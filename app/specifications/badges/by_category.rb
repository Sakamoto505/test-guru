module Badges
  class ByCategory < AbstractRuleSpecification
    def satisfies?
      return false if @value != @test.category_id
      all_category_test_ids = Test.where(category_id: @value).ids.sort
      completed_category_test_ids = @user.tests.where(category_id: @value).distinct.ids.sort
      completed_category_test_ids == all_category_test_ids
    end
  end

end
