'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "27522f7fb3368606a5558020aee7716d",
"assets/AssetManifest.json": "7e7890b78a8255ed84677a878bf086de",
"assets/assets/images/3phone.png": "e4c43b497070a82da9c58aa10de7bcce",
"assets/assets/images/algo.png": "6a3edb27efb80b10de4bfa391561d148",
"assets/assets/images/algo1.png": "4f0bee4dfd24ea9978baeb8e64032aa4",
"assets/assets/images/at.png": "e51bc2c26e1e82b78e2cad620ee90060",
"assets/assets/images/caution-sign%2520(1).png": "0d6f3267a94f5a6a2f29cff8743928a2",
"assets/assets/images/caution-sign.png": "b0fb649823a2e17122202396d1757659",
"assets/assets/images/chat.png": "958e5a6bf088beef5c10ce5b2b185074",
"assets/assets/images/chat2.png": "0a1d03f4046c59ee824427db2fe30069",
"assets/assets/images/chatbub.png": "7b917d8de33917799f49102b2cb2f7d4",
"assets/assets/images/chatbub2.png": "4209ca47c23b027d06bbca22f7480294",
"assets/assets/images/connect.png": "d30ceb3f3e7793e0fb4e191e85b9da46",
"assets/assets/images/connect2.png": "840e1806d2c18fc792e0b37a2741e407",
"assets/assets/images/crypto.png": "226e6fb5e98e089a5852a2ddc6d85ca4",
"assets/assets/images/cs.png": "f6f13b67b6b3bdd39ef91fed45b9b0ec",
"assets/assets/images/csa.png": "646cf7a1bfb96f7aef64d349c0a54c6f",
"assets/assets/images/csa1.png": "c70bf45a703b98a65fd5c7f496beb9ae",
"assets/assets/images/dit.png": "50057e9d8eea64f20b8a92acbfed07f2",
"assets/assets/images/double.png": "f5a9398da4dd31372df9e3ad5a541d2a",
"assets/assets/images/Edit.png": "ab740036ae63af1a93ff235ed7a16441",
"assets/assets/images/free.jpeg": "cf70bd21923ba2c628a0ffe43e4376fe",
"assets/assets/images/goog.png": "95ef2abcc5af62bff6279ce6f870fdbf",
"assets/assets/images/gool.png": "cf84ac37da04212af0abf15d633b632e",
"assets/assets/images/Group.png": "17946b409f23607b49080ab77234a797",
"assets/assets/images/homecard.png": "70f1841cf3f70a00663f2f3c6a3dc120",
"assets/assets/images/lucky.gif": "e7e79f07d899f798aa813de835147413",
"assets/assets/images/merch.png": "c060efee2684561bbcc445b6f0f5c5ac",
"assets/assets/images/mob.png": "bac69504059a1a4529a6449c1ceb7a8e",
"assets/assets/images/mob2.png": "d2115fc6e917f364c5a0ec6482b20795",
"assets/assets/images/naira.png": "bdf93cb0d9f32ee73616bb43d632f3d3",
"assets/assets/images/out.png": "ede9d28b40f9652207c9fca82d9b7b47",
"assets/assets/images/p1.jpeg": "3359d3be031fca9b0e585e8360f86e10",
"assets/assets/images/p2.jpeg": "10233faac610d77debdbcc8efe2845e6",
"assets/assets/images/p3.jpeg": "296346b8578f332755471882c49219f0",
"assets/assets/images/p4.jpeg": "48ab910e47457b1974eb62b0daeac54d",
"assets/assets/images/p5s.jpeg": "9ef994256fd306a5d4412ae4f0afe6a4",
"assets/assets/images/p6.jpeg": "7ab3f35b4f8021dbf953d51d2728b67d",
"assets/assets/images/p7.png": "65bbeac2df638964c4f6f3440f1e38af",
"assets/assets/images/p8.jpeg": "5219223fd1f4aef98e6731fb29bba03e",
"assets/assets/images/phone.png": "580cbfa7679143ebdb36a196b21901b4",
"assets/assets/images/profile.png": "f5a50e3ebfd4e10c42fda9e23c4642d9",
"assets/assets/images/question.png": "928089e81ccd1e4dfb51958d67a9b4c6",
"assets/assets/images/remplus.png": "df45ae903e0897d54aac1eed09a0ab19",
"assets/assets/images/safe.png": "03335d22f2d2815584f2ddb296ea0281",
"assets/assets/images/scand.png": "f6025b24b92e76d52e50e5500ff6b6e9",
"assets/assets/images/sec.png": "af2c2e1358dc227bf6362ee9f9c5ed1a",
"assets/assets/images/telephone.png": "91a72e2ca09a5857907cec763b338f64",
"assets/assets/images/touch.png": "3849a83e6fe4623bcce281ce184019f2",
"assets/assets/images/trans.png": "bfd60e385cc849b1102e8d3ceaf84b0c",
"assets/assets/images/trans2.png": "b512e350923a04c797b72b7420238dc7",
"assets/assets/images/twit.png": "dd2768703a887b9bde8b4108320193c7",
"assets/assets/images/twitter.png": "60680541098367b7834339d432ce2711",
"assets/assets/images/usdt.png": "67b33c86e31ccba395d699c8349c7e43",
"assets/assets/images/user.png": "615f9235885590be4b6c30840a350cff",
"assets/assets/images/vars.png": "70573530e83c291897b4502874504a9a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e7e384852f1fe693fc2008ef0034c02e",
"assets/NOTICES": "567237189675f8e5267509634d113b38",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4bef51c5f8aea5fcb797135c4d84f7c0",
"/": "4bef51c5f8aea5fcb797135c4d84f7c0",
"main.dart.js": "049c1e8f73629052200ef081f642a153",
"manifest.json": "ebfe246873afb9a1d1d3699fe27adf9f",
"version.json": "9a3f6af02ccb41c29c26688786d0d859"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
