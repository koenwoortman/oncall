require_relative '../../../../lib/oncall/core/runner'

RSpec.describe Oncall::Core::Runner do
  describe 'initialize' do
    before do
      @runner = Oncall::Core::Runner.new
    end
  end
end
