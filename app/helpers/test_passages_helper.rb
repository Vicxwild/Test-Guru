module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success?
      "<p> #{t('.result')}: <span class='success'>#{@test_passage.percentage_success}%</span> - #{t('.passed')} </p>".html_safe
    else
      "<p> #{t('.result')}: <span class='fail'>#{@test_passage.percentage_success}%</span> - #{t('.failed')} </p>".html_safe
    end
  end
end
