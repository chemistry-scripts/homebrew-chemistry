# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Platon < Formula
  desc ""
  homepage ""
  url "http://www.platonsoft.nl/xraysoft/unix/platon/platon.f.gz"
  sha256 "dbd1ed733fca491ec6644481cb6dc3365cde0e6de965fec721339049c78df7c3"
  version "2"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components

  resource "additional_files" do
     url "http://www.platonsoft.nl/xraysoft/unix/platon/xdrvr.c.gz"
     sha256 ""
   end

  def install
    # Download additional library for X11
    resource("additional_files")
    # Compile with gfortran
    system "gfortran -o platon platon.f xdrvr.c -I/opt/X11/include -L/opt/X11/lib -lX11"
    # Install
    bin.install "platon"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test platon`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
