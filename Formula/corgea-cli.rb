class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/d9/60/3a914267f925b882e0ee6df7b7eaf260a3039543b38729fbdd5fa4b46797/corgea_cli-1.10.0.tar.gz"
  sha256 "4d14d3e2b4a9fb754aa461c072fe8612a19c88575cb394616c296e449ce185c4"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
