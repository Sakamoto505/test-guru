# frozen_string_literal: true

class User < ApplicationRecord
  def user_result(level)
    joins('join user_tests on tests.id = user_tests.test_id')
      .where(level: level, user_tests: { user_id: id })
  end
end
