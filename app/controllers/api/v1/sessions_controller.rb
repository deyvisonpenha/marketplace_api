class Api::V1::SessionsController < Api::V1::ApiController

    acts_as_token_authentication_handler_for User, fallback_to_devise: false

    def show
        current_user ? head(:ok) : head(:unauthorized)
    end

    def create
        @user = User.where(email: params[:email]).first
        # se nao encontrar email vai dar erro
        if @user.valid_password?(params[:password])
            #@user.authentication_token.blank? 
            render :create , status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
        current_user.reset_authentication_token!
        head :ok
    end

    private

end
