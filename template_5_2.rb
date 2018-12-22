
# gems
gem_group :development, :test do
  gem 'better_errors'
end

gsub_file "Gemfile", /^gem\s+["']coffee-rails["'].*$/, "# Todo Remove coffeescript comment ^"

append_to_file "Gemfile", "# TODO Fix gemfile. Template messed it up :-( "

# things
generate(:scaffold, "thing title:string")
route "root 'things#index'"

# database
rails_command("db:create")
rails_command("db:migrate")

# installs after bundle
after_bundle do
  rails_command "webpacker:install"
  git add: "."
  git commit: %Q{ -m 'Init commit with template_5_2' }
end

