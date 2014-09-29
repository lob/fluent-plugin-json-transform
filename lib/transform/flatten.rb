class JSONTransformer
  def transform(json)
    return flatten(json, "")
  end

  def flatten(json, prefix)
    new_json = {}
    json.each do |key, value|
      if value.is_a?(Hash)
        json.delete key
        new_json["#{prefix}.#{key}"] = flatten(value, prefix)
      else
        new_json["#{prefix}.#{key}"] = value
      end
    end

    return new_json
  end
end
