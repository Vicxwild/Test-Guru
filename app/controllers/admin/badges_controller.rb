class Admin::BadgesController < Admin::BaseController
  helper_method :images, :rule_types

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit
    @badge = find_badge
  end

  def update
    @badge = find_badge

    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    find_badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :description, :picture_link, :rule_type, :category, :level)
  end

  def find_badge
    Badge.find(params[:id])
  end

  def images
    Dir.glob('app/assets/images/*').map { |file_path| File.basename(file_path) }
  end

  def rule_types
    BadgeAchievementService::RULES.keys
  end
end
