class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "46332f5e3d9a1a83752ab875cf65e4756c7ed8d02ca8518893aa40f880c30d67"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.1.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "99b4f59259bb850fd05a9daf62d3b3a581ebce0e40c8eb36d3b7f332b2c30b4f"
    sha256 cellar: :any_skip_relocation, catalina:     "f0e5187f9958daa15b3909097b95e79a4921e541eceb919f2675e94ad0a9d0bb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "216c363a9b41fee5743f58a8fecc65102f80259e30e1feda486b6c442a8d1c6b"
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
