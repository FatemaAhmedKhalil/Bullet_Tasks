# Comparison between Various Commands

**ls** vs **find**
`ls` List directory contents.
`find`  Find files or directories under a directory tree, recursively.
##  Comparison Table
| Feature                | \`ls\`                           | \`find\`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**           | 
|                                  ``` bash
                                    time ls
                                      ```
    | Yes                              |
| **System Interaction Identification**        | Lists files in the current dir  | Lists files based on criteria (name, type, etc.) |
| **Syscall Time Breakdown**    | Yes (\`*.txt\`)                   | Yes (with \`-name\` option)        |
| **Performance Evaluation**      | No                              | Yes (\`-type\` option)             |
