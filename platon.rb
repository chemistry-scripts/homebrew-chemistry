# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Platon < Formula
  desc "A Visualization software for X-Ray crystallographers"
  homepage "http://www.platonsoft.nl"
  url "https://github.com/LaTruelle/homebrew-chemistry-data/blob/master/platon-30715.tar.gz?raw=true"
  sha256 ""

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on :gfortran

  def install
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
    system "#{bin}/platon"
  end
end
