# AWS

AMI of the EC2 instances for backup


## SSL FREE
### Install
On Ubuntu systems, the Certbot team maintains a PPA. Once you add it to your list of repositories all you'll need to do is apt-get the following packages.

```
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:certbot/certbot
$ sudo apt-get update
$ sudo apt-get install python-certbot-apache 
```

### Get Started
Certbot has a fairly solid beta-quality Apache plugin, which is supported on many platforms, and automates both obtaining and installing certs:

```
$ sudo certbot --apache
```
Running this command will get a certificate for you and have Certbot edit your Apache configuration automatically to serve it. If you're feeling more conservative and would like to make the changes to your Apache configuration by hand, you can use the certonly subcommand:

```
$ sudo certbot --apache certonly
```

### Automating renewal

The Certbot packages on your system come with a cron job that will renew your certificates automatically before they expire. Since Let's Encrypt certificates last for 90 days, it's highly advisable to take advantage of this feature. You can test automatic renewal for your certificates by running this command:

```
$ sudo certbot renew --dry-run
```
