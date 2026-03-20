class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/ce/25/e67d869855e1b7ba289a744b48c69911c82a7d8279de682c78713a383854/corgea_cli-1.8.3.tar.gz"
  sha256 "9fb4cb714463cf0d2a4af9105b5bf7a45a5cfe4e0750b9a62e09ea361026ae7e"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
