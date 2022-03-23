class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "51e73d8e924f40a2065653dcb5d99d664101aa7d73da64ed64fef2c60f158cb8"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-0.4.0"
  end

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/go-aws-sso"
  end

  test do
    system "#{bin}/go-aws-sso", "-h"
  end
end
