# bash script to load frontfiles - modify variables denoted with '</>' according to your system and execute with nohup
# bash ./src/update_all_backfiles.sh <start_year> <end_year>
for i in $(seq $1 $2 $END); do
    python ./src/update.py scftp <FTP_PSW> sc_client surechembl --db_type postgres --db_host <HOST_NAME> \
    --db_port 5432 --db_name <DB_NAME> --working_dir . --year $i
done
