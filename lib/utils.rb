module Virgil
  module Utils
    def self.unfold(attrs)
      ret = ""
      attrs.each do |key, value|
        if value.nil? then
          ret += " #{key.to_s}"
        else
          ret += " #{key.to_s}=\"#{value}\""
        end
      end
      ret
    end

    class Generic
      def initialize(attrs, tag = nil, &block)
        tag = self.class.name.split('::').last.downcase if tag.nil?
        @tag = "<#{tag}" +
          Utils::unfold(attrs) +
          ">" +
          self.instance_eval(&block) +
          "</#{tag}>"
      end
      def to_s
        @tag
      end
    end
    class GenericSingle < Generic
      def initialize(attrs, tag = nil)
        tag = self.class.name.split('::').last.downcase if tag.nil?
        @tag = "<#{tag}" +
          Utils::unfold(attrs) +
          ">"
      end
    end
  end
end
