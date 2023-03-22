class TestsController < ApplicationController

  def index
    @tests = Test.available.includes(:category, :creator, :questions)
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
