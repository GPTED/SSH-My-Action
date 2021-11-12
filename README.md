# SSH My Action
Execute command via ssh for your github workflows, example:

```yaml
      - name: SSHing my action
        uses: ./
        with:
          HOST: ${{ secrets.HOST }}
          PORT: ${{ secrets.PORT }}
          USER: ${{ secrets.USER }}
          PRIVATE_KEY: ${{ secrets.PRIVATE_KEY }}
          CMD: whoami

```

## Inputs
- `HOST`: SSH host
- `PORT`: SSH port (*default: `22`*)
- `USER`: SSH User (*default: `root`*)
- `PRIVATE_KEY`: SSH raw private key
- `CMD`: Commands to be executed on remote machine.

  Use semicolon `;` to separates multiple commands, 
  you can also use  multiline string like this:
  
  ```yaml
  command: |
    whoami;
    ls -la
  ```
