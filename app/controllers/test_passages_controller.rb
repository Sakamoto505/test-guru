# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  before_action :authenticate_user!

  def show; end

  def result

  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question).call
    flash_options = if service.success?
                      current_user.gists.create(question_id: @test_passage.current_question_id, link_to_gist: result)
                      { notice: t('.success',
                                  gist_url: view_context.link_to('Gist', service.result.html_url,
                                                                 target: '_blank')) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
