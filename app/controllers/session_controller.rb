class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to contact_index_path
    else
      flash[:error] = "Incorrect login"
      render 'new'
    end
  end

    def destroy
      session[:user_id] = nil
      flash[:info] = "Logged out"
      redirect_to root_url
    end
end
