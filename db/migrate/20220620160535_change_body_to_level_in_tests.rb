# frozen_string_literal: true

class ChangeBodyToLevelInTests < ActiveRecord::Migration[6.0]
  def change
    rename_column :tests, :body, :level
  end
end
