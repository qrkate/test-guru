class Badge < ApplicationRecord
  TYPE_BADGES = %i[first_try? all_category? all_level?]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :name, :image_url, :rule, presence: true
  validates :name, uniqueness: true 
end
