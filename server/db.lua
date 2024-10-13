AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        local sqlQuery = [[            
            CREATE TABLE IF NOT EXISTS `properties` (
                `property_id` int(11) NOT NULL AUTO_INCREMENT,
                `owner_citizenid` varchar(50) NULL,
                `street` VARCHAR(100) NULL,
                `region` VARCHAR(100) NULL,
                `description` LONGTEXT NULL,
                `has_access` JSON NULL DEFAULT (JSON_ARRAY()), -- [citizenid1, citizenid2, ...]
                `extra_imgs` JSON NULL DEFAULT (JSON_ARRAY()),
                `furnitures` JSON NULL DEFAULT (JSON_ARRAY()),
                `for_sale` boolean NOT NULL DEFAULT 1,
                `price` int(11) NOT NULL DEFAULT 0,
                `shell` varchar(50) NOT NULL,
                `apartment` varchar(50) NULL DEFAULT NULL, -- if NULL then it's a house
                `door_data` JSON NULL DEFAULT NULL, -- {"x": 0.0, "y": 0.0, "z": 0.0, "h": 0.0, "length": 0.0, "width": 0.0}
                `garage_data` JSON NULL DEFAULT NULL, -- {"x": 0.0, "y": 0.0, "z": 0.0} -- NULL if no garage
                `zone_data` JSON NULL DEFAULT NULL,
                PRIMARY KEY (`property_id`),
                CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON UPDATE CASCADE ON DELETE CASCADE,
                CONSTRAINT `UQ_owner_apartment` UNIQUE (`owner_citizenid`, `apartment`) -- A character can only own one apartment
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ]]

        -- Executa a query
        exports.oxmysql:execute(sqlQuery, {}, function(result)
            if result then
                print("Tabela `properties` carregada com sucesso!")
            else
                print("Falha ao criar a tabela `properties`.")
            end
        end)
    end
end)
