class User < ApplicationRecord
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy

  validates :name, :email, :password, presence: true

  def test_level(level)
    tests.where(level: level)
  end
end