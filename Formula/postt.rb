class Postt < Formula
  desc "A delightful CLI for creating and publishing blogs"
  homepage "https://github.com/nshreve/postt"
  url "https://github.com/nshreve/postt/releases/download/v0.1.1/postt-dist.tar.gz"
  sha256 "69232c07d5ca0a872cf1de14c487e70a917638a8c7aebd053f6a9a9c6b5dd57b"
  version "0.1.1"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "dist"
    (bin/"postt").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/index.js" "$@"
    EOS
    chmod 0755, bin/"postt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postt --version")
  end
end
