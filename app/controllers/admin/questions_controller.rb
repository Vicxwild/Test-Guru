class Admin::QuestionsController < Admin::BaseController
  helper_method :current_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = current_test.questions
  end

  def new
    @question = current_test.questions.new
  end

  def create
    @question = current_test.questions.build(question_params)

    if @question.save
      redirect_to test_questions_path(current_test)
    else
      render :new
    end
  end

  def edit
    @question = find_question
  end

  def update
    @question = find_question

    if @question.update(question_params)
      redirect_to test_question_path(current_test, @question)
    else
      render :edit
    end
  end

  def destroy
    find_question.destroy
    redirect_to test_questions_path(current_test)
  end

  def current_test
    @current_test ||= Test.find(params[:test_id])
  end

  private

  def find_question
    current_test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "The question was not found"
  end
end
