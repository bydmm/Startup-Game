class Tedko < Coder
	def initialize
		@name = '泰德子'
		@salary = 12000
	end

	def work(remain_difficulty)
		seed = rand(10)
		if seed > 5
			forward = rand(30...200)
			puts "#{name}穿女装写代码，成功完成项目#{forward}"
			remain_difficulty - forward
		else
			forward = rand(1...5)
			puts "#{name}没有找到女朋友，项目只推进了#{forward}"
			remain_difficulty - forward
		end
	end

	def pay(company_money)
		puts "#{name}领取了#{salary}元工资，把所有钱花在吃吃吃和买衣服上"
		company_money - salary
	end
end
