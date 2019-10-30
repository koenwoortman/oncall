module Oncall
  class Config
    DEFAULT_PATTERN = '**{,/*/**}/*_oncall.rb'.freeze

    def pattern
      DEFAULT_PATTERN
    end
  end
end
