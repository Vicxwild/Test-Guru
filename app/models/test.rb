class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :difficult, -> { by_level(5..Float::INFINITY) }
  scope :by_category, -> (name) { joins(:category).where("categories.title = ?", name) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.sort_by_category(name)
    by_category(name).order(title: :DESC).pluck("tests.title")
  end
end

