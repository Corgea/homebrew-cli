class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/43/87/5448447a861121d1e03e90264b58ccbcd12e14656abdcf787e329b44e2ca/corgea_cli-1.7.0.tar.gz"
  sha256 "78322c5d9af4e73e57dfdaa7db8d29fb7339c7b4a991a278915f22a9489633af"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
