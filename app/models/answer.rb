# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_count_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_count_of_answers
    errors.add(:answers) if question.answers.count >= 4
  end
end
