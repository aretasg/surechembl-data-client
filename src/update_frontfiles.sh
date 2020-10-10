# bash script to load frontfiles - modify variables denoted with '</>' according to your system and execute with nohup
# bash ./src/update_all_frontfiles.sh 2020
d=$1-01-01
while [ "$d" != $1-12-31 ]; do
    date -d"$d" "+%Y%m%d"
    python ./src/update.py scftp <FTP_PSW> sc_client surechembl --db_type postgres --db_host <HOST_NAME> \
    --db_port 5432 --db_name <DB_NAME> --working_dir . --date $(date -d"$d" "+%Y%m%d") --all
    d=$(date -I -d "$d + 1 day")
done
