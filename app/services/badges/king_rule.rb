module Badges
  class KingRule
    class << self
      def suitable?(test_passage, param)
        user = test_passage.user
        current_test_category_title = test_passage.category.title
        badge_category_title = param

        return false if badge_category_title != current_test_category_title

        not_passed_tests = Test.by_category(badge_category_title)
            .available
            .where
            .not(
              id: user.tests.by_category(badge_category_title).by_success
            )

        !not_passed_tests.exists?
      end
    end
  end
end
