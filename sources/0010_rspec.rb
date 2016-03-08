def rspec
  gem_group :development, :test do
    gem 'rspec-rails', require: false
    gem 'factory_girl_rails'
  end

  gem_group :test do
    gem 'database_cleaner'
    gem 'fuubar'
  end

  conf_rspec
  conf_database_cleaner
end

def conf_rspec
  empty_directory 'spec'
end

def conf_database_cleaner
  inside 'spec' do
    inside 'support' do
      copy_file 'database_cleaner.rb'
    end
  end
end
