# frozen_string_literal: true

module Admin
  class GistsController < Admins::BaseController
    def index
      @gists = Gist.all
    end
  end
end
