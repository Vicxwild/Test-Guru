class QuestionsController < ApplicationController
  helper_method :current_test, :current_question

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = current_test.questions
  end

  def show; end

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

  def edit; end

  def update
    if current_question.update(question_params)
      redirect_to test_question_path(current_test, current_question)
    else
      render :edit
    end
  end

  def destroy
    current_question.destroy
    redirect_to test_questions_path(current_test)
  end

  def current_test
    @current_test ||= Test.find(params[:test_id])
  end

  def current_question
    @current_question ||= current_test.questions.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "The question was not found"
  end
end
