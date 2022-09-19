class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.all.each do |badge|
      if send "#{badge.rule}_tests_completed?", badge.value
        @test_passage.user.badges << badge
      end
    end
  end


  private

  def first_try_tests_completed?(_arg)
    TestPassage.where(user_id: @test_passage.user.id, test_id: @test_passage.test.id).count == 1
  end

  def by_category_tests_completed?(category_id)
    all_tests_on_category = Test.where(category_id: category_id).pluck(:id)
    all_passages_on_category = @user.test_passages.where(current_question_id: nil, test: all_tests_on_category, badge_accept: false ).pluck(:test_id).uniq
    if all_tests_on_category.sort == all_passages_on_category.sort
      update_badge_accept = @user.test_passages.where(current_question_id: nil, test: all_tests_on_category, badge_accept: false )
      update_badge_accept.each { |index| index.update_columns(badge_accept: true ) }
      true
    else
      false
    end
  end

  def by_level_tests_completed?(level)
    all_tests_on_level = Test.where(level: level.to_i).pluck(:id)
    all_passages_on_level = @user.test_passages.where(current_question_id: nil, test: all_tests_on_level, badge_accept: false).pluck(:test_id).uniq
    if all_tests_on_level.sort == all_passages_on_level.sort
      update_badge_accept = @user.test_passages.where(current_question_id: nil, test: all_tests_on_level, badge_accept: false)
      update_badge_accept.each { |index| index.update_columns(badge_accept: true) if index.success? }
      true
    else
      false
    end
  end
end

