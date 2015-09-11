We love pull requests. Here's a quick guide:

1. Fork the repo.

2. Run the tests. We only take pull requests with passing tests, and it's great
to know that you have a clean slate: `bundle && rake`

3. Add a test for your change. Only refactoring and documentation changes
require no new tests. If you are adding functionality or fixing a bug, we need
a test!

4. Make the test pass. Test with ruby 1.9.3 and 2.2.3+. (e.g. `rvm use 1.9.3 && rake`​ and ​`rvm use 2.2.3 && rake`)

5. Push to your fork and submit a pull request.

Syntax:

* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer &&/|| over and/or.
* a= b or a = b but not a=b.
* Follow the conventions you see used in the source already.
