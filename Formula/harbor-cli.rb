# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class HarborCli < Formula
  desc "Harbor Unoffical CLi"
  homepage "https://github.com/hinyinlam/cli-for-harbor"
  version "0.0.2"
  license "Apache 2.0"
  depends_on :macos

  on_macos do
    url "https://github.com/hinyinlam/cli-for-harbor-go/releases/tag/v0.0.2/cli-for-harbor-go_0.0.2_Darwin_x86_64.tar.gz", :using => CurlDownloadStrategy
    sha256 "29a947597504c7a79ab76e9e9d98a8cf7066e55be7e053fc13ecb8d0cec19d5f"

    def install
      bin.install "harbor"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the HarborCli
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  def caveats; <<~EOS
    This is an unofficial Harbor CLI for CNCF Harbor Registry, not for production use
  EOS
  end

  test do
    system "#{bin}/harbor --version"
  end
end