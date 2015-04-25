class Oott123 < Coder

  def initialize
    @type = types.sample
    @week = 0
    @month = 0
    @flags = {}
  end

  def name
    Rainbow("#{@type[:prefix]}的三三").color(@type[:color])
  end

  def salary(month = @month)
    (@type[:salary] * (1 + @type[:inc] * (month / 4))).to_int
  end

  def types
    [
      { :prefix => "勤劳能干", :color => :blue,
        :ability => 3, :salary => 12167, :inc => 0.2 },
      { :prefix => "物美价廉", :color => :yellow,
        :ability => 5, :salary => 3333, :inc => 0.2 },
      { :prefix => "好吃懒做", :color => :red,
        :ability => 1, :salary => 2333, :inc => 0.5 },
      { :prefix => "即将超神", :color => :green,
        :ability => 10, :salary => 10000, :inc => 0.4 },
      { :prefix => "资历平平", :color => :red,
        :ability => 4, :salary => 5233, :inc => 0.1 }
    ]
  end

  def use_money(name, salary)
    u = [
      "#{name}开心领取了#{salary}元薪水，思考了一下最后存进了银行",
      "#{name}默默地领取了#{salary}元薪水，然后捐给了 Wikipeida",
      "#{name}拿走了#{salary}元薪水，边数钱边吐槽老板真抠门"
    ]
    p @month % 4
    if @month % 4 < 3
      # 还没打算涨薪
      u.concat([
        "#{name}一边数着#{salary}元钞票，计算着加薪的日子",
        "#{name}默默地领了#{salary}元薪水，暗暗吐槽到到底啥时候加薪啊",
        "#{name}领了#{salary}元薪水，感叹这人生真艰难"
        ])
    end
    if @month % 4 < 3
      # 不涨薪
      "#{u.sample}。"
    else
      "#{u.sample}，并提出加薪到#{salary(@month+1)}元。如果不愿意，请#{Rainbow("下周就解雇他").red}。"
    end
  end

  def work(remain_difficulty)
    # 检查是否黑心老板
    if @week / 4 > @month
      # 检查良心发现
      if rand(100) > 30
        puts "#{name}表示自从上次解雇后并无心工作，本周并无进度。"
        return remain_difficulty
      else
        @month = @week / 4 # 修正工龄，虽然会有一些问题，不过凑合吧……
      end
    end
    productivity = rand(-100...100) # 遇到困难的比例是相同的
    if productivity > 0
      productivity = productivity * @type[:ability]
    else
      if rand(5) > 2
        productivity = productivity / @type[:ability] # 但好的程序猿可能降低自己遇到的困难的难度
      else
        productivity = productivity
      end
    end
    productivity = productivity + rand(-50...50)  # 天有不测风云，加入并非能力可控因素
    puts work_description(productivity)
    remain_difficulty -= productivity
    @week = @week + 1
    remain_difficulty
  end

  def work_description(productivity)
    descriptions = []
    if productivity > 0
      descriptions.concat([
        "#{name}用心工作，项目进展顺利，进度推进了 %d。",
        "#{name}努力工作，项目进度推进了 %d。",
        "#{name}连夜加班，项目进度推进了 %d。",
        "#{name}暴打了 PM 一顿，项目推进了 %d。",
        "#{name}得到同事的真传，项目进度推进了 %d。",
        "#{name}运用敏捷开发策略，项目进度推进了 %d。"
        ])
      if !has_flag?('fall_in_love')
        descriptions.concat([
          { :text => "#{@name}开始发展了一段办公室恋情，同时项目进度也推进了 %d。",
            :flag => [{:id => 'fall_in_love_with_fellow', :op => :set}, {:id => 'fall_in_love', :op => :set}] }
          ])
      end
    else
      descriptions.concat([
        "#{name}遇到了一些瓶颈，项目进度被推迟了 %d。",
        "#{name}表示 PHP 是最好的语言，重构了项目的核心部分，结果惨遭性能瓶颈，项目进度推迟了 %d。",
        "#{name}在一台 VPS 上配置了 unicorn ，成功的占满了所有的内存导致项目进度推迟了 %d。",
        "#{name}为了花括号是否应该另起一行和同事起了争执，项目进度被推迟了 %d。",
        "#{name}在代码里用了 23 种设计模式，被骂得狗血淋头，项目进度推迟了 %d。",
        "#{name}加班过度，使用 rm -rf 的时候多敲了一个空格，导致测试环境被清空，项目进度推迟了 %d。",
        "#{name}接了一些私活，项目进度被推迟了 %d。"
        ])
    end
    # flags 情况
    if has_flag?('fall_in_love')
      if productivity > 0
        descriptions.concat([
          { :text => "#{name}的女朋友这周每天都到公司给他送爱心便当，项目进度推进了 %d。",
            :flag => {:id => 'love_point', :op => :inc} },  # 然而 love_point 并没有什么卵用
          { :text => "#{name}和女朋友一起吃喝玩乐，工作效率提升，项目进度推进了 %d。", 
            :flag => {:id => 'love_point', :op => :inc} }
          ])
      else
        descriptions.concat([
          # o(￣ヘ￣o＃)哼你们就笑吧
          { :text => "#{name}分手了，项目进度被推迟 %d 。",
            # ps. 可能需要清除其它恋爱关系。
            :flag => [{:id => 'fall_in_love_with_fellow', :op => :clear},
                      {:id => 'fall_in_love', :op => :clear},
                      {:id => 'love_point', :op => :clear}]}
          ])
      end
    end
    description = descriptions.sample
    if description.is_a?(Hash)
      puts description[:flag]
      produce_flags(description[:flag])
      puts @flags
      description = description[:text]
    end
    description % productivity.abs
  end

  # Flags 相关
  
  def has_flag?(id)
    @flags.has_key?(id)
  end

  def get_flag(id)
    if has_flag?(id)
      @flags[id]
    else
      false
    end
  end

  def produce_flags(flags)
    if not flags.is_a?(Array)
      flags = [flags]
    end
    flags.each {|flag|
      id = flag[:id]
      case flag[:op]
      when :set
        if !has_flag?(id)
          @flags[id] = true
        end
      when :clear
        if has_flag?(id)
          @flags.delete(id)
        end
      when :inc
        if has_flag?(id)
          @flags[id] = @flags[id] + 1
        else
          @flags[id] = 1
        end
      when :dec
        if has_flag?(id)
          @flags[id] = @flags[id] - 1
        else
          @flags[id] = -1
        end
      end
    }
  end

  def pay(company_money)
    puts use_money(name, salary)
    remain = company_money - salary
    @month = @month + 1
    remain
  end
end