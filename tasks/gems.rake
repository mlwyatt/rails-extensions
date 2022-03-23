# frozen_string_literal: true

require 'fileutils'

desc 'Builds service gems'
task 'gems' do
  current_directory = FileUtils.pwd
  Dir.glob("#{$GEMS_DIR}/*").each do |gem_dir|
    gem_name = File.basename(gem_dir)
    Dir.chdir(gem_dir) do
      version = File.read('VERSION').strip
      sh("gem build #{gem_name}.gemspec")
      FileUtils.mv("#{gem_name}-#{version}.gem", current_directory)
    end
  end
end

desc 'Installs local gems'
task 'install_gems' do
  current_directory = FileUtils.pwd
  Dir.glob("#{$GEMS_DIR}/*").each do |gem_dir|
    next if gem_dir.match?(/core/)

    gem_name = File.basename(gem_dir)
    Dir.chdir(gem_dir) do
      version = File.read('VERSION').strip
      sh("gem install #{current_directory}/#{gem_name}-#{version}.gem")
    end
  end
end
