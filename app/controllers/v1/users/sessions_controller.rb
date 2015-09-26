class V1::Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
include ActionController::ImplicitRender
respond_to :json
  # GET /resource/sign_in
  def new
    render :json => {error: "Not allowed"},  status: 422
  end

  # POST /resource/sign_in
  def create    
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
