# frozen_string_literal: true

class User < ApplicationRecord
  def user_result(level)
    Test.joins('join user_tests on tests.id = user_tests.test_id')
        .where('user_tests.user_id = ? and tests.level = ?', id, level)
  end
end
