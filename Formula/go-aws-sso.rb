class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "833881187b1ecea8718eb94f50b96e6f4c5e721e4caff5b7a75358af220423b6"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.0.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "a7443133de4e6b4bf2582473c09d944ed56ed1a42acd39fb0b906482108df11e"
    sha256 cellar: :any_skip_relocation, catalina:     "5a64b003fd611239905625891e11c265c5f0154d456baca094bfb5885ec35bda"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "01aa68c66523be41a323055d22fbf203a0f42804ed7c78dfd55131617127ec1b"
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
