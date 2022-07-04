# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def create
    @question = @test.question.new(questions_params)
    if @question.save
      redirect_to test_questions_path
    else
      render plain 'Not preserved'
    end
  end

  def new; end

  def show; end

  def destroy
    @question.destroy
  end

  private

  def questions_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
