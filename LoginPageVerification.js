describe('Selenium Test Case', function() {

      beforeEach(function() {
    
    ptor = protractor.getInstance();
  });

  it('should execute test case without errors', function() {
    var text, value, bool, source, url, title;
    var TestVars = {};
    browser.ignoreSynchronization = true;
    browser.driver.manage().window().maximize();

    browser.get("http://seep-digilink.in/");
    text = element(by.partialLinkText('HOME')).getText();
    expect(text).toEqual("" + "HOME");
    text = element(by.partialLinkText('PROFILE')).getText();
    expect(text).toEqual("" + "PROFILE");
    text = element(by.partialLinkText('SEEP')).getText();
    expect(text).toEqual("" + "SEEP");
    text = element(by.partialLinkText('CLAIM ENTRY')).getText();
    expect(text).toEqual("" + "CLAIM ENTRY");
    text = element(by.partialLinkText('MY CLAIMS')).getText();
    expect(text).toEqual("" + "MY CLAIMS");
    text = element(by.partialLinkText('REDEMPTION')).getText();
    expect(text).toEqual("" + "REDEMPTION");
    text = element(by.partialLinkText('REWARD GALLERY')).getText();
    expect(text).toEqual("" + "REWARD GALLERY");
    text = element(by.partialLinkText('CONTACT')).getText();
    expect(text).toEqual("" + "CONTACT");
    element(by.linkText("PROGRAM MANAGEMENT")).click();
    text = element(by.partialLinkText('CHANGE PASSWORD')).getText();
    expect(text).toEqual("" + "CHANGE PASSWORD");
    text = element(by.partialLinkText('LOGOUT')).getText();
    expect(text).toEqual("" + "LOGOUT");
    bool = ptor.isElementPresent(by.css("a.left.carousel-control"));
    expect(bool).toBe(true);
    bool = ptor.isElementPresent(by.css("a.right.carousel-control"));
    expect(bool).toBe(true);
    
    value = element(by.xpath("//div[@class='logincontent']/input[1]")).getAttribute('value');
    //expect(value).toEqual("" + );
    value = element(by.xpath("//div[@class='logincontent']/input[2]")).getAttribute('value');
    //expect(value).toEqual("" + );
    text = element(by.partialLinkText('Login')).getText();
    expect(text).toEqual("" + "Login");
    value = element(by.css("input[type=\"submit\"]")).getAttribute('value');
    expect(value).toEqual("" + "Submit");
    bool = ptor.isElementPresent(by.css("footer"));
    expect(bool).toBe(true);
    
  });
});
