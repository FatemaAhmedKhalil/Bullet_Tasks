# Comparison between Various Commands

**ls** vs **find**

`ls` List directory contents.

`find`  Find files or directories under a directory tree, recursively.

# Time Measurement
```bash
time ls
```
```plaintext
real	0m0.004s
user	0m0.001s
sys	0m0.003s
```

```bash
time find
```
```plaintext
real	0m0.004s
user	0m0.000s
sys	0m0.004s

```
##  Comparison Table
| Feature                | `ls`                            | `find`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**   | Kernal time is better           | Excution time is better
| **System Interaction Identification**        | Lists files in the current dir  | Lists files based on criteria (name, type, etc.) |
| **Syscall Time Breakdown**    | Yes (\`*.txt\`)                   | Yes (with \`-name\` option)        |
| **Performance Evaluation**      | No                              | Yes (\`-type\` option)             |
