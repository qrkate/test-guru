class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  def test_level(level)
    Test.joins('JOIN passed_tests ON passed_tests.test_id = tests.id').where(passed_tests: {user_id: id}, level: level)
  end
end
