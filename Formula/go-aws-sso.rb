class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "84dec4bba1657263453b6c253fab9d1bd774236629d0abde9878f47035c0b7ab"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.4.0"
    sha256 cellar: :any_skip_relocation, monterey:     "8c29b37b32c1ab72183d5f2cc8ae9a0836b411db8e6e5af39ed5ab03bdc942f9"
    sha256 cellar: :any_skip_relocation, big_sur:      "d1158ff0b6a1451a562b6e16cd43fb3352e1fda82d57cdeff5e532b5ecb524e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2915fa40b447d0cb36451f6b560ac440f7716ff76c7833e0be0cc6ade1c2e45f"
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
