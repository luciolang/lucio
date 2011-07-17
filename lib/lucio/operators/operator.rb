module Lucio
  module Operator
    class Operator
      attr :type

      def type
        @type
      end

      def execute(*items)
        raise "Incomplete operator"
      end
    end

    class Function
      def initialize
        super.type = :function
      end
    end

    class Macro
      def initialize
        super.type = :macro
      end

    end

  end
end
