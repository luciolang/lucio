require 'polyglot'
require 'treetop'
require 'lucio_syntax'

describe "lucio" do
  before (:all) do
    @parser = LucioParser.new
  end

	context "list" do
	  it "integer" do
  	  @parser.parse('(2)').should be
	  end

	  it "integers" do
  	  @parser.parse('(2)(3)').should be
	  end

	  it "decimal" do
  	  @parser.parse('(3.14)').should be
	  end

	  it "valid string" do
  	  @parser.parse('("this is a text")').should be
	  end

	  it "invalid string" do
  	  @parser.parse('(this is a text)').should_not be
	  end

    it "boolean" do
      @parser.parse('(true)').should be
  	  @parser.parse('(true)').should be
  	  @parser.parse('(true)(false)').should be

      @parser.parse('true').should_not be
  	  @parser.parse('false').should_not be
	  end

    it 'null'  do
      @parser.parse('(null)').should be

      @parser.parse('null').should_not be
      @parser.parse('nullus').should_not be
    end

    it 'space' do
      @parser.parse('( )').should be
      @parser.parse('(  )').should be
    end

    it 'simple expression' do
      @parser.parse('(+ 1 2)').should be
    end

    it 'long expression' do
      @parser.parse('(+ 1 2 3 4)').should be
    end

    it 'composed expression' do
      @parser.parse('(+ 1 (* 2 3))').should be
    end

    it 'composed long expression' do
      @parser.parse('(+ 1 2 3 (* 4 5 6))').should be
    end

    it 'and now we return to begin' do
      @parser.parse('(* (+ 1 2) 3)').should be

      @parser.parse('(/ (* (+ 1 2)(+ 3 4)) 2)').should be
    end

	end

end

