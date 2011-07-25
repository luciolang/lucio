require 'spec_helper'

describe Lucio do
  context 'error handling' do
    before :each do
      @lucio = Lucio.new
    end

    it 'should handle the error' do
      code = '
(beware
  (crash "lets break the things")
  ("saved"))'

      @lucio.eval(code).should == 'saved'

      end
  end
end
