# Requires for load classes
require 'json'
require_relative 'source/classes/agent'
require_relative 'source/classes/job'
require_relative 'source/classes/ruby_queue'
require_relative 'source/utils/hash'

# Reading from STDIN
stdin = ARGF.read
parsed_input = JSON.parse(stdin)
stdout = []

# Instanciating queue
queue = RubyQueue.new

# Reading inputs
parsed_input.each do |individual_command|
  individual_command.each do |command, params|
    # Symbolizing params keys to normalize key names
    params.clean_spaces_keys!
    params.deep_symbolize_keys!
    # Selecting each option
    case command.to_sym
    when :new_agent
      queue.agents << Agent.new(params[:id],
                                params[:name],
                                params[:primary_skillset],
                                params[:secondary_skillset])
    when :new_job
      queue.jobs << Job.new(params[:id], params[:type], params[:urgent])
    when :job_request
      job = queue.dequeue(params[:agent_id])
      next if job.nil?

      stdout << {
        job_assigned: {
          job_id: job.id,
          agent_id: params[:agent_id]
        }
      }
    end
  end
end

open('output.json', 'w') { |f| f.puts stdout.to_json }
