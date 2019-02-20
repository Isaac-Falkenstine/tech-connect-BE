class GithubService
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  def user_json
    get_json("/users/#{handle}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.headers['Authorization'] = ENV['GITHUB_TOKEN']
      faraday.adapter  Faraday.default_adapter
    end
  end
end
