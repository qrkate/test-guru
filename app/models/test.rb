class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :passed_tests, dependent: :destroy
  has_many :users, through: :passed_tests

  def self.test_category(category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where(categories: {title: category})
      .order(title: :desc)
      .pluck(:title)
  end
end
