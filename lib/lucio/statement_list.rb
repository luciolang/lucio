module Lucio
  class StatementList
    def initialize
      @list = []
    end

    def add(statement)
      statement.each{|i| @list << i}
    end

    def get
      v = @list[0]
      @list = @list.drop[0]
      v
    end

    def size
      puts "#{@list.inspect}"
      @list.size
    end
  end
end
