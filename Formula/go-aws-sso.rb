class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "833881187b1ecea8718eb94f50b96e6f4c5e721e4caff5b7a75358af220423b6"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-0.6.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "a6a4edfe03f8d03756d6a84fc92c55afd302e1815a8196732cc3ecca39a937b4"
    sha256 cellar: :any_skip_relocation, catalina:     "74459448abbe520e127e56e661bdbc777ed43c4fd50a82bda2585a152b7f2236"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e1028e8fb87abcc9d75dfe927d905e7358efe7af2d09530911433bb2c7210544"
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
