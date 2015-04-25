class Killernova < Coder
  
  def initialize
    @name = '存在的虚无'
    @salary = 15_000
  end

  
  def work(remain_difficulty)
    if rand(10) > 3
      forward = rand(300...600)
      puts "#{name}日夜奋斗，终于将项目推进了#{forward}"
      remain_difficulty -= forward
    elsif rand(10) < 6
    	forward = rand(600..900)
    	puts "#{name}RP爆棚，暴击#{forward}点进度"
    	remain_difficulty -= forward
    else
      bugs = rand(1...5)
      fallback = bugs * rand(0...10)
      puts "#{name}连续战斗，疲惫不堪，不幸引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty += fallback
    end

    if remain_difficulty < 2000 && remain_difficulty > 10
      forward = (remain_difficulty * rand() * 0.1).to_i
      puts "#{name}感受到了成功的喜悦，额外搞定了#{forward}点进度"
      remain_difficulty -= forward
    end

    time = Time.new
    if time.month > 3 && time.month < 10 && time.hour > 20 && time.hour < 23
      forward = time.min * rand(10..15)
      puts "#{name}最喜欢这个时间了，效率飙升啊，轻松加愉快得解决了#{forward}点额外进度"
      remain_difficulty -= forward
    end
    return remain_difficulty
  end

  
  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 向往已久的Mac Book Pro终于到手～～～"
    company_money - salary
  end

  
  def salary
  	@salary + 2000 * rand(1..10)
  end
end