module Fluent
  class TextParser
    class JSONTransformParser
      include Configurable
      config_param :transform, :string, :default => nil

      def configure(conf)
        if !@transform
          @parse_function = 
            lambda do |text|
              return text
            end
        else
          # load transform function as lambda from file
          load @transform
          @parse_function = JSONTransform::Transform
        end
      end

    
      def call(text)
        # @parse_Function.call(text)
        yield text
      end

    end
  end
end

