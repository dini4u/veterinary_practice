class HomeController < ApplicationController
  protect_from_forgery
  def index
  end

  def login
    user_info = User.where(:username => params[:username], :password => params[:password]).first
    render :json => {:err => "User not found."} and return if user_info.blank?
    cookies["tta"] = {:value => "#{user_info.id}", :expires => Time.now+30.minute, :domain => "127.0.0.1"}
    @current_user =  user_info
    render :json => {:err => nil}
  end

  def logout
    cookies.delete "tta".to_sym, :domain => "127.0.0.1"
    redirect_to "/"
  end
end