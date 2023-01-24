class UsersController < ApplicationController

    # signing up user
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
          else
            render json: { errors: @user.errors.full_messages },
                   status: :unprocessable_entity
        end
    end

    # logging in user
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            cookies.signed[:jwt] = {value: token, httponly: true, expires: 6.hour.from_now}
            render json: {user: @user, token: token}
        else
            head(:unauthorized)
        end
    end

    def logout
        cookies.delete(:jwt)
    end
    
    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
