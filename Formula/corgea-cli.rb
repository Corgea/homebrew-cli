class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/a6/c4/37968cf40cd41f3458e1ee97af249c4b961107f365330c998a4036301abe/corgea_cli-1.16.2.tar.gz"
  sha256 "dd917ea8f445acbe4fc61b3c7687fb1f13fb71781332e8999c0ce2912b6284c5"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
