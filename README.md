# flake8
flake8 for littleworld ci

## use
```
docker run --rm -it laptevss/flake8
```

## local build
```
docker build -t flake8 .
docker run --rm -it flake8 --version
```

## docs

https://flake8.pycqa.org/en/latest/index.html

## cli use
```
flake8 path/to/code/to/check.py
# or
flake8 path/to/code/
```

## select or ignore errors
```
flake8 --select E123,W503 path/to/code/
flake8 --ignore E24,W504 path/to/code/
```
