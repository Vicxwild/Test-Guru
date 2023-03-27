module Badges
  class FirstTryRule
    class << self
      def sutable?(test_passage, badge)
        user = test_passage.user
        test_id = test_passage.test.id

        (user.tests.where('tests.id = ?', test_id).count == 1) && (test_passage.percentage_success == 100)
      end
    end
  end
end
