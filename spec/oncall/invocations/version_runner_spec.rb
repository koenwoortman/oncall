describe Oncall::Invocations::VersionRunner do
  describe '.run' do
    before(:each) do
      allow($stdout).to receive(:puts)
      @runner = Oncall::Invocations::VersionRunner.new
    end

    it 'should call puts on the output stream' do
      @runner.run($stderr, $stdout)
      expect($stdout).to have_received(:puts)
    end
  end
end
