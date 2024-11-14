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
| **Time Measurement**   | Kernal(sys) time is better           | Excution(user) time is better
| **System Interaction Identification** | interactes with memory managment, network, file system, signal, process management stacks | interactes with memory managment, network, file system, signal, process management stacks |
| **Syscall Time Breakdown** | 0.000844 sec | 0.477333 sec |

**Performance Evaluation**       ls is better            

---
**cp** vs **rsync**

`cp` Copy files and directories.

`rsync`  Transfer files either to or from a remote host (but not between two remote hosts).


# Time Measurement
```bash
time cp
```
```plaintext
real	0m0.004s
user	0m0.001s
sys	0m0.003s
```

```bash
time rsync
```
```plaintext
real	0m0.144s
user	0m0.009s
sys	0m0.005s

```
# System Interaction Identification
```bash
strace -e trace=memory cp -a 
strace -e trace=file cp -a
```

```bash
strace -e trace=network rsync -a 
strace -e trace=memory rsync -a 
strace -e trace=file rsync -a
strace -e trace=process rsync -a
strace -e trace=signal rsync -a
```

# Syscall Time Breakdown
```bash
strace -c cp
```
```plaintext
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 29.42    0.000750          27        27           mmap
 24.60    0.000627         627         1           execve
 13.89    0.000354          35        10           mprotect
  8.47    0.000216          16        13         3 openat
  3.92    0.000100           7        13           close
  3.69    0.000094          10         9           read
  3.18    0.000081           8        10           newfstatat
  2.12    0.000054          13         4           pread64
  2.08    0.000053          26         2         2 statfs
  2.04    0.000052          52         1           munmap
  1.69    0.000043          14         3           brk
  0.82    0.000021          10         2         1 arch_prctl
  0.71    0.000018           4         4           write
  0.71    0.000018           9         2         2 access
  0.55    0.000014          14         1           prlimit64
  0.55    0.000014          14         1           getrandom
  0.47    0.000012          12         1           set_tid_address
  0.47    0.000012          12         1           rseq
  0.43    0.000011          11         1           set_robust_list
  0.12    0.000003           3         1           geteuid
  0.08    0.000002           2         1         1 lseek
------ ----------- ----------- --------- --------- ----------------
100.00    0.002549          23       108         9 total
```
```bash
strace -c rsync
```
```plaintext
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 69.83    0.000500           2       185           write
  7.54    0.000054           1        38           mmap
  7.54    0.000054           3        14           mprotect
  4.05    0.000029           1        16           futex
  1.96    0.000014           1        13           read
  1.40    0.000010           1         6           rt_sigaction
  1.40    0.000010           1        10           openat
  1.12    0.000008           8         1           munmap
  1.12    0.000008           1         5           brk
  0.84    0.000006           0        10           close
  0.84    0.000006           1         4           pread64
  0.56    0.000004           0        10           newfstatat
  0.28    0.000002           2         1           getegid
  0.28    0.000002           1         2         1 arch_prctl
  0.28    0.000002           2         1           prlimit64
  0.28    0.000002           2         1           getrandom
  0.28    0.000002           2         1           rseq
  0.14    0.000001           1         1           geteuid
  0.14    0.000001           1         1           set_tid_address
  0.14    0.000001           1         1           set_robust_list
  0.00    0.000000           0         1         1 access
  0.00    0.000000           0         1           execve
------ ----------- ----------- --------- --------- ----------------
100.00    0.000716           2       323         2 total

```
##  Comparison Table
|                 | `cp`                            | `rsync`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**   | Kernal time, Excution time and real time are better | |
| **System Interaction Identification** | interactes with memory managment, file system stacks | interactes with memory managment, network, file system, signal, process management stacks |
| **Syscall Time Breakdown** | 0.002549 sec | 0.000716 sec |

**Performance Evaluation**       cp is better 


---
**diff** vs **cmp**

`cmp` Compare two files byte by byte.

`diff`  Compare files and directories.

# Time Measurement
```bash
time diff
```
```plaintext
real	0m0.090s
user	0m0.000s
sys	0m0.004
```

```bash
time cmp
```
```plaintext
real	0m0.004s
user	0m0.001s
sys	0m0.003s
```
# System Interaction Identification
```bash
strace -e trace=memory diff -a 
strace -e trace=file diff -a
strace -e trace=process diff -a
strace -e trace=signal diff -a 
```

```bash
strace -e trace=memory cmp -a 
strace -e trace=file cmp -a
strace -e trace=process cmp -a
strace -e trace=signal cmp -a
```

# Syscall Time Breakdown
```bash
strace -c diff
```
```plaintext
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 31.53    0.000657         657         1           execve
 14.83    0.000309          30        10           mmap
 12.43    0.000259          28         9         4 openat
  6.86    0.000143          35         4           mprotect
  6.81    0.000142          28         5           read
  5.47    0.000114          57         2           munmap
  4.17    0.000087          14         6           write
  3.31    0.000069          13         5           close
  2.83    0.000059          19         3           brk
  2.50    0.000052          13         4           newfstatat
  1.73    0.000036           9         4           pread64
  1.49    0.000031          15         2         1 arch_prctl
  1.20    0.000025           8         3           fcntl
  0.82    0.000017           8         2           rt_sigaction
  0.72    0.000015          15         1         1 access
  0.72    0.000015          15         1           set_tid_address
  0.53    0.000011          11         1           getrandom
  0.48    0.000010          10         1           prlimit64
  0.43    0.000009           9         1           sigaltstack
  0.38    0.000008           8         1           lseek
  0.38    0.000008           8         1           set_robust_list
  0.38    0.000008           8         1           rseq
------ ----------- ----------- --------- --------- ----------------
100.00    0.002084          30        68         6 total
```
```bash
strace -c cmp
```
```plaintext
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 38.75    0.000658         658         1           execve
 16.20    0.000275          27        10           mmap
 11.07    0.000188          20         9         4 openat
  6.07    0.000103          25         4           mprotect
  6.01    0.000102          20         5           read
  5.12    0.000087          14         6           write
  3.83    0.000065          13         5           close
  2.12    0.000036           9         4           pread64
  1.94    0.000033          16         2           munmap
  1.65    0.000028           7         4           newfstatat
  1.24    0.000021          10         2         1 arch_prctl
  1.18    0.000020           6         3           brk
  1.00    0.000017          17         1         1 access
  0.94    0.000016           5         3           fcntl
  0.71    0.000012           6         2           rt_sigaction
  0.53    0.000009           9         1           set_tid_address
  0.47    0.000008           8         1           set_robust_list
  0.47    0.000008           8         1           rseq
  0.35    0.000006           6         1           lseek
  0.35    0.000006           6         1           sigaltstack
  0.00    0.000000           0         1           prlimit64
  0.00    0.000000           0         1           getrandom
------ ----------- ----------- --------- --------- ----------------
100.00    0.001698          24        68         6 total
```
##  Comparison Table
|                 | `diff`                            | `cmp`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**   | Excution time is better | real and kernal time are better |
| **System Interaction Identification** | interactes with memory managment, file system , signal, process management stacks  | interactes with memory managment, file system , signal, process management stacks |
| **Syscall Time Breakdown** | 0.002084  sec | 0.001698 sec |

**Performance Evaluation**       cmp is better

---
**sort** vs **uniq**

`sort` Sort lines of text files.

`uniq`  Output the unique lines from a input or file.Since it does not detect repeated lines unless they are adjacent, we need to sort them first.

# Time Measurement
```bash
time sort
```
```plaintext
??
```

```bash
time uniq
```
```plaintext
??
```
# System Interaction Identification
```bash
strace -e trace=memory sort -a 
strace -e trace=file sort -a
strace -e trace=process sort -a
strace -e trace=signal sort -a 
```

```bash
strace -e trace=memory uniq -a 
strace -e trace=file uniq -a
strace -e trace=process uniq -a
```
# Syscall Time Breakdown
```bash
strace -c sort
```
```plaintext
???
```
```bash
strace -c uniq
```
```plaintext
???
```

##  Comparison Table
|                 | `sort`                            | `uniq`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**   | ?? | ?? |
| **System Interaction Identification** | interactes with memory managment, file system , signal and process management stacks  | interactes with memory managment, file system and process management stacks |
| **Syscall Time Breakdown** | ??  sec | ?? sec |

**Performance Evaluation**       ?? is better

---
**grep** vs **sed**

`grep` Find patterns in files using regular expressions.

`sed`  Edit text in a scriptable manner.

# Time Measurement
```bash
time grep
```
```plaintext
real	0m0.004s
user	0m0.000s
sys	0m0.004s
```

```bash
time sed
```
```plaintext
real	0m0.004s
user	0m0.002s
sys	0m0.003s
```
# System Interaction Identification
```bash
strace -e trace=memory grep -a 
strace -e trace=file grep -a
strace -e trace=process grep -a
strace -e trace=signal grep -a 
```

```bash
strace -e trace=memory sed -a 
strace -e trace=file sed -a
strace -e trace=process sed -a
```
# Syscall Time Breakdown
```bash
strace -c grep
```
```plaintext
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 27.08    0.000104           9        11         4 openat
 18.23    0.000070           4        15           mmap
 15.10    0.000058           9         6           read
 12.50    0.000048           9         5           mprotect
  5.99    0.000023           2         9           close
  5.21    0.000020          10         2           munmap
  3.39    0.000013           2         6           newfstatat
  3.12    0.000012           4         3           brk
  1.56    0.000006           6         1           lseek
  1.30    0.000005           5         1           futex
  1.30    0.000005           5         1           prlimit64
  1.30    0.000005           5         1           getrandom
  1.04    0.000004           2         2         1 arch_prctl
  1.04    0.000004           4         1           set_tid_address
  1.04    0.000004           4         1           set_robust_list
  0.78    0.000003           3         1           rseq
  0.00    0.000000           0         2           write
  0.00    0.000000           0         2           rt_sigaction
  0.00    0.000000           0         4           pread64
  0.00    0.000000           0         1         1 access
  0.00    0.000000           0         1           execve
  0.00    0.000000           0         1           sigaltstack
------ ----------- ----------- --------- --------- ----------------
100.00    0.000384           4        77         6 total
```
```bash
strace -c sed
```
```plaintext
% time     seconds  usecs/call     calls    errors syscall
------ ----------- ----------- --------- --------- ----------------
 24.61    0.000691          30        23           mmap
 23.47    0.000659         659         1           execve
 10.83    0.000304          16        18           write
  9.79    0.000275          21        13         4 openat
  9.22    0.000259          28         9           mprotect
  4.13    0.000116          14         8           read
  4.13    0.000116          11        10           close
  3.21    0.000090          10         9           newfstatat
  1.85    0.000052          52         1           munmap
  1.60    0.000045          22         2         2 statfs
  1.32    0.000037          12         3           brk
  1.32    0.000037           9         4           pread64
  1.14    0.000032          16         2         2 access
  0.89    0.000025          12         2         1 arch_prctl
  0.50    0.000014          14         1           set_tid_address
  0.46    0.000013          13         1           set_robust_list
  0.43    0.000012          12         1           rseq
  0.39    0.000011          11         1           getrandom
  0.36    0.000010          10         1           futex
  0.36    0.000010          10         1           prlimit64
------ ----------- ----------- --------- --------- ----------------
100.00    0.002808          25       111         9 total
```
##  Comparison Table
|                 | `grep`                            | `sed`                           |
|------------------------|---------------------------------|----------------------------------|
| **Time Measurement**   | Excution time is better | kernal time is better |
| **System Interaction Identification** | interactes with memory managment, file system , signal and process management stacks  | interactes with memory managment, file system and process management stacks |
| **Syscall Time Breakdown** | 0.000384  sec | 0.002808 sec |

**Performance Evaluation**       grep is better

---
