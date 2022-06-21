# frozen_string_literal: true

class Test < ApplicationRecord
  def self.test_name_list(category)
    Test.joins('join categories on tests.category_id = categories.id')
        .where('categories.name = ?', category)
        .order(title: :DESC)
        .pluck(:title)
  end
end
