class Kok < ProductManager
  def initialize
    @name = 'kokdemo'
    @salary = 4000
    @rageCode = 0
  end

  def work(remain_difficulty)
    if rand(10) > 4
      forward = Integer(rand(1...10)*remain_difficulty/100)
      coder = rand(1...3)
      @rageCode += coder
      puts "#{name}觉得项目推进太顺利，大笔一挥，又增加了几个功能点，难度激增#{forward}，激怒了#{coder}个程序员"
      remain_difficulty += forward
    elsif @rageCode > 2
      forward = Integer(rand(1...10)*remain_difficulty/100)
      puts "#{name}被#{@rageCode}个程序员痛打一顿，跪下道歉并删减了几个无用功能，项目难度减少了#{forward}，大家表示很欢迎这种日常活动"
      @rageCode = 0
      remain_difficulty -= forward
    else
      forward = rand(1...500)
      puts "#{name}想到了一个好主意，推进了整个项目#{forward}"
      remain_difficulty -= forward
    end
  end

  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 在淘宝上犹豫买哪个镜头比较好。"
    company_money - salary
  end
end
