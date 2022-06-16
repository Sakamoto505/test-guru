# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.references :question, foreing_key: true, null: false
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
