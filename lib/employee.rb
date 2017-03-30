class Employee
  attr_reader :name, :title

  def initialize(name, title = "Zoo Keeper")
    @name = name
    @title = title
  end

  def full_title
    return "#{@name}, #{@title}"
  end

  def greet
    return "#{@name} waved hello!"
  end

end
