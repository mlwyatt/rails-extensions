# frozen_string_literal: true

desc 'Builds service gems'
task 'build_gems' do
  only_gems = ENV.fetch('gem_names', '').split(',')
  current_directory = FileUtils.pwd
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    gem_name = File.basename(gem_dir)
    it_matches = only_gems.empty?
    it_matches ||= only_gems.any? { |og| gem_name.match?(/#{og}/i) }
    next unless it_matches

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
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    next if gem_dir.match?(/core/)

    gem_name = File.basename(gem_dir)
    Dir.chdir(gem_dir) do
      version = File.read('VERSION').strip
      sh("gem install #{current_directory}/#{gem_name}-#{version}.gem")
    end
  end
end
desc 'Uninstalls local gems'
task 'uninstall_gems' do
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    gem_name = File.basename(gem_dir)
    Dir.chdir(gem_dir) do
      sh("gem uninstall #{gem_name} -a --ignore-dependencies")
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
      sh("gem push #{current_directory}/#{gem_name}-#{version}.gem")
    end
  end
end

desc 'Bumps version of all gems'
task 'version_bump' do
  bump_major = ENV.fetch('bump_major', '') == '1'
  bump_minor = ENV.fetch('bump_minor', '') == '1'
  bump_patch = ENV.fetch('bump_patch', '') == '1'
  only_gems = ENV.fetch('gem_names', '').split(',')
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    gem_name = File.basename(gem_dir)
    it_matches = only_gems.empty?
    it_matches ||= only_gems.any? { |og| gem_name.match?(/#{og}/i) }
    next unless it_matches

    Dir.chdir(gem_dir) do
      versions = File.read('VERSION').strip.split('.').map(&:to_i)
      versions[0] += 1 if bump_major
      versions[1] += 1 if bump_minor
      versions[2] += 1 if bump_patch
      File.write('VERSION', "#{versions.join('.')}\n")
    end
  end
end

desc 'Add task file to each gem'
task 'task_gems' do
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    Dir.chdir(gem_dir) do
      sh('touch lib/task.txt')
    end
  end
end

desc 'Creates new blank gem'
task 'create_gem' do
  new_gem = "#{ENV.fetch('gem_name')}_extension"
  sh("cp -R #{GEMS_DIR}/rails_extensions_core/ #{GEMS_DIR}/#{new_gem}")
  sh("mv #{GEMS_DIR}/#{new_gem}/rails_extensions_core.gemspec #{GEMS_DIR}/#{new_gem}/#{new_gem}.gemspec")
  sh("mv #{GEMS_DIR}/#{new_gem}/lib/rails_extensions_core.rb #{GEMS_DIR}/#{new_gem}/lib/#{new_gem}.rb")
end

desc 'Bulk creates new blank gems'
task 'bulk_new_gem' do
  %w[
    PLACE_GEM_NAMES_HERE
  ].each do |new_gem|
    sh("rake create_gem gem_name=#{new_gem}")
  end
end
