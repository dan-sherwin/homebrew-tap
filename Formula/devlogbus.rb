class Devlogbus < Formula
  desc "Real-time full-stack development log viewer"
  homepage "https://github.com/dan-sherwin/DevLogBus"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dan-sherwin/DevLogBus/releases/download/v1.4.0/devlogbus_v1.4.0_darwin_arm64.tar.gz"
      sha256 "69ab5be62e3c38c917dacb76c9b5945b52d929ce35f70b53fa45224dbce0f93a"
    else
      url "https://github.com/dan-sherwin/DevLogBus/releases/download/v1.4.0/devlogbus_v1.4.0_darwin_amd64.tar.gz"
      sha256 "3d2ec9161a9aebf873c89dcc11fb0bc47ffb0de3328183ebf567e8e6befb58b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dan-sherwin/DevLogBus/releases/download/v1.4.0/devlogbus_v1.4.0_linux_arm64.tar.gz"
      sha256 "96f1ad27dedc1ba5afd6ba98e3dead37f8f96f580c9b648fe4de912357762eca"
    else
      url "https://github.com/dan-sherwin/DevLogBus/releases/download/v1.4.0/devlogbus_v1.4.0_linux_amd64.tar.gz"
      sha256 "805ca1bf1ced8628f142efb260f1af951aee49bf2e27c5d64805aa68d6f362c2"
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
