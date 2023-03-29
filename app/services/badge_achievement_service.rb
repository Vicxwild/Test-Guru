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
    @badges = Badge.all
  end

  def call
    new_achievements = find_new_achievements

    save_badges(new_achievements) if new_achievements.any?
  end

  private

  attr_reader :test_passage, :user, :badges

  def find_new_achievements
    badges.map do |badge|
      rule = RULES[badge.rule_type.to_sym]
      badge if rule.suitable?(test_passage, badge)
    end.compact
  end

  def save_badges(new_achievements)
    @user.badges << new_achievements
  end
end
