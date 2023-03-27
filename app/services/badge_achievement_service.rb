class BadgeAchievementService

  RULES = [
    { title: "#{category_title} king", rule: ::Badges::KingRule.new(category_title) },
    { title: "Flawless victory", rule: ::Badges::FlawlessVictoryRule },
    { title: "First try", rule: ::Badges::FirstTryRule }
  ].freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def check_new_badges
    new_achievements = find_new_achievements

    save_badges(new_achievements) if new_achievements.any?
  end

  private

  attr_reader :test_passage, :user

  def find_new_achievements
    RULES.map do |rule|
      rule.title if rule.sutable?(test_passage)
    end.compact
  end

  def save_badges(new_achievements)
    @user.badges << Badge.where(title: new_achievements)
  end

  def category_title
    test_passage.category.title
  end
end
