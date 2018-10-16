class Dabble < Formula
  desc "The simplest way to load a Scala library into the REPL"
  homepage "https://github.com/ssanj/dabble"
  version "0.4.1"
  url "https://github.com/ssanj/dabble/releases/download/v#{version}/dabble", :using => :nounzip
  sha256 "c089eab72e6adb863b74029d80ef05e10188128afea5760ded90123efa3122ac"
  head "https://github.com/ssanj/dabble.git"

  def install
      bin.install "dabble" => "dabble"
  end

  test do
    expected_output = "Dabble version:"
    assert_includes shell_output("#{bin}/dabble -version"), expected_output
  end
end
