class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/c0/62/9785266dd37a968c40ca808f24ff837e820dc8625cfa46294f6d83b30f67/corgea_cli-1.12.0.tar.gz"
  sha256 "f58ad96f9129f1fc47c5b216bc69fe558be87c046890b7dbac8438ef18240dd4"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
