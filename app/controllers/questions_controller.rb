class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :show]
  before_action :find_question, only: [:show]

  def index
    @questions = @test.questions
  end

  def show
    render plain: @question.body
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end
end
