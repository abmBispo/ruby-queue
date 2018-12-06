##
# Job class responsible for keep data for later execution jobs
class Job
  ##
  # Attributes
  attr_reader :id, :category_type, :priority

  ##
  # Initialization

  def initialize(id, category_type, priority)
    # Securing class
    raise ArgumentError, "wrong id format (expected String, got #{id.class.name})" unless id.is_a?(String)
    raise ArgumentError, "wrong category_type format (expected String, got #{category_type.class.name})" unless category_type.is_a?(String)
    unless priority.is_a?(TrueClass) || priority.is_a?(FalseClass)
      raise ArgumentError, "wrong priority format (expected boolean, got #{priority.class.name})"
    end

    # Saving attr
    @id = id
    @category_type = category_type
    @priority = priority
  end

  ##
  # Helper methods

  def to_s
    "id: #{id} (#{id.class.name}),
    category_type: #{category_type} (#{category_type.class.name}),
    priority: #{priority} (#{priority.class.name})"
  end

  def urgent?
    priority
  end

  def to_json
    {
      id: id,
      category_type: category_type.to_json,
      priority: priority
    }
  end
end
