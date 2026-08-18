class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/af/6c/d925999cdbc2453346e0ac9e0bf1ceb5214a5ce73fd3b377bc562c2b2a7f/corgea_cli-1.11.1.tar.gz"
  sha256 "8501932760c000fa866375bc97aa7e26adb50552886db4d5ff0bab195c04d296"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
