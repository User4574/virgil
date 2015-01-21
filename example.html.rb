require './lib/virgil'
include Virgil

puts Tag.doctype {
  "html"
}

puts Tag.html {
  Tag.head {
    Tag.title {
      "My Virgil site"
    }
  } +
  Tag.body {
    Tag.h1 {
      "My Virgil site"
    } +
    Tag.p ({:class => "italic"}) {
      "some content"
    } +
    Tag.img ({:src => "img.jpg"}) +
    Tag.a ({"href" => "/"}) {
      "A link home"
    }
  }
}
