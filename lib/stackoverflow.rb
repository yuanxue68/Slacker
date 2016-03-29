class StackOverflow
  attr_reader :response
  def initialize
    @response=""
  end

  def fetch_content(search_term)
    begin
      request_url = "https://api.stackexchange.com/2.2/search?pagesize=10&order=desc&sort=relevance&intitle=#{search_term}&site=stackoverflow"
      response = RestClient.get request_url
      parse_content(JSON.parse(response)["items"])
    rescue
      @response = "An error has occured while getting Stack Overflow posts"
    end
  end

  def parse_content(posts)
    return @response = "No Post Found" if !posts || posts.size < 1
    response_list = []
    posts.each do |post|
      response_list.push("|StackOverflow #{post["answer_count"]} Answers| <#{post["link"]}|#{post["title"]}>")
    end
    @response = response_list.join("\n\r")
  end
end
