# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests, dependent: :destroy

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.titles_by_category(category_name)
    joins(:category)
      .where(categories: { name: category_name })
      .order(title: :DESC)
      .pluck(:title)
  end
end
