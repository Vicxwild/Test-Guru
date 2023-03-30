module Badges
  class LevelRule
    class << self
      def suitable?(test_passage, param)
        user = test_passage.user
        rule_level = param.to_i
        test_level = test_passage.test.level

        return false if rule_level != test_level

        not_passed_tests = Test.by_level(rule_level)
            .available
            .where
            .not(
              id: user.tests.by_level(rule_level).by_success
            )

        !not_passed_tests.exists?
      end
    end
  end
end
