# frozen_string_literal: true

class Test < ApplicationRecord
  def self.titles_by_category(category)
    joins('join categories on tests.category_id = categories.id')
      .where('categories.name = ?', category)
      .order(title: :DESC)
      .pluck(:title)
  end
end
