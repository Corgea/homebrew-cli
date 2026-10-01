class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/65/8c/36124c39bf10a74ebfcbad5879db9a7ca032d2f049d662f9efc9f36d6e92/corgea_cli-1.16.1.tar.gz"
  sha256 "40f1c2dea182750ea92d501aa65e12432cf3077671f2811174bd35929fbc18eb"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
