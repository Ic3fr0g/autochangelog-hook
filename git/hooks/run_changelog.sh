#!/bin/bash
echo "Generating CHANGELOG" &&
github_changelog_generator autochangelog-hook -t ${GITHUB_TOKEN} --date-format '%Y-%m-%d %H:%M' &&
echo "Running python script" &&
git tag -l -n9 > a.txt &&
python3 .git/hooks/clog.py &&
rm a.txt &&
echo "Done! Check CHANGELOG.md"
