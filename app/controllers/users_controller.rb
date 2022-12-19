class UsersController < ApplicationController

    # signing up user
    def create
        @user = User.create(user_params)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            cookies.signed[:jwt] = {value: token, httponly: true, expires: 1.hour.from_now}
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
    end

    # logging in user
    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            cookies.signed[:jwt] = {value: token, httponly: true, expires: 1.hour.from_now}
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
    end

    def logout
        cookies.delete(:jwt)
    end
    
    private

    def user_params
        params.permit(:username, :password)
    end
end
