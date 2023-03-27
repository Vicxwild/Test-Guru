module Badges
  class FlawlessVictoryRule
    class << self
      def sutable?(test_passage, badge)
        test_passage.percentage_success == 100
      end
    end
  end
end
