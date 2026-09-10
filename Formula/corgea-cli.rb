class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/b2/49/0cf08d577de0561cef677845c0d38d1466ab360c50dbb59e6953663e22c9/corgea_cli-1.14.0.tar.gz"
  sha256 "e29d76e820e69933f1f66940546561a6439079c21e8d45028a8e921db6b2df5d"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
