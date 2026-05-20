#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VARS_FILE="${1:-$SCRIPT_DIR/variables.example.yaml}"
OUT_DIR="${2:-$SCRIPT_DIR/out}"

if [[ ! -f "$VARS_FILE" ]]; then
  echo "变量文件不存在: $VARS_FILE" >&2
  exit 1
fi

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

export TEMPLATE_ROOT="$SCRIPT_DIR"
export TEMPLATE_VARS_FILE="$VARS_FILE"
export TEMPLATE_OUT_DIR="$OUT_DIR"

ruby <<'RUBY'
require "yaml"
require "fileutils"

root = ENV.fetch("TEMPLATE_ROOT")
vars_file = ENV.fetch("TEMPLATE_VARS_FILE")
out_dir = ENV.fetch("TEMPLATE_OUT_DIR")

raw = YAML.load_file(vars_file)

def flatten_hash(value, result)
  case value
  when Hash
    value.each_value { |child| flatten_hash(child, result) }
  when Array
    # 只有明确需要时再扩展数组规则；当前模板主要使用标量变量
  else
    return if value.nil?
    result << value
  end
end

def collect_named_scalars(value, result)
  case value
  when Hash
    value.each do |key, child|
      if child.is_a?(Hash) || child.is_a?(Array)
        collect_named_scalars(child, result)
      elsif !child.nil?
        result[key.to_s] = child.to_s
      end
    end
  when Array
    value.each { |child| collect_named_scalars(child, result) }
  end
end

variables = {}
collect_named_scalars(raw, variables)
variables["VALIDATION_COMMANDS"] = [
  variables["BACKEND_VALIDATION_COMMAND"],
  variables["FRONTEND_VALIDATION_COMMAND"],
  variables["OPENSPEC_VALIDATION_COMMAND"]
].compact.join(" | ")

expanded = {}
variables.each do |key, value|
  expanded["{{#{key}}}"] = value
  expanded["{{#{key}_VALUE}}"] = value
end

template_files = Dir.glob(File.join(root, "**", "*.template.md")) +
  Dir.glob(File.join(root, "**", "*.template.yaml"))

template_files.each do |template_path|
  relative = template_path.sub("#{root}/", "")
  next if relative.start_with?("example/")

  target_relative = relative
    .sub(/\.template\.md\z/, ".md")
    .sub(/\.template\.yaml\z/, ".yaml")

  target_path = File.join(out_dir, target_relative)
  FileUtils.mkdir_p(File.dirname(target_path))

  content = File.read(template_path)
  rendered = expanded.reduce(content) { |memo, (placeholder, value)| memo.gsub(placeholder, value) }
  File.write(target_path, rendered)
end

puts "Rendered #{template_files.size} template files to #{out_dir}"
RUBY
