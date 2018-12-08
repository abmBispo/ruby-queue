require 'rspec'

require File.dirname(__FILE__) + '/../source/classes/job'
require File.dirname(__FILE__) + '/../source/classes/agent'
require File.dirname(__FILE__) + '/../source/classes/ruby_queue'
require File.dirname(__FILE__) + '/../source/utils/hash'

RSpec.describe RubyQueue do
  context 'initialization' do
    it 'should be correct' do
      expect { RubyQueue.new }.to_not raise_error(Exception)
    end
  end

  context 'add job' do
    it 'should be correct' do
      params = {}
      params[:id] = 'f26e890b-df8e-422e-a39c-7762aa0bac36'
      params[:type] = 'rewards_question'
      params[:urgent] = false
      job = Job.new(params[:id], params[:type], params[:urgent])
      queue = RubyQueue.new
      expect { queue.new_job job }.to_not raise_error(Exception)
    end

    it 'should be incorrect' do
      job = nil
      queue = RubyQueue.new
      expect { queue.new_job job }.to raise_error(Exception)
    end
  end

  context 'add agent' do
    it 'should be correct' do
      params = {}
      params[:id] = '8ab86c18-3fae-4804-bfd9-c3d6e8f66260'
      params[:name] = 'Bojack Horseman'
      params[:primary_skillset] = ['bills_questions']
      params[:secondary_skillset] = []

      agent = Agent.new(params[:id], params[:name], params[:primary_skillset], params[:secondary_skillset])
      queue = RubyQueue.new
      expect { queue.new_agent agent }.to_not raise_error(Exception)
    end

    it 'should be incorrect' do
      agent = nil
      queue = RubyQueue.new
      expect { queue.new_agent agent }.to raise_error(Exception)
    end
  end

end
