# frozen_string_literal: true

module Admins
  class TestsController < Admins::BaseController
    before_action :find_tests, only: %i[index update_inline]
    before_action :find_test, only: %i[show edit update destroy update_inline]
    before_action :questions, only: %i[show destroy]

    def new
      @test = Test.new
    end

    def index; end

    def destroy
      @test.destroy
      redirect_to admins_tests_path
    end

    def create
      @test = current_user.tests_author.create(test_params)
      if @test.save
        redirect_to [:admins, @test], notice: t('.success')
      else
        render :new
      end
    end

    def edit; end

    def show; end

    def update
      if @test.update(test_params)
        redirect_to admins_tests_path(@test)
      else
        render :edit
      end
    end

    def update_inline
      if @test.update(test_params)
        redirect_to admins_tests_path
      else
        render :index
      end
    end

    private

    def find_tests
      @tests = Test.all
    end

    def find_test
      @test = Test.find(params[:id])
    end

    def questions
      @questions = find_test.questions
    end

    def test_params
      params.require(:test).permit(:title, :level, :category_id, :author_id)
    end
  end
end
