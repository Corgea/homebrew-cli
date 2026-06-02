class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/7c/3e/b012c018737225825a1123cde16b9668e0a3c2dde9e9a05661e1724135be/corgea_cli-1.8.8.tar.gz"
  sha256 "492d13e8304ad0a59b243a58cf95165d5db06598c959de5cfa1091f3bd548ae9"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
