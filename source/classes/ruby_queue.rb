class RubyQueue

  # Class variables
  @@last_used_agent = nil
  @@last_assigned_job = nil

  # Instance variables
  attr_accessor :jobs, :agents
  attr_reader :assigned_jobs

  def initialize(jobs = [], agents = [])
    @jobs = jobs
    @agents = agents
  end

  def dequeue(agent_id = '')
    # Defining variables
    best_job = nil
    regular_job = nil
    # Calling private method for order jobs in priority level
    priorize_jobs
    # Getting agent from agent_id param
    agent = @agents.select { |agent| agent.id == agent_id }.first

    # Raise if agent_id params does not refer to any agent in queue
    raise ArgumentError, 'agent_id not found' if agent.nil?

    # Catching agent's skillsets
    primary_skillset = agent.primary_skill_set
    secondary_skillset = agent.secondary_skill_set

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

    # Update class variables
    @@last_used_agent ||= agent
    @@last_assigned_job ||= best_job || regular_job

    # Returning
    @jobs.delete(best_job || regular_job)
  end

  private

  def priorize_jobs
    @jobs.each do |job|
      next unless job.urgent?

      @jobs.delete job
      @jobs.unshift job
    end
  end

end
