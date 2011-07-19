require 'spec_helper'

describe Lucio do
  context 'empty lists' do
    before :each do
      @lucio = Lucio.new
    end

    it 'given an empty list should return nil' do
      @lucio.eval('()').should be_nil
    end

    it 'given two empty lists should return nil' do
      @lucio.eval('()()').should be_nil
    end

    it 'given nested lists should be empty' do
      lambda {@lucio.eval('(())')}.should raise_error

    end

  end
end
