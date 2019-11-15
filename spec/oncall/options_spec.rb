describe Oncall::Options do
  describe 'initialize' do
    before(:each) do
      @options = Oncall::Options.new
    end

    it 'should set the default env' do
      expect(@options.env).to eq('develop')
    end

    it 'should set the default search pattern' do
      expect(@options.pattern).to eq('**{,/*/**}/*_oncall.rb')
    end

    it 'should set an empty exclude pattern as default' do
      expect(@options.exclude).to eq('')
    end
  end
end
