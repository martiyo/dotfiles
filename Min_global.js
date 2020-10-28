// ==UserScript==
// @name Example Script
// @match *
// @exclude youtube.com
// @exclude duckduckgo.com
// @exclude discord.com
// @exclude mejortorrentt.net
// @exclude gmail.com
// @exclude codepen.io
// @exclude material-ui.com
// @exclude localhost
// @exclude flatuicolors.com
// @exclude devchallenges.io
// @exclude martiyo.github.io
// @exclude reddit.com
// @exclude gitlab.com
// @exclude https://todolist-jx3j2qp5m.now.sh/
// @exclude notxor.nueva-actitud.org
// @exclude stackoverflow.com
// @exclude zoowoman.website
// @exclude https://www.eldestapeweb.com/revistafierro/series
// @run-at document-start
// ==/UserScript==

if (window.location.protocol !== "file:") {
  var style = document.createElement("style");

  style.textContent = `
  html {
    background-color: #ddd;
    filter: hue-rotate(180deg) invert(90%) !important;
  }
  body {
    margin: 0;
    background-color: #ddd;
    /* twitter.com */
    min-height: 100vh;
  }
 
  iframe, img, video, canvas {
  filter: hue-rotate(180deg) invert(98%) !important;
  }
  `;

  document.head.appendChild(style);
}
