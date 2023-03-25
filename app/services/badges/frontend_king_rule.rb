module Badges
  class FrontendKingRule
    class << self
      def sutable?(test_passage)
        if test_passage.category.title == "Frontend"
          current_user = test_passage.user

          current_user.tests.by_category("Frontend").uniq.count == Test.by_category("Frontend").available.count
        end
      end

      def title
        "Frontend king"
      end
    end
  end
end
