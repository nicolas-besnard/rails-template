def rspec
  run 'bundle install'

  conf_rspec
  conf_database_cleaner
end

def conf_rspec
  run 'rails generate rspec:install'

  replace_file '.rspec'

  insert_into_file "spec/rails_helper.rb", before: "RSpec.configure do |config|\n" do
    [
      "Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }\n\n"
    ].join("\n")
  end

  insert_into_file "spec/spec_helper.rb", after: "RSpec.configure do |config|\n" do
    [
      "  config.fail_fast = true\n"
    ].join("\n")
  end
end

def conf_database_cleaner
  directory 'spec/support'
end
