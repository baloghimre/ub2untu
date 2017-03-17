MIN=1
MAX=9
rnd=$(( $RANDOM % ($MAX + 1 - $MIN) + $MIN ))

echo $rnd
