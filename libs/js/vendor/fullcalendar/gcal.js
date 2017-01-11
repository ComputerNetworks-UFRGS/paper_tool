/*
 * FullCalendar v1.5.4 Google Calendar Plugin
 *
 * Copyright (c) 2011 Adam Shaw
 * Dual licensed under the MIT and GPL licenses, located in
 * MIT-LICENSE.txt and GPL-LICENSE.txt respectively.
 *
 * Date: Tue Sep 4 23:38:33 2012 -0700
 *
 */
(function(e){function o(t,o,u){var a=t.success,f=e.extend({},t.data||{},{"start-min":n(o,"u"),"start-max":n(u,"u"),singleevents:!0,"max-results":9999}),l=t.currentTimezone;return l&&(f.ctz=l=l.replace(" ","_")),e.extend({},t,{url:t.url.replace(/\/basic$/,"/full")+"?alt=json-in-script&callback=?",dataType:"jsonp",data:f,startParam:!1,endParam:!1,success:function(t){var n=[];t.feed.entry&&e.each(t.feed.entry,function(t,s){var o=s.gd$when[0].startTime,u=r(o,!0),a=r(s.gd$when[0].endTime,!0),f=o.indexOf("T")==-1,c;e.each(s.link,function(e,t){t.type=="text/html"&&(c=t.href,l&&(c+=(c.indexOf("?")==-1?"?":"&")+"ctz="+l))}),f&&i(a,-1),n.push({id:s.gCal$uid.value,title:s.title.$t,url:c,start:u,end:a,allDay:f,location:s.gd$where[0].valueString,description:s.content.$t})});var o=[n].concat(Array.prototype.slice.call(arguments,1)),u=s(a,this,o);return e.isArray(u)?u:n}})}var t=e.fullCalendar,n=t.formatDate,r=t.parseISO8601,i=t.addDays,s=t.applyAll;t.sourceNormalizers.push(function(e){if(e.dataType=="gcal"||e.dataType===undefined&&(e.url||"").match(/^(http|https):\/\/www.google.com\/calendar\/feeds\//))e.dataType="gcal",e.editable===undefined&&(e.editable=!1)}),t.sourceFetchers.push(function(e,t,n){if(e.dataType=="gcal")return o(e,t,n)}),t.gcalFeed=function(t,n){return e.extend({},n,{url:t,dataType:"gcal"})}})(jQuery);