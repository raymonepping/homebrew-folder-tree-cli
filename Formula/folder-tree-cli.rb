class FolderTreeCli < Formula
  desc "CLI toolkit for visualizing folder structures with markdown reports"
  homepage "https://github.com/raymonepping/folder_tree_cli"
  url "https://github.com/raymonepping/homebrew-folder-tree-cli/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "9a75f07c93d2b9286c2cd88ca5092e362e0734e41fc0e9428dda7711b53c803c" 
  license "MIT"
  version "1.0.3"

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
