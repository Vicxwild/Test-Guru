class BadgeAchievementService

  RULES = {
      category: ::Badges::KingRule,
      level: ::Badges::LevelRule,
      flawless_victory: ::Badges::FlawlessVictoryRule,
      first_try: ::Badges::FirstTryRule
  }.freeze

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
    Badge.all.map do |badge|
      rule = RULES[badge.rule_type.to_sym]
      badge.title if rule.suitable?(test_passage, badge)
    end.compact
  end

  def save_badges(new_achievements)
    @user.badges << Badge.where(title: new_achievements)
  end
end
