class Stone < Coder
  def initialize
    @name = '石头'
    @salary = 30_000
  end

  def work(remain_difficulty)
    forward = rand(500...800)
    puts "#{name}巨巨轻描淡写，项目成功推进#{forward}"
    remain_difficulty - forward
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 随手给老婆买了个LV, 并表示LV不是奢侈品"
    company_money = company_money - salary
  end
end