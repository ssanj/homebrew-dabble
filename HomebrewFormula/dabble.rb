class Dabble < Formula
  desc "The simplest way to load a Scala library into the REPL"
  homepage "https://github.com/ssanj/dabble"
  version "0.1.0"
  url "https://github.com/ssanj/dabble/releases/download/v#{version}/dabble", :using => :nounzip
  sha256 "554cd5ffd5d198dddf23bbd8d39eaba9d801fa2c427ab765c4bd26669c52f9d4"
  head "https://github.com/ssanj/dabble.git"

  if build.head?
    depends_on :java => "1.7+"
    depends_on "sbt" => :build
  end

  def install
    if build.head?
      # ENV.java_cache
      system "sbt", "assembly"
      bin.install "target/scala-2.11/dabble" => "dabble"
    else
      bin.install "dabble" => "dabble"
    end
  end

  test do
    expected_output = "Dabble version:"
    assert_includes shell_output("#{bin}/dabble -version"), expected_output
  end
end
