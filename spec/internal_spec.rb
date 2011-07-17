require 'spec_helper'

describe Lucio do
  context 'internal' do
    before :each do
      @lucio = Lucio.new
    end

    it "should sample some internal usage" do
      @lucio.eval('()')
    end
  end
end
