# Acclir

AtCoder CLI developed in Ruby.

## Installation

Install the gem and add to the application's Gemfile by executing:

```
$ bundle add acclir
```

If bundler is not being used to manage dependencies, install the gem by executing:

```
$ gem install acclir
```

## Usage

```
$ acclir help
Acclir commands:
  acclir help [COMMAND]  # Describe available commands or one specific command
  acclir login           # Login AtCoder
  acclir new CONTEST_ID  # Generate files for the contest
```

## Examples

First, login.

```
$ acclir login
```

Prepare for AtCoder Beginner Contest 284.

```
$ acclir new abc284
```

`abc284` is the ID assigned to the contest URL.  
https://atcoder.jp/contests/abc284

Once the problem is solved, the test can be run.

```
$ ruby abc284/abc284_a/main_test.rb
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/n0h0/acclir.
