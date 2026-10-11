module ApplicationHelper
  def default_meta_tags
    {
      site: "Citytori",
      reverse: true,
      separator: " | ",
      description: "Citytoriは街で見つけたものを、写真とことばでつないでいく散歩サービスです。",
      canonical: "#{request.base_url}#{request.path}",
      icon: [
        { href: image_url("favicon.ico"), type: "image/x-icon", sizes: "any" },
        {
          href: image_url("apple-touch-icon.png"),
          rel: "apple-touch-icon",
          sizes: "180x180",
          type: "image/png"
        }
      ],
      og: {
        site_name: :site,
        title: :full_title,
        description: :description,
        type: "website",
        url: :canonical,
        image: image_url("ogp.png"),
        locale: "ja_JP"
      },
      twitter: {
        card: "summary_large_image",
        title: :full_title,
        description: :description,
        image: image_url("ogp.png")
      }
    }
  end
end
