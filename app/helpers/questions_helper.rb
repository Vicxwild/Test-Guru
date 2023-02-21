module QuestionsHelper
  def question_header(question)
    if question.persisted?
      t('.edit_question', test_title: question.test.title)

    else
      t('.create_question', test_title: question.test.title)
    end
  end
end
