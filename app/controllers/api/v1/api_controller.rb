module Api::V1

class ApiController < ApplicationController

    acts_as_token_authentication_handler_for User, fallback_to_devise: false
   # acts_as_token_authentication_handler_for Product, only: [:show, :create, :update, :destroy]

    before_action :require_authentication!
    
    # def after_successful_token_authentication
    #     # Make the authentication token to be disposable
    #     current_user.authentication_token = nil
    #     current_user.save!
    # end

    private
    
    def require_authentication!
    throw(:warden, scope: :user) unless current_user.presence
    end
    
end
end