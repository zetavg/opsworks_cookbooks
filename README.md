Cookbooks Collection for OpsWorks
=================================

A collection of useful cookbooks for AWS OpsWorks.

Cookbook and Recipes
--------------------

### Utilities

System utilities.

#### Locale

- `utilities::locale_gen_zhtw` <kbd>Setup</kbd> - locale-gen zh_TW.UTF-8

#### Mosh

Mobile shell, replacement for SSH.

 - `mosh::default` <kbd>Setup</kbd>

#### Zsh

 - `zsh::default` <kbd>Setup</kbd>

### NewRelic

Server monitoring with New Relic.

#### NewRelic

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

### Rails

#### Command Line Shorthands

 - `rails::opsrp_setapp` <kbd>Setup</kbd> (for Passenger/Rails) - `bin/rake` tasks and `bin/rails console` with ease by downloading [this script](https://gist.github.com/Neson/9ec46f825eebadf06615) and alias it as `sa`.

### Webhooks

Send custom HTTP callbacks while specific events occurs.

#### Webhooks

 - `webhooks::webhooks_setup` <kbd>Setup</kbd>
 - `webhooks::webhooks_configure` <kbd>Configure</kbd>
 - `webhooks::webhooks_deploy` <kbd>Deploy</kbd>
 - `webhooks::webhooks_undeploy` <kbd>Undeploy</kbd>
 - `webhooks::webhooks_shutdown` <kbd>Shutdown</kbd>

##### Attributes

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
