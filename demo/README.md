How to start development from the provided toy example and connect your sources with Github:

1. Create empty github repository

2. Generate ssh keys that will be used ONLY for new repository:
```bash
./01_generate_ssh_key.sh
```

3. Copy output and paste it to deployment key with WRITE permissions in repository settings:
[github guide](https://docs.github.com/en/developers/overview/managing-deploy-keys#deploy-keys)

TODO: video

4. Initialize empty github repository with demo application. Replace github SSD URL in the following example:

```bash
./02_init_github_repo.sh git@github.com:my-organization/my-repo.git
```
