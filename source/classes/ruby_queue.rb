class RubyQueue

  attr_accessor :jobs, :agents
  attr_reader :assigned_jobs

  def initialize(jobs = [], agents = [])
    @jobs = jobs
    @agents = agents
  end

  def dequeue

  end

end
