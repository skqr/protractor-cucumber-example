# [Protractor](https://github.com/angular/protractor) + [Cucumber.js](https://github.com/cucumber/cucumber-js) Example

The [Protractor tutorial](https://github.com/angular/protractor/blob/master/docs/tutorial.md) example written for Cucumber.js, running on a [Vagrant virtual machine](https://github.com/mitchellh/vagrant).

You'll need to have **[VirtualBox](https://www.virtualbox.org)** and **Vagrant** installed.

- Change into the project dir.
- `vagrant up`
- `vagrant ssh`
- `cd /vagrant`
- `./e2e/webdriver.sh`
- Open another terminal.
- `vagrant ssh`
- `cd /vagrant`
- `protractor e2e/conf.js`

The tests are run against `http://juliemr.github.io/protractor-demo` just like in the Protractor tutorial, but are written in the much more pleasing [Gherkin](https://github.com/cucumber/cucumber/wiki/Gherkin) [format](http://docs.behat.org/en/latest/guides/1.gherkin.html).
