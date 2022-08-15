# frozen_string_literal: true

class Admins < User
  self.table_name = 'admins'
  self.type = 'Admins'
  validates :first_name, presence: true
  validates :last_name, presence: true
end
