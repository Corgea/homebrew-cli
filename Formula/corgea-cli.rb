class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/6e/2c/9198d442d2bf7ea8496f88237bd261c84ff798c895ce3d83a94d8e10b719/corgea_cli-1.8.7.tar.gz"
  sha256 "b6862cf2aa7276bdd205387f7589b2a46907559d0422cd7c90a1af12a767ae38"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
