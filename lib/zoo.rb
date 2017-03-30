require_relative 'cage'

class Zoo
  attr_reader :cages, :employees

  def initialize(name, season_opening_date, season_closing_date)
    @name=name
    @season_opening_date=season_opening_date
    @season_closing_date=season_closing_date
    @cages=[]
    10.times do
      @cages << Cage.new
    end
    @employees=[]
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    @season_opening_date < date && date < @season_closing_date
  end

  def add_animal(animal)
    if @cages.any? { |cage| cage.empty? }
      @cages.each do |cage|
        if cage.empty?
          cage.animal = animal
          break
        end
      end
    else
      raise ZooAtCapacity
    end
  end

  def visit
    waves_hello = ''
    @employees.each do |employee|
      waves_hello += "#{employee.name} waved hello!\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        waves_hello += "#{cage.animal.speak}\n"
      end
    end
    return waves_hello
  end
end

class ZooAtCapacity < StandardError
end
