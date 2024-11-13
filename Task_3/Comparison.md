# Comparison between Various Commands

`ls` vs `find`

##  Comparison Table
| Feature                | \`ls\`                           | \`find\`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**           | No (Use \`-R\` for recursion)     | Yes                              |
| **System Interaction Identification**        | Lists files in the current dir  | Lists files based on criteria (name, type, etc.) |
| **Syscall Time Breakdown**    | Yes (\`*.txt\`)                   | Yes (with \`-name\` option)        |
| **Performance Evaluation**      | No                              | Yes (\`-type\` option)             |
