class LeeXu < Coder
  def initialize
    @name = 'iLeeXu'
    @salary = 10_000
  end

  def work(remain_difficulty)
    case rand(10)
    when 0..1
      forward = rand(10..50)
      puts "#{name}对项目进行了小修小补，将项目推进了#{forward}"
      remain_difficulty - forward
    when 2..3
      bugs = rand(1..5)
      fallback = bugs * rand(1..50)
      puts "由于老板要求加班，#{name}疲惫不堪，引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    when 4..6
      forward = rand(100..500)
      puts "相信自己可以改变世界，#{name}将项目推进了#{forward}"
      remain_difficulty - forward
    when 7..9
      puts "#{name}只顾和新来的妹子搭讪，项目丝毫没有进展"
      remain_difficulty
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水，然后请女神吃了一份6块钱的麻辣烫。。。"
    company_money - salary
  end
end
