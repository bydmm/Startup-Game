class Ludwig < Coder
    def initialize
        @name = 'Ludwig'
        @salary = 3_000
    end

    def work(remain_difficulty)
        state = rand(10) 
        if state > 4
            forward = rand(1...500)
            puts "#{name}加班加点,成功将项目推进#{forward}"
            remain_difficulty - forward
        elsif state < 5 && state > 2
            bugs = rand(1...5)
            fallback = bugs * rand(0...50)
            puts "奋战25小时后#{name}于半梦半醒之间提交了feature,却引入了#{bugs}个BUG, 项目难度增加#{fallback}"
            remain_difficulty + fallback
        elsif state < 2
            forward = rand(1...1000)
            puts "受到程序员鼓励师的鼓励,#{name}突然有如神助,成功将项目推进#{forward}"
            remain_difficulty - forward
        end
    end

    def pay(company_money)
        puts "#{name}领取了#{salary}元薪水,从中拿了12元请鼓励师小妹吃了顿麻辣烫改善生活,然后把余下的钱都存入了余额宝"
        company_money - salary
    end
end 
