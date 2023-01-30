class AnswersController < ApplicationController
  helper_method :current_test, :current_question

  def show
    @answer = find_answer
  end

  def new
    @answer = current_question.answers.new
  end

  def edit
    @answer = find_answer
  end

  def create
    @answer = current_question.answers.build(answer_params)

    if @answer.save
      redirect_to test_question_path(current_test, current_question)
    else
      render :new
    end
  end

  def update
    @answer = find_answer

    if @answer.update(answer_params)
      redirect_to test_question_path(current_test, current_question)
    else
      :edit
    end
  end

  def destroy
    find_answer.destroy
    redirect_to test_question_path(current_test, current_question)
  end

  private

  def current_test
    @current_test ||= Test.find(params[:test_id])
  end

  def current_question
    @current_question ||= current_test.questions.find(params[:question_id])
  end

  def find_answer
    current_question.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
