class QuestionsController < ApplicationController
  helper_method :current_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_foun

  def index
    @questions = current_test.questions
  end

  def show
    @question = current_test.questions.find(params[:id])
  end

  def new
    @question = Question.new # сначала грузится представление потом вызывается нью? КАК ПЕРЕДАЮТСЯ ДАННЫЕ
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
    @question = current_test.questions.find(params[:id])
  end

  def update
    @question = current_test.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to test_question_path(current_test, @question)
    else
      render :edit
    end
  end

  def destroy
    @question = current_test.questions.find(params[:id])
    @question.destroy
    redirect_to test_questions_path(@current_test)
  end

  private

  def current_test
    @current_test ||= Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_foun
    render plain: "The questions was not found"
  end
end
