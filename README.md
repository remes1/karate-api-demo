<h2>Demo API Testing Project using Karate</h2>

## 🚀 Tech Stack

| Layer                   | Technology               |
|-------------------------|--------------------------|
| Test Runner             | JUnit 5 / Karate Runner  |
| API Testing Framework   | **Karate DSL**           |
| Configuration           | Karate `karate-config.js`|
| Build Tool              | Maven                    |
| Environment Management  | `.env` + Karate Variables|
| Reporting               | Karate HTML Reports      |
| Language                | **Karate DSL (on JVM)**  |

#### Base URL
`https://dummyjson.com/`

## Endpoints

|       Endpoint            | Method |          Description          |
|---------------------------|--------|-------------------------------|
| `/auth/login`             | POST   | Login user                    |
| `/auth/me`                | GET    | Get profile information       |
| `/users`                  | GET    | Get all users                 |
| `/users/{id}`             | GET    | Get specific user             |
| `/users/{id}`             | PUT    | Update specific user          |
| `/users/{id}`             | PATCH  | Partially update specific user|
| `/users/{id}`             | DELETE | Delete specific user          |

## ▶️ Running Tests

To run tests against the QA environment (for regression using ```@regression``` tag), create a file:

```.env```

Сontent:

```
USERNAME=emilys
PASSWORD=emilyspass
```
### Running from cli
```mvn clean test -Dkarate.env=qa -Dkarate.options="--tags @regression"```
