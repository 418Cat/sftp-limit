# sftp-limit
This script limits the concurrent connections of a particular sftp user.
Simply works by changing the password to a random string when the limit of concurrent connections is exceeded.

/!\ WARNING /!\
I am new to shell and am not aware of the security flaws this script might introduce by storing the password in a variable stored in clear in memory. 
Use this script at your own risks
