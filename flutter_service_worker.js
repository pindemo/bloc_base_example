'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"version.json": "3c2b2a2b53d654716ffa77128636c81a",
"flutter_bootstrap.js": "e39ed958b7f986fd7c6d20f960073ed1",
"manifest.json": "304600a5bbe709068f35e7687341b1ed",
"main.dart.js": "8baa0d5f697f9a69a87232e962056192",
"index.html": "7a2c018e05c6c28451e808275a5a1264",
"/": "7a2c018e05c6c28451e808275a5a1264",
"assets/AssetManifest.json": "499a8314afae2db0faf7c1f1864940e5",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/lib/widget/9-context_read/context_read.dart": "e8d7bce2d8565b08c331abe04e95b1c0",
"assets/lib/widget/9-context_read/code_show.dart": "d41d8cd98f00b204e9800998ecf8427e",
"assets/lib/widget/7-repository_provider/repository_provider2.dart": "6e9ce694c2ccf6d8e3b27e21430209a9",
"assets/lib/widget/7-repository_provider/counter_repository.dart": "077e44651f0b670cea560171a336395f",
"assets/lib/widget/7-repository_provider/code_show.dart": "7215ee9c7d9dc229d2921a40e899ec5f",
"assets/lib/widget/7-repository_provider/repository_provider.dart": "84f6e3345ad3321908c6a66270035a98",
"assets/lib/widget/4-bloc_listener/bloc_listener.dart": "d1cba5d86c6528ea656e77cc2e8c5c05",
"assets/lib/widget/4-bloc_listener/code_show.dart": "efe4a077f1938d81a623fb80d0f8853d",
"assets/lib/widget/1-bloc_selector/bloc_selector.dart": "fd4a48c5dab44b69bf522f37520f9e5b",
"assets/lib/widget/1-bloc_selector/code_show.dart": "6b60f17e1fedcc1c3a7221523ad5743c",
"assets/lib/widget/6-bloc_consumer/code_show.dart": "bc311a5262235edfec9a93f30aba0e87",
"assets/lib/widget/6-bloc_consumer/bloc_consumer.dart": "06ad3eae9e3c1bce4e6577d020d7bac1",
"assets/lib/widget/8-multi_repository_provider/user_repository.dart": "3f379ae7ce3494e85da9abf165970c05",
"assets/lib/widget/8-multi_repository_provider/settings_repository.dart": "bf3c5d293b01d7c47f1187fd67af5604",
"assets/lib/widget/8-multi_repository_provider/code_show.dart": "7215ee9c7d9dc229d2921a40e899ec5f",
"assets/lib/widget/8-multi_repository_provider/multi_repository_provider.dart": "9c25ef330db63bcf57ede606db02d57a",
"assets/lib/widget/9-context_watch/context_watch.dart": "5a8c662c5f3d485c6b2a7cb7c053aa46",
"assets/lib/widget/9-context_watch/code_show.dart": "391a79b50718b5c41c4f24d163b0490c",
"assets/lib/widget/9-context_select/code_show.dart": "96a75f5419fa0f5d05961680073868ce",
"assets/lib/widget/9-context_select/context_select.dart": "107203e965ee0f3406ddc3e46a8ad44a",
"assets/lib/widget/2-bloc_provider/bloc_provider2.dart": "bfc2a9771bc01fa71e47dc2fbfd162b8",
"assets/lib/widget/2-bloc_provider/bloc_provider.dart": "163f334abb3a2a778a17156500a476eb",
"assets/lib/widget/2-bloc_provider/code_show.dart": "7b105957264f277d7389eb576d0a69da",
"assets/lib/widget/3-multi_bloc_provider/multi_bloc_provider.dart": "fea3cd26982cac0d003de2013e12ed05",
"assets/lib/widget/3-multi_bloc_provider/code_show.dart": "c1b839bb8b02ff4152db598ad09c1115",
"assets/lib/widget/0-bloc_builder/bloc_builder.dart": "30fdbf7b9423605eae4b35b31a014c23",
"assets/lib/widget/0-bloc_builder/code_show.dart": "2a5838a128cf99d72a629b8f59ae21d9",
"assets/lib/widget/0-bloc_builder/bloc_builder2.dart": "a01b1d551a73d9a7a847c1cee50e5bbe",
"assets/lib/widget/5-multi_bloc_listener/multi_bloc_listener.dart": "b3362b0d157d05d0ca16f3f2b203ec41",
"assets/lib/widget/5-multi_bloc_listener/code_show.dart": "e935546741c94051122a7ad20afcaaa4",
"assets/fonts/MaterialIcons-Regular.otf": "31bc6ceb4294fb32b67a6b75667f9f79",
"assets/AssetManifest.bin": "48201fe105b3d5414094db7f928f0a34",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/syntax_highlight/themes/dark_vs.json": "2839d5be4f19e6b315582a36a6dcd1c3",
"assets/packages/syntax_highlight/themes/light_plus.json": "2a29ad892e1f54e93062fee13b3688c6",
"assets/packages/syntax_highlight/themes/dark_plus.json": "b212b7b630779cb4955e27a1c228bf71",
"assets/packages/syntax_highlight/themes/light_vs.json": "8025deae1ca1a4d1cb803c7b9f8528a1",
"assets/packages/syntax_highlight/grammars/dart.json": "b533a238112e4038ed399e53ca050e33",
"assets/packages/syntax_highlight/grammars/serverpod_protocol.json": "cc9b878a8ae5032ca4073881e5889fd5",
"assets/packages/syntax_highlight/grammars/sql.json": "957a963dfa0e8d634766e08c80e00723",
"assets/packages/syntax_highlight/grammars/yaml.json": "7c2dfa28161c688d8e09478a461f17bf",
"assets/packages/syntax_highlight/grammars/json.json": "e608a2cc8f3ec86a5b4af4d7025ae43f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "54b5cdb29b219e3a7852c0bf5ad791cf",
"assets/NOTICES": "f1125a041f8e3a4e385e4193b3f60c22",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
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
