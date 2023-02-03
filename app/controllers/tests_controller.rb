class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all.includes(:category, :creator, :questions)
  end

  def show
    @test = find_test
  end

  def start
    @test = find_test
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id)
  end
end
