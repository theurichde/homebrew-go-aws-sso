class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.4.3.tar.gz"
  sha256 "301211e5b6dd5926da423b6d7d01c644ddbc64a5375cfc08df4f2237043d6fce"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.4.3"
    sha256 cellar: :any_skip_relocation, monterey: "7a4f75f35303eb460725a366a503847a9cfa0340f7e5be99ee8e267b59f1df83"
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
