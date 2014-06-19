describe('Selenium Test Case', function() {

      beforeEach(function() {
    
    ptor = protractor.getInstance();
  });

  it('should execute test case without errors', function() {
    var text, value, bool, source, url, title;
    var TestVars = {};
    browser.ignoreSynchronization = true;
    browser.driver.manage().window().maximize();

    browser.get("http://seep-digilink.annectos.net/");
    text = element(by.partialLinkText('HOME')).getText();
    console.log("text");
    console.log(text);

    });
});
