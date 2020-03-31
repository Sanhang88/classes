define("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/plugin/update-geometry",function(t,l,r){"use strict";function e(t,l){return t.settings.minScrollbarLength&&(l=Math.max(l,t.settings.minScrollbarLength)),t.settings.maxScrollbarLength&&(l=Math.min(l,t.settings.maxScrollbarLength)),l}function i(t,l){var r={width:l.railXWidth};r.left=l.isRtl?l.negativeScrollAdjustment+t.scrollLeft+l.containerWidth-l.contentWidth:t.scrollLeft,l.isScrollbarXUsingBottom?r.bottom=l.scrollbarXBottom-t.scrollTop:r.top=l.scrollbarXTop+t.scrollTop,c.css(l.scrollbarXRail,r);var e={top:t.scrollTop,height:l.railYHeight};l.isScrollbarYUsingRight?e.right=l.isRtl?l.contentWidth-(l.negativeScrollAdjustment+t.scrollLeft)-l.scrollbarYRight-l.scrollbarYOuterWidth:l.scrollbarYRight-t.scrollLeft:e.left=l.isRtl?l.negativeScrollAdjustment+t.scrollLeft+2*l.containerWidth-l.contentWidth-l.scrollbarYLeft-l.scrollbarYOuterWidth:l.scrollbarYLeft+t.scrollLeft,c.css(l.scrollbarYRail,e),c.css(l.scrollbarX,{left:l.scrollbarXLeft,width:l.scrollbarXWidth-l.railBorderXWidth}),c.css(l.scrollbarY,{top:l.scrollbarYTop,height:l.scrollbarYHeight-l.railBorderYWidth})}var o=t("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/lib/class"),c=t("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/lib/dom"),s=t("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/lib/helper"),a=t("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/plugin/instances"),n=t("wiki-lemma:widget/lemma_content/configModule/secondsKnow/perfect-scrollbar/src/js/plugin/update-scroll");r.exports=function(t){var l=a.get(t);l.containerWidth=t.clientWidth,l.containerHeight=t.clientHeight,l.contentWidth=t.scrollWidth,l.contentHeight=t.scrollHeight;var r;t.contains(l.scrollbarXRail)||(r=c.queryChildren(t,".ps-scrollbar-x-rail"),r.length>0&&r.forEach(function(t){c.remove(t)}),c.appendTo(l.scrollbarXRail,t)),t.contains(l.scrollbarYRail)||(r=c.queryChildren(t,".ps-scrollbar-y-rail"),r.length>0&&r.forEach(function(t){c.remove(t)}),c.appendTo(l.scrollbarYRail,t)),!l.settings.suppressScrollX&&l.containerWidth+l.settings.scrollXMarginOffset<l.contentWidth?(l.scrollbarXActive=!0,l.railXWidth=l.containerWidth-l.railXMarginWidth,l.railXRatio=l.containerWidth/l.railXWidth,l.scrollbarXWidth=54,l.scrollbarXLeft=s.toInt((l.negativeScrollAdjustment+t.scrollLeft)*(l.railXWidth-l.scrollbarXWidth)/(l.contentWidth-l.containerWidth))):l.scrollbarXActive=!1,!l.settings.suppressScrollY&&l.containerHeight+l.settings.scrollYMarginOffset<l.contentHeight?(l.scrollbarYActive=!0,l.railYHeight=l.containerHeight-l.railYMarginHeight,l.railYRatio=l.containerHeight/l.railYHeight,l.scrollbarYHeight=e(l,s.toInt(l.railYHeight*l.containerHeight/l.contentHeight)),l.scrollbarYTop=s.toInt(t.scrollTop*(l.railYHeight-l.scrollbarYHeight)/(l.contentHeight-l.containerHeight))):l.scrollbarYActive=!1,l.scrollbarXLeft>=l.railXWidth-l.scrollbarXWidth&&(l.scrollbarXLeft=l.railXWidth-l.scrollbarXWidth),l.scrollbarYTop>=l.railYHeight-l.scrollbarYHeight&&(l.scrollbarYTop=l.railYHeight-l.scrollbarYHeight),i(t,l),l.scrollbarXActive?o.add(t,"ps-active-x"):(o.remove(t,"ps-active-x"),l.scrollbarXWidth=0,l.scrollbarXLeft=0,n(t,"left",0)),l.scrollbarYActive?o.add(t,"ps-active-y"):(o.remove(t,"ps-active-y"),l.scrollbarYHeight=0,l.scrollbarYTop=0,n(t,"top",0))}});