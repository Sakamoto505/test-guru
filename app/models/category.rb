# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(name: :asc) }

  has_many :tests, dependent: :destroy

  validates :name, presence: true
end
