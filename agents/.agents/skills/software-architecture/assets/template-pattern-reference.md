# <Pattern Name>

## Intent

1-3 sentences describing:

- What the pattern is.
- What problem it solves / what it optimizes for.

## When to Use

Concrete signals that indicate this pattern is a good fit.

## When Not to Use

Conditions where the pattern adds unnecessary complexity or conflicts with the system's needs.

## Core Model

Describe the essential building blocks and their responsibilities.

Include:

- Major components / roles.
- How they interact.
- Dependency direction.
- Important invariants the implementation must preserve.

A small conceptual mermaid diagram may be useful when the relationships are otherwise difficult to express.

## Applying the Pattern

Practical guidance for designing a system using the pattern.

Focus on:

- How to identify the major components.
- How to define the boundaries.
- Where responsibilities belong.
- How communication crosses boundaries.
- How dependencies should be introduced.
- Important implementation decisions the agent needs to make.

Prefer concrete rules over conceptual explanation, but keep it framework and technology agnostic.

## Design Rules

A concise set of MUST / SHOULD / MAY rules that characterize a correct implementation.

Examples:

- `X MUST NOT depend on Y.`
- `Communication between A and B SHOULD occur through C.`
- `Infrastructure concerns SHOULD remain outside D.`

## Example

A small, technology-agnostic example showing how the pattern is applied in practice.

For example:

```text
application/
  ...
domain/
  ...
infrastructure/
  ...
```
