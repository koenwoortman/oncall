describe Oncall::Invocations::HelpRunner do
  describe '.run' do
    before(:each) do
      allow($stdout).to receive(:puts)
      @parser = OptionParser.new
      @runner = Oncall::Invocations::HelpRunner.new(@parser)
    end

    it 'should call puts on the ouput stream with the parser' do
      @runner.run($stderr, $stdout)
      expect($stdout).to have_received(:puts).with(@parser)
    end
  end
end
