# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages(flash)
    flash.map do |key, msg|
      content_tag :div, msg, id: key, class: 'flash alert'
    end.join.html_safe
  end
end
