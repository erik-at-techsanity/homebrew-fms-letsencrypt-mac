class FmsLetsencryptMac < Formula
  desc "Let's Encrypt SSL Certificate Support Utilities for FileMaker Server on Macs"
  homepage "https://github.com/erik-at-techsanity/fms-letsencrypt-mac"
  url "https://github.com/erik-at-techsanity/fms-letsencrypt-mac/releases/download/v0.1.0/fms-letsencrypt-mac.tar.gz"
  sha256 "c9e527bcb81a0adb2f2d9cd018548da5a94612ecf22d38beeac9660154601098"
  license "Apache-2.0"

  depends_on "certbot"

  def install
    libexec.install "common.sh"
    libexec.install "get_certificate.sh" => "get_certificate"
    libexec.install "revoke_certificate.sh" => "revoke_certificate"

    bin.write_exec_script (libexec/"get_certificate")
    bin.write_exec_script (libexec/"revoke_certificate")

    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  test do
    system "false"
  end
end
