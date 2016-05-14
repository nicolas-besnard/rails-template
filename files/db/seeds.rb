if Rails.env.development?
  puts ' /!\\ Reset DB'
  (ActiveRecord::Base.connection.tables - ['schema_migrations']).each do |table_name|
    ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY CASCADE")
  end
end
