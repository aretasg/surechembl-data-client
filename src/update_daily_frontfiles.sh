/<PATH_TO_MINICONDA>/miniconda3/envs/schembl-data-client-env/bin/python \
/<PATH_TO_CLIENT>/surechembl-data-client/src/update.py scftp <FTP_PSW> \
sc_client surechembl --db_type postgres --db_host <HOST_NAME> --db_port 5432 \
--db_name <DB_NAME> --working_dir . --date $(date --date="1 day ago" +"%Y%m%d") --all
