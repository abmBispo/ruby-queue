class Hash
  def clean_spaces_keys!
    keys.each do |key|
      next unless key.is_a? String

      value = delete(key)
      self[key.gsub(' ','')] = value
    end
  end

  def deep_transform_keys!(&block)
    keys.each do |key|
      value = delete(key)
      self[yield(key)] = value.is_a?(Hash) ? value.deep_transform_keys!(&block) : value
    end
    self
  end

  def deep_symbolize_keys!
    deep_transform_keys!{ |key| key.to_sym rescue key }
  end
end
