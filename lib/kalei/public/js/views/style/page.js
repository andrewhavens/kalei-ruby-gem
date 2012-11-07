define([
  'jquery',
  'underscore',
  'backbone',
  'text!templates/style/page.html',
  'jscssp',
  'config',
  'pagedown',
  'libs/marked/marked',
  'libs/highlight/highlight',
  'libs/parseuri/parseuri'
], function($, _, Backbone, stylePageTemplate, jscssp, config, Pagedown, marked, hljs, parseuri){
  var StylePage = Backbone.View.extend({
    el: '.kalei-style-page',
    render: function () {
      $('head').append('<link rel="stylesheet" href="' + config.css_path + '"" type="text/css" />');
      var converter = new Pagedown.Converter();
      var that = this;
      var styleUrl;
      if(this.options.style.substr(0,1) === '/') {
        // non relative
        var configDir = config.css_path.substr(0, config.css_path.lastIndexOf('/'));
        var pUrl = parseuri(configDir);
        styleUrl = pUrl.protocol + '://' + pUrl.host + (pUrl.port === '' ? '' : ':'+ pUrl) + this.options.style;
      } else {
        var configDir = config.css_path.substr(0, config.css_path.lastIndexOf('/'));
        styleUrl = configDir + '/' + this.options.style;
      }
      console.log('try', styleUrl)
		 require(['text!'+ styleUrl], function (stylesheet){
        var parser = new jscssp();
        marked.setOptions({ sanitize: false, gfm: true });
        var stylesheet = parser.parse(stylesheet, false, true);
        var blocks = [];
        var currentBlock = {
          comments: [],
          css: ''

        };

        _.each(stylesheet.cssRules, function(rule) {
    			if(rule.type === 101) {
    			  var comment = rule.parsedCssText;
            comment = comment.replace('/*', '');
            comment = comment.replace('*/', '');
            var comments = marked.lexer(comment);
            _.each(comments, function (comment) {


              if(comment.type === 'heading' && comment.depth <= 2) {
                currentBlock.css = css_beautify(currentBlock.css);
                if(currentBlock.comments.length !== 0 || currentBlock.css !== '') {
                  currentBlock.comments = marked.parser(currentBlock.comments);
                  blocks.push(_.extend({}, currentBlock));
                  currentBlock.comments = [];
                  currentBlock.css = '';
                }
              }
              if(comment.type === 'code'){
                currentBlock.comments.push({
                  type: 'html',
                  text: '<div class="codedemo">' + comment.text + '<div style="clear: both;"></div></div>'
                })
              };
              currentBlock.comments.push(comment);
            
            });

    			}
          if(rule.type === 1) {
            currentBlock.css += rule.parsedCssText;

          }
          if(rule.type === 3) {
            console.log(rule);
            currentBlock.comments.push({
                  type: 'code',
                  text: rule.parsedCssText
                });

          }

		    });
   
        currentBlock.css = css_beautify(currentBlock.css);

        currentBlock.comments = marked.parser(currentBlock.comments);
        blocks.push(currentBlock);
        $(that.el).html(_.template(stylePageTemplate, {_:_, blocks: blocks, config: config}));
        $(' code').each(function(i, e) {hljs.highlightBlock(e); });

         fixie.init();
        
      });

      
    }
  });
  return StylePage;
});
