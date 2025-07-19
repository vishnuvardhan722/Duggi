'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "a24aa584ad8e04b86e132897e24dafe6",
".git/config": "998198a6617d3e5072afbc9dcd6d05b4",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "34bbf06f32c7506eacfd968f20000e14",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "37f29affb859bbde932b3f8c8cceb514",
".git/logs/refs/heads/gh-pages": "4a67c086c044b16856fdaa5abf62767c",
".git/logs/refs/remotes/origin/gh-pages": "758634b5b38cb4123e4eb0a73ffbbb93",
".git/objects/02/da0343164eb86cc9619a29787e1bd34174d3ff": "33a64c0d529925ce6398a016abf8d6ec",
".git/objects/0b/110a66d07a0a15cd7aa4e1b415cd1f4eaab974": "9875228bcd3b21130139c40f000dadaa",
".git/objects/0c/ae3e987f69fd705a004d3fd61b2388adbd7020": "0a040960b25c3bf1ea376bce24bedcd9",
".git/objects/0f/74e84b247158a0e1283bc4605fd47f14509745": "a99221aefd52bf480053b3ec2351be63",
".git/objects/10/78cda765d979b3beedc95a97c39fe0e7f77ed6": "d2cc6a3b861e5dc4b3d92f80704f77a8",
".git/objects/13/e37f92e8707715dbad9ff8a664452294610e5c": "26074150e7ac33e4066ba19f7edd607e",
".git/objects/17/aa1862f3fcd601628194918db1755cc2a7b388": "963d91e2e02fedc2654195595d5d2d19",
".git/objects/1b/84bbc12d3e20215782f256cf2e88a853b38cfa": "9f06d97e2049700d73c0778fc9530ac7",
".git/objects/1f/4fd6ca451752003e399f0e9671a2c60310456a": "95843ae3f7416f735634d6728990ec6e",
".git/objects/20/6aa4ada75714e2df6709c7b51bc1276c191388": "66f3be8d7c9e195e0ac70b5829e68407",
".git/objects/21/4215a03b2343798e31d9cbcc9d8029380a11ad": "b0486f433d29368a047e2605d1a4d154",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/27/f8480775d96572d2cd6da65fe1e03e7e5ca35f": "a9b060cc876bb61f0d66a88dbdb18e7e",
".git/objects/28/f2cbe53444d023b55e26b993f079945cfedf8f": "89847d0de2bb3be313302940e6c0ab60",
".git/objects/29/ab607cf4c09982b77f834faf36bfc9dba7fa02": "23124acdc98e7701001008d9feca178d",
".git/objects/2a/f8163c54036c69bed391b8e975658d08755414": "0299c911d66f3ce79b80e3e88cc33ee6",
".git/objects/2f/5cc8a5666866cabe32f29ca881cb0d62bf49bd": "efc2c4346f61190dfbaa3b3cf7556de8",
".git/objects/32/bf82e31a2b93211539f7d1f114d6ba251d7535": "0652c6845ab7a42aa42b6dc518f454ef",
".git/objects/35/585dc60b87e333cf99119b30b6723305373d1f": "86020e04e08de0c89c7188ad718b9d99",
".git/objects/38/f72c3b661274731c0dca4263c6147292c3313e": "06ec909689545717240ec77454003efe",
".git/objects/3b/35151b478ddc8e896da9b0502400545b9dd795": "264f298aa31935bfffa5ac471a402950",
".git/objects/47/9f2efa62e439e5a99021cd0a7820c32f85a558": "8383a93cf58335312f0d69e7ddbd2de8",
".git/objects/48/37533a8ffb636e111644446b8b5254d152a146": "54ab11d80a5332cf91fd2999264849ea",
".git/objects/49/4acede0c520f847f75982ca1f671fc6eaa889e": "c4a42624eaa20c8a64455bab6edd0908",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/50/93db295c7a668e6770ebd1f583387f6b2df77f": "c1dc05891d2b10fe6b5d84340b3c63fd",
".git/objects/58/31840272dc1c691085a1cda9eff0467b035365": "adfbc6c173c4e9b037c82eb43ea9b9d0",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/63/154484357801b5ee59f8ee418421fdddb9756a": "ccc2415627d83d180b17e0e18c32c839",
".git/objects/66/e2fa38e2bb5451aac904c1c380f755e80b253f": "3f43d0b2ec2cab06a0d54814b39e3aa0",
".git/objects/6a/993d1156381be1498416f035cbaec13f70281b": "701977d593d5d82365b130d27c1c5c2b",
".git/objects/6e/b76a18c0d2b66d8a596c62d85e3327fc7061c4": "6431ec6d0bf157fc2a2393edbb24f3ad",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/76/188980b1cbbbf6de04991e9816e0e3d44672cd": "0402f6e5c1b55c6ed694981b318e6150",
".git/objects/84/a8ef7f891bbae80850c7dcb140ccfc5a55ccc4": "74448e23c53269bb472485c256a2d53f",
".git/objects/85/741b151cf3ef9755b0c2fef29fcc97b709f55b": "562c9a238588f1a40dbc5c2a82e983c9",
".git/objects/86/a90168ae8b5f9ec67e0c5285e171f408039f36": "d4c03b159abffef416278ecd315b22ba",
".git/objects/87/1e3bf0bf6a5a3730b2c47ce4ec4cd52968dbc2": "e47c8baaa1ab33ad0022b71f709f89f1",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/9688c91fb2b8dae9ce644c2f31d75a91fee231": "989426a31d11ae09f702d8ff2a5b63f6",
".git/objects/93/c32d8926dc61d62357c84a116c061f8b09cc88": "e1b6c0b530f875cc6c883ccfc6b495b6",
".git/objects/9a/54a12e07518d774d1aec7f8994c2ac75cc147f": "62e5b19dc0e38064163a0f5de7638115",
".git/objects/9b/9e88f8637b4bf7a91e500af294be8a5e3690c9": "c7b9a2f9f2a517cf69197d52c2c551c5",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/9c/3e9efde5d014059022dce89d601afdcaf4f32c": "48670cd9ad8926be73cff8f77ec65aa4",
".git/objects/9d/819ebe94e41393ba49562a0f7e5a4fefc7077c": "0fb32ee6921e30146ea32fbaa2bafc0e",
".git/objects/a7/6ba60cb3891cd3e0d2a8f5b03c644e04446def": "3c34440fc65d1aba06ad912fbc46a872",
".git/objects/b6/ed443e650e17535b08c97691f3feb36c2eb5d7": "98cee159dc864208b0024207fea74b96",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/ba/c53d57388cb19b2413525146fc7d93399e06c7": "c53c41a4a546147c3e80aa1d700ee884",
".git/objects/bb/73a00160bc4e63511fc0c0f0e4c306578acbb9": "f182ad4775d345c838cefdb98aaf8fcf",
".git/objects/cd/4782d688ec5ff7553220beaf0e88fa05d631ba": "ffc07447077bf0919a4893cda569d9c2",
".git/objects/ce/e3c5bb4ad9ca1b7e02e3391cc1cbba998308b7": "8e23cc0d8eea61c17a30b19ec3ccb417",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/cb5a9ec2789bef33ced6436700e0d44f9d6fff": "03b9104cfe2f530ee549e7bf6cc834db",
".git/objects/da/1030533423054d057dc6affc91a008397bba36": "2f688101ee7bc21bdd491e942fa86e98",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/e4/fd53f12e19b8d859b5f66be79e72bb2abf699b": "a428c27319c2d6629de11dd5cebc0bd6",
".git/objects/e9/1611b932695ba4b72fc40db648b754ad19179e": "0c34354269727fc1e6edd71205b48342",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/63c9afaee186cc273d8e0902718c0e648dd431": "cc99e756876863a9e438c524372679b9",
".git/objects/f4/ebae7c665bb7a67425b109dbc6ddaaefb08dfd": "6ab0583ad7c1e28009e53007a23aa22e",
".git/objects/f8/9e6d90b44bc966bfc8d972970f36f4f669bf17": "6fcc83175a82a45496ec4e821ab684e6",
".git/objects/fb/adcc5337686ef83f36dc6930eac45dc804e2be": "e88f5d6bc8463b4f009f65308a0b855e",
".git/objects/fc/670d19e6e092a6aaa54a55eee38b010849b592": "db30ba7b07ab1aaa8d98491333de54a7",
".git/objects/ff/071f2f3dbb9956f183fce5d86377bd37ff56f5": "6014d025677bcecd39f03c0c3cd272be",
".git/refs/heads/gh-pages": "2b87a9ba477fcfca18395fc653c712ee",
".git/refs/remotes/origin/gh-pages": "2b87a9ba477fcfca18395fc653c712ee",
"assets/AssetManifest.bin": "cb8525fbb9cd55b65ea5ba5ff29bfc51",
"assets/AssetManifest.bin.json": "978edf3bea58106b7d23cfe09392b1d1",
"assets/AssetManifest.json": "90a118d65f3dd145989d9945cedf5b2e",
"assets/assets/customer.json": "9d5141e303e5eecc7c0e6c436b61c401",
"assets/assets/images/card.png": "de44a4b7b6576d8c583abfd7ceba0932",
"assets/assets/images/doctor.jpg": "def68d9568c99e43e21adbc1958ccd15",
"assets/assets/images/doctor1.jpg": "61c72194fb86c5f250a14585bcff3e2f",
"assets/assets/images/doctor_image.png": "d3036cc5ec6f11dcfbfbcd582c8db8b2",
"assets/assets/images/google.png": "ca2f7db280e9c773e341589a81c15082",
"assets/assets/images/intro1.jpg": "172064046bc8b2d4b37a0073d5314458",
"assets/assets/images/intro1.png": "4ef01095ef0dcb9797c47cec8a8cd395",
"assets/assets/images/intro2.png": "f27bf528dbaeaa2f48b8ff6e069f2f83",
"assets/assets/images/login.png": "0eb2d81bd91b32b7f9b0c51bb78f57c7",
"assets/assets/images/logo.jpg": "7e5da31d6aa96cb7136ad1f7d825fc2b",
"assets/assets/images/logo.png": "8a189d7090f54c90435ab38a5c492247",
"assets/assets/images/otp.png": "0f1d5004b338dd9349f4e5b3382f96c1",
"assets/assets/images/passw.png": "b50737d816b557340c42155830b01f24",
"assets/assets/images/signup.png": "261f3211cd2aee72a6504fe6928798c0",
"assets/assets/sucess.json": "2ea8ee7d4c00565ff686b18441bb52f3",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "a8f1f58d79599fbd11cc6c037033c7d6",
"assets/NOTICES": "e810d929bac5fb1f3cee51e02da4a2c2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "20158fa33a00a59d5252cf057b2ffbaf",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "020512e2542daaeb006396f710d38528",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "3fd9169af123e4a8a9165c645e5d6ba4",
"/": "3fd9169af123e4a8a9165c645e5d6ba4",
"main.dart.js": "58d12321c0e16320b13ac990233c0d6c",
"manifest.json": "744bbe4731fff8b8921dedffa2a5470f",
"version.json": "3833817cbf7d318c4c8d3e39cc7e3251"};
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
