require 'spec_helper'

describe Lucio do
  context 'require' do
    before :each do
      @lucio = Lucio.new
    end

    it 'include a invalid file should raise an error' do
      code = '(include "invalid")'
      lambda { @lucio.eval(code) }.should raise_error
    end

    it 'define a function inside the external file' do
      code = '
(include "spec/include_spec")
(average 10 20)      
'
      @lucio.eval(code).should == 15
    end

  end
end
