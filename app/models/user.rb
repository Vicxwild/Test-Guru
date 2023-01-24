class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "creator_id"

  validates :email, presence: true

  def passed_tests_by_levels(level)
    tests.by_level(level)
  end
end
