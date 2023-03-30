module Badges
  class FlawlessVictoryRule
    class << self
      def suitable?(test_passage, _param)
        test_passage.percentage_success == 100
      end
    end
  end
end
