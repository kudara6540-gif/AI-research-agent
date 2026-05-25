# Background Work Status

**Status:** Blocked / Unverified

## Active Background Processes
- **Blocked:** The `process` tool (with `list` action) is not available in the current environment's toolset.

## Queued or Recurring Research Watches
- **Blocked:** The `schedule_prompt` or scheduling tooling is not available in the current environment's toolset. 

## Failures That Need Attention
- **Tool Availability Error:** Expected tools (`process` and scheduling/watch tools) are not mounted or configured for this session.

## Next Concrete Command
To investigate logs or detailed status manually, verify the required packages are installed, or run:
```bash
npm install -g pi-processes @companion-ai/schedule-prompt
```
Or check active subagents using the installed CLI:
```bash
~/.feynman/npm-global/pi-subagents doctor
```
