class Aquariuslt < Coder
  def initialize
    @name = 'Aquariuslt'
    @salary = 2500
  end

  def work(remain_difficulty)
    forward = rand(2...5)
    puts "#{name}一边上学一边写代码，项目进度推进了#{forward}"
    remain_difficulty - forward
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 直接全款存进了购买Mac Pro的御用款中"
    company_money - salary
  end
end
