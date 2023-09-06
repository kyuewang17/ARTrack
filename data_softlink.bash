#!/bin/bash

# === Set Original Data Paths === #
org_got10k_path="none"
org_lasot_path="none"
org_lasotext_path="none"
org_nfs_path="none"
org_otb_path="none"
org_tc128_path="none"
org_tnl2k_path="none"
org_trackingnet_path="none"
org_uav_path="none"

# Array of Original Path
org_path_arr=( $org_got10k_path $org_lasot_path $org_lasotext_path $org_nfs_path $org_otb_path $org_tc128_path $org_tnl2k_path $org_trackingnet_path $org_uav_path)

# === Set Data Destination Path === #
# Set ARTrack Master Path
master_path=$PWD

# Destination Paths
dest_got10k_path=$master_path/data/got10k
dest_lasot_path=$master_path/data/lasot
dest_lasotext_path=$master_path/data/lasot_extension_subset
dest_nfs_path=$master_path/data/nfs
dest_otb_path=$master_path/data/otb
dest_tc128_path=$master_path/data/TC128
dest_tnl2k_path=$master_path/data/tnl2k
dest_trackingnet_path=$master_path/data/trackingnet
dest_uav_path=$master_path/data/uav

# Array of Destination Path
dest_path_arr=( $dest_got10k_path $dest_lasot_path $dest_lasotext_path $dest_nfs_path $dest_otb_path $dest_tc128_path $dest_tnl2k_path $dest_trackingnet_path $dest_uav_path )

# Loop through array (enumerate) and establish soft-links
N=${#dest_path_arr[@]}
for (( j=0; j<${N}; j++ )); do
  org_path=${org_path_arr[j]}
  dest_path=${dest_path_arr[j]}

  # If Original Path is None, Continue to next iteration
  if [[ "${org_path}" == "none" ]]; then
    continue
  # If Original Path Folder does not exist, then raise error
  elif [ ! -d "${org_path}" ]; then
    echo "Path '${org_path}' is not a valid folder..!"
    exit 1
  fi

  # Soft Link between original and destination paths
  ln -s ${org_path} ${dest_path}
  echo "Soft Link between [Org]: '${org_path}' and [Dest]: '${dest_path}' established..!"
done
