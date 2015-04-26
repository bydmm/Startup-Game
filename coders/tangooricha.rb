class Tangooricha < Coder
	def initialize
		@name = 'Tangooricha'
		@salary = 5_000
	end

	def work(remain_difficulty)
		case rand(100)
		when 0..50
			puts "#{name}压根不会写代码，项目丝毫没有进展。"
			remain_difficulty
		when 51..60
			forward = rand(0.01..0.5)
			bugs = rand(1..10)
			fallback = bugs * rand(1..5)
			puts "#{name}在老板的淫威下，硬着头皮写了一段代码，将项目推进了#{forward}，但引入了#{bugs}个BUG, 项目难度增加#{fallback}。"
			remain_difficulty - forward + fallback
		when 61..80
			forward = rand(-100..100)
			bugs = rand(1..20)
			fallback = bugs * rand(-10..10)
			puts "#{name}喝高了，酒后写代码，反正也不知道自己在写什么，结果将项目推进了#{forward}，但引入了#{bugs}个BUG, 项目难度增加#{fallback}。"
			remain_difficulty - forward + fallback
		when 81..90
			bugs = rand(1..5)
			fallback = bugs * rand(1..10)
			puts "#{name}看完AV，打完飞机，在贤者状态下写代码，结果引入了#{bugs}个BUG, 项目难度增加#{fallback}。"
			remain_difficulty + fallback
		when 91..99
			puts "#{name}打游戏忘了写代码，项目丝毫没有进展。"
			remain_difficulty
		end
	end
	
	def pay(company_money)
		case rand(5)
		when 0..2
			puts "#{name}领取了#{salary}元薪水，赶紧存进余额宝。"
			company_money - salary
		when 3..4
			puts "#{name}领取了#{salary}元薪水，结果转眼就被人偷了100元。"
			company_money - salary
		end
	end
end
