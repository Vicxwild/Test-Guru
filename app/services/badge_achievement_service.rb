class BadgeAchievementService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = test_passage.user
    @current_test = test_passage.test
  end

  def check_new_badges
    achievement_check

    issuing_badges if @earned_badge.any?
  end

  private

  def achievement_check
    @earned_badge = []
    (@earned_badge << Badge.find_by(title: "Backend king")) if backend_king_rule
    (@earned_badge << Badge.find_by(title: "Frontend king")) if frontend_king_rule
    (@earned_badge << Badge.find_by(title: "First try")) if first_try_rule
  end

  def issuing_badges
    @earned_badge.each do |badge|
      @current_user.badges << badge
    end
  end

  def first_try_rule
    @test_passage.percentage_success == 100
  end

  def frontend_king_rule
    @current_user.tests.by_category("Frontend").uniq == Test.by_category("Frontend").available
  end

  def backend_king_rule
    @current_user.tests.by_category("Backend").uniq == Test.by_category("Backend").available
  end
end
