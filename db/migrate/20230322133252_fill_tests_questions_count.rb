class FillTestsQuestionsCount < ActiveRecord::Migration[6.1]
  def change
    Test.all.each do |test|
      Test.reset_counters(test.id, :questions)
    end
  end
end
