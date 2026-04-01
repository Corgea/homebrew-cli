class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/c0/57/3972506e200fd929049fe0f34de9d7980dc2c32447d8b99561bab531952b/corgea_cli-1.8.5.tar.gz"
  sha256 "1c2a5fe55e9afd85d85de749e2ca30ba58284688f89ce035b47216efacf0f909"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
