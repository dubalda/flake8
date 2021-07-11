# flake8
flake8 for littleworld ci

Flake8 is a wrapper around these tools:

- PyFlakes
- pycodestyle
- Ned Batchelder's McCabe script

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

## gitlab ci
```
flake8:
  stage: lint
  image: laptevss/flake8:v3
  before_script:
    - mkdir -p public/badges public/lint
    - echo undefined > public/badges/$CI_JOB_NAME.score
  script:
    - echo "add --exit-zero for ignore errors"
    - flake8 --exit-zero --show-source --count --format=html --htmldir=public/lint | tee /tmp/flake.txt
    - ls -l public/lint/
    - tail -n 1 /tmp/flake.txt > public/badges/$CI_JOB_NAME.score
  after_script:
    - cat public/badges/$CI_JOB_NAME.score
    - anybadge --overwrite --label $CI_JOB_NAME --value=$(cat public/badges/$CI_JOB_NAME.score) --file=public/badges/$CI_JOB_NAME.svg 0=green 1=yellow 2=orange 1000000=red
    - |
      echo "Your score is: $(cat public/badges/$CI_JOB_NAME.score)"
  rules:
    - when: always
  artifacts:
    paths:
      - public
    when: always
```

## badges gitlab ci
link:
```
https://gitlab.com/%{project_path}/-/jobs/artifacts/%{default_branch}/file/public/lint/index.html?job=flake8
```
image:
```
https://gitlab.com/%{project_path}/-/jobs/artifacts/%{default_branch}/raw/public/badges/flake8.svg?job=flake8
```

