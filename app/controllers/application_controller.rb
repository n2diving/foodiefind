class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.where(:id => session[:user_id]).first
  end

  # def debug_cow
  #   puts " ______________"
  #   puts "( I'm thinking )"
  #   puts " --------------"
  #   puts "        o   ^__^"
  #   puts "         o  (oo)\_______"
  #   puts "            (__)\       )\/\""
  #   puts "                ||----w |"
  #   puts "                ||     ||"
  # end
end
