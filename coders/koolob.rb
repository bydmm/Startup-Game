class Koolob < Coder

	def initialize
		@name = 'koolob'
		@salary = 2000
		@contribution = 0
	end

	def work(remain_difficulty)
		n = rand(100)
		if n > 30
			forward = rand(10...99)
			@contribution += forward
			con = @contribution
			puts "#{name}又加班了，项目推进#{forward},本月的绩效是#{con}"	
			remain_difficulty - forward
		elsif n > 10
			forward = rand(100...500)
			@contribution += forward
			con = @contribution
			puts "#{name}福至心灵，有如神助，项目推进#{forward},本月的绩效是#{con}"	
			remain_difficulty - forward
		else
			bug = rand(1...3)
			forward = bug * rand(1...50)
			@contribution -= forward
			con = @contribution
			puts "#{name}引入了#{bug}个Bug，难度增加#{forward},本月的绩效是#{con}"			
			remain_difficulty + forward
		end
	end

	def pay(company_money)
		jixiao = @contribution * 2
		gongzi = salary
		@contribution = 0
		puts "#{name}领取2000元底薪和#{jixiao}元绩效奖励，拿去炒股都陪光了。"
		company_money - gongzi
	end

	def salary
		2000 + @contribution * 2
  	end
end