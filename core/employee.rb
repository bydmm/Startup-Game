class Employee
  attr_accessor :name, :salary, :bonus ,:job

  def name
    Rainbow(@name).cyan
  end

  def pay(company_money)
    puts "#{name}领取了#{salary.color_salary}薪水"
    company_money - salary
  end
end
