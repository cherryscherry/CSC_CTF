import re
import zipfile

def extract_docx_content(docx_filename):
    content = []

    print(f"Opening {docx_filename} to extract contents...\n")
    with zipfile.ZipFile(docx_filename, 'r') as z:
        files_in_docx = z.namelist()
        print(f"Found {len(files_in_docx)} files within the docx...\n")
        
        for filename in files_in_docx:
            print(f"Reading contents of {filename}...")
            with z.open(filename) as f:
                file_content = f.read().decode(errors='ignore')
                content.append((filename, file_content))
                print(f"Extracted content from {filename}\n")
    return content

def search_keywords(contents):
    patterns = [
        r'flag',
        r'hacker',
        r'password',
        r'CTF\{.*?\}'
    ]

    findings = []

    for filename, content in contents:
        print(f"Searching for keywords in {filename}...")
        for pattern in patterns:
            matches = re.findall(pattern, content, re.IGNORECASE)
            if matches:
                for match in matches:
                    findings.append((filename, match))
                    print(f"Found \"{match}\" in {filename}")
        print("\n")
    return findings

# Use the functions
filename = 'Hacker.docx'
contents = extract_docx_content(filename)
findings = search_keywords(contents)

print("Summary of findings:\n" + "-"*50)
if findings:
    for f, match in findings:
        print(f"Found \"{match}\" in {f}")
else:
    print("No keywords found.")

