class Admin::TestsController < Admin::BaseController

  def index
    @tests = set_tests
  end

  def show
    @test = find_test
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def edit
    @test = find_test
  end

  def update
    @test = find_test

    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update_inline
    @tests = set_tests
    @test = find_test

    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    find_test.destroy
    redirect_to admin_tests_path
  end

  def publish
    @test = find_test

    @test.update(published_at: Time.now)
    redirect_to admin_tests_path
  end

  def unpublish
    @test = find_test

    @test.update(published_at: nil)
    redirect_to admin_tests_path
  end

  private

  def set_tests
    Test.all.includes(:category, :creator, :questions)
  end

  def find_test
    Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
