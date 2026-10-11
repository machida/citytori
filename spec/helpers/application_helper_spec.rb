require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#default_meta_tags" do
    it "共通のメタデータを返すこと" do
      allow(helper).to receive(:request).and_return(
        double(base_url: "https://example.com", path: "/")
      )
      allow(helper).to receive(:image_url) { |path| "https://example.com/#{path}" }

      tags = helper.default_meta_tags

      expect(tags).to include(
        site: "Citytori",
        reverse: true,
        separator: " | ",
        canonical: "https://example.com/"
      )
      expect(tags[:og]).to include(type: "website", locale: "ja_JP")
      expect(tags[:twitter]).to include(card: "summary_large_image")
    end
  end
end
