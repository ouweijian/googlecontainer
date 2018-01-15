for primaryName in `docker search kyo472083100 | awk 'NR!=1{print $1":"$2}'`
do
  imagename=`echo $primaryName | awk -F "[:]" '{print $1}'`
  grcname=`echo $primaryName | sed 's/kyo472083100/gcr.io\/google_containers/'`
  docker pull $imagename && docker tag $imagename $grcname && docker rmi $imagename
  echo 'add: '$grcname
done
