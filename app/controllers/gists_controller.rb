# frozen_string_literal: true

class GistsController < ApplicationController
  def create
    question = test_passage.current_question
    service = GistQuestionService.new(question).call

    flash_options = if service.success?
                      current_user.gists.create!(question: question,
                                                 link_to_gist: service.url)
                      { notice: t('gist.create.success',
                                  gist_url: view_context.link_to('Gist', service.url,
                                                                 target: '_blank')) }
                    else
                      { alert: t('gist.create.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  def test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
