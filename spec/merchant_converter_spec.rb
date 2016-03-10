require 'spec_helper'

RSpec.describe MerchantConverter, '#converter' do
  it 'should return the answer of how much is glob?' do
    m = MerchantConverter.new
    expect(m.convert('spec/support/test1.txt')).to eq "glob is 1\n"
  end
  it 'should return the answer of how many Credits is glob prok Silver ?' do
    m = MerchantConverter.new
    expect(m.convert('spec/support/test2.txt')).to eq "glob prok Silver is 68 Credits\n"
  end
  it 'should return "I have no idea what you are talking about"' do
    m = MerchantConverter.new
    expect(m.convert('spec/support/test3.txt')).to eq "I have no idea what you are talking about\n"
  end
  it 'should return full text' do
    m = MerchantConverter.new
    expect(m.convert('spec/support/test_final.txt'))
      .to eq "pish tegj glob glob is 42\nglob prok Silver is 68 Credits\nglob prok Gold is 57800 Credits\nglob prok Iron is 782 Credits\nI have no idea what you are talking about\n"
  end
end
