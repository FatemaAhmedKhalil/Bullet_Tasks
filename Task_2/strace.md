# Using `strace` to Trace System Calls with Error Reporting

1. **Navigate to the Project Directory**  
   Make sure you are in the directory where your executable is located.
   
2. **Run `strace -c` to Trace System Calls with Error Summary**  
   The `-c` option provides a summary of the time spent, the number of calls, and any errors. Execute:
   ```bash
   strace -c ./straceTask
   ```
   
3. **Save Detailed Output to a Log File**  
   If you want to save the detailed output to a file, use the `-o` option:
   ```bash
   strace -o straceTask.txt ./straceTask
   ```
   
## Output with Errors
```plaintext
Error: File not found!
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 33.68    0.000745         745         1           execve
 31.96    0.000707          32        22           mmap
  9.22    0.000204          25         8           mprotect
  7.64    0.000169          28         6         1 openat
  2.67    0.000059          14         4           read
  2.62    0.000058          11         5           newfstatat
  2.22    0.000049           9         5           close
  1.76    0.000039           9         4           pread64
  1.72    0.000038          12         3           brk
  1.58    0.000035          35         1           munmap
  0.95    0.000021          21         1         1 access
  0.90    0.000020          10         2         1 arch_prctl
  0.77    0.000017          17         1           write
  0.41    0.000009           9         1           set_robust_list
  0.41    0.000009           9         1           getrandom
  0.41    0.000009           9         1           rseq
  0.36    0.000008           8         1           futex
  0.36    0.000008           8         1           set_tid_address
  0.36    0.000008           8         1           prlimit64
------ ----------- ----------- --------- --------- ----------------
100.00    0.000374           5        69         3 total
```

In this output:
- **`openat` and `access`**: Errors due to missing files.
- **`arch_prctl`**: indicates invalid arguments.
