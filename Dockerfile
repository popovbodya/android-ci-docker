FROM openjdk:8-jdk

MAINTAINER Popov Bogdan <popovbodya@gmail.com>

ENV LINUX_SDK_VERSION "4333796"

RUN apt-get --quiet update --yes && \
    apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1

RUN wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-${LINUX_SDK_VERSION}.zip

RUN unzip -q android-sdk.zip -d android-sdk

RUN mkdir android-sdk/licenses && \
    printf "8933bad161af4178b1185d1a37fbf41ea5269c55\nd56f5187479451eabf01fb78af6dfcb131a6481e" > android-sdk/licenses/android-sdk-license && \
    printf "84831b9409646a918e30573bab4c9c91346d8abd" > android-sdk/licenses/android-sdk-preview-license && \
    android-sdk/tools/bin/sdkmanager --update > update.log && \
    android-sdk/tools/bin/sdkmanager "platforms;android-28" "build-tools;27.0.3" "extras;google;m2repository" "extras;android;m2repository" > installPlatform.log
