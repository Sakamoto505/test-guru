
class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :img_name, presence: true
  validates :rule, presence: true
  validates :value, presence: true

  enum rule: { by_category: 0, by_level: 1, first_try: 2 }
end
