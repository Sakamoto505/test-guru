# frozen_string_literal: true
module Badges
  class FirstTry < AbstractRuleSpecification
    def satisfies?
      TestPassage.where(user_id: @test_passage.user.id, test_id: @test_passage.test.id).count == 1
    end
  end
end
