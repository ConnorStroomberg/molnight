module.exports = {
  'Hello molgenis test' : function (client) {
    client
      .url('http://localhost:8080')
      .waitForElementVisible('body', 1000)
      .assert.title('MOLGENIS')
      .end();
  }
};
