class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/9c/26/5a30fda87bd30aa8a2f66d99c5246ff925121d0e60568113afb46a23220d/corgea_cli-1.9.1.tar.gz"
  sha256 "4af5f679d6d1d2f5b440f2a1a3267d45ece916226a4a86b5543554b77cbf43a3"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
