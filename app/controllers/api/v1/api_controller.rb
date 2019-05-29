module Api::V1

class ApiController < ApplicationController

    acts_as_token_authentication_handler_for User, fallback_to_devise: false

    private
    
    def require_authentication!
    throw(:warden, scope: :user) unless current_user.presence
    end
    
end
end