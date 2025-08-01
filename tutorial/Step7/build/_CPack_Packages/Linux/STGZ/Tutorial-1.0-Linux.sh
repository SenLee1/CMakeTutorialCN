#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the Tutorial-1.0-Linux subdirectory
  --exclude-subdir  exclude the Tutorial-1.0-Linux subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Tutorial Installer Version: 1.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is the open source License.txt file introduced in
CMake/Tutorial/Step7...

____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Tutorial will be installed in:"
    echo "  \"${toplevel}/Tutorial-1.0-Linux\""
    echo "Do you want to include the subdirectory Tutorial-1.0-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Tutorial-1.0-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +152 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the Tutorial-1.0-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� ��ph �]x[ŕI~%qb%$�
���ɖ���GFq���nd�ھ�,�*8l���Ř@�]��mY(]w۲ᣥ�<|�M����v��e?�<j��@����j��^���|����̙3�{5sfҦ%V��|>�ʕU���U>����U��������W"O��6�LZ����������ܱ�Y9�$�A��d�dJ�ďW���l�?���T����*��w������Zh}���0x�a.8��A�si�h�=�T|� '�!�����ts]���i�L-��<��f�ܹt�/���������a�D���TL��fl9��.0�L~_�9����[N�����i��>�g�+S>�8��u29��Ef��m~M�}��Y��e�ud�<��@�"��o�&��];��̔��q��:�"+�k�LOyϪ���7��Vva�q��dC+n�A��n��Ay������7}s�o~��KM����S�U=V��v0��B���y(׿��|����/u��[ZkW/;A�,��a�w k��6�om�(6�n�����o���~���w���F�,�6�zm�F���=x�M��6�6z�l�]n#_hg?�s�>�h>����w|E��J&���)�-JLM�ZZWS-��dBm���Ugs��d<��4�-R���� Ӭ�D,^m���hg$�詈��A"�Xe[$�E�dZO�����ŧ�����"�(zg*y��%�D�ZL��:2]jBo�4Jr�W*J�����WPE�GKtXeG�
��C�����J�*X�%�
�U�	MgV��4�55'������[M��	0Cߪl��eI.���TVO�t����h�P�bT��ܜ�nM�ŢɌN�� %ٮ�"���ܚ�^KĔ&5�pV�]��sfa������L ��=���=	�FQS�DR�'�]Kb!H�V�v^��G�8-i=]���՘툂Z��1��%��J�ׇj7m�YS�������k�8 ~�V�)�T��V��Z�%?o�0��?<I���+bh1|�����ɞ����37o4.�:?e_r�y��`�xH��#�£���0}ɝ%���;�_7v�?m��?��=Ggk�t��9°��qW~��(�9U��K3�= ��+K�9�}�Ќ�`�%|;{��%|�MJ%A3����)��F�L��9w	�A�/��X��\�G|���
�)>&�s��ʁ�O���y�o�*�A����5p����(��{�&/��^"��>E��|����4�\^*�|�����W��|�����$���_�OF��_��^ق�½o���������3{0��t�S$>[5�w��LRv������l6����2x'�4x�d�����	���F�/&�u_B���O!�W~*�k~��_J��?��3~�_F�w�2jc���ZZ�Pn�ߒ��$�7�����?#�?���J����[��\�wK�N��&�����]�{5����-!������_��gε �~�����p�� "�zL�]�r���d���؁�b����U/`��h�o4�����s�φ�g��s����p;��������~�e���{/|��	������/,�d#K�]Gb���n9�Ր֔���!i�t�0Z:�����쉅��YL�F�����u�����C{�� ?��m�;0��	���;J�����R �p *�4$��$���@L�K�ϙ��/c����X�݅-���	U�3�}����\�>!J[f(���تׇI���(�u��0_��w�>Q�ᾗp�MĐРak��˶�@h�
9r�H}>�o ��#nWN|?�k/��2�p�/M�m��O3
�w��~C�������c�[Gb�e�IS��QI&ž���a|�8��$�!��9�J���Ǟ���(�mG�2c�ێ82�߸m,��nXƞ���TG�vb.�'�h)��\JE��c�vrZ��:~��f��-�6e��6sJ>��&>�1�{�Ϛ�տ����A��IM=��Y��<P���*��#�� #y���[�,�9��>��G�BZ��g����-�#՞3��)H�l��>�k�'.��_a{���k=�<�o�O3{�w�!�8^z0S�;
)"X2�L,�;S���s���z1��o��7R>��-s�������m�I~0�r'�/����ai�˭�=����u�r���=~��E7a+����rW�a����0�^�"4�����~n8ʾ��?
OH{2up��m�]������i�u���ss���Q��a(��g�d\��$�'��@�M�����i���8��,Ȍm/[�ܻeW<ǔ^�$�����D�
@�!	��&"3
y�X�-~�\j��c�_��0�	����aCp�\M���"��w�To�MG�7���V����ŧ�kX}�#�����^�������H��ă:�^f���C>�C>�C>L^p���4^$�\���Z2�A^Ԛ�t��y�'��jSS��S����DR�'�L�d;�iiONOkZ�� ������t��nO���y"	���t-�l��3��&��3��� �)����\!_5=;�����1�_��:���?ɻ�@_�w�f��@� ���lvЭ�f�x_�{����y��}�����6�=@o��c�_=/����l�{�a��K@w��T�6踡	9z܎���%{�>#`�",���,�� |ަy��sוM��d����V�}&�{|�B���_��l���8�[���{��F�f�ov�N/rցE����뉥���� ���޳�m�ΖB�
��"��u�Nszއϫ��21�6M�g�:� > �!~�)��6�5|ނ�� W�22�q�ð���e��6��B�!��'�7������[B��F���7����?�uZ��!�u�R3 B���7�9�t�a'~�������=��)���C>�C>�C>�C>�������p�_�_�p��G%�i��쥝�,�ez�/
����x���}:��o���&1`�+��q3sZ�+C,��^��x�s��}Tp�>1��/-�3������0ܗep��4�lw'K�}Dx��Y��,-��AG��%�2��9���,�0��[5������w��FF73���F�0���F=��0���G s^q3��Y&!p�����Ż��з�}x����Svã�ނ���U�Þ�;�u%�W߶�<t�+��/->[�9����r.��֞�Y�ږI����x}��a��+*���Ol��'+�SH\��u�O�����	��[rz�0|��W2|X��I��ў��}8���㛇�2=����."�1_�����?!�P�ǜ��3{���w�o3�.c������3����N�|�3�[���.͗v�U��:g�Ƴ�k������A��7��	>Ϙy���/�{x� f��[��Щ�1,<��~�nts&[��Ox��2:,��+uR�Y���_��6~��Oލ�����M����)��3�y���4���:��/=ܿ����`y�L�9��Om�����~Z!-/?ϴ��Gm��P���-��6X����k���R�s'���z���@��_��6�O.��P�og|>�[c��~��~ş��Z����<�����>��Z�j�
<Yd}N��F��6��E��m��Y}~Td=�����Z�F�2�OE� �71��b�y�6�Qs4���I�(�6M�#���io�FQ�`��w)Q|�"����O�E�JLO��J$Ӄ�ɮ�1x�ZJ`'{M��R�����S[Q{*ҥ*�LW�VH"p
^�7���H�7��C���WwkjT�^K�J4�H�L����_�(Z� 6�'���Uئ�v��W"��Si:��4)��߸�f=$ɴ)�� @�V��@36Gc��'Q�jBJh�Z|&E�dC�
30��	)k��P�P_k��XW�jQZj֬)�E�~E�E������#���#�q����X,�.
���ƺ�������\���n�P��|ࢫy5���+͑-*͊����ZbZBɤ��$�0	�K���as%}�;b&�禓J'�rJ�'y�I?����k/���v���<�ƟR	
B�s�gX����8�#����ظ�G�ꇟ����|x&�;��Q��4��ŏ�|�NT��hx��
�񗘌��S��$\�j��PL[�%t�#3%��"	��m}�/���T�m�4�V�� މ5]��Y���j�;�%�9�{�sL��:s����Nf��(���_�E&{�����t6��2_6�'u�����Ɵ4���]z�(L�v�o�s���7��U/��N%����Ԗ��r-� � ��5��uFҝ�ۚ�,(�S4f�01
ĥ�x�o�q[� ���H�/i5��0�K�Do*I��^���It�R9��F�'�v�
�)�Z�K���C�.�S�0���n�o���^�ï�|=�����g�����P"��Rz�|�ْ�|7B�������"v�/�χ�l���돜.f8_�� ������INw�~~����2���띜��M���ѵC���rZ-���vD�"9��#9݇r������F�Nyz�>�)_�돗�n�~��z+�;���,�߇Ļи{/�:4r��+�����-U�|��Rz�L3�~�K? ��4S������g�����N{~!����N����{�����I^�?/J���˰��)���fz��,/������,3]"����=�ɇ�q���c�$_"Q���z׫�{Pʭ�ӗ9�g~��TXz�0���x?�!+��?��ݚ5t���:��u6��H�=��m���|�Ǘ�/���Eg����O�L�T�"$<�җ�����x.��)�|ޚ���������L��?f��\J �χ�����31��������XY����D����.� Kkio���QL���~���_e��jh�ꊊ@���b�vئ+B�׳����N�_���?��6�h�:&w8�����s�?�����ʏ�V� �6���3)5�Iv�g�'��yҪ��i�=�ɔ�w��g��v-��rY���~���f��&��� �3Z�CJ�5-��|��	q�����U���p�������<�1���������|���D��DR�΋���o�w�	����x��K��#����=yor��q7!�WVVs���vC��
�� ��Fe��ޡ�5��P`�Cs�F�����s(�2G��P`1ǾC�
~�;���
6Kw(p,'/��
�ŝ�;L�qV4��$2�
Va�<Xy8Q'_�?��,�U��b���xg��nٝ��Ωv'%�b�v'%���G/"6[��l�wY����<r8�x.��2�w���qO@����a�s�«��5K���5�=�r�s}���8|�����~�����lp|��m�|��|�79h�(�0�ǒ�
��u-��w���X��t���f(����[qY;3���������ƷH8)�8ޔ<�����X�T���ѝ!���e~����?.���	�1��a��w�h?�Y��_.�n�����kl�����a]?��X?#���G���sA~����sH��$������b;G|~��"N#A	���f	�z&r!.(��Dp�&$V�"�^"���ĳ��}�$6�S&!x��3/���c�l��6���aۑ��*y:���X���I�?K�I�=��w&y�+����ߏ�wy�n	��.B�eC�e-/�̮F��7�<;x=��+B��o��Yu���K���ڌ�w+/�����;������ϐu�of��i9�d]ϱ�3��44���v��g�+0n�)��v��W���1~�v���w�N	��,�C>�×+���� p  