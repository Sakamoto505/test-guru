# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :validate_count_of_answers

  def validate_count_of_answers
    errors.add(:answers) if answers.count >= 4
  end
end
