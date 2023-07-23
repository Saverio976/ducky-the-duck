#!/usr/bin/env python3

LAUNCH_SH_PATH = "./launch.sh"
PAYLOAD_DUCKY_PATH = "./launch.txt"
EXTENSION_FOLDER = "./extensions/"
EXTENSION_COMMENT = "#!EXTENSION!"
DUCKY_INJECT = "#!DUCKY!"
COMMENT_BASH = "#"
COMMENT_DUCKY = "REM"

lines = []
with open(LAUNCH_SH_PATH) as f:
    for line in f.readlines():
        line = line.rstrip("\n")
        if line == "" or line.startswith("#!/"):
            lines.append("\n")
            continue
        if line.startswith(EXTENSION_COMMENT):
            with open(f"{EXTENSION_FOLDER}{line.replace(EXTENSION_COMMENT, '')}") as ext:
                lines.extend(ext.readlines())
            continue
        if line.startswith(DUCKY_INJECT):
            line = line.replace(DUCKY_INJECT, '', 1)
        elif line.startswith(COMMENT_BASH):
            line = line.replace(COMMENT_BASH, COMMENT_DUCKY, 1)
        else:
            line = f"STRINGLN {line}"
        line = f"{line}\n"
        lines.append(line)

while lines[0] == "\n":
    lines.pop(0)
while lines[-1] == "\n":
    lines.pop(-1)

with open(PAYLOAD_DUCKY_PATH, "w") as f:
    f.writelines(lines)
