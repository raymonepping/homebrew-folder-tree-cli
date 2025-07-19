class FolderTreeCli < Formula
  desc "CLI toolkit for visualizing folder structures with markdown reports"
  homepage "https://github.com/raymonepping/folder_tree_cli"
  url "https://github.com/raymonepping/homebrew-folder-tree-cli/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  version "1.3.1"

  depends_on "bash"

  def install
    bin.install "bin/folder_tree" => "folder_tree"
    pkgshare.install "lib", "tpl"
    doc.install "README.md"
  end

  def caveats
    <<~EOS
      To get started, run:
        folder_tree --help

      If you want to customize or extend templates/configs,
      set this variable in your shell:
        export FOLDER_TREE_HOME=#{opt_pkgshare}

      All shared scripts and templates are available in:
        #{opt_pkgshare}/lib
        #{opt_pkgshare}/tpl
    EOS
  end

  test do
    assert_match "folder_tree", shell_output("#{bin}/folder_tree --version")
  end
end
