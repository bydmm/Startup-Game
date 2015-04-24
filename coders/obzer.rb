class Obzer < Coder
  def initialize
    @name = 'Ob'
    @salary = 1500 + random
  end

  def work(remain_difficulty)
    random = rand(10)
    if random > 1 and random < 3 
      forward = (salary / 10)  +  rand(10...200) - rand(10...200) 
      puts "#{name}奋笔疾书，成功将项目推进#{forward}"
      remain_difficulty - forward
    elsif random > 3 and random < 5
      puts "#{name}在上班时间偷偷给学姐写情书，白白浪费了一周"
      remain_difficulty
    elsif  random > 5 and random < 7
      fallback = (salary / 10)  +  rand(10...200) - rand(10...200) 
      puts "#{name}不慎对自己的开发机和托管代码的服务器使用了rm -rf /* , 项目难度增加#{fallback}"
      remain_difficulty += fallback
    elsif  random > 7 and random < 9
      forward = ((salary / 10)  +  rand(10...200) ) * (1+(random / 100))
      puts "学姐前来探望#{name}，#{name}战斗力上升#{random}个百分点,成功将项目推进#{forward}"
      remain_difficulty - forward
    else
      puts "#{name}在项目评审会上睡着了，不知道自己该干啥,白白浪费了一周"
      remain_difficulty
    end
  end
  def pay(company_money)
    puts "#{name}的薪水实在是太低了!他不好意思告诉你们他领了多少薪水!#{salary} "
    company_money = company_money - salary
  end
end