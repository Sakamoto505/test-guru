class GistQuestionService

  attr_reader :result

  def initialize(question, client: nil)
    @question = question
    @test = @question.test

    @client = client || Octokit::Client.new(
      access_token: Rails.application.credentials.dig(:github, :access_token)
    )
  end

  def call
    @result = @client.create_gist(gist_params)
    self
  end

  def success?
    !!@result[:url]
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      # description: I18n.t('services.gist_question_services.description, test_title: @test.title)
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
