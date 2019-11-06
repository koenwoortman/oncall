require_relative '../../../../lib/oncall/core/config'

RSpec.describe Oncall::Core::Config do
  describe 'port' do
    it 'should return 4567 as default' do
      config = Oncall::Core::Config.new

      expect(config.port).to eq 4567
    end
  end
end
