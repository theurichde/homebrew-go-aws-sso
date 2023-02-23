class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "ef51d8bf3774046913cff75131f685c564199c689ebf25e154b9465c021581fb"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.2.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey:     "c3282e12d5c92df564b5871bf3629c677438cbf5ecbe5f5d9cf257e2ef7ad23c"
    sha256 cellar: :any_skip_relocation, big_sur:      "0ad11912b16bf00b38e7d0bb596cea7c5a5c0f29f2cfeb49df957d198834f40c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f22e16440c4b30658e185f5fc697abc4282261c5bde01adda1ab25519ecdac9e"
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
