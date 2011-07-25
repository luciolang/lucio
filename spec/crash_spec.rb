require 'spec_helper'

describe Lucio do
  context 'crash' do
    before :each do
      @lucio = Lucio.new
    end

    it 'should crash' do
      code = '(crash "and burn")'

      lambda { @lucio.eval(code) }.should raise_error
    end

    it 'should not crash' do
      code = '
(if (eql? 1 2)
  (crash "whattahell?")
  ("ok"))'

      lambda { @lucio.eval(code) }.should_not raise_error
    end

  end
end
