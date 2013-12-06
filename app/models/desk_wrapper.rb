module DeskWrapper
  class Client
    attr_accessor :client, :options

    def initialize(opts)
      @options = defaults.merge(opts)
      @client = build_client
    end

    def cases
      get('cases')
    end

    def labels
      get('labels')
    end

    def new_label(opts)
      response = post('labels',opts)
    end

    def filters
      get('filters')
    end

    def filter_cases(id)
      get("filters/#{id}/cases")
    end

    def post(path, options)
      response = @client.post(path, options)
    end

    def get(endpoint)
      response = @client.get(endpoint)
      entries = response.body['_embedded']['entries']
      entries.sort_by{|x| x['position'] }
    end

    def defaults
      {
        consumer_key: API_KEY,
        consumer_secret: API_SECRET,
      }
    end

    def build_client
      Faraday.new URI.join(API_SITE,'api/v2').to_s do |conn|
        conn.request :oauth, options
        conn.request :json

        conn.response :json, :content_type => /\bjson$/

        conn.use :instrumentation
        conn.use :http_cache, store: :memory_store

        conn.adapter Faraday.default_adapter
      end
    end
  end
end
