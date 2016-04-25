class NewYorkTimes
  attr_reader :response
  def initialize
    @response=""
  end

  def fetch_content(section)
    return @response = Constants::NewYorkTimes::UNRECOGNIZED_SECTION unless Constants::NewYorkTimes::AVAILABLE_SECTIONS.include? section
    request_url = format(Constants::NewYorkTimes::API_URL, section, ENV['NEW_YORK_TIMES_KEY'])
    response = RestClient.get request_url
    parse_content(JSON.parse(response)["results"])
  rescue => e
    p e.response
    @response = Constants::NewYorkTimes::GENERIC_ERROR
  end

  def parse_content(posts)
    return @response = Constants::NO_POSTFOUND if !posts || posts.size < 1
    response_list = []
    posts.each do |post|
      response_list.push("|New York Times #{post["section"]}| <#{post["url"]}|#{post["title"]}>")
    end
    @response = response_list.join("\n\r")
  end
end
