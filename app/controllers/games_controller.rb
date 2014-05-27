class GamesController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = current_user
    @game = Game.new
    @word = Word.order_by_rand.first
  end

  def create
    @user = current_user
    @word = Word.order_by_rand.first
    @game = Game.create(user_id: @user.id, word_id: @word.id)
    if @game.save
      session[:game_id] = @game.id
      redirect_to new_user_game_guess_path(@game, @user)
    else
      render :new 
    end
  end

end

