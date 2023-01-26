class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :correct_questions, class_name: 'Question', optional: true
end
