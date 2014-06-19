// An example configuration file.
exports.config = {
  // The address of a running selenium server.
 // seleniumAddress: 'http://localhost:4444/wd/hub',

  sauceUser: 'praveenk82',
  sauceKey: '3fb2157e-53e3-4c5d-8cf1-0b8131a08d74',

  // Capabilities to be passed to the webdriver instance.
  capabilities: {
    'browserName': 'chrome'
  },

  // Spec patterns are relative to the current working directly when
  // protractor is called.
  specs: ['LoginPageVerification.js'],

  // Options to be passed to Jasmine-node.
  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: 30000
  }
};