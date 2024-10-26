### 1. Put this in your .bashrc
```
if [ -d "$HOME/.bookmarks" ]; then
    export CDPATH=".:$HOME/.bookmarks:/"
    alias goto="cd -P"
fi
```

### 2. Make a bookmarks dir
```
mkdir ~/.bookmarks
```

### 3. Make symlinks
```
ln -s path/to/certain/directory/with/my/project @important-project
```
