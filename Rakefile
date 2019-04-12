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

task :default => [:vim, :bash, :tmux, :irb]

## Vim
VUNDLE_DIR = File.join(Dir.home, '.vim/bundle/Vundle.vim/')
directory VUNDLE_DIR

desc 'Setup the vim environment'
task :vim => VUNDLE_DIR do
  safe_symlink! '.vimrc'

  # Install Vundle
  begin
    require 'git'
    g = Git.open(VUNDLE_DIR)
    g.pull
  rescue ArgumentError
    Git.clone('https://github.com/VundleVim/Vundle.vim.git', VUNDLE_DIR)
  end

  # Install plugins
  sh "vim +PluginInstall +qall"
end

## Bash
BASHRC_DIR = File.join(Dir.home, ".bashrc.d")
directory BASHRC_DIR

BASHCOMPLET_DIR = File.join(Dir.home, ".bash_completion.d")
directory BASHCOMPLET_DIR

desc 'Setup the bash environment'
task :bash => [BASHRC_DIR, BASHCOMPLET_DIR] do
  safe_symlink! '.bashrc'

  require 'open-uri'
  open File.join(BASHRC_DIR, 'powerline-shell.bash'), 'wb' do |file|
    open 'https://raw.githubusercontent.com/bcmarinacci/powerline-shell/master/powerline-shell.bash' do |uri|
      file.write uri.read
    end
  end
end

## Git
desc 'Setup the Git environment'
task :git => BASHCOMPLET_DIR do
  safe_symlink! '.gitconfig'

  hub_autocomplete_url = 'https://raw.githubusercontent.com/github/hub/master/etc/hub.bash_completion.sh'
  require 'open-uri'
  open File.join(BASHCOMPLET_DIR, File.basename(hub_autocomplete_url)), 'wb' do |file|
    open hub_autocomplete_url do |uri|
      file.write uri.read
    end
  end
end

# Tmux
desc 'Setup the tmux environment'
task :tmux do
  safe_symlink! '.tmux.conf'
end

# IRB
desc 'Setup the irb environment'
task :irb do
  safe_symlink! '.irbrc'
end
