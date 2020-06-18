class SessionsController < ApplicationController

    def login
        @user=User.new
    end

    def destroy
        session.clear[:user_id]
        redirect_to '/login'
    end

    def create
        @user = User.find_by(name: user_params[:name])
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to 'welcome'
        else
            redirect_to login_path
        end

    end

    private
  
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    
end