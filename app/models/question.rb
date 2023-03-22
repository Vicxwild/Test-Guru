class Question < ApplicationRecord
  belongs_to :test, counter_cache: true
  has_many :answers
  has_many :gists

  validates :body, presence: true

  def sequence_number
    test.questions.ids.index(id) + 1
  end
end
