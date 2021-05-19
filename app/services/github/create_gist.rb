class Github::CreateGist
  ResultObject = Struct.new(:success?, :html_url)

  def initialize(user, question, client: octokit_client)
    @user = user
    @question = question
    @test = @question.test
    @client = client
  end

  def self.call(user:, question:)
    new(user, question).perform
  end

  def perform
    response = @client.create_gist(gist_params)
    save_gist!(@question, response.html_url, response.id)
    ResultObject.new(response.html_url.present?, response.html_url)
  end

  private
  def octokit_client
    Octokit::Client.new(access_token: Rails.application.credentials.gist_api_key!)
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
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def save_gist!(question, url, hash)
    Gist.create!(user: @user, question: @question, url: url, url_hash: hash)
  end
end
