module Badges
  class KingRule
    class << self
      def suitable?(test_passage, badge)
        current_user = test_passage.user
        current_test_category_title = test_passage.category.title
        badge_category_title = badge.category

        if badge_category_title == current_test_category_title
          current_user.tests.by_category("#{badge_category_title}").uniq.count == Test.by_category("#{badge_category_title}").available.count
        end
      end
    end
  end
end
