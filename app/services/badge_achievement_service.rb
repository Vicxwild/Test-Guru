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
    badges.map do |badge|
      rule = RULES[badge.rule_type.to_sym]
      @user.badges << badge if rule.suitable?(test_passage, badge)
    end.compact
  end

  private

  attr_reader :test_passage, :user, :badges
end
