/*jshint -W018 */
(function(){
  /*jshint -W030 */
  var ref$, empty, reverse, take, takeThree, lastThree, slice$ = [].slice;
  ref$ = require('prelude-ls'), empty = ref$.empty, reverse = ref$.reverse;
  'use strict';
  take = curry$(function(n, list){
    var x, xs;
    x = list[0], xs = slice$.call(list, 1);
    switch (false) {
    case !(n <= 0):
      return [];
    case !empty(list):
      return [];
    default:
      return [x].concat(take(n - 1, xs));
    }
  });
  take(2, [1, 2, 3, 4, 5]);
  takeThree = take(3);
  takeThree([3, 4, 5, 6, 7, 8]);
  lastThree = compose$([reverse, takeThree, reverse]);
  lastThree([1, 2, 3, 4, 5, 6, 7, 8]);
  console.log(lastThree([1, 2, 3, 4, 5, 6, 7, 8]));
  $('h1').hide();
  function curry$(f, bound){
    var context,
    _curry = function(args) {
      return f.length > 1 ? function(){
        var params = args ? args.concat() : [];
        context = bound ? context || this : this;
        return params.push.apply(params, arguments) <
            f.length && arguments.length ?
          _curry.call(context, params) : f.apply(context, params);
      } : f;
    };
    return _curry();
  }
  function compose$(fs){
    return function(){
      var i, args = arguments;
      for (i = fs.length; i > 0; --i) { args = [fs[i-1].apply(this, args)]; }
      return args[0];
    };
  }
}).call(this);
