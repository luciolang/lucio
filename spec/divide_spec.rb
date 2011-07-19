require 'spec_helper'

describe Lucio do
  context 'divide' do
    before :each do
      @lucio = Lucio.new
    end

    it 'without parameters should return zero' do
      lambda {@lucio.eval('(/)')}.should raise_error
    end

    it 'with one value should return that value' do
      @lucio.eval('(/ 2)').should == 0.5
    end

    it 'with two values should return the sum' do
      @lucio.eval('(/ 8 4)').should == 2
    end

    it 'with nested lists should eval the list before return the sum' do
      @lucio.eval('(/ 4 (/ 8 2))').should == 1
    end

  end
end
