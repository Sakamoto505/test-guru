# frozen_string_literal: true

class AddUnique < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, %i[title level], unique: true
    add_index :categories, :name, unique: true
  end
end
