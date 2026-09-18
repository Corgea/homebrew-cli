class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/31/0d/89e4ef26cc981c848e3ad61d8a9945d1bcd093e1fd305f1083a1bfcf0ea7/corgea_cli-1.14.2.tar.gz"
  sha256 "6972230463ff129d5cdb007832b438b710ed2f20b22efe008ecfc7078dd538aa"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
