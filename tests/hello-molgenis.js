module.exports = {
  'Hello molgenis test' : function (client) {
    client
      .url('https://molgenis01.gcc.rug.nl')
      .waitForElementVisible('body', 1000)
      .assert.title('MOLGENIS')
      .end();
  }
};
