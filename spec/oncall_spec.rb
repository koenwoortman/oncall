describe Oncall do
  it 'should return an instance of the Options class' do
    expect(Oncall.options).to be_instance_of(Oncall::Options)
  end

  it 'should define a version' do
    expect(Oncall::VERSION).to be_instance_of(String)
  end

  it 'should define the script name' do
    expect(Oncall::SCRIPT).to be_instance_of(String)
  end
end
