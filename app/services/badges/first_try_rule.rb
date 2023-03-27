module Badges
  class FirstTryRule
    class << self
      def sutable?(test_passage)
        user = test_passage.user
        test_id = test_passage.test.id

        user.tests.where('tests.id = ?', test_id).count == 1
      end
    end
  end
end
