configs_list_file=$(dirname "$0")"/config-files-list.txt"
dest_dir_path=$(dirname "$0")"/../settings"

backup_config () {
  # echo config line "$1"
  set $1
  dest_path="$1"
  src_path="$2"
  dest_full_path="$dest_dir_path/$dest_path"
  echo copy "'$dest_full_path'" to "'$src_path'"
  cp "$dest_full_path" "$src_path"
}


echo "$dest_dir_path"
cat "$configs_list_file" | envsubst | while read config
do
  backup_config "$config"
done