# Linux Processes Commands Exercises

**Beginner Level**
1. List all running processes
```bash
ps aux
```
![Terminal](Images/1.png)

2. Monitor system processes in real-time
```bash
top
```
![Terminal](Images/2.png)

3. Start a background process
```bash
sleep 30 &
jobs
ps
```
![Terminal](Images/3.1.png)  ![Terminal](Images/3.2.png)

4. Bring a background process to the foreground
```bash
fg
```
![Terminal](Images/4.png) 

5. Suspend and resume a process
```bash
ping google.com
`Ctrl+Z`
fg
bg
```
![Terminal](Images/5.png) 


**Intermediate Level**
6. Kill a process by PID
```bash
sleep 300 &
pgrep --full sleep
kill 11530
```
![Terminal](Images/6.png) 

7. Terminate multiple processes
```bash
sleep 100 &
sleep 200 &
sleep 300 &
pkill sleep
```
![Terminal](Images/7.png) 

8. Niceness levels
```bash
nice -n 10 sleep 1000 &
ps -o pid,ni,comm 13151
sudo renice -n 5 -p 13151
ps -o pid,ni,comm 13151
```
![Terminal](Images/8.png)

9. View process hierarchy
```bash
pstree
```
![Terminal](Images/9.png)

10. Redirect process output
```bash
ping google.com >> ~/Downloads/files.txt
```
[files.txt](https://drive.google.com/file/d/1gtrxCiymFvCbYsbbI-BuZfaGLbxc9Y4P/view?usp=drive_link)

![Terminal](Images/10.png)


**Advanced Level**
11. Track system calls of a process
```bash
strace ls
```
![Terminal](Images/11.png)

12. Monitor file descriptors
```bash
cat &
lsof -p 19879
```
![Terminal](Images/12.png)

13. Process scheduling policies
```bash
sudo chrt -f 10 sleep 1000 &
ps -o pd,ni,comm 20597
ps -eo pd,ni,comm | grep sleep
ps -o pd,ni,comm 20599
sudo chrt -p 20599
pstree
```
![Terminal](Images/13.1.png)  ![Terminal](Images/13.2.png)

14. Create and terminate a zombie process
![Terminal](Images/14.1.png)
```bash
ps aux | grep Z
ps aux| grep zombie
kill 22679
```
![Terminal](Images/14.2.png)  ![Terminal](Images/14.3.png)

15. Limit resource usage
```bash
ulimit -t 10 dd if=/dev/zero of=/dev/null
ulimit -a
```
![Terminal](Images/15.png)

**Assignment**
1- Check how many cores do you have using top command.
![Terminal](Images/16.png)

2- Create number of cores + 2 processes run in background.
![Terminal](Images/16.1.png)

3- Change priority for them:
Monitor them using top command, did you notice any change ?
![Terminal](Images/16.1.png)  ![Terminal](Images/16.2.png)
![Terminal](Images/16.3.png)  ![Terminal](Images/16.4.png)
`when ni value changed, Pr changed to with shift +20`

4- Kill them all using killall command.
    ![Terminal](Images/16.5.png)
