exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',

  //baseUrl: 'http://localhost:8081/',

  // specs: ['spec.js'],

  specs: ['features/*.feature'],

  multiCapabilities: [/*{
    browserName: 'firefox'
  }, */{
    browserName: 'chrome',
  }],

  framework: 'cucumber'
}
