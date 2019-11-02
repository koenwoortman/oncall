module Oncall
  module HTTP
    def self.uri(path, params)
      parts = path.split('/')

      if parts.empty?
        return '/'
      end

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
