class Guess < ActiveRecord::Base
  belongs_to :game
  
  validate :letter, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validate :game_id, presence: true

  def self.array_of_letters(game_id) 
    array_of_letter = []
    letters = Guess.where(game_id: game_id)
    letters.find_each do |obj|
      array_of_letter << (obj.letter).downcase
    end
    return array_of_letter
  binding.pry
  end

  def self.create_mystery_word(word)
    mystery_word = ''
    content = word[0].content                         
    length_of_word = content.length

    length_of_word.times do 
      mystery_word << '-'
    end
    return mystery_word
  end

  def self.check_letter_in_word(word, game_id)  
    array_of_letter = array_of_letters(game_id)
    mystery_word = create_mystery_word(word)
    content = word[0].content.downcase  
    if array_of_letter.size == 0
      return mystery_word
    elsif
      array_of_letter.each do |letter|
        all_index = (0..content.length).find_all { |i| content[i,1] == letter.downcase}
        all_index.each do |index|
          mystery_word[index] = letter
        end
      end
      return mystery_word
    elsif content == mystery_word
      return mystery_word && 'Good Job'
    end
  end

  def self.check_if_letter_already_exist(game_id, letter)
    letters = Guess.where(game_id: game_id)
    if letters.size != 0
      letters.find_each do |obj|
        if letter == (obj.letter)
          return true
        else
          return false
        end
      end
    else 
      return false
    end
  end

end
