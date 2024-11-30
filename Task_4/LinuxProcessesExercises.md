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
![files.txt]([https://drive.google.com/file/d/1gtrxCiymFvCbYsbbI-BuZfaGLbxc9Y4P/view?usp=drive_link])
![Terminal](Images/10.png)
