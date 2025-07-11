# Lesson 1: AI Development Tools Overview

## Overview
**Duration**: 15 minutes  
**Level**: 100 - Introduction  
**Track**: Developer Track

Get started with AI coding assistants to accelerate development and improve code quality.

## Learning Objectives
- Set up one AI development tool
- Write your first AI-assisted script
- Understand prompt engineering basics

## Business Value
- **40-60% faster development cycles**
- **Reduced debugging time**
- **Consistent code quality**

## Tools Comparison

| Tool | Best For | Cost | Setup Time |
|------|----------|------|------------|
| **Cursor** | Full projects, refactoring | $20/month | 5 minutes |
| **GitHub Copilot** | Code completion, snippets | $10/month | 2 minutes |
| **Claude Code** | Code review, analysis | $20/month | 3 minutes |

## Quick Start: GitHub Copilot (Fastest Setup)

### Step 1: Install (2 minutes)
1. Go to [github.com/features/copilot](https://github.com/features/copilot)
2. Subscribe and install VS Code extension
3. Authenticate with GitHub

### Step 2: Write Your First AI Script (10 minutes)

**Task**: Create a server monitoring script

```python
# Type this comment and let Copilot generate the code:
# Create a function to check if a server is responding via HTTP

def check_server_health(url):
    """Check if server responds to HTTP request"""
    # Copilot will suggest the implementation
    import requests
    try:
        response = requests.get(url, timeout=5)
        return response.status_code == 200
    except:
        return False

# Test multiple servers
servers = ["http://server1.com", "http://server2.com"]
for server in servers:
    status = "UP" if check_server_health(server) else "DOWN"
    print(f"{server}: {status}")
```

### Step 3: Test and Refine (3 minutes)
1. Run the script
2. Add error handling if needed
3. Customize for your environment

## Effective Prompting

### Good Prompts
- "Create a PowerShell script to check disk space on Windows servers"
- "Write a function to send Teams alerts when CPU usage exceeds 80%"
- "Generate a backup verification script with logging"

### Poor Prompts
- "Make a script"
- "Fix this"
- "Add monitoring"

## Quick Assessment

✅ **Success Criteria**:
- [ ] AI tool installed and working
- [ ] Created a functional monitoring script
- [ ] Script runs without errors
- [ ] Measured time savings vs manual coding

## Next Steps

**Today**: Try the tool on a real work task
**This Week**: Use AI for 50% of new code
**This Month**: Measure productivity improvements

---

**Next Lesson**: [Lesson 2: Workflow Automation Introduction](lesson-02-workflow-automation.md)