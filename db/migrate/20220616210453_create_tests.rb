# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :body, default: 0
      t.references :category, foreign_key: true, null: false
      t.references :author, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
