require "rspec"
require "crossref"
require "byebug"
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost = true
  # c.debug_logger = $stderr
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end