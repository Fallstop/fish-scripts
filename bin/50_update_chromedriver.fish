function update_chromedriver
    set CD_VERSION $(curl -s "https://googlechromelabs.github.io/chrome-for-testing/LATEST_RELEASE_STABLE")
    echo "Latest version of chromedriver is $CD_VERSION, updating..."

    set TEMPFILE /tmp/chromedriver-linux64.zip
    wget -q "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/$CD_VERSION/linux64/chromedriver-linux64.zip" -O $TEMPFILE
    echo "Unzipping chromedriver..."
    sudo unzip -j -o $TEMPFILE -d /usr/bin
    rm $TEMPFILE
    echo Updated to (/usr/bin/chromedriver --version)
end