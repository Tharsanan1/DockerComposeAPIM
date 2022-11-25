echo "Running main.sh"

if [ $# -eq 0 ]
    then
        echo "No arguments supplied, hence starting APIM as single server"
        sh wso2am-3.2.0/bin/wso2server.sh
    else
        echo "Argument received: $1"
        echo "Rrying to setup profile"
        sh wso2am-3.2.0/bin/profileSetup.sh "$1"
        # Remove mysql entry
        sed -i -- 's/\[database.apim_db\]/\[test.test1\]/g' wso2am-3.2.0/repository/conf/deployment.toml
        sed -i -- 's/\[database.shared_db\]/\[test.test2\]/g' wso2am-3.2.0/repository/conf/deployment.toml
        echo "" >> wso2am-3.2.0/repository/conf/deployment.toml
        cat h2-database-config.toml >> wso2am-3.2.0/repository/conf/deployment.toml
        cat wso2am-3.2.0/repository/conf/deployment.toml
        sh wso2am-3.2.0/bin/wso2server.sh
fi