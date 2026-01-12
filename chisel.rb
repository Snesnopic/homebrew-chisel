class Chisel < Formula
  desc "Experimental project aiming to recreate the functionality of FileOptimizer"
  homepage "https://github.com/Snesnopic/chisel"
  license "MIT"
  version "1.0.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.0.1/chisel-macos-arm64.tar.gz"
    sha256 "81105ac4597cccd17a84b2f39bf0cfb237806c78e0164d4bd4b96d8488527b15"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.0.1/chisel-macos-x64.tar.gz"
    sha256 "0d961362dc22d05e22644b3f1be064509b9e5ba6bf02ff8f0f7cce219e691c9e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.0.1/chisel-linux-x64-gcc.tar.gz"
    sha256 "846a24b7ac2f4472fca6e867fbe9e5555f68bb8d47faa61afe4c20ac351165ed"
  end

  if OS.linux? && Hardware::CPU.arm?
    url "https://github.com/Snesnopic/chisel/releases/download/v1.0.1/chisel-linux-arm64.tar.gz"
    sha256 "87c001cc793cf9d97531ca6736a9bd060ff55d14546e592ed087eb0e37e5738d"
  end

  def install
    # rename the specific binary to 'chisel' and install it to bin
    if OS.mac? && Hardware::CPU.arm?
      bin.install "chisel-macos-arm64" => "chisel"
    elsif OS.mac? && Hardware::CPU.intel?
      bin.install "chisel-macos-x64" => "chisel"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "chisel-linux-x64-gcc" => "chisel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "chisel-linux-arm64" => "chisel"
    end
  end

  test do
    assert_match "1.0.1", shell_output("#{bin}/chisel --version")
  end
end
