class Word < ActiveRecord::Base
  validates :content, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  has_many :games


end
