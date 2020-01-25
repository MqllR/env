# frozen_string_literal: true
require 'rake'

def safe_symlink! path
  src = File.join(Dir.pwd, 'dotfiles',  path)
  dest = File.join(Dir.home, path)

  return if File.symlink?(dest)
  if File.exist?(dest) && !File.symlink?(dest)
    mv dest, "#{dest + '.backup-' + Time.now.strftime('%Y-%m-%d_%R')}"
  end
  symlink src, dest unless File.exist?(dest)
end

def download_files(url, path)
  require 'open-uri'
  open path, 'wb' do |file|
    open url do |uri|
      file.write uri.read
    end
  end
end

task :default => [:bash, :tmux, :irb]

#########
## Bash
################
BASHRC_DIR = File.join(Dir.home, ".bashrc.d")
directory BASHRC_DIR

BASHCOMPLET_DIR = File.join(Dir.home, ".bash_completion.d")
directory BASHCOMPLET_DIR

desc 'Setup the bash environment'
task :bash => [BASHRC_DIR, BASHCOMPLET_DIR] do
  safe_symlink! '.bashrc'

  download_files(
    'https://raw.githubusercontent.com/bcmarinacci/powerline-shell/master/powerline-shell.bash',
    File.join(BASHRC_DIR, 'powerline-shell.bash')
  )
  download_files(
    'https://raw.githubusercontent.com/cykerway/complete-alias/master/bash_completion.sh',
    File.join(BASHCOMPLET_DIR, 'bash_completion.sh')
  )
end

#########
## Git
################
desc 'Setup the Git environment'
task :git => BASHCOMPLET_DIR do
  safe_symlink! '.gitconfig'

  download_files(
    'https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh',
    File.join(BASHCOMPLET_DIR, 'hub.bash_completion.sh')
  )
end

#########
## Tmux
################
desc 'Setup the tmux environment'
task :tmux do
  safe_symlink! '.tmux.conf'
end

#########
## IRB
################
desc 'Setup the irb environment'
task :irb do
  safe_symlink! '.irbrc'
end
