class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    return redirect_to test_passage_path(@test_passage), alert: t('.no_answer') unless params[:answer_ids]

    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.success!

      TestsMailer.completed_test(@test_passage).deliver_now

      received_badge = BadgeAchievementService.new(@test_passage).call || []
      flash[:notice] = "You get a new badge!" if received_badge.any?

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
