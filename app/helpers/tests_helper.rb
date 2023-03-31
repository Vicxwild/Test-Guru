module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def timer(test)
    test.time_limit == 0 ? t('admin.tests.test.no_timer') : test.time_limit
  end
end
