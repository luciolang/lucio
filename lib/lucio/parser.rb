module Lucio
  class Parser
    def self.parse(code)
      sep = /\(|\)/
      stack = StatementList.new

      statements = (code =~ sep ? code.split(sep) : compile(code))
      statements.each{|s| stack.add compile(s)}

      stack
    end

    private
      def self.compile(statement)
        statement.split(' ').delete_if{|x| x.strip == ''}
      end
  end
end
