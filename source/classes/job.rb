##
# Esta classe será responsável por guardar os serviços que ficarão na fila esperando serem processados
class Job

  attr_reader :id, :category_type, :priority

  def initialize(id, category_type, priority)
    # Securing class
    raise ArgumentError, "wrong id format (expected String, got #{id.class.name})" unless id.is_a? String
    raise ArgumentError, "wrong category_type format (expected String, got #{category_type.class.name})" unless id.is_a? CategoryType
    raise ArgumentError, "wrong priority format (expected String, got #{priority.class.name})" unless id.is_a?(TrueClass) || id.is_a?(FalseClass)
    # Saving attr
    @id = id
    @category_type = category_type
    @priority = priority
    # Returning class
    self
  end

end
