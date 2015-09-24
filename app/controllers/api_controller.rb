class ApiController < ApplicationController
    before_action :authenticate_user!
    acts_as_token_authentication_handler_for User

end
