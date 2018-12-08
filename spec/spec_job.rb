require 'rspec'

require File.dirname(__FILE__) + '/../source/classes/job'
require File.dirname(__FILE__) + '/../source/utils/hash'

RSpec.describe Job do
  context 'Job' do
    it 'should be initialized correctly' do
      $params = {}
      $params[:id] = 'f26e890b-df8e-422e-a39c-7762aa0bac36'
      $params[:type] = 'rewards_question'
      $params[:urgent] = false
      expect {
        Job.new($params[:id],
                $params[:type],
                $params[:urgent])
      }.to_not raise_error(Exception)
    end

    it 'should be initialized incorrectly (argument error)' do
      expect {
        Job.new($params[:type],
                $params[:urgent])
      }.to raise_error(ArgumentError)
    end

    it 'should be initialized incorrectly (argument error)' do
      expect {
        Job.new($params[:id],
                $params[:urgent])
      }.to raise_error(ArgumentError)
    end

    it 'should be initialized incorrectly (argument error)' do
      expect {
        Job.new($params[:id],
                $params[:type])
      }.to raise_error(ArgumentError)
    end
  end
end
