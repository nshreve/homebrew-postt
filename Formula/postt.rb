class Postt < Formula
    desc "A delightful CLI for creating and publishing blogs"
    homepage "https://github.com/noahshreve/postt"
    url "https://github.com/noahshreve/postt/releases/download/v0.1.0/postt-dis
  t.tar.gz"
    sha256 "PLACEHOLDER"
    version "0.1.0"
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
