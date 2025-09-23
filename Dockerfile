FROM ghcr.io/cirruslabs/flutter:stable AS builder

WORKDIR /app

COPY pubspec.* ./
RUN flutter pub get

COPY . .

RUN flutter analyze
RUN flutter test
RUN flutter build apk --release

FROM scratch

COPY --from=builder /app/build/app/outputs/flutter-apk/app-release.apk /app-release.apk