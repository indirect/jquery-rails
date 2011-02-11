module Jquery
  PROTOTYPE_JS = %w{prototype effects dragdrop controls}
  
  module Rails
    class Railtie < ::Rails::Railtie

      config.before_initialize do
        require "jquery-rails/assert_select_jquery" if ::Rails.env.test?

        if ::Rails.root.join("public/javascripts/jquery-ui.min.js").exist?
          jq_defaults = %w(jquery jquery-ui)
          jq_defaults.map!{|a| a + ".min" } if ::Rails.env.production?
        else
          jq_defaults = ::Rails.env.production? ? %w(jquery.min) : %w(jquery)
        end

        # Remove 'rails', another gem may have loaded it but we have to ensure the
        # correct load order or it will not function
        if config.action_view.javascript_expansions[:defaults].include?('rails')
          config.action_view.javascript_expansions[:defaults].delete('rails')
        end

        #  Merge the jQuery scripts, remove the Prototype defaults and finally add 'rails'
        config.action_view.javascript_expansions[:defaults] |= jq_defaults
        config.action_view.javascript_expansions[:defaults] -= PROTOTYPE_JS
        config.action_view.javascript_expansions[:defaults] << 'rails'
      end

    end
  end
end
