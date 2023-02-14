## to create new application (project / component) - 'dictionary' in our case

```
mix new dictionary
```

### to compile the app

```
mix
```

### after you edit the app

#### in comand line:

```
mix compile
mix run
```

after edit this command is enough:

```
mix run -e Dictionary.hello
```

#### in iex:

```
iex -S mix
```

- to compile (after editing):

```
c "lib/dictionary.ex"
```

OR

- to recompile file with particular module:

```
r Dictionary

Dictionary.hello
```
