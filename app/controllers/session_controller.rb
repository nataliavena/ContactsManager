class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login: params[:session][:login])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to main_index_path
    else
      render 'new'
    end
  end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, :notice => "Logged out!"
    end
end
