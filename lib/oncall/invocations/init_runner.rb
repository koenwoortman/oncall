module Oncall
  module Invocations
    class InitRunner < BaseRunner
      def run(_err, _out)
        config_template_path = File.join(File.dirname(__FILE__), '..', 'templates', 'oncall.yml.template')
        template = File.read(config_template_path)

        File.open(File.join(Dir.getwd, 'oncall.yml'), 'w') do |file|
          file.write(template)
        end
      end
    end
  end
end
