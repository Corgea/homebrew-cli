class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/63/bb/77407c2e6dff75097fc2c5149f9446262529100aa301b1c09a532a821842/corgea_cli-1.11.0.tar.gz"
  sha256 "ff09a5383ee24c35bbfceb4063cbe94c6228d8427463a31b88f730660811b6f4"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
