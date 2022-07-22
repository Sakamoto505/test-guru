# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_NUMBER = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def set_current_question
    self.current_question = next_question
  end

  def success?
    result >= SUCCESS_NUMBER
  end

  def result
    (Float(correct_questions * 100) / test.questions.count)
  end

  def question_number
    test.questions.where('id <= ?', current_question.id).count
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  private

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
