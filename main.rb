# Requires for load classes
require_relative 'source/classes/category_type'
require_relative 'source/classes/agent'
require_relative 'source/classes/job'

# Creating categories
category_type_1 = CategoryType.new('rewards_question')
category_type_2 = CategoryType.new('bills_question')

# Creating jobs
job_1 = Job.new('f26e890b-df8e-422e-a39c-7762aa0bac36', category_type_1, false)
job_2 = Job.new('c0033410-981c-428a-954a-35dec05ef1d2', category_type_2, true)

# Creating agents
agent_1 = Agent.new('8ab86c18-3fae-4804-bfd9-c3d6e8f66260', [category_type_1], [])
agent_2 = Agent.new('ed0e23ef-6c2b-430c-9b90-cd4f1ff74c88', [category_type_2], [category_type_1])

# Testing
puts job_1.to_s
puts job_2.to_s
puts agent_1.to_s
puts agent_2.to_s
puts CategoryType.number_of_categories

# 
