require './lib/virgil'
include Virgil::Tags

puts doctype {
  "html"
}

puts comment {
  "this is neat"
}

puts html {
  head {
    title {
      "My Virgil site"
    }
  } +
  body {
    h1 {
      "My Virgil site"
    } +
    p({:class => "italic"}) {
      "some content"
    } +
    img({:src => "img.jpg"}) +
    a({"href" => "/"}) {
      "A link home"
    } +
    input({"webkit-speech-recognition" => nil}) {} +
    map {
      area {}
    }
  }
}
