class GradleCompletion < Formula
  desc "Bash and Zsh completion for Gradle"
  homepage "https://gradle.org/"
  url "https://github.com/gradle/gradle-completion/archive/v1.4.0.tar.gz"
  sha256 "e16357369b93a95663694e6f9d86fafde14f22d0e6ab3ee798bdbcdf442c39eb"
  head "https://github.com/gradle/gradle-completion.git"

  bottle :unneeded

  depends_on "bash-completion"

  def install
    bash_completion.install "gradle-completion.bash" => "gradle"
    zsh_completion.install "_gradle" => "_gradle"
  end

  test do
    assert_match "-F _gradle",
      shell_output("bash -c 'source #{bash_completion}/gradle && complete -p gradle'")
  end
end
