require 'capistrano'

Capistrano::Configuration.instance.load do
  namespace :gitrev do
    desc 'records the git commit hash on the server'
    task :record, :roles => :app do
      run "cd #{release_path} && echo \"`git rev-parse --short HEAD`\" >> #{release_path}/public/gitrev.txt"
    end

    desc 'confirms if the remote git rev matches the local one'
    task :confirm do
      prev_log_level = logger.level
      logger.level = Capistrano::Logger::IMPORTANT
      local_rev = `git rev-parse --short HEAD`.chomp.strip
      run("curl http://localhost/gitrev.txt") do |channel, stream, data|
        remote_rev = data.chomp.strip
        match = local_rev == remote_rev
        puts "#{channel[:host]}: #{match ? "Remote git rev matches local!" : "#{remote_rev}, local: #{local_rev}"}"
      end
      logger.level = prev_log_level
    end
  end

  after 'deploy', "gitrev:record"
end
