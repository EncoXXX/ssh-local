# Local ssh

This program helps to connect to ssh with already stored credentials

### Install:
```bash
make install
```

### Usage:
```bash
ssh-local env1 #Connect to env1 server
ssh-local --list #Environment list for current folder
ssh-local --help #Show help message
```

You can specify environments for specific folders<br>
F.ex:

* Create file *.env.ssh.local* in current folder
* Put next text there:
```
environment_1="ssh -p 5555 user1@domain1.com"
environment_2="ssh -p 4185 user2@domain2.com"
```
This environments will be available only for this folder.
If you switch to another folder you will not be able to connect 
to one of these environments.
You can specify *.env.ssh.local* file in each folder you want,
and they will not conflict to each other


