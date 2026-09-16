---
name: software-architecture
description: Patterns and guidelines for designing software architectures. Use any time the user mentions software architecture, design patterns, or system design.
---

# Software Architecture

Design **software architectures** that are...

- **Maintainable**: The architecture makes the system easier to understand, modify, test, and operate over time.
- **Adaptable**: The architecture enables the system to evolve as requirements, technologies, scale, and constraints change.

## System Architecture

TBD

## Application Architecture

An **application architecture** describes how one application/service is internally structured.

| Pattern                        | Description                                                                                                                                                                                                                                                                                     | Reference                              |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| Hexagonal / Ports and Adapters | Structures an application around a technology-agnostic core, with external systems (such as databases, APIs, and UIs) connected through explicit interfaces. It reduces coupling to infrastructure, making the system easier to test, evolve, and adapt as technologies or integrations change. | `references/hexagonal-architecture.md` |
