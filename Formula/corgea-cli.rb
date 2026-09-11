class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/11/a4/66aecfc2eb53d61d0231ee633a21a9c1f5d69feaa3e10ce46b33fca4f9e4/corgea_cli-1.14.1.tar.gz"
  sha256 "d81af286404b6dc6e08a2c840efa24000230ea871f7eca04185d01afbda208d8"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
