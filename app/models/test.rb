# frozen_string_literal: true

class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hurd, -> { where(5..Float::INFINITY) }
  scope :by_category, ->(category_name) {
    joins(:category)
      .where(category: { name: category_name })
  }


  def self.titles_by_category(category_name)
    by_category(category_name).order(name: :desc).pluck(:name)
  end
end
