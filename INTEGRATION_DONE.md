# Integration Done

This version uses the cleaned HSTS package structure.

## Active packages

```text
com.hsts.client.controller
com.hsts.client.gui
com.hsts.client.network
com.hsts.server.network
com.hsts.shared.model
com.hsts.shared.net
com.hsts.shared.net.dto
ocsf.client
ocsf.server
```

## Removed old package dependency

The active Java source no longer depends on:

```text
shared.communication
client.communication
server.communication
```

## Communication flow

```text
LoginWindow / QuestionManagementWindow
 -> LoginClientController / QuestionClientController
 -> ServerConnection
 -> RealServerConnection
 -> HSTSClient
 -> Request(Command, payload, requestId)
 -> HSTSServer
 -> ServerRequestRouter
 -> Partner 1 controller handlers
 -> Response
 -> GUI controller
```

## Demo server

For testing without Partner 1 database code, run:

```text
com.hsts.server.demo.InMemoryHSTSServerMain
```

Then run:

```text
com.hsts.client.MainApp
```
