# issue with @vue/test-utils@2.4.0 and 2.4.1

- execute `docker build . -t vuetesting`
- execute `docker run -it vuetesting`

now you get this:
```

 RUN  v0.32.2 /app

 ❯ example.test.ts (0)

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯ Failed Suites 1 ⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

 FAIL  example.test.ts [ example.test.ts ]
Error: @vue/test-utils tried to access @vue/compiler-dom (a peer dependency) but it isn't provided by your application; this makes the require call ambiguous and unsound.

Required package: @vue/compiler-dom (via "@vue/compiler-dom/package.json")
Required by: @vue/test-utils@virtual:0460f86c7587ee75dac643681550c044e8047ba46e219a5baac054fc0fea2d0af97a9bd3fe4b22de0884797215e0a1a4368bb60f9ef7087a69c4008789f4e032#npm:2.4.0 (via /app/.yarn/__virtual__/@vue-test-utils-virtual-4aca422d8c/0/cache/@vue-test-utils-npm-2.4.0-7d32a4f2ce-28b9628cf8.zip/node_modules/@vue/test-utils/dist/vue-test-utils.esm-bundler.mjs)
Ancestor breaking the chain: app@workspace:.


 ❯ makeError .pnp.cjs:11264:34
 ❯ resolveToUnqualified .pnp.cjs:12930:21
 ❯ Object.resolveToUnqualified .pnp.cjs:13173:26
 ❯ resolve$1 .pnp.loader.mjs:1977:31

⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
Serialized Error: {
  "code": "MODULE_NOT_FOUND",
  "data": {
    "brokenAncestors": [
      {
        "name": "app",
        "reference": "workspace:.",
      },
    ],
    "dependencyName": "@vue/compiler-dom",
    "issuer": "/app/.yarn/__virtual__/@vue-test-utils-virtual-4aca422d8c/0/cache/@vue-test-utils-npm-2.4.0-7d32a4f2ce-28b9628cf8.zip/node_modules/@vue/test-utils/dist/vue-test-utils.esm-bundler.mjs",
    "issuerLocator": {
      "name": "@vue/test-utils",
      "reference": "virtual:0460f86c7587ee75dac643681550c044e8047ba46e219a5baac054fc0fea2d0af97a9bd3fe4b22de0884797215e0a1a4368bb60f9ef7087a69c4008789f4e032#npm:2.4.0",
    },
    "request": "@vue/compiler-dom/package.json",
  },
  "pnpCode": "MISSING_PEER_DEPENDENCY",
}
⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯[1/1]⎯

 Test Files  1 failed (1)
      Tests  no tests
   Start at  16:15:05
   Duration  894ms (transform 51ms, setup 0ms, collect 0ms, tests 0ms, environment 198ms, prepare 124ms)
```

- go to `Dockerfile` and change in line the version of `@vue/test-utils` to `2.3.2` (version before 2.4.0)
- execute `docker build . -t vuetesting`
- execute `docker run -it vuetesting`
- everything is ok