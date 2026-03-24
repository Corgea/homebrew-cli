class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/1c/ed/ed6878de1635c53590b1abc6c45e2831643366be9b99aaca24a721d06530/corgea_cli-1.8.4.tar.gz"
  sha256 "04c2300ecfbadf40b5de0f5013e66531586ab6d74266aa58322a820909bf8b83"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
