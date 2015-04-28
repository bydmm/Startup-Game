class Cloudy9101 < Coder
  def initialize
    @name = 'Cloudy9101 '
    @salary = 6543
  end

  def work(remain_difficulty)
      if rand(10) > 3
        forward = rand(100...500)
        puts "#{name}吐出十升鲜血，成功将项目推进#{forward}"
        remain_difficulty - forward
      else
        bugs = rand(1...10)
        fallback = bugs * rand(0...50)
        puts "#{name}堆代码的过程中打死数只蟑螂，却引入了#{bugs}个BUG, 项目难度增加#{fallback}"
        remain_difficulty + fallback
      end
    end

    def pay(company_money)
      puts "#{name}领取了#{salary}元薪水, 然而并没有什么屌用。"
      company_money - salary
    end

    def salary
      rand(3000...10000)
    end
end
