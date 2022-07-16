# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    test_title = question.test.title
    if question.persisted?
      "Edit #{test_title}"
    else
      "Create '#{test_title} test' new Question"
    end
  end
end
