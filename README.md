Cookbooks Collection for OpsWorks App Server
============================================

A collection of useful cookbooks for app servers on AWS OpsWorks.

Cookbook and Recipes
--------------------

### Utilities

#### Locale

- `opsworks_app_server::locale_gen_zhtw` <kbd>Setup</kbd> - locale-gen zh_TW.UTF-8

#### Mosh

Mobile shell, replacement for SSH.

 - `mosh::default` <kbd>Setup</kbd>

#### Zsh

 - `zsh::default` <kbd>Setup</kbd>

### NewRelic

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

#### Set App

 - `opsworks_app_server::opsrp_setapp` <kbd>Setup</kbd> (for Passenger/Rails) - `bin/rake` tasks and `bin/rails console` with ease by downloading [this script](https://gist.github.com/Neson/9ec46f825eebadf06615) and alias it as `sa`.

### Webhooks

#### Webhooks

 - `opsworks_app_server::webhooks_setup` <kbd>Setup</kbd>
 - `opsworks_app_server::webhooks_configure` <kbd>Configure</kbd>
 - `opsworks_app_server::webhooks_deploy` <kbd>Deploy</kbd>
 - `opsworks_app_server::webhooks_undeploy` <kbd>Undeploy</kbd>
 - `opsworks_app_server::webhooks_shutdown` <kbd>Shutdown</kbd>

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
    <td>Array</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['webhooks_configure_url']</tt></td>
    <td>Array</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['webhooks_deploy_url']</tt></td>
    <td>Array</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['webhooks_undeploy_url']</tt></td>
    <td>Array</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['webhooks_shutdown_url']</tt></td>
    <td>Array</td>
    <td>list of URLs to POST to</td>
    <td><tt>[]</tt></td>
  </tr>
</table>
