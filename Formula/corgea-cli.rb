class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/f5/15/33a5a359cfe23af9820e0993fa0d5a5a4c9e5e783ac6388aafc6880e6d0e/corgea_cli-1.9.0.tar.gz"
  sha256 "5f1bd5525be8689e8765ee0afa57b3e06f1707ab7d1f8f302071b7e742dfa763"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
