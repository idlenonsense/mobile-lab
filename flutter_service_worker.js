'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "888483df48293866f9f41d3d9274a779",
"icons/Icon-512.png": "24a2909667512cc1846c64c52be4dac5",
"icons/Icon-maskable-512.png": "24a2909667512cc1846c64c52be4dac5",
"icons/Icon-192.png": "055fdd3c8da839ba1a4eeda976ffa764",
"icons/Icon-maskable-192.png": "055fdd3c8da839ba1a4eeda976ffa764",
"manifest.json": "300de492584f9699b2f3a92f3e40a504",
"index.html": "b81a04258526aa738779b36283272831",
"/": "b81a04258526aa738779b36283272831",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "6b59244d8032f8cd55211d0f03b4eaa7",
"assets/assets/images/galleryActivity.png": "a771b34e6cdfb419b63957a716056cf2",
"assets/assets/images/surfaceView.png": "2d960d37c860136273a733b6959754a1",
"assets/assets/images/room.jpg": "69d15fbce3ba006146396466107a15c7",
"assets/assets/images/canari.png": "ec55ea421ee6cfc8acf312ddbd200386",
"assets/assets/images/achartEngine.png": "1b6d43a1d5e49c911efca1caddcfeb8c",
"assets/assets/images/puppy.png": "aa2f326d88955263bcd541a674a55822",
"assets/assets/images/maldivi.png": "a884a0c7644d95d6281dd1ba012cf794",
"assets/assets/images/relativeLayout.png": "c4dc087c97101bbf0b3db65111fd0cae",
"assets/assets/images/philippini.png": "4b72f8ae61f42ae2bf2804cee4b2d482",
"assets/assets/images/frameLayout.png": "bf18acfc49427c9ad3ff4d901f20dfca",
"assets/assets/images/intentImage.png": "f0608b5f322a230601179c099408de69",
"assets/assets/images/icon.png": "ddb6525a7475df2ff5e210a0c4bdeaac",
"assets/assets/images/intel.png": "8a9cfe486d1df0707e4205f2473f31e0",
"assets/assets/images/emulatorImage.png": "38205c2127472167f352ff03fbdf4d27",
"assets/assets/images/news_feed.png": "438bfcca760573b094baf3977a5dd43e",
"assets/assets/images/activityImage.png": "23c1361e07d5ea1832a534fcfe503280",
"assets/assets/images/html5.jpg": "d7643f3d263255d9d8299e830436edb6",
"assets/assets/images/linearLayout.png": "36ff71206ef4389b6417d2b8e660c469",
"assets/assets/images/sqlite.jpg": "594e1d39640fdd7061062dffa262ec71",
"assets/assets/images/map_placeholder.png": "bde28940bb1e2c6d0928596843211522",
"assets/assets/images/fragmentImage.png": "4a6a81b74d9cc3888eb372a8facac032",
"assets/assets/images/architecture.png": "049effa0de4b25740672329278fd8948",
"assets/assets/images/dust.png": "dbb3f7ea89c2b62598770029d42ff9c5",
"assets/assets/images/gpsManager.jpg": "6910416a1d2fe190e089cbed343efaff",
"assets/assets/images/curili.png": "f6b7e02258b9d2ade47bd3339b923523",
"assets/assets/images/navigation.png": "33ee5749843a630722785ebcf5362239",
"assets/assets/images/toastImage.png": "2e1d65ea6df2ae4fdcddc8612a524d27",
"assets/assets/images/water.png": "62b47ae914125c754f04bcf54457cf65",
"assets/assets/images/blackBackground.png": "3f666d00df340fd632c32e9ccac4594b",
"assets/assets/images/starring.png": "bb2a3d81ff196e40c1035e98ec1b3351",
"assets/fonts/MaterialIcons-Regular.otf": "73b867be5b34adc6ae05f3ffa0ea5bea",
"assets/NOTICES": "d1e15beb27cbe8843afeacccf3d2617a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "bfc5345c4a7916c281096ed8debeb3e4",
"assets/AssetManifest.json": "5f63b2db8f95696901c56448171c408d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"favicon.png": "9776984f14e826cb7d7c483d7c828fab",
"flutter_bootstrap.js": "d4f6902885cd13a00444137dc19d519a",
"version.json": "57d53baec0a6ee6ba8546d00b22bfc45",
"main.dart.js": "5401cb5e8d93ac9845a38a42a6d82e0f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
