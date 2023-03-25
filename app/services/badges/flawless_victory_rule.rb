module Badges
  class FlawlessVictoryRule
    class << self
      def sutable?(test_passage)
        test_passage.percentage_success == 100
      end

      def title
        "Flawless victory"
      end
    end
  end
end
