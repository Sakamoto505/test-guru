class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_name, null: false
      t.integer :rule, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
