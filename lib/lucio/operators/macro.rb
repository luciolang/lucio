module Lucio
  module Operator
    class Macro
      attr :type

      def initialize
        @type = :macro
      end

      def execute(*params)
        raise "Operator not implemented"
      end
    end
  end
end
