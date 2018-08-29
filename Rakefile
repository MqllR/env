require 'rake'

bashrc_dir = File.join(Dir.home, ".bashrc.d")
source_files = Rake::FileList.new(".*") do |fl|
  fl.exclude(".")
  fl.exclude("..")
  fl.exclude(".git")
end

task :default => [:gpull, :symlink, :bashrc]

desc "Link environment config file to user's home directory"
task :symlink do
  source_files.each do |f|
    src = File.join(Dir.pwd, f)
    dest = File.join(Dir.home, f)
    next if File.symlink? dest
    if File.exist?(dest) && !File.symlink?(dest)
      mv dest, "#{dest + '.backup-' + Time.now.strftime('%Y-%m-%d_%R')}"
    end
    symlink src, dest
  end
end

desc "Create .bashrc.d directory"
task :bashrc => bashrc_dir

# Directory task refer to :bashrc
directory bashrc_dir

# Exec a tiny git pull
task :gpull do
  sh "git pull", { verbose: false }
end
