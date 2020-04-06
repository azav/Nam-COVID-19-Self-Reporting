#/bin/sh

git=`sh /etc/profile; which git`

git_count=`git rev-list  HEAD --count`

/usr/libexec/PlistBuddy -c "Set :CFBundleVersion $git_count" "${PRODUCT_SETTINGS_PATH}"

echo "Updated build number in ${PRODUCT_SETTINGS_PATH} to $git_count"

