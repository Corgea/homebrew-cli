class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/82/cc/33182388d1dc9e247bcf8c7d3c44e4f0a2fe897c23450ab5d25f3cc461f0/corgea_cli-1.8.1.tar.gz"
  sha256 "ad6b27ab36053af66a4ee8c4ad0d7313fb9ef5d76df49fb19d082f0bc9a945e6"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
