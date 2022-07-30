# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController

    before_action :find_test, only: %i[show edit update destroy]
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
      @test = current_user.tests_author.create(test_params)
      if @test.save
        redirect_to admin_tests_path(@test)
      else
        render :new
      end
    end

    def edit; end

    def show; end

    def update
      if @test.update(test_params)
        redirect_to admin_tests_path(@test)
      else
        redirect_to :edit_test
      end
    end

    private

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
