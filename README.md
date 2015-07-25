Cookbooks Collection for OpsWorks
=================================

A collection of useful cookbooks for AWS OpsWorks.

AWS OpsWorks is an application management service based on [Chef](https://www.chef.io/) that makes it easy for DevOps users to model & manage the entire application. This Cookbook collection provides some Recipes to enhance it for Ruby/Rails/Node.js application deployment and provide several additional functionalities.

Supported OS platforms: `Ubuntu 14.04 LTS`.

---

 - [Utilities](#utilities)
 - [Dotenv](#dotenv)
 - [Procfile](#procfile)
 - [Rails](#rails)
 - [Webhooks](#webhooks)
 - [rsyslog Watch Files](#rsyslog-watch-files)
 - [rsyslog Watch OpsWork Event](#rsyslog-watch-opswork-event)
 - [swap](#swap)
 - [3rd Party Cookbooks](#3rd-party-cookbooks)
   - [Mosh](#mosh)
   - [Zsh](#zsh)
   - [New Relic](#new-relic)
   - [Papertrail rsyslog](#papertrail-rsyslog)
 - [OS Packages](#os-packages)
 - [Packaging](#packaging)
 - [Notes](#notes)

---


## Utilities

System utilities.

### Locale

- `utilities::locale_gen_zhtw` <kbd>Setup</kbd> - locale-gen zh_TW.UTF-8

## Dotenv

 - `dotenv::default` <kbd>Deploy</kbd> - Generate an .env file for dotenv for each deploy.

## Procfile

Reads the content of an application's `Procfile` and start each process with monit. Currently supports
`worker` and `clock`.

### Worker

This recipe writes an monit configuration to start workers using the command specified in the `Procfile`. It will be ignored if `Procfile` doesn't exists or the worker process type isn't specified. Include these recipes in the worker instances.

 - `procfile::worker` <kbd>Deploy</kbd>
 - `procfile::worker-undeploy` <kbd>Undeploy</kbd>

Note that the worker process count can be set through each application's `workers` environment variable (`deploy[:environment_variables][:workers]`). The default is 3.

### Clock

This recipe writes an monit configuration to start a clock using the command specified in the `Procfile`. It will be ignored if `Procfile` doesn't exists or the clock process type isn't specified. Include these recipes in the clock instance.

 - `procfile::clock` <kbd>Deploy</kbd>
 - `procfile::clock-undeploy` <kbd>Undeploy</kbd>

## Rails

### Command Line Shorthands

 - `rails::opsrp_setapp` <kbd>Setup</kbd> (for Passenger/Rails) - `bin/rake` tasks and `bin/rails console` with ease by downloading [this script](https://gist.github.com/Neson/9ec46f825eebadf06615) and alias it as `sa`.

## Webhooks

Send custom HTTP callbacks while specific events occurs.

 - `webhooks::webhooks_setup` <kbd>Setup</kbd>
 - `webhooks::webhooks_configure` <kbd>Configure</kbd>
 - `webhooks::webhooks_deploy` <kbd>Deploy</kbd>
 - `webhooks::webhooks_undeploy` <kbd>Undeploy</kbd>
 - `webhooks::webhooks_shutdown` <kbd>Shutdown</kbd>

### Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['webhooks_setup_url']</tt></td>
    <td>Array of Strings</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['webhooks_configure_url']</tt></td>
    <td>Array of Strings</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['webhooks_deploy_url']</tt></td>
    <td>Array of Strings</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['webhooks_undeploy_url']</tt></td>
    <td>Array of Strings</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['webhooks_shutdown_url']</tt></td>
    <td>Array of Strings</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

## rsyslog Watch Files

Watch and send custom log files with rsyslog. Requires rsyslog.

 - `rsyslog_watch_files::default` <kbd>Setup</kbd> - Setup watching custom files for rsyslog

### Attribute

`node['rsyslog']['watch_files']`: A hash of files and associated tags that will be configured to be watched and included for rsyslog logging. Example:

```ruby
{
  "/var/log/apache2/app-access.log":          "apache2-app-access",
  "/var/log/apache2/app-error.log":           "apache2-app-error",
  "/var/log/aws/opsworks/opsworks-agent.log": "opsworks-agent"
}
```

## rsyslog Watch OpsWork Event

Report the OpsWork events log with rsyslog. Requires rsyslog and monit.

 - `rsyslog_opswork_event::default` <kbd>Setup</kbd>

## swap

 - `swap::1024` <kbd>Setup</kbd> - Setup swapfile to 1024MB
 - `swap::2048` <kbd>Setup</kbd> - Setup swapfile to 2048MB
 - `swap::4096` <kbd>Setup</kbd> - Setup swapfile to 4096MB
 - `swap::remove` - Remove swapfile


3rd Party Cookbooks
-------------------

Here are some 3rd party Cookbooks (included in `Berksfile`) and their common usage listed below.

### [Mosh](https://supermarket.chef.io/cookbooks/mosh)

Mobile shell, replacement for SSH.

 - `mosh::default` <kbd>Setup</kbd>

### [Zsh](https://supermarket.chef.io/cookbooks/zsh)

 - `zsh::default` <kbd>Setup</kbd>

### [New Relic](https://supermarket.chef.io/cookbooks/newrelic)

 - `newrelic::default` <kbd>Setup</kbd> - installs the New Relic agent that performs the server monitoring

##### Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['newrelic']['license']</tt></td>
    <td>String</td>
    <td>your newrelic license key</td>
    <td><tt>undefined</tt></td>
  </tr>
</table>

### [Papertrail rsyslog](https://supermarket.chef.io/cookbooks/papertrail-rsyslog)

 - `papertrail-rsyslog::default` <kbd>Setup</kbd> - Setup logging to [Papertrail](https://papertrailapp.com/) (the full cookbook name should be used for OpsWorks)

##### Attributes

```js
['papertrail']['port'] = The Papertrail log destination port number (required)
['papertrail']['host'] = The Papertrail host address (defaults to logs)
['papertrail']['syslog_selector'] = The syslog tags and types to stream into Papertrail (defaults to "*.*")
['papertrail']['resume_retry_count'] = The number of times to retry the sending of failed messages (defaults to unlimited)
['papertrail']['queue_disk_space'] = The maximum disk space allowed for queues (default to 100M)
['papertrail']['enable_tls'] = Whether to encrypt all log traffic going into Papertrail (default to True)
['papertrail']['certificate_src'] = The URL of the certificate file on the Papertrail server
['papertrail']['certificate_checksum'] = The sha256 checksum for the Papertrail certificate file
```


OS Packages
-----------

Here are some recommended (or required) OS packages that can set to be installed.

 - `nodejs` - system Node.js
 - `libpq-dev` - header files for libpq5, required if using PostgreSQL
 - `imagemagick` - commonly used for apps to create, edit, compose, or convert bitmap images


Packageing
----------

Run `bin/package` to package this cookbook collection with all the dependencies and push it to the `packaged` branch of git remote server. The archives can be used for faster installation (no need to download all dependencies while installing the cookbook), especially while each run on OpsWorks.


Notes
-----

### Recipe Description Syntax

The Recipe description used in this documentation follows this syntax as convention:

 - `recipe::name` <kbd>OpsWorks lifecycle that recommend to set on</kbd> - recipe description
