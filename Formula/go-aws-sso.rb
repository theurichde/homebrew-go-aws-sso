class Go_aws_sso < Formula
  desc "Makes dealing with AWS SSO from local machines an ease."
  homepage "https://github.com/theurichde/go-aws-sso"
  url "https://github.com/theurichde/go-aws-sso/archive/v0.4.0.tar.gz"
  sha256 "ffb79f965269f1c34b0c2bf58ae5abbdbcbc71fd4a8c2dc09692db190128c8a8"
  license "MIT"
  head "https://github.com/theurichde/go-aws-sso.git", branch: "master"
  version "v0.4.0"

#   bottle do
#     sha256 cellar: :any_skip_relocation, arm64_monterey: "TODO"
#     sha256 cellar: :any_skip_relocation, arm64_big_sur:  "TODO"
#     sha256 cellar: :any_skip_relocation, monterey:       "TODO"
#     sha256 cellar: :any_skip_relocation, big_sur:        "TODO"
#     sha256 cellar: :any_skip_relocation, catalina:       "TODO"
#     sha256 cellar: :any_skip_relocation, x86_64_linux:   "e403e60df30c2739027992d1a8361bd329aa52a50e9b1ec606c9b259b5fd346e"
#   end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit # OSX ARM
      url "https://github.com/theurichde/go-aws-sso/releases/download/v0.4.0/go-aws-sso_0.4.0_darwin_arm64.tar.gz"
      sha256 "beb0981390798d9f9c32babb5bf8e143f3cdf03cb24e731ae223ac22836400b7"
    end
    if Hardware::CPU.Intel? && Hardware::CPU.is_64_bit # OSX AMD
      url "https://github.com/theurichde/go-aws-sso/releases/download/v0.4.0/go-aws-sso_0.4.0_darwin_amd64.tar.gz"
      sha256 "d48fe74fbc6226d362f7d48c600ae6e9e3856e749e6cdf772d5b8d4fb0818b08"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/theurichde/go-aws-sso/releases/download/v0.4.0/go-aws-sso_0.4.0_linux_amd64.tar.gz"
        sha256 "e403e60df30c2739027992d1a8361bd329aa52a50e9b1ec606c9b259b5fd346e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/theurichde/go-aws-sso/releases/download/v0.4.0/go-aws-sso_0.4.0_linux_arm64.tar.gz"
      sha256 "8c9bbb1c87f2da7d314d0f62c718659a5b2d9d4e43e6798124c9b1817a20ab79"
    end
  end

  depends_on "go" => :build

  def install
    ldflags = "-X 'github.com/theurichde/cmd/go-aws-sso/main.version=#{version}'"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/go-aws-sso"
  end

  test do
    system "#{bin}/go-aws-sso --version"
  end
end
