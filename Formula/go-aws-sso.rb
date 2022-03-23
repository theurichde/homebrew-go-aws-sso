class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "51e73d8e924f40a2065653dcb5d99d664101aa7d73da64ed64fef2c60f158cb8"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-0.5.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "29bcc77cec331a7b1de094d0030bf6cbad1f360823dd7d7068d0487a937bd2bb"
    sha256 cellar: :any_skip_relocation, catalina:     "3d6b7e1dd1521e2580a37bbd11db78baf35a8389ef37bf696d30acb78ca91463"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c351a33c9995132c0e0d1df97b069826e9c96c5214f60e38d46ab84f7c47f7a"
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
