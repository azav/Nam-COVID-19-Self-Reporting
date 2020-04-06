#/bin/sh
# Setting this value back to Placeholder makes it so that the info.plist wasn't dirtied and will not be require another commit.

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion 'Placeholder'" "${PRODUCT_SETTINGS_PATH}"

echo "Restored placeholder value in ${PRODUCT_SETTINGS_PATH}"

