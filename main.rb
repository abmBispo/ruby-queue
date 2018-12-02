# Requires for load classes
require 'json'
require_relative 'source/classes/agent'
require_relative 'source/classes/job'
require_relative 'source/classes/ruby_queue'

# Reading from STDIN
stdin = ARGF.read
parsed_input = JSON.parse(stdin)

# Instanciating queue
queue = RubyQueue.new

# Reading inputs
parsed_input.each do |individual_command|
  individual_command.each do |command, params|
    case command
    when 'new_agent'
      queue.agents << Agent.new(params['id'], params['name'], params['primary_skillset'], params['secondary_skillset'])
    when 'new_job'
      queue.jobs << Job.new(params['id'], params['type'], params['urgent'])
    when 'job_request'
      queue.dequeue(params['agent_id'])
    end
  end
end

# Testing
puts "****************************"
puts "Created agents"
puts "****************************"
puts queue.agents
puts "****************************"
puts "Created jobs"
puts "****************************"
puts queue.jobs
