class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/76/98/430891d97a0f70d2a396efe7aeef8348c43e689938bb75785656d2766212/corgea_cli-1.9.3.tar.gz"
  sha256 "ca5f7892813bd1416a2f584738df3ff4726d671d70ba546b6cabc11a41c0473a"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
