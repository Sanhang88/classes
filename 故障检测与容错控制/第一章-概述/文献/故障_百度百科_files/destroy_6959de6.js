define("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/plugin/destroy",function(e,o,l){"use strict";var r=e("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/lib/dom"),s=e("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/lib/helper"),c=e("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/plugin/instances");l.exports=function(e){var o=c.get(e);o&&(o.event.unbindAll(),r.remove(o.scrollbarX),r.remove(o.scrollbarY),r.remove(o.scrollbarXRail),r.remove(o.scrollbarYRail),s.removePsClasses(e),c.remove(e))}});