class NewYorkTimes
  attr_reader :response
  def initialize
    @response=""
  end

  def fetch_content
    begin
      request_url = "http://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{ENV['NEW_YORK_TIMES_KEY']}"
      response = RestClient.get request_url
      parse_content(JSON.parse(response)["results"])
    rescue
      @response = "An error has occured while getting New York Times posts" 
    end
  end

  def parse_content(posts)
    return @response = "No Post Found" if !posts || posts.size < 1
    response_list = []
    posts.each do |post|
      response_list.push("|New York Times| <#{post["url"]}|#{post["title"]}>")
    end
    @response = response_list.join("\n\r")
  end
end
