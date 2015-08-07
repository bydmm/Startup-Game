class Bromance < Step
  def start
    meeting_in_the_demo_cofee
  end

  private

  def meeting_in_the_demo_cofee
    puts '你每天都奋力的在DemoCoffee中一写就是一天'
    puts '在一次下午例行的分享活动中, 你展示了你的产品原型, 这时台下响起一阵阵嘘声..'
    puts '这时台下一个人喝止了他们, 并气愤的涨红了脸.'
    puts '他表示这是他见过最靠谱的项目'
    puts '他缓缓的向你走来, 你根据他的穿着你判断出来他的职业是:'
    puts '1.色彩搭配讲究的设计师'
    puts '2.身穿POLO衫的资深程序员'
    puts '3.笔挺西装的传统行业的企业家'
    co_founder_get_daze
  end

  def co_founder_get_daze
    case Keyboard.option(1..3)
    when 1
      puts '设计师首先要求你把领子翻对称, 否则没办法好好说话, 然后指出你的初期设计中100处低级错误.'
      puts '你们一起改改改, 就改到了天亮. 你们的产品因此总比别人好用一些'
      game.company.design_speed_weight = 1.2
    when 2
      puts '你们相谈甚欢，不知不觉就抱在一起开始了结对编程.'
      puts '(产品开发速度增加20%)'
      game.company.dev_speed_weight = 0.8
    when 3
      puts '企业家带你去了一家高档会所, 他表示自己虽然不太懂互联网创业, 但是愿意用100万入股50%'
      game.company.money += 1_000_000
    end
  end
end
