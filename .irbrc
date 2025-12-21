# frozen_string_literal: true

load('~/.ruby_utils.rb')

module Capybara
  module Node
    class Element
      def pp
        html = self['innerHTML']
        doc = Nokogiri::XML("<node>#{html}</node>")
        puts doc.to_xhtml
      end
    end
  end
end
