# Ubuntu 64 Development Machine

Development Virtual Machine built with vagrant + puppet

## Usage

Copy files `Vagrantfile` + `vm/*` in your project folder

```bash
| /my_php_project
| ... other project files
| - vm           
| - Vagrantfile
| ... other project files
```

Open terminal and put your current directory at same level of Vagrantfile

```bash
cd my_php_project
```

#### Run Environment

```bash
vagrant up
```

#### Connect to the machine

```bash
vagrant ssh
```

#### Stop Environment

```bash
vagrant halt
```

## Default Virtual Host

DocumentRoot: http://localhost:8080 points to the folder that contains Vagrantfile
   
PHP info: http://localhost:8080/phpinfo

PHPMyAdmin: http://localhost:8080/phpmyadmin

## Machine Configuratiom

Default Puppet configuration: `vm/manifests/default.pp`

Every time the `configuration` changes virtual machine have to run provision

```bash
vagrant provision
```

#### Users

class `users` is used to ensure users creation

#### Apt

class `apt` is used to ensure apt-update command to be executed

#### Timezone

class `timezone` is used to set correct time and date

#### System Packages

class `syspackage` is used to install system packages given in the `sys_packages` array

#### NodeJS Global Modules

class `nodeglobal` is used to install node modules given in the `node_modules` array globally

#### PHP

class `php` is used to install php and its modules

#### APACHE

class `apache` is used to install apache, its modules, set virtual hosts and configurations

#### MYSQL

class `mysql::server` is used to install mysql and create databases

#### PHPMYADMIN

class `phpmyadmin` is used to install phpmyadmin
