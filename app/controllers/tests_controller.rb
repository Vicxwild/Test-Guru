class TestsController < ApplicationController
  def index
    @tests = Test.all.includes(:category, :creator, :questions)
  end

  def show
    @test = Test.find(params[:id])
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id)
  end
end
