class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :difficult, -> { by_level(5..Float::INFINITY) }
  scope :by_category, -> (name) { joins(:category).where("categories.title = ?", name) }
  scope :available, -> { where("questions_count > ?", 0).where.not(published_at: nil) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.sort_by_category(name)
    by_category(name).order(title: :DESC).pluck("tests.title")
  end
end

