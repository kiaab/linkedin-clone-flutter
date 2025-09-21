#!/bin/bash

echo "🧹 Running Flutter Clean..."
flutter clean

echo "📦 Getting Packages..."
flutter pub get

echo "🧪 Running Tests..."
flutter test

if [ $? -ne 0 ]; then
    echo "⛔️ Test failed:Fix before pushing."
    exit 1
fi

echo "🔨 Building APK..."
flutter build apk --release

if [ $? -ne 0 ]; then
    echo "⛔️ Build failed:Fix before pushing."
    exit 1
fi

echo "✅ All checks passed:Ready to push."