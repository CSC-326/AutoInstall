# AutoInstall

Configuration management for iTrust

## choco packages

Get this repo in order to get local packages inside.
```
git clone <THIS REPO>
```

### Tomcat 

The default tomcat 8 package is broken. I've fixed it to point to a real release.
```
cd choco\tomcat\
choco install .\tomcat.nuspec -y 
```
### Mysql and workbench

Installing workbench seems fine:
* `choco install mysql.workbench -y`  

The default mysql package creates a new installation without telling your temporary/random root password.
This version uses `initialize-insecure` instead.
This will install mysql, but without root password.

```
cd choco\mysql\
choco install .\mysql.nuspec -y
```

After installing, will want to login like this and set root password.
```
$ mysql -u root --skip-password
ALTER USER 'root'@'localhost' IDENTIFIED BY '';
SET GLOBAL sql_mode = "";
```

Why we have this mess:
* http://mysqlserverteam.com/initialize-your-mysql-5-7-instances-with-ease/

## homebrew packages

* EXTRA CREDIT?

## TODO:

* Run init-file to set root password?
* Making easier to have tomcat stopped and started....
