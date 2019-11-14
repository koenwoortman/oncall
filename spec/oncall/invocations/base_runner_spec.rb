describe Oncall::Invocations::BaseRunner do
  describe '.run' do
    before(:each) do
      @err = StringIO.new
      @out = StringIO.new
      @runner = Oncall::Invocations::BaseRunner.new
    end

    it 'should raise an NotImplementedError' do
      expect { @runner.run(@err, @out) }.to raise_error(NotImplementedError)
    end
  end
end
