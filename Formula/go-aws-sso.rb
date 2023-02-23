class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "ef51d8bf3774046913cff75131f685c564199c689ebf25e154b9465c021581fb"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.2.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "c4203e95d0b7332833954c6e74a00f5c9db4ce33fb51ffd504f1d68ef2f79a98"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5f2d9890ee139ecfe444faaa38a124ec4e74c43b7c343f3a11afc84da06a4e01"
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
