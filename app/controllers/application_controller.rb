class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  def current_parent_user
    Parent.find(session[:parent_id]) if session[:parent_id]
  end
  helper_method :current_parent_user
  
  def current_sitter_user
    Sitter.find(session[:sitter_id]) if session[:sitter_id]
  end
  helper_method :current_sitter_user


end
