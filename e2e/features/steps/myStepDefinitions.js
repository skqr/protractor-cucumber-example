var chai = require('chai');

var chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);

var expect = chai.expect;

module.exports = function() {
  //var ptor = protractor.getInstance();

  this.Given('I go on "$url"', function (url, callback) {
    browser.get(url);
    callback()
  });

  this.Then('the title should equal "$title"', function (title, callback) {
    expect(browser.getTitle())
      .to.eventually.equal(title)
      .and.notify(callback);
  });

  this.Given(/^I enter (.*) and (.*) as addends$/, function (
    firstAddend, secondAddend, callback
  ) {
    element(by.model('first')).sendKeys(firstAddend);
    element(by.model('second')).sendKeys(secondAddend);
    callback();
  });

  this.When(/^I press Go!$/, function (callback) {
    element(by.id('gobutton')).click();
    callback();
  });

  this.Then(/^the result should equal (.*)$/, function (sum, callback) {
    expect(element(by.binding('latest')).getText())
      .to.eventually.equal(sum)
      .and.notify(callback);
  });

  this.Then('the history should list "$entry"', function(entry, callback) {
    var history = element.all(by.repeater('result in memory'));
    expect(history.first().getText())
      .to.eventually.contain(entry)
      .and.notify(callback);
  });
}
