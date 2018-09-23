class SshAliases < Formula
  desc "A tool for ~/.ssh/config generation"
  homepage "https://github.com/dankraw/ssh-aliases"
  url "https://github.com/dankraw/ssh-aliases.git",
      :tag => "v0.2.0",
    :revision => "5f882f444053008024a7b5ad98f0e4ec98514d85"

  head "https://github.com/dankraw/ssh-aliases.git"

  depends_on "go" => :build

  def install
    gopath = buildpath/"gopath"
    (gopath/"src/github.com/dankraw/ssh-aliases").install  Dir[buildpath/"*"]

    ENV["GOPATH"] = gopath

    cd gopath/"src/github.com/dankraw/ssh-aliases" do
     system "make"
     bin.install "target/ssh-aliases"
    end
  end

  test do
    system bin/"ssh-aliases", "--version"
  end
end
