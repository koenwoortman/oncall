module Oncall
  class Options
    attr_writer :runner, :config, :env
    attr_accessor :pattern,
                  :exclude,
                  :group,
                  :persist,
                  :path,
                  :verbose,
                  :domain,
                  :port

    def initialize
      @env = nil
      @pattern = default_pattern
      @exclude = ''
      @group = nil
      @persist = nil
      @path = nil
      @verbose = default_verbosity
      @domain = default_host
      @port = default_port
    end

    def runner
      @runner ||= Oncall::Invocations::TestRunner.new
    end

    def config
      @config ||= config_default
    end

    def env
      @env ||= default_env
    end

    def parse_config
      conf_file = load_config_file

      set_default_env conf_file
      update_options conf_file
    end

    private

    def update_options(conf_file)
      raise "Expected env '#{env}' does not exist in config" unless conf_file.key? env

      @domain = conf_file[env]['domain'] if conf_file[env].key? 'domain'
      @port = conf_file[env]['port'] if conf_file[env].key? 'port'
    end

    def set_default_env(conf_file)
      return if @env 

      @env = conf_file['default'] if conf_file.key? 'default'
    end

    def load_config_file
      YAML.load_file(config)
    end

    def default_pattern
      '**{,/*/**}/*_oncall.rb'
    end

    def default_env
      'develop'
    end

    def default_host
      'localhost'
    end

    def default_port
      3000
    end

    def default_verbosity
      false
    end

    def config_default
      File.join(Dir.pwd, config_file_name)
    end

    def config_file_name
      'oncall.yml'
    end
  end
end
