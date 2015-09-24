module Requests
    def json
      @json ||= JSON.parse(response.body)
    end
end