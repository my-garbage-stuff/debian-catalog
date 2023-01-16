src=""
curl https://ftp.debian.org/debian/dists/unstable/main/source/Sources.gz | gzip -d - | while read line ; do
    if [ "${line/:*/}" == "Package" ] ; then
        src=${line/*:/}
    fi
    if [ "${line/:*/}" == "Binary" ] ; then
        pkg=${line/*:/}
        echo $src : $pkg
    fi
done | sed  "s/, / /g;s/\///g" > catalog.txt
