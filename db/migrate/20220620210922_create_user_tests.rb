# frozen_string_literal: true

class CreateUserTests < ActiveRecord::Migration[6.0]
  def defold
    # code here
  end

  def change
    create_table :user_tests do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
