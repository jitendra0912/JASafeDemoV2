/*
 Highcharts JS v10.2.1 (2022-08-29)

 X-range series

 (c) 2010-2021 Torstein Honsi, Lars A. V. Cabrera

 License: www.highcharts.com/license
*/
(function(a){"object"===typeof module&&module.exports?(a["default"]=a,module.exports=a):"function"===typeof define&&define.amd?define("highcharts/modules/xrange",["highcharts"],function(h){a(h);a.Highcharts=h;return a}):a("undefined"!==typeof Highcharts?Highcharts:void 0)})(function(a){function h(a,b,t,c){a.hasOwnProperty(b)||(a[b]=c.apply(null,t),"function"===typeof CustomEvent&&window.dispatchEvent(new CustomEvent("HighchartsModuleLoaded",{detail:{path:b,module:a[b]}})))}a=a?a._modules:{};h(a,"Series/XRange/XRangeSeriesDefaults.js",
[a["Core/Utilities.js"]],function(a){var b=a.correctFloat,q=a.isNumber,c=a.isObject;"";return{colorByPoint:!0,dataLabels:{formatter:function(){var a=this.point.partialFill;c(a)&&(a=a.amount);if(q(a)&&0<a)return b(100*a)+"%"},inside:!0,verticalAlign:"middle"},tooltip:{headerFormat:'<span style="font-size: 10px">{point.x} - {point.x2}</span><br/>',pointFormat:'<span style="color:{point.color}">\u25cf</span> {series.name}: <b>{point.yCategory}</b><br/>'},borderRadius:3,pointRange:0}});h(a,"Series/XRange/XRangePoint.js",
[a["Core/Series/SeriesRegistry.js"],a["Core/Utilities.js"]],function(a,b){var q=this&&this.__extends||function(){var a=function(c,f){a=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(a,f){a.__proto__=f}||function(a,f){for(var c in f)f.hasOwnProperty(c)&&(a[c]=f[c])};return a(c,f)};return function(c,f){function b(){this.constructor=c}a(c,f);c.prototype=null===f?Object.create(f):(b.prototype=f.prototype,new b)}}(),c=a.series.prototype.pointClass.prototype;b=b.extend;a=function(a){function b(){var f=
null!==a&&a.apply(this,arguments)||this;f.options=void 0;f.series=void 0;return f}q(b,a);b.getColorByCategory=function(a,c){var b=a.options.colors||a.chart.options.colors;a=c.y%(b?b.length:a.chart.options.chart.colorCount);return{colorIndex:a,color:b&&b[a]}};b.prototype.resolveColor=function(){var a=this.series;if(a.options.colorByPoint&&!this.options.color){var c=b.getColorByCategory(a,this);a.chart.styledMode||(this.color=c.color);this.options.colorIndex||(this.colorIndex=c.colorIndex)}else this.color||
(this.color=a.color)};b.prototype.init=function(){c.init.apply(this,arguments);this.y||(this.y=0);return this};b.prototype.setState=function(){c.setState.apply(this,arguments);this.series.drawPoint(this,this.series.getAnimationVerb())};b.prototype.getLabelConfig=function(){var a=c.getLabelConfig.call(this),b=this.series.yAxis.categories;a.x2=this.x2;a.yCategory=this.yCategory=b&&b[this.y];return a};b.prototype.isValid=function(){return"number"===typeof this.x&&"number"===typeof this.x2};return b}(a.seriesTypes.column.prototype.pointClass);
b(a.prototype,{ttBelow:!1,tooltipDateKeys:["x","x2"]});"";return a});h(a,"Series/XRange/XRangeSeries.js",[a["Core/Globals.js"],a["Core/Color/Color.js"],a["Core/Series/SeriesRegistry.js"],a["Core/Utilities.js"],a["Series/XRange/XRangeSeriesDefaults.js"],a["Series/XRange/XRangePoint.js"]],function(a,b,h,c,F,G){function f(){if(this.isXAxis){var a=v(this.dataMax,-Number.MAX_VALUE);for(var b=0,d=this.series;b<d.length;b++){var g=d[b];if(g.x2Data){var y=0;for(g=g.x2Data;y<g.length;y++){var c=g[y];if(c&&
c>a){a=c;var e=!0}}}}e&&(this.dataMax=a)}}var q=this&&this.__extends||function(){var a=function(b,d){a=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(a,d){a.__proto__=d}||function(a,d){for(var g in d)d.hasOwnProperty(g)&&(a[g]=d[g])};return a(b,d)};return function(b,d){function g(){this.constructor=b}a(b,d);b.prototype=null===d?Object.create(d):(g.prototype=d.prototype,new g)}}();a=a.noop;var A=b.parse,B=h.series.prototype,C=h.seriesTypes.column,t=c.addEvent,w=c.clamp,I=c.defined;
b=c.extend;var D=c.find,x=c.isNumber,z=c.isObject,u=c.merge,v=c.pick,E=[];c=function(a){function b(){var d=null!==a&&a.apply(this,arguments)||this;d.data=void 0;d.options=void 0;d.points=void 0;return d}q(b,a);b.compose=function(a){-1===E.indexOf(a)&&(E.push(a),t(a,"afterGetSeriesExtremes",f))};b.prototype.init=function(){a.prototype.init.apply(this,arguments);this.options.stacking=void 0};b.prototype.getColumnMetrics=function(){var d=this,b=function(){for(var a=0,b=d.chart.series;a<b.length;a++){var g=
b[a],c=g.xAxis;g.xAxis=g.yAxis;g.yAxis=c}};b();var c=a.prototype.getColumnMetrics.call(this);b();return c};b.prototype.cropData=function(a,b,c,H){b=B.cropData.call(this,this.x2Data,b,c,H);b.xData=a.slice(b.start,b.end);return b};b.prototype.findPointIndex=function(a){var d=this.cropStart,b=this.points,c=a.id;if(c)var e=(e=D(b,function(a){return a.id===c}))?e.index:void 0;"undefined"===typeof e&&(e=(e=D(b,function(d){return d.x===a.x&&d.x2===a.x2&&!d.touched}))?e.index:void 0);this.cropped&&x(e)&&
x(d)&&e>=d&&(e-=d);return e};b.prototype.translatePoint=function(a){var b=this.xAxis,d=this.yAxis,c=this.columnMetrics,e=this.options,f=e.minPointLength||0,p=(a.shapeArgs&&a.shapeArgs.width||0)/2,m=this.pointXOffset=c.offset,h=v(a.x2,a.x+(a.len||0)),l=a.plotX,n=b.translate(h,0,0,0,1);h=Math.abs(n-l);var q=this.chart.inverted,k=v(e.borderWidth,1)%2/2,r=c.offset,t=Math.round(c.width);f&&(f-=h,0>f&&(f=0),l-=f/2,n+=f/2);l=Math.max(l,-10);n=w(n,-10,b.len+10);I(a.options.pointWidth)&&(r-=(Math.ceil(a.options.pointWidth)-
t)/2,t=Math.ceil(a.options.pointWidth));e.pointPlacement&&x(a.plotY)&&d.categories&&(a.plotY=d.translate(a.y,0,1,0,1,e.pointPlacement));e=Math.floor(Math.min(l,n))+k;e={x:e,y:Math.floor(a.plotY+r)+k,width:Math.floor(Math.max(l,n))+k-e,height:t,r:this.options.borderRadius};a.shapeArgs=e;q?a.tooltipPos[1]+=m+p:a.tooltipPos[0]-=p+m-e.width/2;p=e.x;m=p+e.width;0>p||m>b.len?(p=w(p,0,b.len),m=w(m,0,b.len),n=m-p,a.dlBox=u(e,{x:p,width:m-p,centerX:n?n/2:null})):a.dlBox=null;p=a.tooltipPos;m=q?1:0;n=q?0:1;
c=this.columnMetrics?this.columnMetrics.offset:-c.width/2;p[m]=q?p[m]+e.width/2:p[m]+(b.reversed?-1:0)*e.width;p[n]=w(p[n]+(q?-1:1)*c,0,d.len-1);if(d=a.partialFill)z(d)&&(d=d.amount),x(d)||(d=0),a.partShapeArgs=u(e,{r:this.options.borderRadius}),l=Math.max(Math.round(h*d+a.plotX-l),0),a.clipRectArgs={x:b.reversed?e.x+h-l:e.x,y:e.y,width:l,height:e.height}};b.prototype.translate=function(){a.prototype.translate.apply(this,arguments);for(var b=0,c=this.points;b<c.length;b++)this.translatePoint(c[b])};
b.prototype.drawPoint=function(a,b){var c=this.options,d=this.chart.renderer,e=a.shapeType,f=a.shapeArgs,g=a.partShapeArgs,m=a.clipRectArgs,h=c.stacking&&!c.borderRadius,l=a.state,n=c.states[l||"normal"]||{},q="undefined"===typeof l?"attr":b;l=this.pointAttribs(a,l);n=v(this.chart.options.chart.animation,n.animation);var k=a.graphic,r=a.partialFill;if(a.isNull||!1===a.visible)k&&(a.graphic=k.destroy());else{if(k)k.rect[b](f);else a.graphic=k=d.g("point").addClass(a.getClassName()).add(a.group||this.group),
k.rect=d[e](u(f)).addClass(a.getClassName()).addClass("highcharts-partfill-original").add(k);g&&(k.partRect?(k.partRect[b](u(g)),k.partialClipRect[b](u(m))):(k.partialClipRect=d.clipRect(m.x,m.y,m.width,m.height),k.partRect=d[e](g).addClass("highcharts-partfill-overlay").add(k).clip(k.partialClipRect)));this.chart.styledMode||(k.rect[b](l,n).shadow(c.shadow,null,h),g&&(z(r)||(r={}),z(c.partialFill)&&(r=u(c.partialFill,r)),a=r.fill||A(l.fill).brighten(-.3).get()||A(a.color||this.color).brighten(-.3).get(),
l.fill=a,k.partRect[q](l,n).shadow(c.shadow,null,h)))}};b.prototype.drawPoints=function(){for(var a=this.getAnimationVerb(),b=0,c=this.points;b<c.length;b++)this.drawPoint(c[b],a)};b.prototype.getAnimationVerb=function(){return this.chart.pointCount<(this.options.animationLimit||250)?"animate":"attr"};b.prototype.isPointInside=function(b){var c=b.shapeArgs,d=b.plotX,f=b.plotY;return c?"undefined"!==typeof d&&"undefined"!==typeof f&&0<=f&&f<=this.yAxis.len&&0<=(c.x||0)+(c.width||0)&&d<=this.xAxis.len:
a.prototype.isPointInside.apply(this,arguments)};b.defaultOptions=u(C.defaultOptions,F);return b}(C);b(c.prototype,{pointClass:G,cropShoulder:1,getExtremesFromAll:!0,parallelArrays:["x","x2","y"],requireSorting:!1,type:"xrange",animate:B.animate,autoIncrement:a,buildKDTree:a});h.registerSeriesType("xrange",c);return c});h(a,"masters/modules/xrange.src.js",[a["Core/Globals.js"],a["Series/XRange/XRangeSeries.js"]],function(a,b){b.compose(a.Axis)})});
//# sourceMappingURL=xrange.js.map