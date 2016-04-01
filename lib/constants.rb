module Constants
  module Reddit
    TOKEN_URL = "https://www.reddit.com/api/v1/access_token"
    API_URL = "https://oauth.reddit.com/r/"
    BASE_URL = "https://reddit.com"
    GENERIC_ERROR = "An error has occured while getting reddit posts"
    TOKEN_ERROR = "Error while getting reddit access token"
  end

  module StackOverflow
    API_URL = "https://api.stackexchange.com/2.2/search?pagesize=10&order=desc&sort=relevance&intitle=%s&site=stackoverflow"
    GENERIC_ERROR = "An error has occured while getting Stack Overflow posts"
  end

  module NewYorkTimes
    API_URL = "http://api.nytimes.com/svc/topstories/v1/%s.json?api-key=%s"
    GENERIC_ERROR = "An error has occured while getting New York Times posts"
    AVAILABLE_SECTIONS = ["home",
                          "world", 
                          "national", 
                          "politics",
                          "nyregion",
                          "business",
                          "opinion",
                          "technology",
                          "science",
                          "health",
                          "sports",
                          "arts",
                          "fashion",
                          "dining",
                          "travel",
                          "magazine",
                          "realestate"]
    UNRECOGNIZED_SECTION = "The list of sections are:\r\n #{AVAILABLE_SECTIONS.join("\r\n")}"
  end

  NO_POSTFOUND = "No Post Found"
end

