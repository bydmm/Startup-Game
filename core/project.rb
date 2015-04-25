class Project
  attr_accessor :name, :estimate_project_difficulty, :remain_difficulty

  def name
    Rainbow("《#{@name}》").red
  end
end
