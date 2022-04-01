# frozen_string_literal: true

# :nodoc:
def build_gem(gem_dir)
  Dir.chdir(gem_dir) do
    sh("gem build #{File.basename(gem_dir)}.gemspec")
  end
end

# :nodoc:
def read_version(gem_dir)
  File.read("#{gem_dir}/VERSION").strip
end

# :nodoc:
def process_gem?(gem_dir, only_gems)
  only_gems.empty? || only_gems.any? { |og| File.basename(gem_dir).match?(/#{og}/i) }
end

# :nodoc:
def before_install_push(gem_dir, only_gems)
  return false unless process_gem?(gem_dir, only_gems)

  unless File.exist?("#{gem_dir}/#{File.basename(gem_dir)}-#{read_version(gem_dir)}.gem")
    build_gem(gem_dir)
  end

  return true
end

desc 'Builds service gems'
task 'build_gems' do
  only_gems = ENV.fetch('gem_names', '').split(',')
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    next unless process_gem?(gem_dir, only_gems)

    build_gem(gem_dir)
  end
end

desc 'Installs local gems'
task 'install_gems' do
  only_gems = ENV.fetch('gem_names', '').split(',')
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    next if gem_dir.match?(/core/)
    next unless before_install_push(gem_dir, only_gems)

    sh("gem install #{gem_dir}/#{File.basename(gem_dir)}-#{read_version(gem_dir)}.gem")
  end
end

desc 'Uninstalls local gems'
task 'uninstall_gems' do
  only_gems = ENV.fetch('gem_names', '').split(',')
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    next unless process_gem?(gem_dir, only_gems)

    Dir.chdir(gem_dir) do
      sh("gem uninstall #{File.basename(gem_dir)} -a --ignore-dependencies")
    end
  end
end

desc 'Installs local gems'
task 'publish_gems' do
  only_gems = ENV.fetch('gem_names', '').split(',')
  Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
    next unless before_install_push(gem_dir, only_gems)

    sh("gem push #{gem_dir}/#{File.basename(gem_dir)}-#{read_version(gem_dir)}.gem")
  end
end

desc 'Bumps version of all gems'
task 'version_bump' do
  bump_major = ENV.fetch('bump_major', '') == '1'
  bump_minor = ENV.fetch('bump_minor', '') == '1'
  bump_patch = ENV.fetch('bump_patch', '') == '1'

  if bump_major || bump_minor || bump_patch
    only_gems = ENV.fetch('gem_names', '').split(',')
    Dir.glob("#{GEMS_DIR}/*").each do |gem_dir|
      next unless process_gem?(gem_dir, only_gems)

      Dir.chdir(gem_dir) do
        versions = read_version(gem_dir).split('.').map(&:to_i)
        versions[0] += 1 if bump_major
        versions[1] += 1 if bump_minor
        versions[2] += 1 if bump_patch
        File.write('VERSION', "#{versions.join('.')}\n")
      end
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
