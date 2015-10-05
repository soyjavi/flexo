/**
 * flexo - A dead simple, responsive & flexible boilerplate.
 * @version v1.0.4
 * @link    http://getflexo.com
 * @author   ()
 * @license MIT
 */
(function(){$(function(){var t,i,l,o,r,e,a;for(a=[],r=$("article section"),t=0,l=r.length;l>t;t++)e=r[t],i=$(e).attr("id"),i&&a.push({id:i,top:e.offsetTop});return o=$("aside > ul > li > a"),$("article").scroll(function(t){var i,l,r,s,n,c;for(c=t.target.scrollTop,o.removeClass("active"),n=[],i=l=0,r=a.length;r>l;i=++l)e=a[i],c>=e.top&&(c>=(null!=(s=a[i+1])?s.top:void 0)?n.push(void 0):n.push(o.filter("[href=#"+e.id+"]").addClass("active")));return n})})}).call(this);