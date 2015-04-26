class Project
  attr_accessor :name,
                :explode_point,
                :estimate_project_difficulty,
                :remain_difficulty,
                :useful, :user_experience,
                :users

  def name
    Rainbow("《#{@name}》").red
  end

  def beta_init
    @useful = estimate_project_difficulty / 3_000.0
    @user_experience = 2
    @users = 100
    @remain_difficulty = explode_point[:estimate_difficulty]
  end

  def user_growth(week)
    user_experience * week**2 + useful * week
  end

  def color_users
    users.color_users
  end
end
