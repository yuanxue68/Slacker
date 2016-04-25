class Reddit
  attr_reader :response
  def initialize
    @username = ENV["REDDIT_USERNAME"]
    @password = ENV["REDDIT_PASSWORD"]
    @app_id = ENV["REDDIT_APP_ID"]
    @app_secret = ENV["REDDIT_APP_SECRET"]
    @token = nil
    @response = ''
  end

  def fetch_content(sub_reddit, limit = 10)
    get_token
    if @token
      response = RestClient::Request.execute(
        method: :get,
        params: {
          limit: limit
        },
        url: "#{Constants::Reddit::API_URL}#{sub_reddit}",
        headers:{
          Authorization: "Bearer #{@token}"
        }
      )
      parse_content (JSON.parse(response)["data"]["children"])
    else 
      @response = Constants::Reddit::TOKEN_ERROR
    end
  rescue => e
    p e.response
    @response = Constants::Reddit::GENERIC_ERROR
  end

  def parse_content(posts)
    return  @response = Constants::NO_POSTFOUND if !posts || posts.size < 1
    response_list = []
    posts.each do |post|
      response_list.push "|reddit #{post["data"]["subreddit"]}| <#{Constants::Reddit::BASE_URL}#{post["data"]["permalink"]}|#{post["data"]["title"]}>"
    end
    @response = response_list.join("\r\n")
  end

  private
  def get_token
    response = RestClient::Request.execute(
      method: :post,
      url: Constants::Reddit::TOKEN_URL,
      user: @app_id,
      password: @app_secret,
      content_type: 'application/x-www-form-urlencoded',
      payload: {
        grant_type: 'password',
        username: @username,
        password: @password
      }
    )
    @token = JSON.parse(response)["access_token"]
  rescue => e
    p e.response
    @response = Constants::Reddit::GENERIC_ERROR
  end
end
