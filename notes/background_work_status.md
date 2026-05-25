# Background Work Status

**Status:** Blocked / Unverified

## Active Background Processes
- **Blocked:** The `process` tool is not available in the current tool set. 
- Attempted to check processes via fallback CLI commands (`pi-processes`), but the executables are not present or installed.
- (Verified that background async subagents directory `async-subagent-runs` is currently empty).

## Queued or Recurring Research Watches
- **Blocked:** The scheduling tooling (e.g., `schedule_prompt`) is missing from the configured capabilities. 

## Failures That Need Attention
- **Unverified:** Unable to evaluate failures without access to the background task logs or scheduling lists. 

## Next Steps
To resolve this block, the required tools must be exposed to the agent context. 
The user can inspect the logs directly by running:
```bash
# If using the Pi packages externally:
npx pi-processes list
npx pi-schedule-prompt list
```
Alternatively, ensure the `process` and `schedule_prompt` tools are injected into the agent's active configuration for this workspace.