require 'spec_helper'

describe Lucio do
  context 'behead' do

    it 'should return the first item and the rest' do
      h, t = Lucio.behead [1, 2, 3, 4]
      h.should == 1
      t.should == [2, 3, 4]
    end
  end
end
