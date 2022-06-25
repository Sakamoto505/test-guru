# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  def self.titles_by_category(category_name)
    joins('join categories on tests.category_id = categories.id')
      .where(categories: { name: category_name })
      .order(title: :DESC)
      .pluck(:title)
  end
end
