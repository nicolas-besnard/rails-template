def gemfile
  gem 'fast_blank'
  gem 'lograge'
  gem 'dotenv-rails'

  gem_group :development do
    gem 'awesome_print'
    gem 'tracer_bullets'
    gem 'bullet'
    gem 'annotate'
    gem 'rails-erd'
    gem 'rubocop'
    gem 'pry-rails'
    gem 'seedbank'
  end

  conf_dotenv
  conf_seedbank
  conf_lograge
  conf_bullet
end

def conf_dotenv
  copy_file '.env.example'
  copy_file '.env.example', '.env.local'
end

def conf_seedbank
  empty_directory 'db/seeds'
  create_file 'db/seeds/.keep'
  empty_directory 'db/seeds/development'
  create_file 'db/seeds/development/.keep'
  empty_directory 'db/seeds/staging'
  create_file 'db/seeds/staging/.keep'
  empty_directory 'db/seeds/production'
  create_file 'db/seeds/production/.keep'
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
