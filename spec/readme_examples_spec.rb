require 'spec_helper'

describe Lucio do
  context 'Examples found in README file' do
    before :each do
      @lucio = Lucio.new
    end

    it 'first example: math' do
      @lucio.eval('(/ (* (+ 1 2) (+3 4)) 2)').should == 10.5
    end

    it 'second example: eql?' do 
      @lucio.eval('(eql? (* (+ 1 2) 3) 9)').should be_true
    end

    it 'third example: if' do
      @lucio.eval('
(if (eql? 10.5 (/ (* (+ 1 2) (+ 3 4)) 2))
    ("great"))').should == "\"great\""
    end

    it 'fourth example: if else' do
      code = '
(if (eql? 0 (/ (* (+ 1 2) (+ 3 4)) 2))
  ("great")
  ("ouch"))'

      @lucio.eval(code).should == "\"ouch\""
    end
  end
end
