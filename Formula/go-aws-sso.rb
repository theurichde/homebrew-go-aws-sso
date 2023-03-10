class GoAwsSso < Formula
  desc "Makes dealing with AWS SSO Logins an ease"
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "bb385a30255d4a7b0fbb51aab43eb9dc737db8e13e00815bc9a370e88de89183"
  license "MIT"

  bottle do
    root_url "https://github.com/theurichde/homebrew-go-aws-sso/releases/download/go-aws-sso-1.3.0"
    sha256 cellar: :any_skip_relocation, monterey:     "df9f516daa8c9f701488938159a7243f7d9a7150bf5db8b9ece6dda2c350e787"
    sha256 cellar: :any_skip_relocation, big_sur:      "63a2ef43ea215d69f1955ad9799d8f8963e152519cbd7dbc9b82f8cb4a035f4e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f683ea8678bc195186a7661b32d3c744f70ee39122e66636364b2ff7c69c9d0d"
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
