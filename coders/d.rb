class D < Coder
  def initialize
    @name = 'D菊'
    @salary = 3000
  end

  def work(remain_difficulty)
    forward = rand(30...50) / 1000.0
    puts "由于#{name}永不下班，项目进度迅速前进#{(forward * 100).round(2)}%"
    remain_difficulty * (1.0 - forward)
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 并表示会继续奋斗"
    company_money = company_money - salary
  end
end
