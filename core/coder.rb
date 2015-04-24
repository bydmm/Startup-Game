class Coder
  attr_accessor :name, :salary

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水"
    company_money = company_money - salary
  end
end