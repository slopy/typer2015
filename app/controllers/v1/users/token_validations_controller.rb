module Overrides
  class V1::Users::TokenValidationsController < DeviseTokenAuth::TokenValidationsController

    skip_before_filter :assert_is_devise_resource!, :only => [:validate_token]
    before_filter :set_user_by_token, :only => [:validate_token]

    def validate_token
      # @resource will have been set by set_user_token concern
      if @resource
        yield if block_given?
        render_validate_token_success
      else
        render_validate_token_error
      end
    end

    protected 

    def render_validate_token_success
      render json: {
        success: true,
        data: @resource.as_json(except: [
          :tokens, :created_at, :updated_at
        ])
      }
    end

    def render_validate_token_error
      render json: {
        success: false,
        errors: [I18n.t("devise_token_auth.token_validations.invalid")]
      }, status: 401
    end

    protected

      def set_user_by_token(mapping=nil)
    # determine target authentication class
    rc = resource_class(mapping)

    # no default user defined
    return unless rc

    # parse header for values necessary for authentication
    uid        = request.headers['uid'] || params['uid']
    @token     = request.headers['access-token'] || params['access-token']
    @client_id = request.headers['client'] || params['client']

    # client_id isn't required, set to 'default' if absent
    @client_id ||= 'default'

    # check for an existing user, authenticated via warden/devise, if enabled
    if DeviseTokenAuth.try(:enable_standard_devise_support)
      devise_warden_user = warden.user(rc.to_s.underscore.to_sym)
      if devise_warden_user && devise_warden_user.tokens[@client_id].nil?
        @used_auth_by_token = false
        @resource = devise_warden_user
        @resource.create_new_auth_token
      end
    end

    # user has already been found and authenticated
    return @resource if @resource and @resource.class == rc

    # ensure we clear the client_id
    if !@token
      @client_id = nil
      return
    end

    return false unless @token

    # mitigate timing attacks by finding by uid instead of auth token
    user = uid && rc.find_by(uid: uid)

    if user && user.valid_token?(@token, @client_id)
      sign_in(:user, user, store: false, bypass: true)
      return @resource = user
    else
      # zero all values previously set values
      @client_id = nil
      return @resource = nil
    end
  end
  end
end