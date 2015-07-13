Cookbooks Collection for OpsWorks
=================================

A collection of useful cookbooks for AWS OpsWorks.

Cookbooks
---------

### Utilities

System utilities.

#### Locale

- `utilities::locale_gen_zhtw` <kbd>Setup</kbd> - locale-gen zh_TW.UTF-8

### Rails

#### Command Line Shorthands

 - `rails::opsrp_setapp` <kbd>Setup</kbd> (for Passenger/Rails) - `bin/rake` tasks and `bin/rails console` with ease by downloading [this script](https://gist.github.com/Neson/9ec46f825eebadf06615) and alias it as `sa`.

### Webhooks

Send custom HTTP callbacks while specific events occurs.

 - `webhooks::webhooks_setup` <kbd>Setup</kbd>
 - `webhooks::webhooks_configure` <kbd>Configure</kbd>
 - `webhooks::webhooks_deploy` <kbd>Deploy</kbd>
 - `webhooks::webhooks_undeploy` <kbd>Undeploy</kbd>
 - `webhooks::webhooks_shutdown` <kbd>Shutdown</kbd>

#### Attributes

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

### rsyslog Watch Files

 - `rsyslog_watch_files::default` <kbd>Setup</kbd> - Setup watching custom files for rsyslog

#### Attribute

`node['rsyslog']['watch_files']`: A hash of files and associated tags that will be configured to be watched and included for rsyslog logging. Example:

```ruby
{
  "/var/log/apache2/app-access.log":          "apache2-app-access",
  "/var/log/apache2/app-error.log":           "apache2-app-error",
  "/var/log/aws/opsworks/opsworks-agent.log": "opsworks-agent"
}
```

3rd Party Cookbooks
-------------------

### Mosh

Mobile shell, replacement for SSH.

 - `mosh::default` <kbd>Setup</kbd>

### Zsh

 - `zsh::default` <kbd>Setup</kbd>

### New Relic

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

### [papertrail-rsyslog](https://supermarket.chef.io/cookbooks/papertrail-rsyslog)

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
