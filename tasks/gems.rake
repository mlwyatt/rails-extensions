# frozen_string_literal: true

desc 'Builds service gems'
task 'gems' do
  current_directory = FileUtils.pwd
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    gem_name = File.basename(gem_dir)
    Dir.chdir(gem_dir) do
      version = File.read('VERSION').strip
      system("gem build #{gem_name}.gemspec")
      FileUtils.mv("#{gem_name}-#{version}.gem", current_directory)
    end
  end
end

desc 'Installs local gems'
task 'install_gems' do
  current_directory = FileUtils.pwd
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    next if gem_dir.match?(/core/)

    gem_name = File.basename(gem_dir)
    Dir.chdir(gem_dir) do
      version = File.read('VERSION').strip
      system("gem install #{current_directory}/#{gem_name}-#{version}.gem")
    end
  end
end

desc 'Installs local gems'
task 'publish_gems' do
  current_directory = FileUtils.pwd
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    gem_name = File.basename(gem_dir)
    Dir.chdir(gem_dir) do
      version = File.read('VERSION').strip
      system("gem push #{current_directory}/#{gem_name}-#{version}.gem")
    end
  end
end
