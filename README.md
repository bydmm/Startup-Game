
# 创业游戏

![screen shoot](https://raw.githubusercontent.com/bydmm/Startup-Game/master/images/shoot.png)

# 运行环境

请先检查ruby版本是否为2.0.0

```ruby
ruby -v
````

如果不是 请参照各系统升级的方法，升级为2.0.0（或以上）


# 运行

运行游戏请执行

```ruby
bundle install # add all ruby libs

ruby game.rb
```

# 感谢以下程序猿友情出演

D, 教主, 石头巨巨, 四爷, 小狼狼, 阿垃垃圾君, 黑叔叔, ltype, Obzer, w叔

这么有趣的群众活动，还不赶快参加一个？

# 活动交流帖

v2ex:
http://www.v2ex.com/t/186277

ruby china
https://ruby-china.org/topics/25313

# 参加方法

你可以任意的修改本项目，然后提交Pull Request, 我会尽快通过

# 修改教程

首先第一步, 你应该fork本项目作为副本用于修改。

如果不会用fork，请参考 https://help.github.com/articles/fork-a-repo/

然后使用``` git clone your_fork_url ```到你的爱机上, 然后进行修改

作为一个案例，你可能想作为群众演员，参与到这个游戏中来。

那么你需要在在coders文件夹里里提交一个your_name.rb的文件并包含类一个类用来描述你的行为.

以下是一个示范

```ruby
# you_name.rb 请注意文件名和类名的大小写关系
class YourName < Coder
  # 初始化你的姓名和薪水，一个闪亮亮的名字是成功的开始
  def initialize
    @name = 'Your Name'
    @salary = 10_000
  end

  # 当你工作的时候，是怎样的呢？ 项目进度可能前进，也可能后退，甚至可能被秒杀
  # 请随意发挥你的想象力
  # 要注意的是Ruby最后一行默认是函数的返回值，返回的是项目的剩余进度.
  # 这个函数是必填的
  def work(remain_difficulty)
    if rand(10) > 3
      forward = rand(100...500)
      puts "#{name}奋笔疾书，成功将项目推进#{forward}"
      remain_difficulty - forward
    else
      bugs = rand(1...5)
      fallback = bugs * rand(0...50)
      puts "#{name}奋笔疾书，却引入了#{bugs}个BUG, 项目难度增加#{fallback}"
      remain_difficulty + fallback
    end
  end

  # 经过一个月辛苦的劳作，你会怎么花呢？
  # 函数返回的是公司剩余的资金， 如果你对公司的涨薪的机制有怨念，
  # 你可以在这里随意调节你的薪水
  # 这个函数是可选的
  def pay(company_money)
    puts "#{name}领取了#{salary}元薪水, 然而败在苹果表上了。"
    company_money - salary
  end

  # 如果你需要一个动态的名称，比如御板妹妹001 - 20001 你可以在这里控制
  # 这个函数是可选的
  def name
    "御坂妹妹#{rand(1...20001)}"
  end

  # 你可以给自己的薪水定义一个表达式
  # 这个函数是可选的
  def salary
  end
end
```
如果你的文件名和类名遵守snack_case to PascalCase 的命名规则的话，你的类就会自动被读取到游戏中了。

修改完成后使用```git push origin master```提交到你的副本（fork）中

然后使用github的Pull Request功能将你的修改提交到这边来

参考：如何提交Pull Request来参加游戏开发？

https://help.github.com/articles/using-pull-requests/

# 本项目是完全开放的

本项目接受所有部分的修改， 除了上面提到的成为我们的coder这一种方式外, 添加events(随机事件), projects(创业项目), companies(创业公司)这都是一些不错的方法。

projects和companies稍后会成为可选项，甚至是游戏中的竞争对手

# 项目开发进度 10%

现在已经实现了一些基本功能，比如雇用系统，资金系统，开发系统， 随机事件系统

下一步将会实现用户增长系统，正式参与到互联网的红海搏杀中去。

# 联系人

miku@maimoe.com 三月时辰

# LECENSE

MIT
