# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :questions, only: %i[show destroy]

  def new
    @test = Test.new
  end

  def index
    @tests = Test.all
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      redirect_to :edit_test
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test ||= Test.find(params[:id])
  end

  def questions
    @questions ||= find_test.questions
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def set_user
    @user = User.first
  end
end
