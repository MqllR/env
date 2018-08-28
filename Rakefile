require 'rake'

source_files = Rake::FileList.new(".*") do |fl|
  fl.exclude(".")
  fl.exclude("..")
  fl.exclude(".git")
end 

task :default => :symlink

desc "create dotfiles symlink into user's home directory"
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
