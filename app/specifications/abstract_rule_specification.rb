class AbstractRuleSpecification
  def initialize(value:, test_passage:)
    @value = value
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end
end

