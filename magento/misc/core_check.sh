# Looking for your feed back to make this better!
# This is intended to check the core version of Magento with your version of Magento
# To check to make sure core files have not been changed and if they do get changed to alert someone of the changes
# This would best be done at install and patches commited to core version. 
# Requires you have MUTT installed
# You should download the core version of Magento and setup a GIT repo
# the opy your core back into it to ensure you have your patches, but at this point you should check to make sure there are not files that are no pathch files
EMAILTO="brent@wagento.com,creativedata@gmail.com"
# Change the path for the two directories to diff below
# TODO create installer that will generate a file automatically
# TODO download CE version if site is CE, EE Code will have to manually be install
diff $HOME/magento-core-files/app/code/core/ $HOME/current/app/code/core/
if [ $? -ne 0 ]
then
      diff -wrql $HOME/magento-core-files/app/code/core/ $HOME/current/app/code/core/ >> $HOME/core-diff.log
      diff -wrql $HOME/magento-core-files/app/code/core/ $HOME/current/app/code/core/ | mutt -s "Core File Changes" -- $EMAILTO
      #TODO copy and commit files to repo and push to git so files can be quickly reviewed
else
    echo "Core files are the same" >> $HOME/core-diff.log
fi
# Add Core Lib checker
diff $HOME/magento-core-files/lib/ $HOME/current/lib/
if [ $? -ne 0 ]
then
      diff -wrql $HOME/magento-core-files/lib/ $HOME/current/lib/ >> $HOME/core-diff.log
      diff -wrql $HOME/magento-core-files/lib/ $HOME/current/lib/ | mutt -s "Core File Changes" -- $EMAILTO
else
    echo "lib files are the same" >> $HOME/core-diff.log
fi