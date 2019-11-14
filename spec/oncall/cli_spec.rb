describe Oncall::CLI do
  describe 'initialize' do
    before(:each) do
      @args = []
      @cli = Oncall::CLI.new(@args)
    end

    it 'should set the args property' do
      expect(@cli.args).to be(@args)
    end

    it 'should set the options property' do
      expect(@cli.options).to be_instance_of(Oncall::Options)
    end
  end
end
