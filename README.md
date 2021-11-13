# SSH My Action
Execute command via ssh for your github workflows, example:

![](https://github.com/GPTED/SSH-My-Action/workflows/test/badge.svg)

```yaml
      - name: SSH My Action
        uses: GPTED/SSH-My-Action@0.1
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
- `CMD`: Commands to be executed on remote machine (*default: show current login info*)

  Use semicolon `;` to separates multiple commands, 
  you can also use  multiline string like this:
  
  ```yaml
  command: |
    whoami;
    ls -la
  ```
