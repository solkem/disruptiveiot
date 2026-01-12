#!/bin/bash
set -e

SERVER="root@143.110.131.196"
GHOST_PATH="/var/www/ghost"

echo "Ì∫Ä Deploying to DisruptiveIoT..."

echo "Ì≥¶ Syncing Casper theme..."
rsync -avz --delete --exclude '.git' --exclude '.DS_Store' theme/casper/ $SERVER:$GHOST_PATH/content/themes/casper/

echo "Ìª§Ô∏è  Syncing routes.yaml..."
scp routes.yaml $SERVER:$GHOST_PATH/content/settings/routes.yaml

echo "Ì¥Ñ Restarting Ghost..."
ssh $SERVER "cd $GHOST_PATH && ghost restart"

echo "‚úÖ Deployment complete!"
