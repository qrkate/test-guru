class User < ApplicationRecord
  def test_level(level)
    Test.joins('JOIN passed_tests ON passed_tests.test_id = tests.id').where(passed_tests: {user_id: id}, level: level)
  end
end
