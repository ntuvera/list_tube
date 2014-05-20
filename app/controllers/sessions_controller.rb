class SessionsController < ApplicationController

    def new

    end

    def create

      user = User.find_by(name: params[:name])


      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to play_lists_path, notice: "Signed in as #{user.name}"
      else
        redirect_to log_in_path, alert: 'Log-In failed'
      end

    end

    def destroy
      session[:user_id] = nil
      redirect_to log_in_path, notice: "Logged Out"
    end

  end
