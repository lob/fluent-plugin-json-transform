module Fluent
  class TextParser
    class JSONTransformParser
      DEFAULTS = [ 'nothing', 'flatten' ]

      include Configurable
      config_param :transform_script, :string
      config_param :script_path, :string

      def configure(conf)
        @transform_script = conf['transform_script']

        if DEFAULTS.include?(@transform_script)
          @transform_script =
            "#{__dir__}/../../transform/#{@transform_script}.rb"
        elsif @transform_script == 'custom'
          @transform_script = conf['script_path']
        end

        require @transform_script
        @transformer = JSONTransformer.new
      end

      def parse(text)
        raw_json = JSON.parse(text)
        return nil, @transformer.transform(raw_json)
      end
    end
  register_template("json_transform", Proc.new { JSONTransformParser.new })
  end
end

