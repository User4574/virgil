module Virgil
  class Utils
    def self.unfold(attrs)
      ret = ""
      attrs.each do |key, value|
        ret += " #{key.to_s}=\"#{value}\""
      end
      ret
    end
  end
end
