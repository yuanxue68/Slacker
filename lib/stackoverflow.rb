class StackOverflow
  attr_reader :response
  def initialize
    @response=""
  end

  def fetch_content(search_term)
    begin
      request_url = format(Constants::StackOverflow::API_URL, search_term)
      response = RestClient.get request_url
      parse_content(JSON.parse(response)["items"])
    rescue
      @response = "#{Constants::StackOverflow::GENERIC_ERROR}"
    end
  end

  def parse_content(posts)
    return @response = "#{Constants::NO_POSTFOUND}" if !posts || posts.size < 1
    response_list = []
    posts.each do |post|
      response_list.push("|StackOverflow #{post["answer_count"]} Answers| <#{post["link"]}|#{post["title"]}>")
    end
    @response = response_list.join("\n\r")
  end
end
