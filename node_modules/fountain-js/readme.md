# Fountain

A JavaScript parser for Fountain formated scripts that is compatible with Node.js and Browserify.


## Install

    npm install fountain-js


## Use

    var fountain = require('fountain-js');
    
    // Give it a callback
    fountain.parse(string, function (output) {
      // output.title;
      // output.credit;
      // output.authors;
      // output.source;
      // output.draft_date;
      // output.date;
      // output.contact;
      // output.copyright;
      
      // output.scenes;
      
      // output.title_page_html;
      // output.script_html;
    });
    
    // Get the output directly
    var output = fountain.parse(string);


## Test

    npm test