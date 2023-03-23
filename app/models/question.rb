class Question < ApplicationRecord
  belongs_to :test, counter_cache: true
  has_many :answers, dependent: :destroy
  has_many :gists
  has_many :test_passages, foreign_key: "current_question_id", dependent: :destroy

  validates :body, presence: true

  def sequence_number
    test.questions.ids.index(id) + 1
  end
end
