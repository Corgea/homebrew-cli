class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/a1/7d/049e2f9c654d943629872d07db67bc82345d28ddf727a6c57168b3a40802/corgea_cli-1.6.5.tar.gz"
  sha256 "f52ca13bafb58073194d3e04b6c1cc4cca0e72a763c404a969b05c8213010c9a"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
