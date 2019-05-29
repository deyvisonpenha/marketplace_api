class Api::V1::UsersController < Api::V1::ApiController

    before_action :require_authorization!, only: [:show, :update, :destroy]

    def index
        render json: User.all.as_json(only:[:email, :id]), status: :ok
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user.as_json(only: [:email, :authentication_token]), status: :created
        else
            head(:unprocessable_entity)
        end
    end

    # PATCH/PUT /api/v1/products/1
    def update
        if current_user.update(user_params)
        render json: current_user.as_json
        else
        render json: current_user.errors, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def require_authorization!
        unless  request.headers["X-User-Token"] == nil || request.headers["X-User-Email"] == nil
            render json: {}, status: :forbidden
          end
    end

    def current_user
        @user = User.where(email: request.headers["X-User-Email"]).first
    end
end
