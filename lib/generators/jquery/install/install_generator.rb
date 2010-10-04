module Jquery
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "This generator downloads and installs jQuery, jQuery-ujs HEAD, and (optionally) jQuery UI 1.8.4"
      class_option :ui, :type => :boolean, :default => false, :desc => "Whether to Include JQueryUI"
      class_option :version, :type => :string, :default => "1.4.1", :desc => "Which version of JQuery to fetch"
      @@versions = %w( 1.4.2 1.4.1 1.4.0 1.3.2 1.3.1 1.3.0 1.2.6 )
      class_option :ui-version, :type => :string, :default => "1.8.5", :desc => "Which version of JQuery UI to fetch"
      @@ui-versions = %w( 1.8.4 1.8.5 )

      def remove_prototype
        %w(controls.js dragdrop.js effects.js prototype.js).each do |js|
          remove_file "public/javascripts/#{js}"
        end
      end

      def download_jquery
        # Downloading latest jQuery
        if @@versions.include?(options.version)
          puts "Fetching JQuery version #{options.version}!"
          get "http://ajax.googleapis.com/ajax/libs/jquery/#{options.version}/jquery.min.js", "public/javascripts/jquery.min.js"
          get "http://ajax.googleapis.com/ajax/libs/jquery/#{options.version}/jquery.js", "public/javascripts/jquery.js"
        else
          puts "JQuery #{options.version} is invalid; fetching #{@@versions[1]} instead."
          get "http://ajax.googleapis.com/ajax/libs/jquery/#{@@versions[1]}/jquery.min.js", "public/javascripts/jquery.min.js"
          get "http://ajax.googleapis.com/ajax/libs/jquery/#{@@versions[1]}/jquery.js", "public/javascripts/jquery.js"
        end


        # Downloading latest jQueryUI minified
        if options.ui?
          if @@ui-versions.include?(options.ui-version)
            puts "Fetching JQuery UI version #{options.ui-version}!"
            get "http://ajax.googleapis.com/ajax/libs/jqueryui/#{options.ui-version}/jquery-ui.min.js", "public/javascripts/jquery-ui.min.js"
            get "http://ajax.googleapis.com/ajax/libs/jqueryui/#{options.ui-version}/jquery-ui.js", "public/javascripts/jquery-ui.js"
          else
            puts "JQuery UI #{options.ui-version} is invalid; fetching #{@@ui-versions[1]} instead."
            get "http://ajax.googleapis.com/ajax/libs/jqueryui/#{@@ui-versions[1]}/jquery-ui.min.js", "public/javascripts/jquery-ui.min.js"
            get "http://ajax.googleapis.com/ajax/libs/jqueryui/#{@@ui-versions[1]}/jquery-ui.js", "public/javascripts/jquery-ui.js"
          end
        end
     end

      def download_ujs_driver
        # Downloading latest jQuery drivers
        get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"
      end

    end
  end
end