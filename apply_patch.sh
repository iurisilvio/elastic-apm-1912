if [ ! -f "$TOX_ENV_DIR/.patch_applied" ]; then
  patch $TOX_ENV_DIR/lib/python3.11/site-packages/ansible_collections/community/general/plugins/callback/elastic.py 1912.patch
  touch $TOX_ENV_DIR/.patch_applied
fi
