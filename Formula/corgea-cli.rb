class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/b2/82/59a839360b793da74f76ba0e4da2c91928cc4416fe84bdba34ac71b2cffb/corgea_cli-1.6.7.tar.gz"
  sha256 "201698b54e9238562c2ffa2054d8844ad4aaf35361e6e97e9d1eee9eb5024959"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
