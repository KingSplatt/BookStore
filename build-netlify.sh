#!/bin/bash
set -e

echo "🚀 Starting .NET Blazor build for Netlify..."

# Install .NET SDK 9.0
echo "📦 Installing .NET SDK 9.0..."
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 9.0.100

# Set up environment
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet

# Verify installation
echo "✅ .NET version:"
$DOTNET_ROOT/dotnet --version

# Restore and build
echo "📚 Restoring packages..."
$DOTNET_ROOT/dotnet restore BookStore.Client/BookStore.Client.csproj

echo "🔨 Building and publishing..."
$DOTNET_ROOT/dotnet publish BookStore.Client/BookStore.Client.csproj \
  -c Release \
  -o BookStore.Client/bin/Release/net9.0/publish

echo "📂 Checking output..."
ls -la BookStore.Client/bin/Release/net9.0/publish/wwwroot/

echo "✨ Build completed successfully!"
