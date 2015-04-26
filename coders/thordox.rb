class thordox < Coder
  def initialize
    @name = 'Thordox'
    @salary = 5000
  end


  def work(remain_difficulty)
    if rand(10) > 3
      forward = rand(100...500)
      puts "老板不给配MacBookPro，#{name}只能苦逼地用爪机码代码，成功将项目推进#{forward}"
      remain_difficulty - forward
    else
      bugs = rand(1...5)
      fallback = bugs * rand(0...50)
      puts "#{name}的爪机根本没法用！引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 毫不犹豫地买了台MacBookPro"
    company_money - salary
  end
end