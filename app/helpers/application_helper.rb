module ApplicationHelper
  def default_meta_tags
    {
      site: "Citytori",
      reverse: true,
      separator: " | ",
      description: "Citytoriは街で見つけたものを、写真とことばでつないでいく散歩サービスです。",
      icon: [
        { href: image_url("favicon.ico"), type: "image/x-icon", sizes: "any" },
        {
          href: image_url("apple-touch-icon.png"),
          rel: "apple-touch-icon",
          sizes: "180x180",
          type: "image/png"
        }
      ]
    }
  end
end
