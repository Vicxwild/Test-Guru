class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :show, :new, :create, :destroy]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_foun

  def index
    @questions = @test.questions
  end

  def show
    render plain: @question.body
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_questions_path(@test)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    # render plain: 'The question #{@question.id} has deleted!'
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body).to_h
  end

  def rescue_with_question_not_foun
    render plain: "The question was not found"
  end
end
