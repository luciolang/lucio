module Lucio
  module Operator
    class Function
      attr :type

      def initialize
        @type = :function
      end

      def execute(*params)
        raise "Operator not implemented"
      end
    end
  end
end
