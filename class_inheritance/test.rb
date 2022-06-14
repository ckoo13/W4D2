require_relative "./employee.rb"
require_relative "./manager.rb"

David = Employee.new("David", "TA",  10000, "Darren")
Shawna = Employee.new("Shawna", "TA", 12000, "Darren")
Darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
Ned = Manager.new("Ned", "Founder",  1000000)

Ned.add_employee(Darren)
Ned.add_employee(Shawna)
Ned.add_employee(David)
Darren.add_employee(Shawna)
Darren.add_employee(David)

p Ned.bonus(5) # => 500_000
p Darren.bonus(4) # => 88_000
p David.bonus(3) # => 30_000