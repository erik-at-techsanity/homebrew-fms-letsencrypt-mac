class FmsLetsencryptMac < Formula
  desc "Let's Encrypt SSL Certificate Support Utilities for FileMaker Server on Macs"
  homepage "https://github.com/erik-at-techsanity/fms-letsencrypt-mac"
  url "https://github.com/erik-at-techsanity/fms-letsencrypt-mac/releases/download/v0.2.2/fms-letsencrypt-mac.tar.gz"
  sha256 "416ae09e1745e897de7bf41643ad05cc04a5e5a1c6f415db5a1d51cb959f588f"
  license "Apache-2.0"

  depends_on "certbot"

  def caveats
    return unless latest_version_installed?

    <<~EOS
      Before starting the com.techsanity.fms-ssl service:
      * Rename /opt/homebrew/etc/fms-letsencrypt-mac.dist.conf to /opt/homebrew/etc/fms-letsencrypt-mac.conf
      * Edit DOMAIN, EMAIL, FMS_USER, and FMS_PASSWORD to reflect your environment
      * Start / restart the service:  `sudo launchctl start com.filemaker.fms`
    EOS
  end

  def install
    libexec.install "common.sh"
    libexec.install "get_certificate.sh" => "get_certificate"
    libexec.install "revoke_certificate.sh" => "revoke_certificate"

    bin.write_exec_script (libexec/"get_certificate")
    bin.write_exec_script (libexec/"revoke_certificate")

    etc.install "fms-letsencrypt-mac.dist.conf"

    prefix.install "README.md"
    prefix.install "LICENSE"
  end

  test do
    system "true"
  end
end
