class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_current_user
  before_filter :is_user_logged_in

  def get_current_user()
    @current_user = nil
    auth_value = cookies["tta"].present?? cookies["tta"] : nil
    if auth_value.present?
      cookies["tta"] = {:value => cookies["tta"], :expires => Time.now+30.minute, :domain => "127.0.0.1"}
      @current_user = User.where(:id => auth_value.to_i).first
    end
  end

  def is_user_logged_in
    if @current_user.blank? and params[:controller] != "home"
      redirect_to "/" and return
    end
  end
end
