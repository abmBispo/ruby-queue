##
# RubyQueue class responsible for main code execution, handling with agents and jobs
class RubyQueue
  # Instance variables
  attr_accessor :jobs, :agents
  attr_reader :assigned_jobs

  def initialize(jobs = [], agents = [])
    @jobs = jobs
    @agents = agents
  end

  def new_job(job)
    raise Exception unless job.is_a? Job

    job.priority ? priorize_jobs(job) : @jobs << job
  end

  def new_agent(agent)
    raise Exception unless agent.is_a? Agent

    @agents << agent
  end

  def dequeue(agent_id = '')
    # Defining variables
    best_job = nil
    regular_job = nil
    # Getting agent from agent_id param
    selected_agent = @agents.select { |agent| agent.id == agent_id }.first

    # Raise if agent_id params does not refer to any agent in queue
    raise ArgumentError, 'agent_id not found' if selected_agent.nil?

    # Catching agent's skillsets
    primary_skillset = selected_agent.primary_skill_set
    secondary_skillset = selected_agent.secondary_skill_set

    # Filtering jobs by job type and agent skills for primary skillset
    primary_skillset.each do |skill|
      best_job = @jobs.select { |job| job.category_type == skill }.first
      break unless best_job.nil?
    end

    # This happens if no job can match to the agent's primary skillset
    # So it filters  jobs by job type and agent skills for secondary skillset
    unless best_job
      secondary_skillset.each do |skill|
        regular_job = @jobs.select { |job| job.category_type == skill }.first
        break unless regular_job.nil?
      end
    end

    # Returning
    @jobs.delete(best_job || regular_job)
  end

  private

  def priorize_jobs(new_job)
    @jobs.each_with_index do |job, index|
      next if job.priority

      @jobs.insert(index, new_job)
      break
    end
  end
end
