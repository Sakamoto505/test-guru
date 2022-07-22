# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :create_tests, class_name: 'Test', foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: true

  def user_result(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
