module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success?
      "<p> Your result: <span class='success'>#{@test_passage.percentage_success}%</span> The test was passed successfully </p>".html_safe
    else
      "<p> Your result: <span class='fail'>#{@test_passage.percentage_success}%</span> The test failed </p>".html_safe
    end
  end
end
