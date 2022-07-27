# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy update edit]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def create
    @question = @test.questions.new(questions_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.updete(questions_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @question.destroy
      redirect_to test_path(@question.test)
    else
      render :show
    end
  end

  def new
    @question = @test.questions.new
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
