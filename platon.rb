# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Platon < Formula
  desc "A Visualization software for X-Ray crystallographers"
  homepage "http://www.platonsoft.nl"
  url "https://github.com/chemistry-scripts/homebrew-chemistry-data/blob/master/platon-30715.tar.gz?raw=true"
  sha256 "9049d116a49f205821faa219fe785141390b082948233b2483506f2756a3a39d"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on :fortran

  def install
    # Compile with gfortran
    system "gfortran -o platon platon.f xdrvr.c -I/opt/X11/include -L/opt/X11/lib -lX11"
    # Install
    bin.install "platon"
    # Copy check.def file
    prefix.install "check.def"
  end

  test do
    # Just start platon
    # Better testing is probably required
    system "#{bin}/platon"
  end
end
