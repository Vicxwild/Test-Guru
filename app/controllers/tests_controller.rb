class TestsController < ApplicationController

  def index
    @tests = Test.all.includes(:category, :creator, :questions)
  end

  def show
    @test = find_test
  end

  def start
    @test = find_test
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    Test.find(params[:id])
  end
end
