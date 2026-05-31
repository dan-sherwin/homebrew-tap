class Devlogbus < Formula
  desc "Local-first structured log bus for development work"
  homepage "https://github.com/dan-sherwin/DevLogBus"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dan-sherwin/DevLogBus/releases/download/v1.3.1/devlogbus_v1.3.1_darwin_arm64.tar.gz"
      sha256 "0919df1ba180c8a5192d92370a6f23cf055d4b0fd8d316ce86dd8f386665e49f"
    else
      url "https://github.com/dan-sherwin/DevLogBus/releases/download/v1.3.1/devlogbus_v1.3.1_darwin_amd64.tar.gz"
      sha256 "b5a19b4f7608d84868f99118d7ae80e2007155544a48c07a6fbd3c9ac6f7f5cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dan-sherwin/DevLogBus/releases/download/v1.3.1/devlogbus_v1.3.1_linux_arm64.tar.gz"
      sha256 "fed54e5c9054f033045ac2697acc88a84c9c465e7dc3c3a9c5b9898dcf4d4a8b"
    else
      url "https://github.com/dan-sherwin/DevLogBus/releases/download/v1.3.1/devlogbus_v1.3.1_linux_amd64.tar.gz"
      sha256 "6368fff5bd66319df8703d9fa77ee1148bca01f241e267f1661ff45293001555"
    end
  end

  def install
    bin.install "devlogbus"
    bin.install "devlogbusd"
    bin.install "devlogbus-journal-bridge"
    doc.install "README.md", "CHANGELOG.md", "LICENSE"
    doc.install "docs"
  end

  def caveats
    <<~EOS
      Start the broker:
        devlogbusd run

      Open the embedded browser UI:
        http://127.0.0.1:7423/

      The journald bridge only captures records on Linux.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devlogbus version")
    assert_match version.to_s, shell_output("#{bin}/devlogbusd version")
    assert_match version.to_s, shell_output("#{bin}/devlogbus-journal-bridge version")
  end
end
