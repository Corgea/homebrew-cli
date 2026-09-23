class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/dd/ac/108bf158306817c45ea5e2e4877206184346a2ee17e48d9e5fa286a7b099/corgea_cli-1.16.0.tar.gz"
  sha256 "46de49bd8a3d98b4ec08f033aef67cd45e8fc8077d21b9bda6187427454cbd66"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
