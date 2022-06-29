class AddUnique < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, [:title, :level], unique: true
    add_index :categories, :name, unique: true
  end
end
