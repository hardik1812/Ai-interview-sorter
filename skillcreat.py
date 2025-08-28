import requests
import json
import pymupdf
import os

# --- Best Practice: Load API key from environment variables ---
# Create a file named .env and add the line:
# OPENROUTER_API_KEY="sk-or-v1-..."
# Then run 'pip install python-dotenv'
# from dotenv import load_dotenv
# load_dotenv()
# API_KEY = os.getenv("OPENROUTER_API_KEY")
# For simplicity in this example, we'll use a placeholder.
# IMPORTANT: Replace this placeholder with your actual key, preferably via environment variables.
API_KEY = "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"


def get_skills_from_text(text_block):
    """
    Sends a block of text to the OpenRouter API to extract skills.
    """
    if not text_block:
        return "Error: No text provided to extract skills from."

    response = requests.post(
        url="https://openrouter.ai/api/v1/chat/completions",
        headers={
            "Authorization": f"Bearer {API_KEY}",
            "Content-Type": "application/json"
        },
        data=json.dumps({
            "model": "openai/gpt-3.5-turbo", # Using a reliable free model
            "messages": [
                {
                    "role": "system",
                    "content": "Read and identify all the skill sets from the given data. Display them in simple words in form of a list, for example [a,b,c,d]. ONLY RETURN THE LIST."
                },
                {
                    "role": "user",
                    "content": text_block
                }
            ]
        })
    )

    result = response.json()
    
    if response.status_code == 200 and "choices" in result:
        return result["choices"][0]["message"]["content"]
    elif "error" in result:
        return f"API Error: {result['error'].get('message', 'Unknown error')}"
    else:
        return f"Unexpected API response. Status: {response.status_code}, Body: {response.text}"


def check_skill_match(skill_list, job_role):
    """
    Asks the OpenRouter API if the skills match the job role.
    """
    response = requests.post(
        url="https://openrouter.ai/api/v1/chat/completions",
        headers={
            "Authorization": f"Bearer {API_KEY}",
            "Content-Type": "application/json"
        },
        data=json.dumps({
            "model": "openai/gpt-3.5-turbo", # Using a reliable free model
            "messages": [
                {
                    "role": "user",
                    "content": f"Check if the skills provided in the list {skill_list} are sufficient for the role of {job_role}. ANSWER ONLY IN YES OR NO. DISPLAY ONLY YES OR NO."
                }
            ]
        })
    )
    
    result = response.json()

    if response.status_code == 200 and "choices" in result:
        return result["choices"][0]["message"]["content"]
    elif "error" in result:
        return f"API Error: {result['error'].get('message', 'Unknown error')}"
    else:
        return f"Unexpected API response. Status: {response.status_code}, Body: {response.text}"


def process_cv(file_path):
    """
    Opens and processes the PDF to extract candidate name and skills.
    """
    try:
        doc = pymupdf.open(file_path)
    except Exception as e:
        print(f"Error opening PDF file: {e}")
        return None, None

    # --- 1. Extract Candidate Name (assuming it's on the first page) ---
    page = doc[0]
    text = page.get_text("text")
    lines = [line.strip() for line in text.split("\n") if line.strip()]
    candidate_name = lines[0] if lines else "Name not found"

    # --- 2. Extract Skills Block ---
    skills_block_text = None
    for page in doc:
        blocks = page.get_text("blocks")
        for idx, b in enumerate(blocks):
            # b[4] contains the text of the block
            if "skills" in b[4].lower():
                if idx + 1 < len(blocks):
                    skills_block_text = blocks[idx + 1][4]
                    break 
        if skills_block_text:
            break 
            
    doc.close()
    
    if not skills_block_text:
        print("Could not find a 'skills' section in the PDF.")
        return candidate_name, None

    return candidate_name, skills_block_text


# --- Main Execution ---
if __name__ == "__main__":
    pdf_file = "skills-based-cv.pdf"
    
    name, raw_skills = process_cv(pdf_file)

    if name:
        print(f"Candidate Name: {name}")

    if raw_skills:
        print("\nExtracting skills from CV...")
        skill_set = get_skills_from_text(raw_skills)
        print(f"Extracted Skill Set: {skill_set}")
        
        job_role = input("\nEnter the job role to match against: ")
        
        print("\nChecking for skill match...")
        match_result = check_skill_match(skill_set, job_role)
        
        print(f"\nAre the skills sufficient for a {job_role}? \nAnswer: {match_result}")