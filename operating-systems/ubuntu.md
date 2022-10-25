# Ubuntu

## Commands

##### To fully remove a package with its configurations

```sh
sudo apt remove $PACKAGE
sudo apt autoremove -y
dpkg -l | grep "^rc" | awk '{print $2}' | sudo xargs dpkg --purge $PACKAGE
```