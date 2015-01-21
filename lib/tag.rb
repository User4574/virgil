module Virgil
  class Tag
    class << self
      def doctype
        "<!DOCTYPE " + yield + ">"
      end
      def common(attrs = {})
        "<#{__callee__}" + Utils.unfold(attrs) + ">" +
        yield +
        "</#{__callee__}>"
      end
      def common_single(attrs = {})
        "<#{__callee__}" + Utils.unfold(attrs) + " />"
      end

      alias :html   :common
      alias :head   :common
      alias :title  :common
      alias :body   :common
      alias :h1     :common
      alias :p      :common
      alias :img    :common_single
      alias :a      :common

    end
  end
end
