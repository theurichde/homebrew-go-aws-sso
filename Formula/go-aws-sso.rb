class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "ec6bd08338d88082c635e5cd0f28b32b09a130fa0ac5d3df9a16def87d405bb3"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-0.6.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "d980ae28341f66fdf3b61b8b2d222dd9f1689bf3fa4fc31797780505b3165d7a"
    sha256 cellar: :any_skip_relocation, catalina:     "79ebd56757bcf5e7e6e5f28bf870190d1aab84fe00bf37cbf7a9062069f84503"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "24505248751c77d8f91192221ee5f1054c82fe7de415cca5a294533e9014e9fb"
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
