import subprocess

find = subprocess.run(["find", "../", "-type", "l"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

lines = [line.strip() for line in find.stdout.splitlines()]
for line in lines :
    line = line[1:len(line)]
    grep = subprocess.run(["grep", "-xF", line, "../.gitignore"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if grep.stdout == "" :
        line = line + "\n"
        gitignore = open("../.gitignore", "a")
        gitignore.write(line)
        gitignore.close()