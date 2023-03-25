module Badges
  class BackendKingRule
    class << self
      def sutable?(test_passage)
        if test_passage.category.title == "Backend"
          current_user = test_passage.user

          current_user.tests.by_category("Backend").uniq.count == Test.by_category("Backend").available.count
        end
      end

      def title
        "Backend king"
      end
    end
  end
end
