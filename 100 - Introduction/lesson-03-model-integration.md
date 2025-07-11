# Lesson 3: Model Integration Basics

## Overview
**Duration**: 12 minutes  
**Level**: 100 - Introduction  
**Track**: Developer Track

Connect AI models to your MSP tools to enhance client services and automate intelligent responses.

## Learning Objectives
- Set up your first AI API integration
- Build a simple AI-powered tool
- Understand cost-effective model selection

## Business Value
- **Enhanced client communication** with AI responses
- **Automated document processing**
- **Intelligent log analysis**

## Platform Comparison

| Platform | Best For | Cost (per 1K tokens) | Setup Time |
|----------|----------|---------------------|------------|
| **OpenAI** | General AI tasks, chatbots | $0.002-0.03 | 5 minutes |
| **Azure AI** | Microsoft environments | $0.001-0.02 | 10 minutes |
| **AWS Bedrock** | Multi-model access | $0.0003-0.024 | 15 minutes |

## Quick Start: OpenAI API Integration (5 minutes)

### Step 1: Get API Key (2 minutes)
1. Go to [platform.openai.com](https://platform.openai.com)
2. Sign up and add payment method
3. Generate API key in "API Keys" section

### Step 2: Build Client Email Classifier (8 minutes)

**Scenario**: Auto-classify client support emails

```python
import openai
import os

client = openai.OpenAI(api_key=os.getenv('OPENAI_API_KEY'))

def classify_email(email_content):
    """Classify client email using AI"""
    prompt = f"""
    Classify this client email:
    "{email_content}"
    
    Categories:
    - URGENT: System down, security issue
    - HIGH: Performance problems, partial outage
    - MEDIUM: Software issues, feature requests
    - LOW: General questions, info requests
    
    Return only: CATEGORY, confidence%
    """
    
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": "You are an MSP support classifier."},
            {"role": "user", "content": prompt}
        ],
        max_tokens=50,
        temperature=0.1
    )
    
    return response.choices[0].message.content

# Test it
email = "Our website has been down for 2 hours. Customers can't access anything!"
result = classify_email(email)
print(f"Classification: {result}")
```

### Step 3: Test and Deploy (2 minutes)
1. Test with sample client emails
2. Check classification accuracy
3. Add to your existing workflow

## Cost Optimization Tips

### Model Selection Guide
- **Simple tasks**: GPT-3.5 Turbo ($0.002/1K tokens)
- **Complex analysis**: GPT-4 ($0.03/1K tokens)
- **Batch processing**: Use cheaper models for bulk operations

### Smart Caching
```python
import json
import hashlib

class AICache:
    def __init__(self):
        self.cache = {}
    
    def get_cached_response(self, prompt):
        """Check if we've seen this request before"""
        key = hashlib.md5(prompt.encode()).hexdigest()
        return self.cache.get(key)
    
    def cache_response(self, prompt, response):
        """Save response for future use"""
        key = hashlib.md5(prompt.encode()).hexdigest()
        self.cache[key] = response
```

## Integration Patterns

### 1. Webhook Integration
```python
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/ai-classify', methods=['POST'])
def classify_request():
    data = request.json
    result = classify_email(data['email'])
    return jsonify({"classification": result})
```

### 2. Batch Processing
```python
def process_email_batch(emails):
    """Process multiple emails efficiently"""
    results = []
    for email in emails:
        result = classify_email(email)
        results.append(result)
    return results
```

## Quick Assessment

✅ **Success Criteria**:
- [ ] OpenAI API key working
- [ ] Email classifier built and tested
- [ ] Integration with existing workflow
- [ ] Cost tracking implemented

## Next Steps

**Today**: Test classifier with real client emails
**This Week**: Integrate with ticketing system
**This Month**: Add response generation and routing

---

**Next Lesson**: [Lesson 4: AI-Powered Monitoring & Analytics](lesson-04-monitoring-analytics.md)