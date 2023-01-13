class TestsController < ApplicationController
  helper_method :current_test

  def index
    @tests = Test.all.includes(:category, :creator)
  end

  def show
    @test = Test.find(params[:id])
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id)
  end

  def current_test
    @current_test ||= Test.find(params[:id])
  end
end
