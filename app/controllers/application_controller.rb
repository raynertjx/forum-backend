class ApplicationController < ActionController::API
    include ActionController::Cookies
    SECRET_KEY = Rails.application.secret_key_base
    # secret should be ENV variable in production!
    def encode_token(payload)
        JWT.encode(payload, SECRET_KEY)
    end

    def auth_header
        request.headers['Authorization']
    end

    # def decode_token
    #     begin
    #         token = cookies.signed[:jwt]
    #         JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    #     rescue JWT::DecodeError
    #         nil
    #     end
    # end

    def decode_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
              JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
            rescue JWT::DecodeError
              nil
            end
          end
        end

    def whoami
        if logged_in_user
            render json: {user_id: logged_in_user.id, username: logged_in_user.username }
        else
            head(:unauthorized)
        end
    end

    def logged_in_user
        if decode_token
            user_id = decode_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end
    
    def logged_in?
        !!logged_in_user
    end

    def authorized
        render json: {message: 'Please log in!'}, status: :unauthorized unless logged_in?
    end
end
