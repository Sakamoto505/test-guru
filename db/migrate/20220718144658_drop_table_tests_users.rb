# frozen_string_literal: true

class DropTableTestsUsers < ActiveRecord::Migration[6.0]
  def up
    drop_table :user_tests, if_exists: true
  end
end
