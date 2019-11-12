module Oncall
  class HTTP
    attr_accessor :path, :headers, :params

    def initialize(path, **opts)
      @path = path
      @client = Net::HTTP.new('localhost', 4567)
      @headers = opts[:headers] || { 'User-Agent' => "#{Oncall::SCRIPT}/#{Oncall::VERSION}" }
      @params = opts[:params] || {}
      @query = opts[:query] || {}
    end

    def get
      request = Net::HTTP::Get.new(uri)
      @response = @client.request(request)
    end

    def post
      request = Net::HTTP::Post.new(uri)
      @response = @client.request(request)
    end

    def response_body
      @response.body
    end

    def response_code
      @response.code
    end

    private

    def uri
      parts = path.split('/')
      return '/' if parts.empty?

      parts.each_with_index do |part, index|
        if part.start_with?(':')
          part[0] = ''
          parts[index] = params[part.to_sym]
        end
      end

      parts.join('/')
    end
  end
end
