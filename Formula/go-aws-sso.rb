class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "9c0ae0d5a159159007632fea0d736b41f04dd9890753f5d947efb2cac3bff9ce"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.4.1"
    sha256 cellar: :any_skip_relocation, monterey:     "ea1c1dcfa60bb9784961a18f16352a9c05714b7252213d7b2eec729fd21b5501"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b57b442dee0890e4944e8ceee0f6018e23b2c0b64866d24b597caf19b8b2ac85"
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
