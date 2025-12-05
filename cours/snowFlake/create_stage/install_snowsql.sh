#!/bin/bash

# Télécharger l'installateur SnowSQL depuis Snowflake
wget https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.3/linux_x86_64/snowsql-1.3.3-linux_x86_64.bash

# Rendre le script exécutable
chmod +x snowsql-1.3.3-linux_x86_64.bash

# Lancer l'installation
./snowsql-1.3.3-linux_x86_64.bash
