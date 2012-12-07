# Gitrev

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'gitrev'

Then add this to config/deploy.rb

    require 'capistrano-gitrev'

## Usage

On deploy, this will create a file (public/gitrev.txt) on the server that you can use to confirm which
revision is running.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
