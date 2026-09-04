class CorgeaCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool for corgea"
  homepage "https://pypi.org/project/corgea-cli/"
  url "https://files.pythonhosted.org/packages/86/85/e5308a995bf9af87e761703bba2e6edc33793372552fe13b61c63dd09a06/corgea_cli-1.13.0.tar.gz"
  sha256 "699f8f9c3087ff577b80b02ab67f5513ede4e532a28b848268abdddaa36ffdec"

  depends_on "python@3.11"
  depends_on "rust" => :build

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corgea", "--help"
  end
end
