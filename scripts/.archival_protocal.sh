cd ~/dev

tar \
  --exclude='zipitnshipit-git/node_modules' \
  --exclude='zipitnshipit-git/.next' \
  --exclude='zipitnshipit-git/.next-*' \
  --exclude='zipitnshipit-git/.next-build' \
  --exclude='zipitnshipit-git/.next-dev' \
  --exclude='zipitnshipit-git/.vercel' \
  --exclude='zipitnshipit-git/.git' \
  --exclude='zipitnshipit-git/.env' \
  --exclude='zipitnshipit-git/.env.*' \
  --exclude='zipitnshipit-git/tsconfig.tsbuildinfo' \
  --exclude='zipitnshipit-git/.report' \
  \
  --exclude='zipitnshipit-git/LPD_raw_images' \
  --exclude='zipitnshipit-git/WD_raw_images' \
  \
  --exclude='zipitnshipit-git/jba-*.json' \
  --exclude='zipitnshipit-git/jba-*.txt' \
  --exclude='zipitnshipit-git/jba-*.csv' \
  --exclude='zipitnshipit-git/jba-*.tsv' \
  --exclude='zipitnshipit-git/jba-*.html' \
  --exclude='zipitnshipit-git/jba-*.log*' \
  \
  --exclude='zipitnshipit-git/kmc-*.json' \
  --exclude='zipitnshipit-git/kmc-*.txt' \
  --exclude='zipitnshipit-git/kmc-*.csv' \
  --exclude='zipitnshipit-git/kmc-*.tsv' \
  \
  --exclude='zipitnshipit-git/lpd-*.json' \
  --exclude='zipitnshipit-git/lpd-*.txt' \
  --exclude='zipitnshipit-git/lpd-*.csv' \
  --exclude='zipitnshipit-git/lpd-*.tsv' \
  \
  --exclude='zipitnshipit-git/onstage-*.json' \
  --exclude='zipitnshipit-git/onstage-*.txt' \
  --exclude='zipitnshipit-git/onstage-*.csv' \
  --exclude='zipitnshipit-git/onstage-*.tsv' \
  \
  --exclude='zipitnshipit-git/wd-*.json' \
  --exclude='zipitnshipit-git/wd-*.txt' \
  --exclude='zipitnshipit-git/wd-*.csv' \
  --exclude='zipitnshipit-git/wd-*.tsv' \
  \
  --exclude='zipitnshipit-git/new-vendor-*.json' \
  --exclude='zipitnshipit-git/new-vendor-*.txt' \
  --exclude='zipitnshipit-git/new-vendor-*.csv' \
  \
  --exclude='zipitnshipit-git/live-image-*.json' \
  --exclude='zipitnshipit-git/live-image-*.txt' \
  --exclude='zipitnshipit-git/live-image-*.csv' \
  \
  --exclude='zipitnshipit-git/dry-run-*.json' \
  --exclude='zipitnshipit-git/dry-run-*.txt' \
  \
  --exclude='zipitnshipit-git/logs/*.log' \
  --exclude='zipitnshipit-git/logs/**/*.log' \
  --exclude='zipitnshipit-git/logs/**/.*-audit.json' \
  \
  --exclude='zipitnshipit-git/*.before-*' \
  --exclude='zipitnshipit-git/*.bak' \
  \
  -czf zipitnshipit-source-$(date +%Y%m%d-%H%M%S).tar.gz \
  zipitnshipit-git

## To ensure archive security run check 

cd ~/dev

ls -lh zipitnshipit-source-*.tar.gz

tar -tzf "$(ls -1t zipitnshipit-source-*.tar.gz | head -n 1)" \
  | grep -E 'scripts/build-report|scripts/diag|jba-.*\.ts|kmc-.*\.ts|lpd-.*\.ts|onstage-.*\.ts' \
  | head -n 80
