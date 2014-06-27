guard_options = {
  cmd: "bundle exec rspec --color --format=doc",
  all_after_pass: false,
  all_after_fail: false,
  all_on_start: false,
  failed_mode: :keep,
}

guard :rspec, guard_options do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
