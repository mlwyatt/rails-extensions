# frozen_string_literal: true

REPO_ROOT = File.expand_path(__dir__)
GEMS_DIR = "#{REPO_ROOT}/gems".freeze

Dir.glob("#{REPO_ROOT}/tasks/**/*.rake").each do |task_file|
  load(task_file)
end
