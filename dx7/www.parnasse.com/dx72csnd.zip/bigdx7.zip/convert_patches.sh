#
#  http://adp-gmbh.ch/csound/dx7/convert_patches.html
#
for dx in *.DX7; do
  dx_bank=$(basename $dx .DX7)

# echo $dx
  ../a.out $dx

  for patch in patch*; do
    alg=$(echo ${patch:10:2})
    pno=$(echo ${patch:5:2})

    mv $patch ../converted/${dx_bank}_$pno.sco
    cp ../newdx7${alg}.orc ../converted/${dx_bank}_$pno.orc
#  (cd ../converted; cs ${dx_bank}_$pno)
  done
done
