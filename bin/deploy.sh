if [ -z "$1" ]
then
    echo "Deployment destination required..."
    exit 1
fi
rsync -avcC 'static/' "$1/"
perl -Ilib bin/build.pl
rsync -avcC 'site/' "$1/"
