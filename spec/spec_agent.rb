require 'rspec'

require File.dirname(__FILE__) + '/../source/classes/agent'
require File.dirname(__FILE__) + '/../source/utils/hash'

$params = {}
$params[:id] = '8ab86c18-3fae-4804-bfd9-c3d6e8f66260'
$params[:name] = 'Bojack Horseman'
$params[:primary_skillset] = ['bills_questions']
$params[:secondary_skillset] = []

RSpec.describe Agent do
  context 'Agent' do
    it 'should be initialized correctly' do
      expect {
        Agent.new($params[:id],
                  $params[:name],
                  $params[:primary_skillset],
                  $params[:secondary_skillset])
      }.to_not raise_error(Exception)
    end

    it 'should be initialized incorrectly (argument error)' do
      expect {
        Agent.new($params[:name],
                  $params[:primary_skillset],
                  $params[:secondary_skillset])
      }.to raise_error(ArgumentError)
    end

    it 'should be initialized incorrectly (argument error)' do
      expect {
        Agent.new($params[:id],
                  $params[:primary_skillset],
                  $params[:secondary_skillset])
      }.to raise_error(ArgumentError)
    end

    it 'should be initialized incorrectly (argument error)' do
      expect {
        Agent.new($params[:id],
                  $params[:name],
                  $params[:secondary_skillset])
      }.to raise_error(ArgumentError)
    end

    it 'should be initialized incorrectly (argument error)' do
      expect {
        Agent.new($params[:id],
                  $params[:name],
                  $params[:primary_skillset])
      }.to raise_error(ArgumentError)
    end
  end
end
