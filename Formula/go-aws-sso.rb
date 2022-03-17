class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "11655f89608610c49e83a2c9ffcbe32aa37c623de00537bc59ac0b6ea320c562"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-0.4.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "9bd77411e2a726446843ac25949f6afa29e607d8ceafb1e5a9e53360092c524d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "74e5be07fd902caa4863dd405be75c790f2ed6b895bb277651c9e14457f16010"
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
