module Badges
  class LevelRule
    class << self
      def suitable?(test_passage, badge)
        user = test_passage.user
        rule_level = badge.level
        test_level = test_passage.test.level

        if rule_level == test_level
          user.tests.by_level(rule_level).uniq.count == Test.by_level(rule_level).available.count
        end
      end
    end
  end
end
