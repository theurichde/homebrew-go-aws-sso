class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "e721ea2424b0eab45402f2de01ce98d8e95788d7b13b0b0b55add28172e250c2"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.3.1"
    sha256 cellar: :any_skip_relocation, monterey:     "4570c8f34e73d462c4061d0efc098c86c9ac9ea5b302544efce887f5804f62a8"
    sha256 cellar: :any_skip_relocation, big_sur:      "b40756631a661270c7b2936a608ed21234de4a5937dfa86261b6e763f938f34d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "27e5c7825258ab6583df6717c5c0da73f2c795d3d3aaffd5c9e114dafddc9737"
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
