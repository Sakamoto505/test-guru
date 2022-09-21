module Badges
  class ByLevel < AbstractRuleSpecification
    def satisfies?
      return false unless @value != @test.level
      all_tests_on_level = Test.where(level: @value).pluck(:id)
      all_passages_on_level = @user.test_passages.where(current_question_id: nil, test: all_tests_on_level, badge_accept: false).pluck(:test_id).uniq
      all_tests_on_level.sort == all_passages_on_level.sort
    end
  end
end
