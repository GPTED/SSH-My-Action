# SSH My Action
Execute command via ssh for your github workflows, example:

```yaml
on: [push]

jobs:
  ssh-job:
    runs-on: ubuntu-latest
    name: Connect to remote machine
    steps:
      - uses: actions/checkout@v1
      - name: SSHing my action
        uses: ./
        with:
          host: ${{ secrets.HOST }}
          port: ${{ secrets.PORT }}
          username: ${{ secrets.USERNAME }}
          key: ${{ secrets.KEY }}
          command: whoami

```

## Inputs
- `host` 
- `port`
- `username`
- `key`: SSH raw private key
- `command`: Commands to be executed on remote machine.

  Use semicolon `;` to separates multiple commands, 
  you can also use  multiline string like this:
  
  ```yaml
  command: |
    whoami;
    ls -la
  ```
