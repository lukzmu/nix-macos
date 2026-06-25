# Use Agents

Prefer delegating work to specialized subagents over doing it inline.

- For any non-trivial task (implementation, review, research, debugging), identify which agent type fits and spawn it rather than doing the work yourself.
- Match the agent to the role: rune-smith for implementation, dungeon-master for architecture/debugging, arbiter for code review, rules-lawyer for adversarial review, ward-keeper for security, chronicler for git history.
- Fork yourself (subagent_type: "fork") when background research or multi-step work would otherwise fill your context with raw output you won't need again.
- Only work inline when the task is genuinely trivial (single lookup, one-line edit, direct answer) or when the user explicitly asks you not to delegate.
