module Badges
  class KingRule

    def initialize(category_title)
      @category_title = category_title
    end

    def sutable?(test_passage)
      current_user = test_passage.user

      current_user.tests.by_category("#{category_title}").uniq.count == Test.by_category("#{category_title}").available.count
    end

    private

    attr_reader :category_title
  end
end
