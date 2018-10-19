# android-ci-docker

Small and lightweight Docker image based on OpenJDK and Android SDK. 
It can be used for building and testing Android applications on the CI pipeline.

It can be used on the Gitlab CI with .gitlab-ci.yml implementation: 
```
image: popovbodya/android-ci

before_script:
    - export GRADLE_USER_HOME=$(pwd)/.gradle
    - chmod +x ./gradlew
    
cache:
  key: ${CI_PROJECT_ID}
  paths:
    - .gradle/

stages:
  - build
  - test

build:
  stage: build
  script:
    - ./gradlew assembleDebug
  artifacts:
    paths:
    - app/build/outputs/

unitTests:
  stage: test
  script:
    - ./gradlew test
```
