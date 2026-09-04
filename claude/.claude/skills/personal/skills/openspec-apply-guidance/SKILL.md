---
name: openspec-apply-guidance
description: Custom instructions for applying an OpenSpec change, supplementing the base openspec "apply" instructions. Load together whenever the user prompts you to apply the openspec change.
---

When the user asks you to apply an openspec change, ALWAYS follow these rules.

1. NEVER execute the openspec tasks yourself.
2. ALWAYS delegate the openspec tasks to sub agents.
3. Assign an entire openspec task section to a sub agent. The sub agent's work is only considered complete when they've committed and pushed their work.
4. Repeat step 3 until all openspec task sections are completed. Assign each section to a new sub agent.

IMPORTANT: Obviously, tasks that are meant for the user should not be done by the sub agents.
