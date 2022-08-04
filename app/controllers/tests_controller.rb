# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[start]
  before_action :questions, only: %i[show destroy]

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def questions
    @questions ||= find_test.questions
  end
end
