chef_base Cookbook
==================
This is a cookbook to adjust my DO servers to my liking, rather than using cloud-init

Requirements
------------
This cookbook is designed for RHEL distro's, mileage with other disro's will vary greatly


#### packages
No special packages are required that don't come preinstalled

Attributes
----------

#### chef_base::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ssh']['port']</tt></td>
    <td>Integer</td>
    <td>Port to have sshd listen on</td>
    <td><tt>2244</tt></td>
  </tr>
  <tr>
    <td><tt>['selinux]['state']</tt></td>
    <td>String</td>
    <td>Sets the default selinux state</td>
    <td><tt>enforcing</tt></td>
  </tr>
</table>

Usage
-----
#### chef_base::default

Just include `chef_base` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef_base]"
  ]
}
```
#### chef_base::selinux

Recipe to configure Selinux. This should be ran at the start of the recipe as a reboot may be required before other configuration can take place.