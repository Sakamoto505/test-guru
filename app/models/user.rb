# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :create_tests, class_name: 'Test', foreign_key: :user_id, dependent: :destroy
  has_many :tests, through: :user_tests, dependent: :destroy

  def user_result(level)
    tests.where(level: level)
  end
end
