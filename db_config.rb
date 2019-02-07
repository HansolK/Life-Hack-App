options = {
  adapter: 'postgresql',
  database: 'life_hacks'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)