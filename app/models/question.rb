class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :gists

  validates :body, presence: true

  def sequence_number
    test.questions.ids.index(id) + 1
  end
end
