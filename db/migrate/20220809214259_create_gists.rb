# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :link_to_gist
      t.references :user, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
