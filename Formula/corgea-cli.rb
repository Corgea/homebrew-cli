class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/98/01/c9726bf4c472737e8a84ec45b93ce1f38017fb7eee1855e7faf8ac860cf4/corgea_cli-1.8.2.tar.gz"
  sha256 "dae0ccc12a36335ddb57383b1c481dd74079be16748b0f5c6f64a62504ee23df"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
