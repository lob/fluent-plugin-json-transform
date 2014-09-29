module Fluent
  class TextParser
    class JSONTransformParser
      include Configurable
      config_param :transform_script, :string

      def configure(conf)
        @transform_script ||= "#{__dir__}/transform/nothing.rb"
        require @transform_script
        @transformer = JSONTransformer.new
      end

    
      def call(text)
        raw_json = JSON.parse(text)
        return text, @transformer.transform(raw_json)
      end
    end
  register_template("json_transform", Proc.new { JSONTransformParser.new })
  end
end

