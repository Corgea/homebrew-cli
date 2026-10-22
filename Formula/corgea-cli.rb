class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/e7/a9/58dbe8105ddc8500713c5d73f9af2244e06cf1e48a480937d19f0106a91c/corgea_cli-1.17.0.tar.gz"
  sha256 "7c11c03e31a648d10ea53eed4711b9d5028ddc1b99ce4ebb5739ba3ce897e4a4"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
