class GistQuestionService
  def initialize(user, question, client: octokit_client)
    @user = user
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    result = @client.create_gist(gist_params)
    save_gist(@question, result.html_url) if result.respond_to? :html_url
    result
  end

  private
  def octokit_client
    Octokit::Client.new(:access_token => Rails.application.credentials.gist_api_key!)
  end

  def gist_params
    {
      description: I18n.t("services.gist.description", test: @test.title),
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

  def save_gist(question, url)
    Gist.create!(user: @user, question: @question, url: url)
  end
end
