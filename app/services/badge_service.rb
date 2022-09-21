class BadgeService

  RULE = { first_try: Badges::FirstTry,
           by_level: Badges::ByLevel,
           by_category: Badges::ByCategory
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULE[badge.rule.to_sym].new(value: badge.value, test_passage: @test_passage)
      add_badge(badge) if rule.satisfies?
  end
  end

  private

  def satisfies_by_services

  end

  def add_badge(badge)
    @test_passage.user.badges << badge
  end

  end

