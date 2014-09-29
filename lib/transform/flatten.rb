class JSONTransformer
  def transform(json)
    return flatten(json, "")
  end

  def flatten(json, prefix)
    json.keys.each do |key|
      if prefix.empty?
        full_path = key
      else
        full_path = [prefix, key].join('.')
      end

      if json[key].is_a?(Hash)
        value = json[key]
        json.delete key
        json.merge! flatten(value, full_path)
      else
        value = json[key]
        json.delete key
        json[full_path] = value
      end
    end
    return json
  end
end
