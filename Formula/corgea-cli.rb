class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/9b/72/ded2db6d0dfa9539c0738e6ee484ac73727641a9c53d6566f494a67ef2f6/corgea_cli-1.17.2.tar.gz"
  sha256 "7b53d3e0b42e79e8323a9a3e0a1dfb42d0ae06edfb08822ce1f958b4ba4a48fb"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
