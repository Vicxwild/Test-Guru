module Badges
  class FlawlessVictoryRule
    class << self
      def suitable?(test_passage, _param)
        return if test_passage.success != true

        test_passage.percentage_success == 100
      end
    end
  end
end
