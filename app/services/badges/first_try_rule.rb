module Badges
  class FirstTryRule
    class << self
      def suitable?(test_passage, _param)
        user = test_passage.user
        test_id = test_passage.test.id

        user.tests.where('tests.id = ?', test_id).count == 1
      end
    end
  end
end
