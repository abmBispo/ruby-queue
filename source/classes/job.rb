##
# Esta classe será responsável por guardar os serviços que ficarão na fila esperando serem processados
class Job

  ##
  # Attributos

  @@number_of_jobs = 0
  attr_reader :id, :category_type, :priority

  ##
  # Inicialização

  def initialize(id, category_type, priority)
    # Securing class
    raise ArgumentError, "wrong id format (expected String, got #{id.class.name})" unless id.is_a?(String)
    raise ArgumentError, "wrong category_type format (expected String, got #{category_type.class.name})" unless category_type.is_a?(String)
    raise ArgumentError, "wrong priority format (expected boolean, got #{priority.class.name})" unless priority.is_a?(TrueClass) || priority.is_a?(FalseClass)
    # Saving attr
    @id = id
    @category_type = category_type
    @priority = priority
    # Returning class
    self
  end


  ##
  # Métodos de ajuda

  def to_s
    "id: #{id} (#{id.class.name}), category_type: #{category_type.to_s} (#{category_type.class.name}), priority: #{priority} (#{priority.class.name})"
  end

  def to_json
    {
      id: id,
      category_type: category_type.to_json,
      priority: priority
    }
  end

  ##
  # Métodos da classe ou estáticos
  def self.number_of_categories
    @@number_of_categories
  end

end
