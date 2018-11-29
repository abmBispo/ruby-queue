##
# Esta classe será responsável por guardar os tipos de categorias possíveis para os Jobs
class CategoryType

  ##
  # Attributos

  @@number_of_categories = 0
  @@unique_names = []
  attr_reader :name

  ##
  # Inicialização

  def initialize(name)
    # Securing class
    raise ArgumentError, "wrong name format (expected String, got #{name.class.name})" unless name.is_a? String
    raise ArgumentError, "wrong name format (already taken)" if @@unique_names.include? name
    # Saving attr
    @name = name
    @@number_of_categories += 1
    @@unique_names << name
    # Returning class
    self
  end

  ##
  # Métodos de ajuda

  def to_s
    "name: #{name} (#{name.class.name})"
  end

  def to_json
    {
      name: name
    }
  end

  ##
  # Métodos da classe ou estáticos
  def self.number_of_categories
    @@number_of_categories
  end


end
