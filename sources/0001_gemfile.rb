def gemfile
  gem 'fast_blank'
  gem 'lograge'
  gem 'dotenv-rails'

  gem 'changey', github: 'adamcooke/changey'

  #Better enum
  gem 'enumerize'

  # Validation
  gem 'date_validator'

  gem_group :development do
    gem 'tracer_bullets'
    gem 'bullet'
    gem 'annotate'
    gem 'rails-erd'
    gem 'rubocop'
    gem 'pry-rails'
    gem 'seedbank'
    gem 'puma'
  end

  gem_group :development, :test do
    gem 'awesome_print'
    gem 'factory_girl_rails'
    gem 'faker'
  end

  gem_group :test do
    gem 'rspec-rails', require: false

    gem 'database_cleaner'
    gem 'fuubar'
    gem 'vcr'
    gem 'webmock'
  end

  conf_dotenv
  conf_seedbank
  conf_lograge
  conf_bullet
  conf_puma
end

def conf_dotenv
  copy_file '.env.example'
  copy_file '.env.example', '.env.local'
end

def conf_seedbank
  in_root do
    run 'rm -rf db/'
  end

  directory 'db'
  copy_file 'db/seeds.rb'
end

def conf_bullet
  inside_initializers do
    copy_file 'bullet.rb'
  end
end

def conf_lograge
  inside_initializers do
    copy_file 'lograge.rb'
  end
end

def conf_puma
  inside 'config' do
    copy_file 'puma.rb'
  end
end
