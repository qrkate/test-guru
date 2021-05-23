class BadgeService
  def initialize(passed_test)
    @passed_test = passed_test
    @user = passed_test.user
    @test = passed_test.test
    @badges = Badge.all
  end

  def call
    @badges.select { |badge| send(badge.rule, badge.option)}
  end

  private
  def first_try?(option)
    return unless @passed_test.success == true
    PassedTest.where(test: @test, user: @user).count == 1
  end

  def all_category?(category)
    return unless @test.category.title == category
    successfull_tests_by_category = Test.where(id: success_ids).test_by_category(category)
    successfull_tests_by_category.count == Test.test_by_category(category).count
  end

  def all_level?(level)
    return unless @test.level == level.to_i
    successfull_tests_by_level = Test.where(level: level, id: success_ids)
    successfull_tests_by_level.count == Test.where(level: level).ids.count
  end

  def success_ids
    @user.passed_tests.where(success: true).pluck(:test_id).uniq
  end
end
