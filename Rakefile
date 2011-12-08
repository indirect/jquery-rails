require 'bundler'
require 'open-uri'
Bundler::GemHelper.install_tasks

# require "spec/rake/spectask"
# desc "Run all examples"
# Spec::Rake::SpecTask.new(:spec) do |t|
#   t.ruby_opts  = ['-r test/unit']
#   t.spec_opts = %w[--color]
# end
task :default => :spec

desc "download the specified jquery"
task :jquery, :version do |t, args|
  raise "\nPlease specify version (ie rake jquery[1.7.1])" if args.version.nil?

  puts "downloading jquery #{args.version} from code.jquery.com..."
  begin
    open('vendor/assets/javascripts/jquery.js', 'wb') do |file|
      file << open("http://code.jquery.com/jquery-#{args.version}.js").read
    end
    open('vendor/assets/javascripts/jquery.min.js', 'wb') do |file|
      file << open("http://code.jquery.com/jquery-#{args.version}.min.js").read
    end
    puts "done."
  rescue OpenURI::HTTPError => ex
    puts ex
  end
end

desc "download the specified jquery-ui"
task :ui, :version do |t, args|
  raise "\nPlease specify version (ie rake ui[1.7.1])" if args.version.nil?

  puts "downloading jquery-ui #{args.version} from ajax.googleapapis.com..."

  begin
    open('vendor/assets/javascripts/jquery-ui.js', 'wb') do |file|
      file << open("http://ajax.googleapis.com/ajax/libs/jqueryui/#{args.version}/jquery-ui.js")
    end
    open('vendor/assets/javascripts/jquery-ui.min.js', 'wb') do |file|
      file << open("http://ajax.googleapis.com/ajax/libs/jqueryui/#{args.version}/jquery-ui.min.js")
    end
    puts "done."
  rescue OpenURI::HTTPError => ex
    puts ex
  end
end
