module Admins
  class BadgesController < Admins::BaseController

    before_action :find_badge, only: %i[index]

    def index;end

    def new
      @badge = Badge.new
    end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save!
        redirect_to  admins_badges_path
      else
        render :new
      end
    end

    def destroy
      @badge = Badge.find(params[:id])
      @badge.destroy
      redirect_to admins_test_path
    end

    private

    def badge_params
      params.require(:badge).permit(:title, :img_name, :rule, :value)
    end

    def find_badge
      @badges = Badge.all
    end
  end
end
