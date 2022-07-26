# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages(type = :alert)
    return unless flash[type.to_sym]

    tag.div flash[type.to_sym], id: type, class: "flash #{type}"
  end
end
