class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "e420a8201f66bbabef38acb4bd1e42524d1e22e229b46790d13bffa45be5d1bb"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.4.2"
    sha256 cellar: :any_skip_relocation, monterey:     "cc767fb54e72d44ad7338825d99734aa89292c9625796f552bd6d4a85755e0d9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "17487ef3c22fe77f38df76f3b342cbbe74ca96e691b4a33fd6515e28224ce8ec"
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
