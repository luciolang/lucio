require 'spec_helper'

describe Lucio do
  context 'send' do
    before :each do
      @lucio = Lucio.new
    end

    it 'should send a message to a native Ruby object' do
      code = '(send + 1 2)'
      @lucio.eval(code).should == 3
    end

  end
end
