class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_game
    @_game ||= session[:game_id] &&
    Game.find_by(id: session[:game_id])
  end
end
