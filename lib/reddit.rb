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
    begin
      get_token
      if @token
        response = RestClient::Request.execute(
          method: :get,
          params: {
            limit: limit
          },
          url: "https://oauth.reddit.com/r/#{sub_reddit}",
          headers:{
            Authorization: "Bearer #{@token}"
          }
        )
        parse_content (JSON.parse(response)["data"]["children"])
      end
    rescue => e
      p e.response
      @response = "An error has occured whie getting reddit posts"
    end
  end

  def parse_content(posts)
    return  @response = "No Post Found" if !posts || posts.size < 1
    response_list = []
    posts.each do |post|
      response_list.push "|reddit #{post["data"]["subreddit"]}| <https://reddit.com#{post["data"]["permalink"]}|#{post["data"]["title"]}>"
    end
    @response = response_list.join("\r\n")
  end

  private
  def get_token
    begin
      response = RestClient::Request.execute(
        method: :post,
        url: "https://www.reddit.com/api/v1/access_token",
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
      @response = "An error has occured whie getting reddit posts"
    end
  end
end
