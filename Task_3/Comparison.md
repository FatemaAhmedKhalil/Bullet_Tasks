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
# System Interaction Identification
```bash
strace -e trace=network ls -a 
strace -e trace=memory ls -a 
strace -e trace=file ls -a
strace -e trace=process ls -a
strace -e trace=signal ls -a 
```

```bash
strace -e trace=network find -a 
strace -e trace=memory find -a 
strace -e trace=file find -a
strace -e trace=process find -a
strace -e trace=signal find -a
```

# Syscall Time Breakdown
```bash
strace -c ls
```
```plaintext
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 20.38    0.000172          24         7           mprotect
 13.27    0.000112          16         7           openat
 10.55    0.000089          44         2           getdents64
  8.18    0.000069           7         9           close
  6.75    0.000057          57         1           munmap
  5.45    0.000046           9         5           read
  5.45    0.000046          23         2           write
  5.33    0.000045          22         2         2 statfs
  4.50    0.000038           4         8           newfstatat
  3.91    0.000033          11         3           brk
  3.32    0.000028          28         1           set_robust_list
  2.96    0.000025           1        18           mmap
  2.25    0.000019           9         2           ioctl
  1.78    0.000015          15         1           set_tid_address
  1.78    0.000015          15         1           rseq
  1.66    0.000014           7         2         2 access
  1.30    0.000011          11         1           getrandom
  1.18    0.000010          10         1           prlimit64
  0.00    0.000000           0         4           pread64
  0.00    0.000000           0         1           execve
  0.00    0.000000           0         2         1 arch_prctl
------ ----------- ----------- --------- --------- ----------------
100.00    0.000844          10        80         5 total
```
```bash
strace -c find
```
```plaintext
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 46.30    0.221016           2     94172           write
 12.73    0.060762           1     40450           fcntl
 12.21    0.058263           3     16435           getdents64
 11.55    0.055116           1     32591           close
 11.12    0.053078           2     24891           newfstatat
  5.68    0.027126           3      8519         4 openat
  0.12    0.000591         591         1           execve
  0.11    0.000523          24        21           mmap
  0.05    0.000226           3        61           brk
  0.04    0.000184          26         7           mprotect
  0.02    0.000101          14         7           read
  0.02    0.000087          29         3           munmap
  0.01    0.000043          21         2         2 statfs
  0.01    0.000034           8         4           pread64
  0.01    0.000032          16         2         2 access
  0.01    0.000030          15         2         1 arch_prctl
  0.01    0.000025          25         1           set_robust_list
  0.00    0.000023          11         2           ioctl
  0.00    0.000013          13         1           fstatfs
  0.00    0.000012          12         1           set_tid_address
  0.00    0.000011          11         1           getrandom
  0.00    0.000010          10         1           uname
  0.00    0.000009           9         1           prlimit64
  0.00    0.000009           9         1           rseq
  0.00    0.000007           7         1           sysinfo
  0.00    0.000002           2         1           fchdir
  0.00    0.000000           0         1           futex
------ ----------- ----------- --------- --------- ----------------
100.00    0.477333           2    217180         9 total
```

##  Comparison Table
|                 | `ls`                            | `find`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**   | Kernal time is better           | Excution time is better
| **System Interaction Identification** | interactes with memory managment, network, file system, signal, process management stacks | interactes with memory managment, network, file system, signal, process management stacks |
| **Syscall Time Breakdown** | 0.000844 sec | 0.477333 sec |

**Performance Evaluation**       ls is better            

---
**cp** vs **rsync**

`cp` Copy files and directories.

`rsync`  Transfer files either to or from a remote host (but not between two remote hosts).
