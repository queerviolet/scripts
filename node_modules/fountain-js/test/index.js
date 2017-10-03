var fs = require('fs'),
    should = require('should'),
    fountain = require('../fountain');

var script = fs.readFileSync(__dirname + '/the-riddling-troll.fountain', 'utf8');


require('./tokenizer-tests.js');
require('./parser-tests.js');


describe('Fountain', function () {
  describe('#parse', function () {
    it('should parse a script', function () {
      var output = fountain.parse(script);
      
      output.title.should.equal('The Riddling Troll');
      output.should.have.properties('title_page_html', 'script_html');
      output.title_page_html.should.startWith('<h1>The Riddling Troll</h1>');
      output.script_html.should.containEql('A STONE BRIDGE stands over a wide rushing river');
    });
    
    it('should handle a callback', function () {
      fountain.parse(script, function (output) {
        output.title.should.equal('The Riddling Troll');
        output.should.have.properties('title_page_html', 'script_html');
        output.title_page_html.should.startWith('<h1>The Riddling Troll</h1>');
        output.script_html.should.containEql('A STONE BRIDGE stands over a wide rushing river');
      });
    });
    
    it('should output parse tokens', function () {
      var output = fountain.parse(script, { tokens: true });
      
      output.should.have.properties('title', 'tokens');
      output.tokens.length.should.be.above(260);
      output.tokens[0].should.have.properties('type', 'text');
      output.tokens[0].type.should.equal('title');
      output.tokens[0].text.should.equal('The Riddling Troll');
    });
  });
});