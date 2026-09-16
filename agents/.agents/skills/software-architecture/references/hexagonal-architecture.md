# Hexagonal Architecture

## Intent

Hexagonal Architecture structures a system around an application core that is independent of external technologies. External concerns such as HTTP APIs, databases, messaging systems, file systems, and third-party services interact with the core through explicit **ports**, implemented or invoked by **adapters**.

Use it to keep business and application logic isolated from infrastructure so the system remains testable, replaceable, and adaptable as technologies change.

## When to Use

Use Hexagonal Architecture when:

- Business or application logic should remain independent of frameworks and infrastructure.
- The system interacts with multiple external systems such as databases, APIs, queues, or user interfaces.
- External technologies are expected to change independently from the application's core behavior.
- Core behavior needs to be tested without databases, networks, frameworks, or other infrastructure.
- Clear boundaries between application behavior and integration concerns are important.

Avoid introducing it solely to create architectural layers in applications with little meaningful business logic or few external dependencies.

## When Not to Use

Prefer a simpler structure when:

- The application is primarily a thin wrapper around a database or external API.
- Most behavior is straightforward CRUD with little domain or application logic.
- External dependencies are unlikely to require meaningful isolation.
- The additional interfaces and boundaries would add more indirection than architectural value.

## Core Model

Hexagonal Architecture consists of three primary concepts:

### Application Core

Contain the application's business rules and use cases.

The core MUST NOT depend on infrastructure technologies such as:

- HTTP frameworks
- Database libraries
- Message brokers
- File systems
- Third-party SDKs

Infrastructure-specific types SHOULD NOT leak into the core.

### Ports

Define the boundaries through which the core communicates.

A port is an interface or contract owned by the application boundary.

**Driving ports** expose capabilities that external actors can invoke.

Examples:

- `CreateOrder`
- `RegisterUser`
- `GenerateInvoice`

**Driven ports** define capabilities the application requires from external systems.

Examples:

- `OrderRepository`
- `PaymentGateway`
- `EmailSender`
- `EventPublisher`

Ports describe what the application needs or provides without specifying the underlying technology.

### Adapters

Connect ports to concrete technologies.

**Driving adapters** translate external requests into calls to driving ports.

Examples:

- REST controller
- GraphQL resolver
- CLI command
- Message consumer

**Driven adapters** implement driven ports using external technologies.

Examples:

- PostgreSQL repository
- Stripe payment adapter
- Kafka publisher
- SMTP email adapter

The dependency direction should point toward the application core:

```text
Driving Adapter -> Driving Port -> Application Core -> Driven Port <- Driven Adapter
```

The core knows about ports. It does not know about concrete adapters.

## Applying the Pattern

### Start With Use Cases

Model application behavior around meaningful operations rather than infrastructure entry points.

Prefer:

```text
PlaceOrder
CancelOrder
GetOrder
```

over:

```text
OrderController
OrderDatabaseService
```

Treat HTTP, persistence, messaging, and other technologies as mechanisms for invoking or supporting those use cases.

### Define Driving Ports

Expose application capabilities through interfaces or clearly defined application APIs.

A driving adapter should:

1. Receive input from an external mechanism.
2. Translate it into application-level input.
3. Invoke the appropriate driving port.
4. Translate the result into the external representation.

Keep protocol-specific concerns outside the application core.

### Define Driven Ports at External Boundaries

Whenever application logic requires behavior supplied by an external system, define that dependency as a port.

For example, instead of application logic directly calling PostgreSQL:

```text
Application -> OrderRepository
```

provide:

```text
Application -> OrderRepository port <- PostgreSQL adapter
```

Define ports in terms of what the application needs, not the API exposed by the underlying technology.

Prefer:

```text
OrderRepository.findById(orderId)
```

over:

```text
OrderRepository.executeSql(query)
```

### Keep Adapters Thin

Adapters SHOULD primarily translate between external representations and application representations.

Keep business decisions inside the application core rather than controllers, database adapters, event consumers, or SDK wrappers.

### Keep Infrastructure Types Outside the Core

Convert infrastructure-specific representations at the adapter boundary.

Examples include:

```text
HTTP request -> application command
database row -> domain object
broker message -> application command
domain event -> broker message
```

Do not require the core to understand HTTP request objects, ORM entities, Kafka records, or vendor SDK models.

### Compose Dependencies at the Edge

Instantiate adapters and connect them to the core from an outer composition layer such as:

- application startup
- dependency injection configuration
- bootstrap code

The core SHOULD NOT construct its own infrastructure dependencies.

## Design Rules

- The application core MUST NOT depend on concrete infrastructure implementations.
- Ports SHOULD be defined around application needs rather than infrastructure APIs.
- External technologies SHOULD be accessed through driven ports.
- External entry points SHOULD invoke the application through driving ports.
- Adapters SHOULD translate between external models and application models.
- Business rules SHOULD remain inside the application core.
- Infrastructure-specific types SHOULD NOT cross into the core.
- Adapters MAY depend on the core and its ports; the core MUST NOT depend on adapters.
- Driven ports SHOULD be replaceable without changing application behavior.
- Dependency wiring SHOULD occur outside the application core.

## Examples

A typical project might be organized as:

```text
src/
  application/
    ports/
      driving/
        place-order.ts
      driven/
        order-repository.ts
        payment-gateway.ts
    use-cases/
      place-order.ts

  domain/
    order.ts
    money.ts

  adapters/
    driving/
      http/
        order-controller.ts

    driven/
      persistence/
        postgres-order-repository.ts
      payments/
        stripe-payment-gateway.ts

  bootstrap/
    application.ts
```

For a `PlaceOrder` use case:

```text
HTTP Request
    |
    v
OrderController
    |
    v
PlaceOrder
    |
    +----> OrderRepository
    |          ^
    |          |
    |     PostgreSQL Adapter
    |
    +----> PaymentGateway
               ^
               |
          Stripe Adapter
```

The application logic depends only on its ports:

```text
PlaceOrder
  -> OrderRepository
  -> PaymentGateway
```

Concrete technology remains outside the core:

```text
PostgresOrderRepository implements OrderRepository
StripePaymentGateway implements PaymentGateway
```

Replacing PostgreSQL, Stripe, HTTP, or another external mechanism should require changing or adding adapters rather than rewriting the application's core behavior.
