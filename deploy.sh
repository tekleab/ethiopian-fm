#!/bin/bash
# Ethiopian FM Radio — One-shot GitHub Pages deploy script
# Usage: chmod +x deploy.sh && ./deploy.sh
# Prerequisite: gh CLI installed (https://cli.github.com/) and logged in,
#               OR do the manual steps at the bottom.

set -e

REPO_NAME="ethiopian-fm"
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🎙 Ethiopian FM Radio — Deploy to GitHub Pages"
echo "================================================"

# 1. Generate icons from icon-source.jpg if available
if command -v python3 &>/dev/null; then
    python3 "$DIR/setup.py"
else
    echo "⚠  Python3 not found — skipping icon generation."
    echo "   Manually rename icon-source.jpg to icon-192.png and icon-512.png"
fi

# 2. Git init if not already done
if [ ! -d "$DIR/.git" ]; then
    git -C "$DIR" init
    git -C "$DIR" checkout -b main
fi

# 3. Git add and commit
git -C "$DIR" add .
git -C "$DIR" commit -m "Ethiopian FM Radio — initial release" 2>/dev/null || echo "(nothing new to commit)"

# 4. Push with gh CLI if available
if command -v gh &>/dev/null; then
    echo ""
    echo "Creating GitHub repo and pushing..."
    gh repo create "$REPO_NAME" --public --source="$DIR" --remote=origin --push
    echo ""
    echo "Enabling GitHub Pages..."
    gh api "repos/$(gh api user --jq .login)/$REPO_NAME/pages" \
        -X POST -f source='{"branch":"main","path":"/"}' 2>/dev/null || true
    LOGIN=$(gh api user --jq .login)
    echo ""
    echo "✅ Done! Open this URL in Safari on your iPhone:"
    echo "   https://$LOGIN.github.io/$REPO_NAME"
    echo ""
    echo "   Safari → Share → Add to Home Screen → Done"
else
    echo ""
    echo "gh CLI not found. Manual steps:"
    echo ""
    echo "  1. Go to https://github.com/new and create a repo: $REPO_NAME (Public)"
    echo "  2. cd $DIR"
    echo "  3. git remote add origin https://github.com/YOUR_USERNAME/$REPO_NAME.git"
    echo "  4. git push -u origin main"
    echo "  5. GitHub → Settings → Pages → Branch: main → Save"
    echo "  6. Open  https://YOUR_USERNAME.github.io/$REPO_NAME  in Safari on your iPhone"
    echo "  7. Safari → Share → Add to Home Screen"
fi
