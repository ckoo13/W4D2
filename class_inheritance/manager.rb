require_relative "./employee.rb"

class Manager < Employee

  def initialize(name, title, salary,  boss = nil)
    super
    @employees = []
  end

  def add_employee(name)
    @employees << name
  end

  def bonus(multiplier)
    salaries = 0
    
    @employees.each do |employee|
      salaries += employee.salary
    end
    
    salaries * multiplier
  end
end

