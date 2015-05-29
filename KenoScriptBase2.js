
(function () {
    
    var names = $w('1 2 3 4 5 6 7 8 9 10 11 12 13 14 ' +
  '15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80'),
  cards = names.map(function (name) {

      var divid = 'KenoCardDiv' + name;
      var card = new Element('li', { id: name, style: 'margin-top:288px;left:361px;' });
      var div1 = new Element('div', { id: divid, class: 'KenoCardDivImageBorder' });
      var div2 = new Element('div', { id: divid, class: 'KenoCardDivdefaultDiv' });
      var picksDiv = new Element('div', { id: divid, class: 'KenoCardDivpicksDiv' });
      var div3 = new Element('div', { id: divid, class: 'KenoCardDivdrawDiv' });
      var emptyDiv = new Element('div', { id: divid, class: 'KenoCardDivdivEmpty' });
      //div1.insert(new Element('div', { width:'15px', value: 'images/' + name + '.png' }));

      if ((jQuery.inArray(name, selectedNumbersList) >= 0) && (jQuery.inArray(name, drawNumbersList) >= 0)) {

          div1.insert(name);

          card.insert(div1);
      }
      else if (jQuery.inArray(name, selectedNumbersList) >= 0) {
          picksDiv.insert(name);

          card.insert(picksDiv);
      }
      else if (jQuery.inArray(name, drawNumbersList) >= 0) {

          div3.insert(name);

          card.insert(div3);
      } else {
          div2.insert(name);

          card.insert(div2);
      }

      $('cards').insert(card);
      return card;
  });

    function zIndexTransition(pos) { return pos > 0.8 ? 1 : 0; }
    function calculateTop(index) {
        return 200 + (1 - S2.FX.Transitions.mirror((index / (names.length - 1)) * .7 + .15, S2.FX.Transitions.easeOutCirc)) * 300;
    }

    document.observe('cards:shuffle', function () {
        names.sortBy(Math.random).each(function (card, index) {
            $(card).morph('top:-200px;margin-top:' + calculateTop(index) + 'px;left:' + (51 + (index * 20)) + 'px;z-index:' + index, {
                propertyTransitions: { top: 'mirror', left: 'swingFromTo', zIndex: zIndexTransition },
                delay: Math.random() * 2, duration: 1
            });
        });
    });

    document.observe('cards:stack', function () {
        names.sortBy(Math.random).each(function (card, index) {
            $(card).morph('top:-200px;margin-top:' + calculateTop(index) + 'px;left:' + (51 + (names.length / 2) * 20) + 'px;z-index:' + index, {
                propertyTransitions: { top: 'mirror', left: 'bouncePast', zIndex: zIndexTransition },
                delay: Math.random() * 2, duration: 1
            });
        });
    });

    document.observe('cards:layup', function () {
        names.each(function (card, index) {

            $(card).show();

            if (index > 39) {
                $(card).morph('margin-top:' + (((index + 10) / 10).floor() * 72) + 'px;left:' + ((index + 10) % 10) * 72 + 'px', {
                    propertyTransitions: { marginTop: 'easeOutCirc', left: 'linear' },
                    duration: 0.0, delay: (index + 10) / 60
                });
            }
            else {
                $(card).morph('margin-top:' + ((index / 10).floor() * 72) + 'px;left:' + (index % 10) * 72 + 'px', {
                    propertyTransitions: { marginTop: 'easeOutCirc', left: 'linear' },
                    duration: 0.0, delay: index / 60
                });
            }


        });
    });

    document.observe('cards:layup2', function () {
        names.each(function (card, index) {

            $(card).show();
            if (index > 39) {
                $(card).morph('margin-top:' + (((index + 10) / 10).floor() * 72) + 'px;left:' + ((index + 10) % 10) * 72 + 'px', {
                    propertyTransitions: { marginTop: 'easeOutCirc', left: 'linear' },
                    duration: 0, delay: 0
                });
            }
            else {
                $(card).morph('margin-top:' + ((index / 10).floor() * 72) + 'px;left:' + (index % 10) * 72 + 'px', {
                    propertyTransitions: { marginTop: 'easeOutCirc', left: 'linear' },
                    duration: 0, delay: 0
                });
            }

        });
    });

    document.observe('cards:snake', function () {
        var d = 7;
        names.sortBy(Math.random).each(function (card, index) {
            $(card).morph(
      'margin-left:' + [-300, 300, -150, 150][index % 4] + 'px;margin-top:' +
      (272 + (index - names.length / 2) * d) + 'px;left:371px;z-index:' + index, {
          propertyTransitions: {
              marginLeft: 'mirror', marginTop: 'bouncePast',
              left: 'swingFromTo', zIndex: zIndexTransition
          },
          duration: 2
      }).morph('margin-top:272px;left:' + (371 + (index - names.length / 2) * d) + 'px', {
          propertyTransitions: { marginTop: 'easeInCirc', left: 'linear' },
          duration: 1, delay: index / 15
      }).morph('margin-top:' + (272 - (index - names.length / 2) * d) + 'px;left:371px', {
          propertyTransitlions: { marginTop: 'easeOutCirc', left: 'linear' },
          duration: 1
      });
        });
    });





    document.observe('cards:layup2', function () {
        names.each(function (card, index) {

            $(card).show();
            if (index > 39) {
                $(card).morph('margin-top:' + (((index + 10) / 10).floor() * 72) + 'px;left:' + ((index + 10) % 10) * 72 + 'px', {
                    propertyTransitions: { marginTop: 'easeOutCirc', left: 'linear' },
                    duration: 0, delay: 0
                });
            }
            else {
                $(card).morph('margin-top:' + ((index / 10).floor() * 72) + 'px;left:' + (index % 10) * 72 + 'px', {
                    propertyTransitions: { marginTop: 'easeOutCirc', left: 'linear' },
                    duration: 0, delay: 0
                });
            }


        });
    });

    document.observe('cards:afterload', function () {
        names.each(function (card, index) {


            $(card).show();
            if (index > 39) {
                $(card).morph('width:400px', { engine: 'javascript' });
            }
            else {
                $(card).morph('margin-top:' + ((index / 10).floor() * 72) + 'px;left:' + (index % 10) * 72 + 'px', {
                    propertyTransitions: { marginTop: 'easeOutCirc', left: 'linear' },
                    duration: 0, delay: 0
                });
            }


        });

    });



    (function () {
        //document.fire('cards:shuffle');
        //document.fire('cards:stack');
      
        document.fire('cards:layup');


    }).delay(1);

})();

