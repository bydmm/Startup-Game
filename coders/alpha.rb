class Alpha < Coder
	def initialize
		@name = '路人Alpha'
		@salary = 2999
	end

	def work(remain_difficulty)
		seed = rand(10)
		if seed > 5
			forward = rand(10...100)
			puts "#{name}刚跑了8公里，精神状态良好，成功完成项目#{forward}"
			remain_difficulty - forward
		else
			forward = rand(1...5)
			puts "#{name}昨晚补番补到大半夜，严重睡眠不足，项目只推进了#{forward}"
			remain_difficulty - forward
		end
	end

	def pay(company_money)
		puts "#{name}领取了#{salary}元工资，现阶段对生活毫无追求的他把所有工资存进了余额宝"
		company_money - salary
	end
end

