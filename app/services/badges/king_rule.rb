module Badges
  class KingRule
    class << self
      def suitable?(test_passage, badge)
        user = test_passage.user
        current_test_category_title = test_passage.category.title
        badge_category_title = badge.category

        if badge_category_title == current_test_category_title
          user.tests.by_category(badge_category_title).by_success.count == Test.by_category(badge_category_title).available.count
        end
      end
    end
  end
end
