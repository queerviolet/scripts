var fs = require('fs'),
    should = require('should'),
    parser = require('../src/parser');

var script = fs.readFileSync(__dirname + '/the-riddling-troll.fountain', 'utf8');


describe('Parser', function () {
  describe("#lexer", function () {
    it('should handle bold', function () {
      var s = parser.lexer("This is **bold** text");
      s.should.equal('This is <strong>bold</strong> text');
    });
    
    it('should handle italic', function () {
      var s = parser.lexer("This is *italic* text");
      s.should.equal('This is <em>italic</em> text');
    });
    
    it('should handle underline', function () {
      var s = parser.lexer("This is _underlined_ text");
      s.should.equal('This is <span style="text-decoration:underline">underlined</span> text');
    });
    
    it('should handle bold underline', function () {
      var s = parser.lexer("This is **_bold underlined_** text");
      s.should.equal('This is <strong><span style="text-decoration:underline">bold underlined</span></strong> text');
    });
    
    it('should handle bold italic', function () {
      var s = parser.lexer("This is ***bold italic*** text");
      s.should.equal('This is <strong><em>bold italic</em></strong> text');
    });
    
    it('should handle bold italic underline', function () {
      var s = parser.lexer("This is _***bold italic underline***_ text");
      s.should.equal('This is <strong><em><span style="text-decoration:underline">bold italic underline</span></em></strong> text');
    });
    
    it('should handle italic underline', function () {
      var s = parser.lexer("This is *_italic underline_* text");
      s.should.equal('This is <em><span style="text-decoration:underline">italic underline</span></em> text');
    });
  });
  
  
  describe('#parse', function () {
    it('should create a title page', function () {
      var output = parser.parse(script);
      output.title_page_html.should.containEql('<h1>The Riddling Troll</h1>');
    });
    
    
    it('should extract meta data', function () {
      var output = parser.parse(script);
      
      output.title.should.equal('The Riddling Troll');
      output.credit.should.equal('by');
      output.authors[0].should.equal('Nathan Hoad');
      output.source.should.equal('A short story by Nathan Hoad');
      output.draft_date.should.equal('March 1, 2013');
      output.date.should.equal('July 4, 2014');
      output.contact.should.equal('nathan@nathanhoad.net');
    });
    
    
    it('should compile a list of scenes', function () {
      var output = parser.parse(script);
      
      output.should.have.property('scenes');
      output.scenes.should.be.an.instanceOf(Array);
      output.scenes.length.should.be.above(0);
      output.scenes[0].should.equal('EXT. BRIDGE – DAY');
    });
    
    
    it('should handle multiple authors', function () {
      var output;
      
      // Single author
      output = parser.parse(script);
      
      output.authors.should.be.an.instanceOf(Array);
      output.authors.length.should.equal(1);
      output.authors[0].should.equal('Nathan Hoad');
      
      // Multiple authors
      var multiple_authors_script = script.replace('Author: Nathan Hoad', 'Authors:\nNathan Hoad\nJordon Beth');
      output = parser.parse(multiple_authors_script);
      
      output.authors.should.be.an.instanceOf(Array);
      output.authors.length.should.equal(2);
      output.authors[0].should.equal('Nathan Hoad');
      output.authors[1].should.equal('Jordon Beth');
      
      multiple_authors_script = script.replace('Author: Nathan Hoad', 'Authors: Nathan Hoad, Jordon Beth');
      output = parser.parse(multiple_authors_script);
      
      output.authors.should.be.an.instanceOf(Array);
      output.authors.length.should.equal(2);
      output.authors[0].should.equal('Nathan Hoad');
      output.authors[1].should.equal('Jordon Beth');
    });
    
    it('should allow @Character references', function () {
      var special_character_names_script = script.replace(/\nBARDUS\n/g, '\n@BARDUS\n');
      output = parser.parse(special_character_names_script);
      
      output.script_html.should.not.containEql('@BARDUS');
    });
  });
});