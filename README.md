## Homebrew

Formula for [go-aws-sso](https://github.com/theurichde/go-aws-sso)
=======
## How do I install these formulae?

`brew install theurichde/go-aws-sso/<formula>`

Or `brew tap theurichde/go-aws-sso` and then `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh)

### How to release

1. Download the artifact via `curl -L https://github.com/theurichde/go-aws-sso/archive/refs/tags/v0.6.1.tar.gz -o /tmp/release.tar.gz`
2. do `sha256sum /tmp/release.tar.gz`
3. Adapt the artifact and sha256 sum in [go-aws-sso.rb](Formula/go-aws-sso.rb)
4. Create a PR with that change
5. Wait for the bottle builds to finish
6. Put the label `pr-pull` on the PR
7. The workflow is doing the rest


### Useful Links

* [Homebrew blog post](https://brew.sh/2020/11/18/homebrew-tap-with-bottles-uploaded-to-github-releases/)
* [Step-by-step guide](https://betterprogramming.pub/a-step-by-step-guide-to-create-homebrew-taps-from-github-repos-f33d3755ba74)
