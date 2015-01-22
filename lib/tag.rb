module Virgil
  module Tag
    class Doctype
      def initialize(&block)
        @tag =  "<!DOCTYPE " +
                self.instance_eval(&block) +
                ">"
      end
      def to_s
        @tag
      end
    end
    class Comment
      def initialize(&block)
        @tag =  "<!--" +
                self.instance_eval(&block) +
                "-->"
      end
      def to_s
        @tag
      end
    end

    class Common
      def initialize(tag, attrs, &block)
        @tag =  "<#{tag}" +
                Utils.unfold(attrs) +
                ">" +
                self.instance_eval(&block) +
                "</#{tag}>"
      end
      def to_s
        @tag
      end
      def subtag(attrs = {})
        Common.new(__callee__, attrs, &Proc.new).to_s
      end
      def subtagsingle(attrs = {})
        Common_Single.new(__callee__, attrs).to_s
      end
    end
    class Common_Single
      def initialize(tag, attrs)
        @tag =  "<#{tag}" +
                Utils.unfold(attrs) +
                ">"
      end
      def to_s
        @tag
      end
    end

    class Map < Common
      alias :area :subtagsingle
    end

    class Head < Common
      alias :link :subtagsingle
      alias :title :subtag
    end
  end
end
