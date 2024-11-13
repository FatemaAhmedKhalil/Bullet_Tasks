# Comparison between Various Commands

**ls** vs **find**
`ls` List directory contents.
```bash
time ls
```
```plaintext
real	0m0.004s
user	0m0.001s
sys	0m0.003s
```
`find`  Find files or directories under a directory tree, recursively.

##  Comparison Table
| Feature                | \`ls\`                           | \`find\`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**           | Yes                              |
| **System Interaction Identification**        | Lists files in the current dir  | Lists files based on criteria (name, type, etc.) |
| **Syscall Time Breakdown**    | Yes (\`*.txt\`)                   | Yes (with \`-name\` option)        |
| **Performance Evaluation**      | No                              | Yes (\`-type\` option)             |
