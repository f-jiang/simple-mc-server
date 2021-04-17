# Setup

1. Initialize submodules
2. Install Docker
3. Install [drive](https://github.com/odeke-em/drive#installing)
4. Install [tmuxinator](https://github.com/tmuxinator/tmuxinator#installation)
5. Install Minecraft Overviewer ([install](http://docs.overviewer.org/en/latest/installing/#) or [build from source](http://docs.overviewer.org/en/latest/building/))
6. Create cron jobs as needed
7. Fill in values in `env.sh`.
8. Fill in values in `mc-server.yml` and `render.config`:

```
source env.sh
for file in mc-server.yml render.config; do
    (envsubst < $file) > tmp && mv tmp $file
done
```

9. Link `mc-server.yml` to make it visible to tmuxinator:

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

