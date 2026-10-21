#!/usr/bin/env python3
"""
Run this once to generate icon-192.png and icon-512.png from icon-source.jpg
then initialize git and push to GitHub.

Usage:
  python3 setup.py

Requirements:
  pip install Pillow
"""
import os
import sys
import subprocess

try:
    from PIL import Image
except ImportError:
    print("Installing Pillow...")
    subprocess.check_call([sys.executable, '-m', 'pip', 'install', 'Pillow', '-q'])
    from PIL import Image

script_dir = os.path.dirname(os.path.abspath(__file__))
src = os.path.join(script_dir, 'icon-source.jpg')

if not os.path.exists(src):
    print("⚠  icon-source.jpg not found. Using a placeholder.")
    # Create a simple green/yellow/red gradient placeholder
    img = Image.new('RGB', (512, 512), (22, 101, 52))
    img.save(src)

img = Image.open(src).convert('RGBA')

for size in [192, 512]:
    out = img.copy()
    out.thumbnail((size, size), Image.LANCZOS)
    # Create square canvas
    canvas = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    offset = ((size - out.width) // 2, (size - out.height) // 2)
    canvas.paste(out, offset)
    path = os.path.join(script_dir, f'icon-{size}.png')
    canvas.save(path, 'PNG')
    print(f'✓ Created {path}')

print("\n✓ Icons created! Now push to GitHub:")
print("  1. Create a repo called 'ethiopian-fm' on github.com")
print("  2. cd ~/ethiopian-fm")
print("  3. git init && git checkout -b main")
print("  4. git remote add origin https://github.com/YOUR_USERNAME/ethiopian-fm.git")
print("  5. git add . && git commit -m 'Initial release'")
print("  6. git push -u origin main")
print("  7. On GitHub: Settings → Pages → Branch main → Save")
print("  8. Your URL: https://YOUR_USERNAME.github.io/ethiopian-fm")
