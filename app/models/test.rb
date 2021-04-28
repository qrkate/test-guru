class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :test_by_category, ->(category) { joins(:category).where(categories: {title: category}).order(title: :desc) }

  def self.test_category(category)
    test_by_category(category).pluck(:title)
  end
end
