class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/fe/d0/af73933de367e8c9cadaff1c6f9d3e6f775b2d844d25bd027cab12c661df/corgea_cli-1.7.1.tar.gz"
  sha256 "558e425c4987bb4f427c8706a40612a29df235d7b4daed1623c3921e4a51e9a9"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
