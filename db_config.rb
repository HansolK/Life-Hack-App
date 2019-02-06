options = {
  adapter: 'postgresql',
  database: 'life_hacks'
}

ActiveRecord::Base.establish_connection(options)