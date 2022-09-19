class AddBadgeAcceptToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :badge_accept, :boolean, default: false
  end
end
