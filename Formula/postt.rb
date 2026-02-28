class Postt < Formula
  desc "A delightful CLI for creating and publishing blogs"
  homepage "https://github.com/nshreve/postt"
  url "https://github.com/nshreve/postt/releases/download/v0.1.3/postt-dist.tar.gz"
  sha256 "470a5bd8b0354948a0313bceb14285e101794b932feb28793f0bbc21162b2368"
  version "0.1.3"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "dist"
    libexec.install "node_modules"
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
