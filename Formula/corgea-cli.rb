class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/67/41/144bcfe9973e484766566380bfd26afa9fdbbe347f65bfbd2b34ea155a59/corgea_cli-1.6.6.tar.gz"
  sha256 "b5154e4cdcb87a0ba2b74207b92540ad6c2ef30df34c41e7058dbefcdd859855"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
