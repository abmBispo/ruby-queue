require 'rspec'

require File.dirname(__FILE__) + '/../source/classes/agent'
require File.dirname(__FILE__) + '/../source/utils/hash'


RSpec.describe Agent do
  context 'initialization' do
    it 'should be correct' do
      $params = {}
      $params[:id] = '8ab86c18-3fae-4804-bfd9-c3d6e8f66260'
      $params[:name] = 'Bojack Horseman'
      $params[:primary_skillset] = ['bills_questions']
      $params[:secondary_skillset] = []

      expect {
        Agent.new($params[:id],
                  $params[:name],
                  $params[:primary_skillset],
                  $params[:secondary_skillset])
      }.to_not raise_error(Exception)
    end

    it 'should be incorrect (argument error)' do
      expect {
        Agent.new(nil,
                  $params[:name],
                  $params[:primary_skillset],
                  $params[:secondary_skillset])
      }.to raise_error(ArgumentError)
    end

    it 'should be incorrect (argument error)' do
      expect {
        Agent.new($params[:id],
                  nil,
                  $params[:primary_skillset],
                  $params[:secondary_skillset])
      }.to raise_error(ArgumentError)
    end

    it 'should be incorrect (argument error)' do
      expect {
        Agent.new($params[:id],
                  $params[:name],
                  nil,
                  $params[:secondary_skillset])
      }.to raise_error(ArgumentError)
    end

    it 'should be incorrect (argument error)' do
      expect {
        Agent.new($params[:id],
                  $params[:name],
                  $params[:primary_skillset],
                  nil)
      }.to raise_error(ArgumentError)
    end
  end
end
