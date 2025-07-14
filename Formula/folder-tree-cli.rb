class FolderTreeCli < Formula
  desc "CLI toolkit for visualizing folder structures with markdown reports"
  homepage "https://github.com/raymonepping/folder_tree_cli"
  url "https://github.com/raymonepping/homebrew-folder-tree-cli/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "119b059cebc559e3c8a4bee80689dad8cd09c90e7038375d9b3aaa3fc89fa6ce" 
  license "MIT"
  version "1.0.2"

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
