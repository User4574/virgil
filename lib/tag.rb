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

    class Html < Utils::Generic
      def head(attrs = {})
        Head.new(attrs, &Proc.new).to_s
      end
      def body(attrs = {})
        Body.new(attrs, &Proc.new).to_s
      end

      class Body < Html
        def map(attrs = {})
          Map.new(attrs, &Proc.new).to_s
        end

        class Map < Utils::Generic
          def area(attrs = {})
            Area.new(attrs).to_s
          end

          class Area < Utils::GenericSingle ; end
        end
      end

      class Head < Html
        def link(attrs = {})
          Link.new(attrs).to_s
        end
        class Link < Utils::GenericSingle ; end

        def title(attrs = {})
          Title.new(attrs, &Proc.new).to_s
        end
        class Title < Utils::Generic ; end
      end
    end
  end
end
