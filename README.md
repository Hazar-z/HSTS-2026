# HSTS GUI + OCSF Integrated Project

This project contains the JavaFX GUI, shared DTO/model classes, OCSF client/server communication, and a server routing layer.

## Main client entry point

```text
com.hsts.client.MainApp
```

By default it connects to:

```text
localhost:3000
```

## Demo server entry point

Use this if Partner 1 database/server controllers are not ready yet:

```text
com.hsts.server.demo.InMemoryHSTSServerMain
```

This starts a real OCSF server and routes requests to an in-memory mock question bank.

## Packages

```text
com.hsts.client.network.HSTSClient
com.hsts.client.network.RealServerConnection
com.hsts.server.network.HSTSServer
com.hsts.server.network.ServerRequestRouter
com.hsts.shared.net.Request
com.hsts.shared.net.Response
com.hsts.shared.net.Command
com.hsts.shared.net.dto.*
ocsf.client.*
ocsf.server.*
```

## Partner 1 database integration

Replace the demo server handlers with real calls to:

```text
LoginServerController
QuestionServerController
```

The GUI should not import Partner 1 server controllers directly. It should only send requests through `ServerConnection` / `HSTSClient`.
