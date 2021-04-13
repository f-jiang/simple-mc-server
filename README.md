# Setup

1. Install Docker
2. Install [drive](https://github.com/odeke-em/drive#installing)
3. Install [tmuxinator](https://github.com/tmuxinator/tmuxinator#installation)
4. Install Minecraft Overviewer ([install](http://docs.overviewer.org/en/latest/installing/#) or [build from source](http://docs.overviewer.org/en/latest/building/))
5. Create cron jobs as needed
6. Fill in values in `env.sh`.
7. Fill in values in `mc-server.yml` and `render.config`:

```
source env.sh
for file in mc-server.yml render.config; do
    (envsubst < $file) > tmp && mv tmp $file
done
```

8. Link `mc-server.yml` to make it visible to tmuxinator:

```
ln -s "$REPO_PATH"/mc-server.yml ~/.config/tmuxinator/mc-server.yml
```

# Usage:

## Start server:

```
tmuxinator start mc-server
```

## Stop server:

```
tmuxinator stop mc-server
```

