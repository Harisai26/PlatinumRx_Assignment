text = "programming"

result = ""

for ch in text:
    if ch not in result:
        result = result + ch

print(result)