# Golden VM

Golden Virtual Machine Image.

This is Ubuntu 20.04 VM hardened by Ubuntu SSG and STIG.

## Getting start

Start VM and create snapshot as initial state.

```bash
vagrant up
vagrant halt
vagrant snapshot save initial_state
vagrant up
```
