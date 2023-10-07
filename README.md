Content-Based Backup Tool for Large Projects

This Bash script is designed specifically for developers working on extensive projects, such as Flask or Django applications, in conjunction with Chat GPT. It allows for a holistic review of the entire project by consolidating the content of relevant files into one single file. By doing so, it becomes easier to share and review the codebase with tools like Chat GPT without navigating through multiple files.

The script recursively searches the current directory (from which it's executed) for Python and HTML files and appends their content into a single output file (output.txt). Additionally, at the end of the output file, a directory tree of the current folder is added.

Features:

Designed for extensive projects like Flask and Django applications.
Recursively searches for Python and HTML files.
Ignores specific directories such as "pycache", "venv", and "uploads".
Adds a 5-line gap between the content of each file to distinguish them.
Appends a directory tree of the current folder at the end of the output file, providing a clear overview of the project's structure.
Usage:

Making the Script Executable and Running:

Navigate to the directory of your Flask or Django project.

Make the script executable by running:


chmod +x gpt-helper.sh

Run the script:


./gpt-helper.sh

Once executed, all the content of Python and HTML files will be written to output.txt, followed by the directory tree of the current folder.
You can then easily share output.txt with Chat GPT or other platforms for a comprehensive code review.
Requirements:

The tree command should be installed on the system to generate the directory tree.
Note:

This tool is particularly useful when looking to share a project overview or solicit feedback on the entirety of a project from platforms like Chat GPT, without the hassle of navigating through individual files.