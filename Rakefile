# frozen_string_literal: true

$REPO_ROOT = File.dirname(__FILE__)
$GEMS_DIR = "#{$REPO_ROOT}/gems"
# $CORE_LIB = "#{$REPO_ROOT}/gems/core-extension/lib"

# $:.unshift("#{$GEMS_DIR}/core-extension/lib")

# require 'core-extension'

Dir.glob("#{$REPO_ROOT}/tasks/**/*.rake").each do |task_file|
  load(task_file)
end
