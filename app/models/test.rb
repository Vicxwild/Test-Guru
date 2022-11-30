class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  def self.sort_by_category(name)
    joins(:category).where("categories.title = ?", name).order(title: :DESC).pluck("tests.title")
  end
end

