# frozen_string_literal: true

class Test < ApplicationRecord
  def self.titles_by_category(category_name)
    joins('join categories on tests.category_id = categories.id')
      .where(categories: { name: category_name })
      .order(title: :DESC)
      .pluck(:title)
  end
end
