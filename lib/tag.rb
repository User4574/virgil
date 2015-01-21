module Virgil
  module Tag
    class Doctype
      def initialize
        @tag = "<!DOCTYPE " + yield + ">"
      end
      def to_s
        @tag
      end
    end
    class Comment
      def initialize
        @tag = "<!--" + yield + "-->"
      end
      def to_s
        @tag
      end
    end
    class Common
      def initialize(tag, attrs)
        @tag = "<#{tag}" + Utils.unfold(attrs) + ">" +
        yield +
        "</#{tag}>"
      end
      def to_s
        @tag
      end
    end
    class Common_Single
      def initialize(tag, attrs)
        @tag = "<#{tag}" + Utils.unfold(attrs) + "/>"
      end
      def to_s
        @tag
      end
    end

    class Map < Common
      def initialize(attrs, &block)
        @tag = "<map" + Utils.unfold(attrs) + ">" +
        self.instance_eval(&block) +
        "</map>"
      end
      def area
        "<area>" +
        "</area>"
      end
    end
  end

  module Tags
    def doctype
      Tag::Doctype.new(&Proc.new).to_s
    end
    def comment
      Tag::Comment.new(&Proc.new).to_s
    end
    def common(attrs = {})
      Tag::Common.new(__callee__, attrs, &Proc.new).to_s
    end
    def common_single(attrs = {})
      Tag::Common_Single.new(__callee__, attrs).to_s
    end

    def map(attrs = {})
      Tag::Map.new(attrs, &Proc.new).to_s
    end

    alias :a :common
    alias :abbr :common
    alias :acronym :common
    alias :address :common
    alias :applet :common
    alias :article :common
    alias :aside :common
    alias :audio :common
    alias :b :common
    alias :base :common
    alias :basefont :common
    alias :bdi :common
    alias :bdo :common
    alias :big :common
    alias :blockquote :common
    alias :body :common
    alias :br :common
    alias :button :common
    alias :canvas :common
    alias :caption :common
    alias :center :common
    alias :cite :common
    alias :code :common
    alias :col :common
    alias :colgroup :common
    alias :datalist :common
    alias :dd :common
    alias :del :common
    alias :details :common
    alias :dfn :common
    alias :dialog :common
    alias :dir :common
    alias :div :common
    alias :dl :common
    alias :dt :common
    alias :em :common
    alias :embed :common
    alias :fieldset :common
    alias :figcaption :common
    alias :figure :common
    alias :font :common
    alias :footer :common
    alias :form :common
    alias :frame :common
    alias :frameset :common
    alias :h1 :common
    alias :h2 :common
    alias :h3 :common
    alias :h4 :common
    alias :h5 :common
    alias :h6 :common
    alias :head :common
    alias :header :common
    alias :hgroup :common
    alias :hr :common
    alias :html :common
    alias :i :common
    alias :iframe :common
    alias :img :common_single
    alias :input :common
    alias :ins :common
    alias :kbd :common
    alias :keygen :common
    alias :label :common
    alias :legend :common
    alias :li :common
    alias :link :common
    alias :main :common
    alias :mark :common
    alias :menu :common
    alias :menuitem :common
    alias :meta :common
    alias :meter :common
    alias :nav :common
    alias :noframes :common
    alias :noscript :common
    alias :object :common
    alias :ol :common
    alias :optgroup :common
    alias :option :common
    alias :output :common
    alias :p :common
    alias :param :common
    alias :pre :common
    alias :progress :common
    alias :q :common
    alias :rp :common
    alias :rt :common
    alias :ruby :common
    alias :s :common
    alias :samp :common
    alias :script :common
    alias :section :common
    alias :select :common
    alias :small :common
    alias :source :common
    alias :span :common
    alias :strike :common
    alias :strong :common
    alias :style :common
    alias :sub :common
    alias :summary :common
    alias :sup :common
    alias :table :common
    alias :tbody :common
    alias :td :common
    alias :textarea :common
    alias :tfoot :common
    alias :th :common
    alias :thead :common
    alias :time :common
    alias :title :common
    alias :tr :common
    alias :track :common
    alias :tt :common
    alias :u :common
    alias :ul :common
    alias :var :common
    alias :video :common
    alias :wbr :common
  end
end
