class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/cb/8d/d152c025d33d24ed6617db2d9cc2855a3a5a04c2147e29c9adf1c0d2808a/corgea_cli-1.9.2.tar.gz"
  sha256 "834db5a9a600d9e930ed1f1283cb5c305d831264d6b12899be2dffb047330a5d"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
