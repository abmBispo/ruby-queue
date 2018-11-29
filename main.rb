# Requires for load classes
require_relative 'source/classes/category_type'
require_relative 'source/classes/job'

# Creating categories
category_type_1 = CategoryType.new('rewards_question')
category_type_2 = CategoryType.new('bills_question')

# Creating jobs
job_1 = Job.new('f26e890b-df8e-422e-a39c-7762aa0bac36', category_type_1, false)
job_2 = Job.new('c0033410-981c-428a-954a-35dec05ef1d2', category_type_2, true)
