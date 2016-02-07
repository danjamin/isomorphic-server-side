# isomorphic-server-side

An example of isomorphic react; server side heavy


## One time setup

- Install docker toolbox
- Install git

Launch Docker Toolbox

Note: with docker compose, you should be able to leverage a single docker machine
across projects.


## Running

Set the `default` docker machine active (if not already):

```
$ eval $(docker-machine env default)
```

Leverage docker compose to bring up the dev server:

```
$ docker-compose up -d
```

Figure out machine IP (Windows/OS X only) -- linux can use localhost:

```
$ docker-machine ip default
```

Visit dev site at `<machine_ip>:8000`


## Watchers / Change, reload page

The whole app in dev is configured with polling inside docker so that
a change will trigger a rebuild of client side code and server side when necessary.

No need to manually restart the docker container -- unless something strange happens.


## Debugging server side web

First, you will want to run a separate server in the foreground where you have full control.
The docker configuration already exposes `8001` for this purpose:

```
$ docker exec -it isomorphicserverside_web_1 bash
# cd app
# WEB_PORT=8001 && node debug server.js
# cd ..
```

Call out the debugger from your code:

```js
// ...

debugger;

// ...
```

Then visit `<machine_ip>:8001`

See [debugger](https://nodejs.org/api/debugger.html) for more information
