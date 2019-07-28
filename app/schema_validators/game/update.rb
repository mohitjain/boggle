module SchemaValidators
  module Game
    class Update

      def initialize(input:)
        self.input = input
      end

      def valid?
        JSON::Validator.validate(
          schema, input
        )
      end

      private

      def schema
        {
          "type" => "object",
          "required" => ["id", "token", "word"],
          "properties" => {
            "duration" => { "type" => "integer" },
            "random" => { "token" => "string" },
            "random" => { "word" => "string" }
          }
        }
      end

      attr_accessor :input
    end
  end
end
