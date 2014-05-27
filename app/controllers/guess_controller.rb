class GuessController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = current_game
    @guess = Guess.new
    word_id = @game.word_id
    @word = Word.where(id: word_id)
    @revealing_word = Guess.check_letter_in_word(@word, @game.id)
    winner(@word, @revealing_word)
    @counter =1
  end

  def winner (word,revealing_word)
    if word[0].content == revealing_word
      flash[:notice] = 'Well Done, Try another game'
      redirect_to new_user_game_path
    else
        revealing_word
    end
  end


  def create
    @game = current_game
    @guess = Guess.new(guess_params)
    if Guess.check_if_letter_already_exist(@game.id, @guess.letter) == false
      @guess.save
      flash[:notice] = 'letter saved'
      redirect_to user_guesses_path(@game)
    elsif
      flash[:notice] = 'letter has already been submitted.'
      redirect_to user_guesses_path(@game)
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:letter).merge(game_id: @game.id)
  end
end

