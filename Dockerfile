FROM ghcr.io/cirruslabs/flutter:stable AS builder

WORKDIR /app

COPY pubspec.* ./
RUN flutter pub get

COPY . .

RUN flutter build apk --release