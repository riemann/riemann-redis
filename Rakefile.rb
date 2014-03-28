require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'find'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec
gemspec = Gem::Specification.new do |s|
  s.rubyforge_project = 'riemann-redis'

  s.name = 'riemann-redis'
  s.version = '0.1.0'
  s.author = 'Fede Borgnia'
  s.email = 'fborgnia@gmail.com'
  s.homepage = 'https://github.com/riemann/riemann-redis'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Redis client that submits events to Riemann.'

  s.add_dependency 'riemann-tools', '>= 0.2.1'
  s.add_dependency 'redis', '>= 3.0.2'

  s.files = FileList['lib/**/*', 'bin/*', 'LICENSE', 'README.md'].to_a
  s.executables |= Dir.entries('bin/')
  s.require_path = 'lib'
  s.has_rdoc = false

  s.required_ruby_version = '>= 1.8.7'
end

Gem::PackageTask.new gemspec do |p|
end

RDoc::Task.new do |rd|
  rd.main = 'Riemann redis'
  rd.title = 'Riemann redis'
  rd.rdoc_dir = 'doc'

  rd.rdoc_files.include('lib/**/*.rb')
end
