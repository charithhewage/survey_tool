require 'rspec'
require 'rspec/its'
require 'survey_tool'

Dir[File.dirname(__FILE__) + '/support/*.rb'].each {|file| require file }

RSpec.configure do |config|
 
  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end

include SurveyTool
