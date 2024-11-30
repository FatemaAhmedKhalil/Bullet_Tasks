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
`Ctrl+Z`
bg
```
![Terminal](Images/5.png) 
