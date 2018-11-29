##
# Esta classe será responsável por guardar os tipos de categorias possíveis
class CategoryType

  @@number_of_categories = 0

  attr_reader :name

  def initialize(name)
    # Securing class
    raise ArgumentError, "wrong name format (expected String, got #{id.class.name})" unless id.is_a? String
    # Saving attr
    @name = name
    @@number_of_categories += 1
    # Returning class
    self
  end

end
