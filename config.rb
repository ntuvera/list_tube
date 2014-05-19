database_url = ENV['DATABASE_URL'] || 'postgres://localhost/list_tube'
ActiveRecord::Base.establish_connection(database_url)

