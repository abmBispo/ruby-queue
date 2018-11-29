##
# Esta classe será responsável por guardar os tipos de categorias possíveis para os Jobs
class CategoryType

  @@number_of_categories = 0

  attr_reader :name

  def initialize(name)
    # Securing class
    raise ArgumentError, "wrong name format (expected String, got #{name.class.name})" unless name.is_a? String
    # Saving attr
    @name = name
    @@number_of_categories += 1
    # Returning class
    self
  end

  def to_s
    "name: #{name}"
  end

  def to_json
    {
      name: name
    }
  end

end
