class Boris < Coder
	def initialize
		@name = '丁博约'
		@salary = 100000
	end

	def work(remain_difficulty)
		 if rand(10) > 4
      forward = rand(100...500)
      puts "#{name} 灵感大发，成功将项目推进#{forward}"
      remain_difficulty - forward
    else
      bugs = rand(1...5)
      fallback = bugs * rand(0...50)
      puts "#{name} 进入了拖延症晚期，项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
	end

	def pay(company_money)
		puts "#{name}领取了#{salary}元工资，然后一路向西去了东莞"
		company_money - salary
	end
end
