// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
//
import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"
import IntersectionObserverAdmin from 'intersection-observer-admin';

let Hooks = {}
Hooks.LazyArtwork = {
  mounted() {
    let itemsToWatch = document.querySelectorAll(`[data-lazy-load]`);

    if (itemsToWatch.length) {
      let admin = new IntersectionObserverAdmin();

      window.requestIdleCallback(() => {
        itemsToWatch.forEach((element) => {
          let enterCallback = ({ target: img }) => {
            if (img) {
                if (img && img.dataset) {
                    img.src = img.dataset.src;
                }
            }
          }

          let exitCallback = ({ target: img }) => {
            admin.unobserve(img, { rootMargin: '0px 0px 0px 0px' , threshold: 0 });
          }

          admin.addEnterCallback(
            element,
            enterCallback
          )
          admin.addExitCallback(
            element,
            exitCallback
          )

          admin.observe(
            element,
            { rootMargin: '0px 0px 100px 0px' , threshold: 0 }
          )
        });
      });
    }
  }
}


let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks })
liveSocket.connect()
