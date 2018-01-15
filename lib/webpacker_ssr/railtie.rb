# frozen_string_literal: true

require 'webpacker_ssr/view_helpers'

module WebpackerSSR
  class Railtie < Rails::Railtie
    initializer 'webpacker_ssr.view_helpers' do
      ActionView::Base.send(:include, WebpackerSSR::ViewHelpers)
    end

    config.after_initialize do |app|
      # Load the renderer if eager_load is true
      WebpackerSSR.renderer if app.config.eager_load
    end
  end
end
