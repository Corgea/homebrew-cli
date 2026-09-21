class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/30/e5/be0dd98f1842ec20a8f0ff1a6186683e35ff2da5c6c916da445882c60ee7/corgea_cli-1.15.0.tar.gz"
  sha256 "50ec6f24d72e7d763c6627e147561e0cde7e38ea84f2ffc82d17c9b975adae75"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
