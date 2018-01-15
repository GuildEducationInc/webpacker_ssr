# frozen_string_literal: true

# require 'webpacker_ssr/js_location'

module WebpackerSSR
  module ViewHelpers
    # def request_to_location
    #   JsLocation.new(request)
    # end

    def server_stylesheet_pack_tag(*names, **options)
      manifest = WebpackerSSR::ServerManifest.new
      sources = names.map { |name| manifest.lookup!(pack_name_with_extension(name, type: :stylesheet)) }
      stylesheet_link_tag(*sources, **options)
    end
  end
end
