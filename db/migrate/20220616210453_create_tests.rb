class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :body, default: 0
      t.references :categorie, foreign_key: true, null: false

      t.timestamps
    end
  end
end
