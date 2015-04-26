class Coder
  attr_accessor :name, :salary , :job

  def name
    Rainbow(@name).cyan
  end

  def pay(company_money)
    puts "#{name}领取了#{salary.color_salary}元薪水"
    company_money - salary
  end
end
