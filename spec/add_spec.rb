require 'spec_helper'

describe Lucio do
  context 'add' do
    before :each do
      @lucio = Lucio.new
    end

    it 'without parameters should return zero' do
      @lucio.eval('(+)').should == 0
    end

    it 'with one value should return that value' do
      @lucio.eval('(+ 3)').should == 3
    end

    it 'with two values should return the sum' do
      @lucio.eval('(+ 3 5)').should == 8
    end

  end
end
