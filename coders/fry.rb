class Fry < Coder
  def initialize
    @name = 'Fry'
    @salary = 1000
  end

  def work(remain_difficulty)
    state = rand(10)
    if state > 3 && state < 9
      forward = rand(100...500)
      puts "#{name}完全不会Ruby，照猫画虎，侥幸将项目推进#{forward}"
      remain_difficulty - forward
    elsif state >= 9
      surprise = rand(10)
      if surprise >= 9
        forward = rand(800...1000)
        puts "#{name}完全不会Ruby，照猫画猫出现暴击，风一般的将项目推进#{forward}, 并且用Ruby重写了喵歌搜索"
      elsif
        forward = rand(500...600)
        puts "#{name}完全不会Ruby，照猫画猫，非常走运的将项目推进#{forward}"
      end
      remain_difficulty - forward
    else
      bugs = rand(1...5)
      fallback = bugs * rand(0...50)
      puts "#{name}完全不会Ruby, 照虎画猫，引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 然而买了一本Ruby入门指南。"
    company_money - salary
  end

end