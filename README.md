# Golden VM

Golden Virtual Machine Image.

This is Ubuntu 20.04 VM hardened by Ubuntu SSG and STIG.

## Getting start

Start VM and create snapshot as initial state.

```bash
vagrant plugin install --local
vagrant up
vagrant halt
vagrant package default --output hardened.box
vagrant snapshot save initial_state
```
