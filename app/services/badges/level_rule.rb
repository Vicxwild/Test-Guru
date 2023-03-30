module Badges
  class LevelRule
    class << self
      def suitable?(test_passage, param)
        user = test_passage.user
        rule_level = param.to_i
        test_level = test_passage.test.level

        return if rule_level != test_level

        user.tests.by_level(rule_level).by_success.count == Test.by_level(rule_level).available.count
      end
    end
  end
end
