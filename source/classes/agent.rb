##
# Esta classe será responsável por processar os serviços que ficarão em espera na fila
class Agent

  ##
  # Attributos

  @@number_of_agents = 0
  attr_reader :id, :name, :primary_skill_set, :secondary_skill_set

  ##
  # Inicialização

  def initialize(id, name, primary_skill_set, secondary_skill_set)
    # Securing class
    raise ArgumentError, "wrong id format (expected String, got #{id.class.name})" unless id.is_a? String
    raise ArgumentError, "wrong name format (expected String, got #{id.class.name})" unless name.is_a? String
    raise ArgumentError, "wrong primary_skill_set format (expected Array, got #{primary_skill_set.class.name})" unless primary_skill_set.is_a?(Array)
    raise ArgumentError, "wrong type inside primary_skill_set (expected CategoryType, got #{primary_skill_set.first.class.name})" unless primary_skill_set.first.is_a?(String) || primary_skill_set.first.nil?
    raise ArgumentError, "wrong secondary_skill_set format (expected Array, got #{secondary_skill_set.class.name})" unless secondary_skill_set.is_a?(Array)
    raise ArgumentError, "wrong type inside primary_skill_set (expected CategoryType, got #{secondary_skill_set.first.class.name})" unless secondary_skill_set.first.is_a?(String) || secondary_skill_set.first.nil?
    # Saving attr
    @id = id
    @name = name
    @primary_skill_set = primary_skill_set
    @secondary_skill_set = secondary_skill_set
    # Returning class
    self
  end


  ##
  # Métodos de ajuda

  def to_s
    "id: #{id} (#{id.class.name}), name: #{name} (#{name.class.name}), primary_skill_set: #{primary_skill_set.map{|i| i.to_s }} (#{primary_skill_set.class.name}), secondary_skill_set: #{secondary_skill_set.map{|i| i.to_s }} (#{secondary_skill_set.class.name})"
  end

  def to_json
    {
      id: id,
      primary_skill_set: primary_skill_set,
      secondary_skill_set: secondary_skill_set
    }
  end

  ##
  # Métodos da classe ou estáticos
  def self.number_of_categories
    @@number_of_categories
  end

end
