PropertiesTable = {}
ApartmentsTable = {}

exports('GetProperties', function() return PropertiesTable end)
exports('GetApartments', function() return ApartmentsTable end)

Config = {}

-- If you're not utilizing ox_lib, it's time to question your approach.
Config.Target = "ox" -- "ox" or "qb"
Config.Notify = "ox" -- "ox" or "qb"
Config.Radial = "ox" -- "ox" or "qb"
Config.Inventory = "ox" -- "ox" or "qb"
Config.Logs = "qb" -- "qb"

-- Anyone provided with keys to a property has the ability to modify its furnishings.
Config.AccessCanEditFurniture = true

-- Draw the poly for the property
Config.DebugMode = false

function Debug(...)
    if Config.DebugMode then
        print(...)
    end
end

-- Log System
Config.EnableLogs = true

-- Enables Dynamic Doors
Config.DynamicDoors = true

Config.PoliceJobNames = {  -- add multiple police jobs that are allowed to raid properties!
    "police",
    -- "police2",
    -- "police3",
}

Config.MinGradeToRaid = 3  -- Minimum grade to raid a property

Config.RaidTimer = 5  -- 5 minutes

Config.RaidItem = "police_stormram"  -- The item required to raid a property

-- If you are using ox_inventory, it is encouraged to use the consume property within data/items.lua and keeping this config option false
Config.ConsumeRaidItem = false          -- Whether or not to consume the raid item upon successful entry.

-- Set your Real Estate jobs here
Config.RealtorJobNames = { -- add multiple realestate jobs that are allowed to sell properties!
    "realestate",
    -- "realestate2",
    -- "realestate3",
}

-- If you are utilizing qb-banking and wish for the funds to be deposited directly into the Realestate bank account, set this value to true. 
-- In case you are using an alternative Boss Menu, replace the qb-banking export with the appropriate script export or event.
Config.QBManagement = false

-- Realtor Commisions based on job grade, the rest goes to the owner, if any.
Config.Commissions = {
    [0] = 0.05, -- 5% commision for each sale
    [1] = 0.10,
    [2] = 0.15,
    [3] = 0.20,
    [4] = 0.25,
}

-- Set this value to false if you don't want to assign a starting apartment.
Config.StartingApartment = true

--- With this enabled, the customizer will open when starting apartment is false.
Config.ShowCustomizerWhenNoStartingApartment = true

Config.Apartments = {
    ["Integrity Way"] = {
        label = "Integrity Way",
        door = { x = 269.73, y = -640.75, z = 42.02, h = 249.07, length = 1, width = 2 },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/e5a352a3-afb1-4452-ab52-e239e53d901a.png",
                label = "Outside",
            },
        },
        shell = "Cabana 01",
    },

    ["South Rockford Drive"] = {
        label = "South Rockford Drive",
        door = { x = -667.02, y = -1105.24, z = 14.63, h = 242.32, length = 1, width = 2 },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/aa88b5df-c4c8-4706-beb0-8d8197e0ccff.png",
                label = "Outside",
            },
        },
        shell = "Cabana 01",
    },

    ['Morningwood Blvd'] = {
        label = 'Morningwood Blvd',
        door = { x = -1288.52, y = -430.51, z = 35.15, h = 124.81, length = 1, width = 2 },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/c53dbc10-d161-4b34-a095-316949588f33.png",
                label = "Outside",
            },
        },
        shell = "Cabana 01",
    },

    ['Tinsel Towers'] = {
        label = 'Tinsel Towers',
        door = { x = -619.29, y = 37.69, z = 43.59, h = 181.03, length = 1, width = 2 },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/0663c90e-2e90-426d-80ea-a780727b4a76.png",
                label = "Outside",
            },
        },
        shell = "Cabana 01",
    },

    ['Fantastic Plaza'] = {
        label = 'Fantastic Plaza',
        door = { x = 291.517, y = -1078.674, z = 29.405, h = 270.75, length = 1, width = 2 },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/d618a25e-2f88-47c5-b065-515cbd34cb3f.png",
                label = "Outside",
            },
        },
        shell = "Cabana 01",
    },

    ---ipl
    ['Modern 1 Apartment'] = {
        label = 'Modern 1 Apartment',
        door = { x = -771.18, y = 319.64, z = 85.66, h = 351.95, length = 1, width = 2 },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/d618a25e-2f88-47c5-b065-515cbd34cb3f.png",
                label = "Outside",
            },
        },
        interior = vector3(-786.8663, 315.7642, 217.6385),
        thickness = 7.5,
        zone = {
            vector3(-787.3, 317.37, 219.5),
            vector3(-787.29, 314.34, 219.5),
            vector3(-780.56, 314.15, 219.5),
            vector3(-780.54, 343.62, 219.5),
            vector3(-793.98, 343.54, 219.5),
            vector3(-793.33, 333.82, 219.5),
            vector3(-794.68, 339.83, 219.5),
            vector3(-800.69, 339.94, 219.5),
            vector3(-807.54, 334.88, 219.5),
            vector3(-807.29, 331.75, 219.5),
            vector3(-799.8, 321.23, 219.5)
        },
        shell = "Cabana 01",
    },
}

-- Shells provided by Gordela store https://gordela-store.tebex.io/package/6493356
Config.Shells = {
    ["mlo"] = {
        label = "Mlo",
        doorOffset = { x = -0.5, y = -2.3, z = 0.0, h = 90.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/e39bd4a6-bc3f-41e7-876e-cc03d77f953b.jpg",
                label = "Motel",
            },
        }
    },

    ["Standard Motel"] = {
        label = "Standard Motel",
        hash = 'standardmotel_shell',
        doorOffset = { x = -0.5, y = -2.3, z = 0.0, h = 90.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/fb1f1038-2b38-4cee-b031-e0bca4c108ed.webp",
                label = "Motel",
            },
        }
    },

    ["Modern Hotel"] = {
        label = "Modern Hotel",
        hash = 'modernhotel_shell',
        doorOffset = { x = 4.98, y = 4.35, z = 0.0, h = 179.79, width = 2.0  },
        stash = {
            maxweight = 150000,
            slots = 20,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/33d4b3e2-9c5a-43d8-a43e-f111f25a62df.webp",
                label = "Angle 1",
            },
            {
                url = "https://files.fivemerr.com/images/7dc8efd9-d2c7-4878-a7d7-74d69e47cc96.webp",
                label = "Angle 2",
            },
        }
    },

    ["Apartment Furnished"] = {
        label = "Apartment Furnished",
        hash = 'furnitured_midapart',
        doorOffset = { x = 1.44, y = -10.25, z = 0.0, h = 0.0, width = 1.5  },
        stash = {
            maxweight = 200000,
            slots = 25,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/884a835f-9d5d-4121-8576-b23c51f48a00.webp",
                label = "Bathroom",
            },
            {
                url = "https://files.fivemerr.com/images/3381c0b8-1e57-4aa7-bb61-5b1202523db9.webp",
                label = "Bedroom",
            },
            {
                url = "https://files.fivemerr.com/images/5b5b66a5-50f5-437c-9fb8-ebb5a7ecec11.webp",
                label = "Entrance",
            },
            {
                url = "https://files.fivemerr.com/images/5e07d5e9-c069-4db1-a677-d2d0a02def70.webp",
                label = "Kitchen and Dining",
            },
            {
                url = "https://files.fivemerr.com/images/41998ae1-e2f0-4e8a-b9e3-4613e46b3356.webp",
                label = "Living Room Angle 1",
            },
            {
                url = "https://files.fivemerr.com/images/b60325be-e75c-4985-89f2-6e2dfe65951c.webp",
                label = "Living Room Angle 2",
            },
        },
    },

    ["Apartment Unfurnished"] = {
        label = "Apartment Unfurnished",
        hash = 'shell_v16mid',
        doorOffset = { x = 1.34, y = -14.36, z = -0.5, h = 354.08, width = 1.5  },
        stash = {
            maxweight = 200000,
            slots = 25,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/90238f10-e65e-4c89-a879-6be664194258.webp",
                label = "Bathroom",
            },
            {
                url = "https://files.fivemerr.com/images/edfcda70-bca6-419c-84b5-11e173e9edc3.webp",
                label = "Bedroom",
            },
            {
                url = "https://files.fivemerr.com/images/aed9c846-7314-4869-948f-3262e1d141ee.webp",
                label = "Entrance",
            },
            {
                url = "https://files.fivemerr.com/images/a51a4844-2141-472f-bde2-0c07a940ddd0.webp",
                label = "Kitchen",
            },
            {
                url = "https://files.fivemerr.com/images/bcbc0b02-5648-4eb2-bd16-5585a2f14e12.webp",
                label = "Living Room",
            },
        },
    },

    ["Apartment 2 Unfurnished"] = {
        label = "Apartment 2 Unfurnished",
        hash = 'shell_v16low',
        doorOffset = { x = 4.69, y = -6.5, z = -1.0, h = 358.50, width = 1.5  },
        stash = {
            maxweight = 200000,
            slots = 25,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/6e111f0d-a663-4baf-9f64-e38e8c2c6cf8.webp",
                label = "Entrance",
            },
            {
                url = "https://files.fivemerr.com/images/5202fb7b-c178-4a30-8113-2b5d7bd45ea8.webp",
                label = "Kitchen",
            },
            {
                url = "https://files.fivemerr.com/images/f3676be4-49c5-4b4a-9c56-e5ceb228329c.webp",
                label = "Living Room",
            },
        },
    },

    ["Garage"] = {
        label = "Garage",
        hash = 'shell_garagem',
        doorOffset = { x = 14.0, y = 1.7, z = -0.76, h = 88.49, width = 2.0  },
        stash = {
            maxweight = 500000,
            slots = 50,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/dad29136-63f4-486a-8b0c-73bf6717ac10.webp",
                label = "Entrance",
            },
            {
                url = "https://files.fivemerr.com/images/b94621eb-1c3d-4cd6-b849-bd74fe94b601.webp",
                label = "Garage",
            },
        },
    },

    ["Office"] = {
        label = "Office",
        hash = 'shell_office1',
        doorOffset = { x = 1.2, y = 4.90, z = -0.73, h = 180.0, width = 2.0  },
        stash = {
            maxweight = 250000,
            slots = 30,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/b6894303-56a5-4ed6-9c3c-3108563b32b5.webp",
                label = "Entance",
            },
            {
                url = "https://files.fivemerr.com/images/938945b9-fa86-4b88-8264-870c8d25b780.webp",
                label = "Office",
            },
        },
    },

    ["Store"] = {
        label = "Store",
        hash = 'shell_store1',
        doorOffset = { x = -2.69, y = -4.56, z = -0.62, h = 1.91, width = 2.0  },
        stash = {
            maxweight = 500000,
            slots = 50,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/4b071bca-fd50-4d41-ba83-f9080c2da0be.webp",
                label = "Room 1",
            },
            {
                url = "https://files.fivemerr.com/images/ef1ccd1f-85b8-4681-abdd-c798b73eb1e2.webp",
                label = "Room 2",
            },
        },
    },

    ["Warehouse"] = {
        label = "Warehouse",
        hash = 'shell_warehouse1',
        doorOffset = { x = -8.96, y = 0.11, z = -0.95, h = 270.64, width = 2.0  },
        stash = {
            maxweight = 1000000,
            slots = 100,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/35d75b18-aa4f-4226-9b42-8e8ceb723946.webp",
                label = "Angle 1",
            },
            {
                url = "https://files.fivemerr.com/images/b25f0c5d-9c6a-43e4-b082-eac8d1730f98.webp",
                label = "Angle 2",
            },
        },
    },

    ["Container"] = {
        label = "Container",
        hash = 'container_shell',
        doorOffset = { x = 0.05, y = -5.7, z = -0.22, h = 1.7, width = 2.2  },
        stash = {
            maxweight = 500000,
            slots = 100,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/29930411-18a3-4e39-bb4b-80bb5ca9c233.webp",
                label = "Container",
            },
        },
    },

    ["2 Floor House"] = {
        label = "2 Floor House",
        hash = 'shell_michael',
        doorOffset = { x = -9.6, y = 5.63, z = -4.07, h = 268.55, width = 2.0  },
        stash = {
            maxweight = 300000,
            slots = 50,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/5b3fc4b4-fbc7-4020-bb63-50d5bd5ae1ca.webp",
                label = "Bathroom",
            },
            {
                url = "https://files.fivemerr.com/images/a7537dd9-94d7-47ad-bd74-ae3c7fc728d3.webp",
                label = "Entrance",
            },
            {
                url = "https://files.fivemerr.com/images/75f3cc72-ace3-40af-836f-40112fde2ba8.webp",
                label = "Floor 2",
            },
            {
                url = "https://files.fivemerr.com/images/348e6af7-f247-49a0-a4d4-e99995f20d7f.webp",
                label = "Kitchen",
            },
            {
                url = "https://files.fivemerr.com/images/9e8689a9-5860-41b5-b5f1-df9f68cfaea2.webp",
                label = "Living Room",
            },
            {
                url = "https://files.fivemerr.com/images/e4cb286e-acb2-42a4-b41a-e31b0482d7a7.webp",
                label = "Room 1",
            },
            {
                url = "https://files.fivemerr.com/images/b3c0eeec-b5e7-4f41-a82b-f4bdf954c1a7.webp",
                label = "Room 2",
            },
            {
                url = "https://files.fivemerr.com/images/0f327cda-e432-4fd3-9002-973544f3b46a.webp",
                label = "Room 3",
            },
            {
                url = "https://files.fivemerr.com/images/5e2e0778-2709-4bb0-a17d-ac6154fdbd77.webp",
                label = "Room 3 Dresser",
            },
        },
    },

    ["House 1"] = {
        label = "House 1",
        hash = 'shell_frankaunt',
        doorOffset = { x = -0.34, y = -5.97, z = -0.57, h = 357.23, width = 2.0  },
        stash = {
            maxweight = 200000,
            slots = 50,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/5b3fc4b4-fbc7-4020-bb63-50d5bd5ae1ca.webp",
                label = "Bathroom",
            },
            {
                url = "https://files.fivemerr.com/images/71df6160-68b0-4233-a8df-abc0b76401a0.webp",
                label = "Dining Room",
            },
            {
                url = "https://files.fivemerr.com/images/5830cc1b-fd3b-4ff5-8e7b-4a9c81725daf.webp",
                label = "Entrance",
            },
            {
                url = "https://files.fivemerr.com/images/7be14444-b37c-4ad1-b215-e126525f23b0.webp",
                label = "Kitchen",
            },
            {
                url = "https://files.fivemerr.com/images/f7e3d82b-26d3-4550-acdb-a5d6f2aacdce.webp",
                label = "Living Room",
            },
            {
                url = "https://files.fivemerr.com/images/b0d64302-f411-40fd-9d08-b2c19473960b.webp",
                label = "Room 1",
            },
            {
                url = "https://files.fivemerr.com/images/5b3fc4b4-fbc7-4020-bb63-50d5bd5ae1ca.webp",
                label = "Room 2",
            },
        },
    },

    ["House 2"] = {
        label = "House 2",
        hash = 'shell_ranch',
        doorOffset = { x = -1.23, y = -5.54, z = -1.1, h = 272.21, width = 2.0  },
        stash = {
            maxweight = 500000,
            slots = 50,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/5f9b5a4a-d607-4fef-954e-aab0c25457d6.webp",
                label = "Entrance",
            },
            {
                url = "https://files.fivemerr.com/images/31be06b1-d092-41e4-bd90-b23ca06fdf51.webp",
                label = "Hallway",
            },
            {
                url = "https://files.fivemerr.com/images/a498685d-31bc-487c-83be-d479529dc36e.webp",
                label = "Kitchen",
            },
            {
                url = "https://files.fivemerr.com/images/87cbc4d9-e3aa-4709-9504-26a56816b3d9.webp",
                label = "Main Area",
            },
            {
                url = "https://files.fivemerr.com/images/2bc3d6b6-3d22-4865-82dd-594c2d48fad9.webp",
                label = "Room",
            },
        },
    },

    ["House 3"] = {
        label = "House 3",
        hash = 'shell_lester',
        doorOffset = { x = -1.61, y = -6.02, z = -0.37, h = 357.7, width = 2.0  },
        stash = {
            maxweight = 15000,
            slots = 20,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/c43c554f-8bc4-4028-9d6e-599aff60c4e8.jpeg",
                label = "Angle 1",
            },
            {
                url = "https://files.fivemerr.com/images/a2cf4128-2d3a-4aa4-a19b-186edc7813c5.jpeg",
                label = "Angle 2",
            },
            {
                url = "https://files.fivemerr.com/images/5a669e54-2080-45fd-bf8c-0dd9075e3258.jpeg",
                label = "Entrance",
            },
        },
    },

    ["House 4"] = {
        label = "House 4",
        hash = 'shell_trevor',
        doorOffset = { x = 0.2, y = -3.82, z = -0.41, h = 358.4, width = 2.0  },
        stash = {
            maxweight = 10000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/cfc6d14e-d198-427a-a45c-fa1e0b1a8121.webp",
                label = "Bathroom",
            },
            {
                url = "https://files.fivemerr.com/images/30f5c5b2-8591-4fef-9ebf-2095c508605b.webp",
                label = "Entrance",
            },
            {
                url = "https://files.fivemerr.com/images/9babd5ff-7421-4a38-9b86-4900b3c0901f.webp",
                label = "Kitchen",
            },
            {
                url = "https://files.fivemerr.com/images/d2dda0ca-aa9d-4826-9cd0-be6e1ee37f6b.webp",
                label = "Living Room",
            },
            {
                url = "https://files.fivemerr.com/images/9309b115-3266-48af-952d-cdcb39573b3e.webp",
                label = "Room 1",
            },
            {
                url = "https://files.fivemerr.com/images/2c5625ed-af05-49f3-a7ca-256fef131988.webp",
                label = "Room 2",
            },
        },
    },

    ["Trailer"] = {
        label = "Trailer",
        hash = 'shell_trailer',
        doorOffset = { x = -1.27, y = -2.08, z = -0.48, h = 358.84, width = 2.0  },
        stash = {
            maxweight = 10000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/a52b4053-ffb5-430c-a578-1aa09ebea723.webp",
                label = "Entrance and Kitchen",
            },
            {
                url = "https://files.fivemerr.com/images/603bc770-1a8f-43a1-b8d2-d15f9af87f59.webp",
                label = "Main",
            },
            {
                url = "https://files.fivemerr.com/images/222716c0-9a27-4269-8c5b-698c218ec2d9.webp",
                label = "Room",
            },
        },
    },
    
    ["Casa Média 01"] = {
        label = "Casa Média 01",
        hash = 'gg_shell_01',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/3aceba45-9201-46c0-a041-2acccb5d0f9d.png",
                label = "Motel",
            },
        }
    },
    ["Trailer 01"] = {
        label = "Trailer 01",
        hash = 'gg_shell_02',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/57411dde-126f-437a-a261-a1b464718067.png",
                label = "Motel",
            },
        }
    },
    ["Mansão 01"] = {
        label = "Mansão 01",
        hash = 'gg_shell_03',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/e993d749-bcc2-4d42-a891-4f557ad24928.png",
                label = "Motel",
            },
        }
    },
    ["Mansão 02"] = {
        label = "Mansão 02",
        hash = 'gg_shell_04',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/a3a293d6-74f4-4fc7-90de-641af9c515ad.png",
                label = "Motel",
            },
        }
    },
    ["Quitinete 01"] = {
        label = "Quitinete 01",
        hash = 'gg_shell_05',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/6e825ff9-aed5-4f4c-9419-444a4889ceaa.png   ",
                label = "Motel",
            },
        }
    },
    ["Casa Média 02"] = {
        label = "Casa Média 02",
        hash = 'gg_shell_06',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/cd3603f1-b433-4a9c-bb4d-325893f13a1f.png",
                label = "Motel",
            },
        }
    },
    ["Casa Média 03"] = {
        label = "Casa Média 03",
        hash = 'gg_shell_07',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/3dd75c62-cdf0-4b26-aa5e-db2e4a7c0196.png",
                label = "Motel",
            },
        }
    },
    ["Quitinete 02"] = {
        label = "Quitinete 02",
        hash = 'gg_shell_08',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/0248324d-7106-4be2-b3cb-9f74bbde59f2.png",
                label = "Motel",
            },
        }
    },
    ["Container 01"] = {
        label = "Container 01",
        hash = 'gg_shell_09',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/e320c2c6-fc22-4d35-a228-26f0c6b93343.png",
                label = "Motel",
            },
        }
    },
    ["Casa Média 04"] = {
        label = "Casa Média 04",
        hash = 'gg_shell_10',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/7719b446-0c41-4309-afe8-88f7e2618977.png",
                label = "Motel",
            },
        }
    },
    ["Casa Média 05"] = {
        label = "Casa Média 05",
        hash = 'gg_shell_11',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/193cd9f8-f2e2-424b-b8cd-b10223a7d390.png",
                label = "Motel",
            },
        }
    },
    ["Casa Média 06"] = {
        label = "Casa Média 06",
        hash = 'gg_shell_12',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/7e812446-2b65-4e4c-afbf-f8ed76559af8.png",
                label = "Motel",
            },
        }
    },
    ["Casa favela 01"] = {
        label = "Casa favela 01",
        hash = 'gg_shell_13',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/7fc14392-7048-4493-91b9-9c22e6bbb0b1.png",
                label = "Motel",
            },
        }
    },
    ["Casa favela 02"] = {
        label = "Casa favela 02",
        hash = 'gg_shell_14',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/40a9cd68-3a1a-49d3-9479-02b438f20228.png",
                label = "Motel",
            },
        }
    },
    ["Cabana 01"] = {
        label = "Cabana 01",
        hash = 'gg_shell_15',
        doorOffset = { x = 0.0, y = 0.0, z = 0.0, h = 0.0, width = 1.5 },
        stash = {
            maxweight = 100000,
            slots = 12,
        },
        imgs = {
            {
                url = "https://files.fivemerr.com/images/87d2e753-fc37-43c6-8544-fb3e9bdd2727.png",
                label = "Motel",
            },
        }
    },
}

Config.FurnitureTypes = {
    ["storage"] = function(entity, property_id, shell, id)
        local stash = ("property_%s"):format(property_id)
        id = type(id) == "boolean" and stash or stash..id

        -- Framework[Config.Inventory].RegisterInventory(stash, label, Config.Shells[shell].stash)

        Framework[Config.Target].AddTargetEntity(entity, "Baú", "fas fa-box-open", function()
            local stashConfig = Config.Shells[shell].stash
            Framework[Config.Inventory].OpenInventory('property_'..property_id, stashConfig, property_id)
        end)

        local property = Property.Get(property_id)
        property.storageTarget = property.storageTarget or {}
        property.storageTarget[entity] = id
    end,

    ["clothing"] = function(entity, property_id)
        Framework[Config.Target].AddTargetEntity(entity, "Clothing", "fas fa-shirt", function()
            local heading = GetEntityHeading(cache.ped)
            SetEntityHeading(cache.ped, heading - 180.0)
            TriggerEvent("qb-clothing:client:openOutfitMenu")
        end)

        local property = Property.Get(property_id)
        property.clothingTarget = entity
    end
}

Config.Furnitures = {
    {
        category = "Pré-requisitos",
        items = {
            { ["object"] = "v_res_tre_storagebox", ["price"] = 100, ["label"] = "Baú", ["type"] = "storage", ["max"] = 2 },
            { ["object"] = "v_res_tre_wardrobe", ["price"] = 100, ["label"] = "Guarda-Roupas", ["type"] = "clothing", ["max"] = 2 },
        }
    },

    {
        category = "sofás",
        items = {
            { ["object"] = "miss_rub_couch_01", ["price"] = 300, ["label"] = "Sofá velho" },
            { ["object"] = "prop_fib_3b_bench", ["price"] = 700, ["label"] = "Sofá de três lugares" },
            { ["object"] = "prop_ld_farm_chair01", ["price"] = 250, ["label"] = "Cadeira velha" },
            { ["object"] = "prop_ld_farm_couch01", ["price"] = 300, ["label"] = "Sofá de três lugares velho" },
            { ["object"] = "prop_ld_farm_couch02", ["price"] = 300, ["label"] = "Sofá listrado velho" },
            { ["object"] = "v_res_d_armchair", ["price"] = 300, ["label"] = "Sofá de 1 lugar amarelo velho" },
            { ["object"] = "v_res_fh_sofa", ["price"] = 3700, ["label"] = "sofá de canto" },
            { ["object"] = "v_res_mp_sofa", ["price"] = 3700, ["label"] = "sofá de canto 2" },
            { ["object"] = "v_res_d_sofa", ["price"] = 700, ["label"] = "sofá 1" },
            { ["object"] = "v_res_j_sofa", ["price"] = 700, ["label"] = "Sofá 2" },
            { ["object"] = "v_res_mp_stripchair", ["price"] = 700, ["label"] = "Sofá 3" },
            { ["object"] = "v_res_m_h_sofa_sml", ["price"] = 700, ["label"] = "Sofá 4" },
            { ["object"] = "v_res_r_sofa", ["price"] = 700, ["label"] = "Sofá 5" },
            { ["object"] = "v_res_tre_sofa", ["price"] = 700, ["label"] = "Sofá 6" },
            { ["object"] = "v_res_tre_sofa_mess_a", ["price"] = 700, ["label"] = "Sofá 7" },
            { ["object"] = "v_res_tre_sofa_mess_b", ["price"] = 700, ["label"] = "Sofá 8" },
            { ["object"] = "v_res_tre_sofa_mess_c", ["price"] = 700, ["label"] = "Sofá 9" },
            { ["object"] = "v_res_tt_sofa", ["price"] = 700, ["label"] = "Sofá 10" },
            { ["object"] = "prop_rub_couch02", ["price"] = 700, ["label"] = "Sofá 11" },
            { ["object"] = "v_ilev_m_sofa", ["price"] = 2000, ["label"] = "Sofá branco" },
            { ["object"] = "v_med_p_sofa", ["price"] = 1000, ["label"] = "Sofá de couro marrom" },
            { ["object"] = "v_club_officesofa", ["price"] = 500, ["label"] = "Sofá pobre vermelho" },
            { ["object"] = "bkr_prop_clubhouse_sofa_01a", ["price"] = 1000, ["label"] = "Sofá preto" },
            { ["object"] = "apa_mp_h_stn_sofacorn_01", ["price"] = 5000, ["label"] = "sofá de canto 3" },
            { ["object"] = "prop_couch_lg_02", ["price"] = 1000, ["label"] = "Sofá de madeira" },
            { ["object"] = "apa_mp_h_stn_sofacorn_10", ["price"] = 5000, ["label"] = "sofá de canto 4" },
            { ["object"] = "apa_mp_h_yacht_sofa_02", ["price"] = 1000, ["label"] = "Sofá marrom" },
            { ["object"] = "apa_mp_h_yacht_sofa_01", ["price"] = 5000, ["label"] = "Sofá branco longo" },
            { ["object"] = "prop_couch_01", ["price"] = 1000, ["label"] = "Almofadas do sofá" },
            { ["object"] = "prop_couch_03", ["price"] = 1000, ["label"] = "Sofá amarelo" },
            { ["object"] = "prop_couch_04", ["price"] = 1000, ["label"] = "Almofadas de sofá de couro" },
            { ["object"] = "prop_couch_lg_05", ["price"] = 500, ["label"] = "Sofá de veludo cotelê" },
            { ["object"] = "prop_couch_lg_06", ["price"] = 1000, ["label"] = "Sofá de couro marrom 2" },
            { ["object"] = "prop_couch_lg_07", ["price"] = 1000, ["label"] = "Almofadas do sofá 2" },
            { ["object"] = "prop_couch_lg_08", ["price"] = 1000, ["label"] = "Sofá de couro marrom 3" },
            { ["object"] = "prop_couch_sm1_07", ["price"] = 500, ["label"] = "Sofá de couro de canto" },
            { ["object"] = "prop_couch_sm2_07", ["price"] = 500, ["label"] = "Sofá de couro reto" },
            { ["object"] = "prop_couch_sm_06", ["price"] = 500, ["label"] = "Sofá de couro pequeno" },
            { ["object"] = "apa_mp_h_stn_sofa2seat_02", ["price"] = 1000, ["label"] = "Namoradeira" },
            { ["object"] = "apa_mp_h_stn_sofacorn_05", ["price"] = 5000, ["label"] = "Sofá de canto 5" },
            { ["object"] = "apa_mp_h_stn_sofacorn_06", ["price"] = 5000, ["label"] = "Sofá de canto 6" },
            { ["object"] = "apa_mp_h_stn_sofacorn_07", ["price"] = 5000, ["label"] = "Sofá de canto 7" },
            { ["object"] = "apa_mp_h_stn_sofacorn_08", ["price"] = 5000, ["label"] = "Sofá de canto 8" },
            { ["object"] = "apa_mp_h_stn_sofacorn_09", ["price"] = 5000, ["label"] = "Sofá de canto 9" },
            { ["object"] = "ex_mp_h_off_sofa_003", ["price"] = 1000, ["label"] = "Sofá de tecido azul" },
            { ["object"] = "ex_mp_h_off_sofa_01", ["price"] = 1000, ["label"] = "Sofá de couro branco" },
            { ["object"] = "ex_mp_h_off_sofa_02", ["price"] = 1000, ["label"] = "Sofá de couro preto" },
            { ["object"] = "hei_heist_stn_sofa2seat_03", ["price"] = 1000, ["label"] = "Sofá moderno" },
            { ["object"] = "hei_heist_stn_sofa2seat_06", ["price"] = 1000, ["label"] = "Sofá marrom" },
            { ["object"] = "hei_heist_stn_sofa3seat_01", ["price"] = 1000, ["label"] = "Chaise longue" },
            { ["object"] = "hei_heist_stn_sofa3seat_02", ["price"] = 1000, ["label"] = "Sofá moderno 2" },
            { ["object"] = "hei_heist_stn_sofa3seat_06", ["price"] = 1000, ["label"] = "Sofá moderno 3" },
            { ["object"] = "imp_prop_impexp_sofabed_01a", ["price"] = 1000, ["label"] = "Sofá-cama" },
            { ["object"] = "prop_t_sofa_02", ["price"] = 1000, ["label"] = "Sofá-cama 2" },
        }
    },

    {
        category = "Cadeiras",
        items = {
            { ["object"] = "v_res_d_highchair", ["price"] = 700, ["label"] = "Cadeira alta" },
            { ["object"] = "apa_mp_h_stn_chairstrip_03", ["price"] = 500, ["label"] = "Cadeira Sitchair 4" },
            { ["object"] = "v_res_fa_chair01", ["price"] = 700, ["label"] = "Cadeira 1" },
            { ["object"] = "v_res_fa_chair02", ["price"] = 700, ["label"] = "Cadeira 2" },
            { ["object"] = "v_res_fh_barcchair", ["price"] = 700, ["label"] = "Cadeira alta 2" },
            { ["object"] = "v_res_fh_dineeamesa", ["price"] = 700, ["label"] = "Cadeira de cozinha 1" },
            { ["object"] = "v_res_fh_dineeamesb", ["price"] = 700, ["label"] = "Cadeira de cozinha 2" },
            { ["object"] = "v_res_fh_dineeamesc", ["price"] = 700, ["label"] = "Cadeira de cozinha 3" },
            { ["object"] = "v_res_fh_easychair", ["price"] = 700, ["label"] = "Cadeira 3" },
            { ["object"] = "v_res_fh_kitnstool", ["price"] = 700, ["label"] = "Cadeira 4" },
            { ["object"] = "v_res_fh_singleseat", ["price"] = 700, ["label"] = "Cadeira alta 3" },
            { ["object"] = "v_res_jarmchair", ["price"] = 700, ["label"] = "Cadeira de braço" },
            { ["object"] = "v_res_j_dinechair", ["price"] = 700, ["label"] = "Cadeira de cozinha 4" },
            { ["object"] = "v_res_j_stool", ["price"] = 700, ["label"] = "Cadeira 5" },
            { ["object"] = "v_res_mbchair", ["price"] = 700, ["label"] = "Cadeira MB" },
            { ["object"] = "v_res_m_armchair", ["price"] = 700, ["label"] = "Cadeira de braço 2" },
            { ["object"] = "v_res_m_dinechair", ["price"] = 700, ["label"] = "Cadeira de cozinha 5" },
            { ["object"] = "v_res_study_chair", ["price"] = 700, ["label"] = "Cadeira de estudo" },
            { ["object"] = "v_res_trev_framechair", ["price"] = 700, ["label"] = "Estrutura da cadeira" },
            { ["object"] = "v_res_tre_chair", ["price"] = 700, ["label"] = "Cadeira 5" },
            { ["object"] = "v_res_tre_officechair", ["price"] = 700, ["label"] = "Cadeira de escritório" },
            { ["object"] = "v_res_tre_stool", ["price"] = 700, ["label"] = "Cadeira 6" },
            { ["object"] = "v_res_tre_stool_leather", ["price"] = 700, ["label"] = "Cadeira de couro" },
            { ["object"] = "v_res_tre_stool_scuz", ["price"] = 700, ["label"] = "Cadeira Scuz" },
            { ["object"] = "v_med_p_deskchair", ["price"] = 700, ["label"] = "Cadeira de mesa" },
            { ["object"] = "v_med_p_easychair", ["price"] = 700, ["label"] = "Cadeira confortável" },
            { ["object"] = "v_med_whickerchair1", ["price"] = 700, ["label"] = "Cadeira de vime" },
            { ["object"] = "prop_direct_chair_01", ["price"] = 700, ["label"] = "Cadeira direta" },
            { ["object"] = "prop_direct_chair_02", ["price"] = 700, ["label"] = "Cadeira direta 2" },
            { ["object"] = "prop_yacht_lounger", ["price"] = 700, ["label"] = "Cadeira de iate 1" },
            { ["object"] = "prop_yacht_seat_01", ["price"] = 700, ["label"] = "Cadeira de iate 2" },
            { ["object"] = "prop_yacht_seat_02", ["price"] = 700, ["label"] = "Cadeira de iate 3" },
            { ["object"] = "prop_yacht_seat_03", ["price"] = 700, ["label"] = "Cadeira de iate 4" },
            { ["object"] = "v_ret_chair_white", ["price"] = 100, ["label"] = "Cadeira branca" },
            { ["object"] = "v_ret_chair", ["price"] = 100, ["label"] = "Cadeira 7" },
            { ["object"] = "v_ret_ta_stool", ["price"] = 100, ["label"] = "Cadeira TA" },
            { ["object"] = "prop_cs_office_chair", ["price"] = 100, ["label"] = "Cadeira de Escritório 2" },
            { ["object"] = "apa_mp_h_yacht_armchair_01", ["price"] = 1000, ["label"] = "Poltrona branca" },
            { ["object"] = "v_club_barchair", ["price"] = 300, ["label"] = "Cadeira 8" },
            { ["object"] = "prop_off_chair_04", ["price"] = 300, ["label"] = "Cadeira de Mesa 2" },
            { ["object"] = "v_club_stagechair", ["price"] = 500, ["label"] = "Poltrona rosa" },
            { ["object"] = "v_club_officechair", ["price"] = 500, ["label"] = "Cadeira de Mesa 3" },
            { ["object"] = "prop_armchair_01", ["price"] = 500, ["label"] = "Cadeira de sentar" },
            { ["object"] = "prop_bar_stool_01", ["price"] = 300, ["label"] = "Cadeira de bar" },
            { ["object"] = "apa_mp_h_yacht_stool_01", ["price"] = 300, ["label"] = "Pufe branco" },
            { ["object"] = "apa_mp_h_stn_chairarm_12", ["price"] = 500, ["label"] = "Cadeira Sitchair 3" },
            { ["object"] = "apa_mp_h_stn_chairstool_12", ["price"] = 300, ["label"] = "Suporte para os pés" },
            { ["object"] = "prop_chair_03", ["price"] = 100, ["label"] = "Cadeira de madeira" },
            { ["object"] = "prop_couch_sm_05", ["price"] = 500, ["label"] = "Poltrona de veludo" },
            { ["object"] = "prop_couch_sm_07", ["price"] = 300, ["label"] = "Poltrona branca 2" },
            { ["object"] = "prop_couch_sm_02", ["price"] = 300, ["label"] = "Poltrona laranja" },
            { ["object"] = "apa_mp_h_stn_sofa_daybed_01", ["price"] = 500, ["label"] = "Cadeira lounge" },
            { ["object"] = "apa_mp_h_stn_sofa_daybed_02", ["price"] = 500, ["label"] = "Cadeira lounge 2" },
            { ["object"] = "apa_mp_h_din_chair_04", ["price"] = 500, ["label"] = "Cadeira moderna" },
            { ["object"] = "apa_mp_h_din_chair_08", ["price"] = 500, ["label"] = "Cadeira moderna 2" },
            { ["object"] = "apa_mp_h_din_chair_09", ["price"] = 500, ["label"] = "Cadeira moderna 3" },
            { ["object"] = "apa_mp_h_din_chair_12", ["price"] = 500, ["label"] = "Cadeira moderna 4" },
            { ["object"] = "apa_mp_h_din_stool_04", ["price"] = 500, ["label"] = "Cadeira moderna 5" },
            { ["object"] = "apa_mp_h_stn_chairarm_01", ["price"] = 500, ["label"] = "Cadeira moderna 6" },
            { ["object"] = "apa_mp_h_stn_chairarm_02", ["price"] = 500, ["label"] = "Cadeira moderna 7" },
            { ["object"] = "apa_mp_h_stn_chairarm_03", ["price"] = 500, ["label"] = "Cadeira moderna 8" },
            { ["object"] = "apa_mp_h_stn_chairarm_09", ["price"] = 500, ["label"] = "Cadeira moderna 9" },
            { ["object"] = "apa_mp_h_stn_chairarm_11", ["price"] = 500, ["label"] = "Cadeira moderna 10" },
            { ["object"] = "apa_mp_h_stn_chairarm_13", ["price"] = 500, ["label"] = "Cadeira moderna 11" },
            { ["object"] = "apa_mp_h_stn_chairarm_24", ["price"] = 500, ["label"] = "Cadeira moderna 12" },
            { ["object"] = "apa_mp_h_stn_chairarm_25", ["price"] = 500, ["label"] = "Cadeira moderna 13" },
            { ["object"] = "apa_mp_h_stn_chairarm_26", ["price"] = 500, ["label"] = "Cadeira moderna 14" },
            { ["object"] = "apa_mp_h_stn_chairstrip_04", ["price"] = 500, ["label"] = "Cadeira moderna 15" },
            { ["object"] = "apa_mp_h_stn_chairstrip_05", ["price"] = 500, ["label"] = "Cadeira moderna 16" },
            { ["object"] = "apa_mp_h_stn_chairstrip_08", ["price"] = 500, ["label"] = "Cadeira moderna 17" },
            { ["object"] = "apa_mp_h_stn_foot_stool_01", ["price"] = 500, ["label"] = "Pufe" },
            { ["object"] = "apa_mp_h_stn_foot_stool_02", ["price"] = 500, ["label"] = "Pufe 2" },
            { ["object"] = "apa_mp_h_yacht_barstool_01", ["price"] = 500, ["label"] = "Cadeira de bar 2" },
            { ["object"] = "ba_prop_int_glam_stool", ["price"] = 500, ["label"] = "Cadeira de bar 3" },
            { ["object"] = "ba_prop_battle_club_chair_01", ["price"] = 500, ["label"] = "Cadeira de escritório" },
            { ["object"] = "ba_prop_battle_club_chair_02", ["price"] = 500, ["label"] = "Cadeira de escritório 2" },
            { ["object"] = "ba_prop_battle_club_chair_03", ["price"] = 500, ["label"] = "Cadeira de escritório 3" },
            { ["object"] = "ba_prop_battle_control_seat", ["price"] = 500, ["label"] = "Cadeira de jogos" },
        }
    },

    {
        category = "Armários",
        items = {
            { ["object"] = "v_res_cabinet", ["price"] = 2500, ["label"] = "Armário Grande" },
            { ["object"] = "v_res_d_dressingtable", ["price"] = 2500, ["label"] = "Mesa de Maquiagem" },
            { ["object"] = "v_res_d_sideunit", ["price"] = 2500, ["label"] = "Unidade Lateral" },
            { ["object"] = "v_res_fh_sidebrddine", ["price"] = 2500, ["label"] = "Unidade Lateral" },
            { ["object"] = "v_res_fh_sidebrdlngb", ["price"] = 2500, ["label"] = "Unidade Lateral" },
            { ["object"] = "v_res_mbbedtable", ["price"] = 2500, ["label"] = "Unidade de Cama" },
            { ["object"] = "v_res_j_tvstand", ["price"] = 2500, ["label"] = "Unidade de TV" },
            { ["object"] = "v_res_mbdresser", ["price"] = 2500, ["label"] = "Unidade de Cômoda" },
            { ["object"] = "v_res_mbottoman", ["price"] = 2500, ["label"] = "Unidade de Banqueta" },
            { ["object"] = "v_res_mconsolemod", ["price"] = 2500, ["label"] = "Unidade de Console" },
            { ["object"] = "v_res_mcupboard", ["price"] = 2500, ["label"] = "Unidade de Armário" },
            { ["object"] = "v_res_mdchest", ["price"] = 2500, ["label"] = "Unidade de Baú" },
            { ["object"] = "v_res_msoncabinet", ["price"] = 2500, ["label"] = "Unidade de Alvenaria" },
            { ["object"] = "v_res_m_armoire", ["price"] = 2500, ["label"] = "Unidade de Guarda-Roupa" },
            { ["object"] = "v_res_m_sidetable", ["price"] = 2500, ["label"] = "Unidade Lateral" },
            { ["object"] = "v_res_son_desk", ["price"] = 2500, ["label"] = "Unidade de Escrivaninha" },
            { ["object"] = "v_res_tre_bedsidetable", ["price"] = 2500, ["label"] = "Unidade Lateral" },
            { ["object"] = "v_res_tre_bedsidetableb", ["price"] = 2500, ["label"] = "Unidade Lateral 2" },
            { ["object"] = "v_res_tre_smallbookshelf", ["price"] = 2500, ["label"] = "Unidade de Livros" },
            { ["object"] = "v_res_tre_storageunit", ["price"] = 2500, ["label"] = "Unidade de Armazenamento" },
            { ["object"] = "v_res_tre_wardrobe", ["price"] = 2500, ["label"] = "Unidade de Guarda-Roupa" },
            { ["object"] = "v_res_tre_wdunitscuz", ["price"] = 2500, ["label"] = "Unidade de Madeira" },
            { ["object"] = "prop_devin_box_closed", ["price"] = 100, ["label"] = "Puff 1" },
            { ["object"] = "prop_mil_crate_01", ["price"] = 100, ["label"] = "Caixa Militar 1" },
            { ["object"] = "prop_mil_crate_02", ["price"] = 100, ["label"] = "Caixa Militar 2" },
            { ["object"] = "prop_ld_int_safe_01", ["price"] = 1100, ["label"] = "Cofre" },
            { ["object"] = "prop_toolchest_05", ["price"] = 5000, ["label"] = "Bancada de Artesanato" },
            { ["object"] = "v_corp_filecablow", ["price"] = 500, ["label"] = "Arquivo Baixo" },
            { ["object"] = "v_corp_filecabtall", ["price"] = 500, ["label"] = "Arquivo Alto" },
            { ["object"] = "apa_mp_h_str_shelffloorm_02", ["price"] = 500, ["label"] = "Armário Moderno Grande" },
            { ["object"] = "v_ilev_frnkwarddr1", ["price"] = 500, ["label"] = "Armário Franklin" },
            { ["object"] = "prop_coathook_01", ["price"] = 100, ["label"] = "Cabideiro" },
            { ["object"] = "v_corp_lowcabdark01", ["price"] = 500, ["label"] = "Arquivo Baixo Preto" },
            { ["object"] = "v_corp_tallcabdark01", ["price"] = 500, ["label"] = "Arquivo Alto Preto" },
            { ["object"] = "v_corp_cabshelves01", ["price"] = 1000, ["label"] = "Arquivo Preto" },
            { ["object"] = "v_corp_offshelf", ["price"] = 1000, ["label"] = "Arquivo Grande" },
            { ["object"] = "v_61_lng_mesh_unitc", ["price"] = 500, ["label"] = "Estante Branca" },
            { ["object"] = "ba_wardrobe", ["price"] = 500, ["label"] = "Guarda-Roupa" },
            { ["object"] = "apa_mp_h_str_sideboardl_06", ["price"] = 750, ["label"] = "Armário Moderno" },
            { ["object"] = "apa_mp_h_str_sideboardl_09", ["price"] = 750, ["label"] = "Armário Moderno 2" },
            { ["object"] = "apa_mp_h_str_shelfwallm_01", ["price"] = 750, ["label"] = "Estante 2" },
            { ["object"] = "apa_mp_h_str_sideboardl_11", ["price"] = 750, ["label"] = "Armário Moderno 3" },
            { ["object"] = "imp_prop_impexp_parts_rack_03a", ["price"] = 750, ["label"] = "Peças de Carro" },
            { ["object"] = "imp_prop_impexp_parts_rack_04a", ["price"] = 750, ["label"] = "Peças de Carro 2" },
            { ["object"] = "imp_prop_impexp_parts_rack_05a", ["price"] = 750, ["label"] = "Peças de Carro 3" },
            { ["object"] = "apa_mp_h_bed_chestdrawer_02", ["price"] = 750, ["label"] = "Cômoda" },
            { ["object"] = "hei_heist_bed_chestdrawer_04", ["price"] = 750, ["label"] = "Cômoda 2" },
            { ["object"] = "prop_rub_cabinet", ["price"] = 50, ["label"] = "Arquivo Enferrujado" },
            { ["object"] = "prop_tv_cabinet_03", ["price"] = 750, ["label"] = "Armário de TV Pequeno" },
            { ["object"] = "prop_tv_cabinet_04", ["price"] = 750, ["label"] = "Armário de TV Pequeno 2" },
            { ["object"] = "prop_tv_cabinet_05", ["price"] = 750, ["label"] = "Armário de TV Pequeno 3" },
            { ["object"] = "apa_mp_h_str_shelffreel_01", ["price"] = 750, ["label"] = "Armário IKEA" },
            { ["object"] = "apa_mp_h_str_sideboardl_13", ["price"] = 750, ["label"] = "Armário Moderno 4" },
            { ["object"] = "apa_mp_h_str_sideboardl_14", ["price"] = 750, ["label"] = "Armário Moderno 5" },
            { ["object"] = "apa_mp_h_str_sideboardm_02", ["price"] = 750, ["label"] = "Armário Moderno 6" },
            { ["object"] = "bkr_prop_biker_garage_locker_01", ["price"] = 750, ["label"] = "Armário de Motociclista" },
            { ["object"] = "gr_prop_gr_bench_04b", ["price"] = 750, ["label"] = "Bancada de Motociclista" },
        }
    },

    {
        category = "Electrónicos",
        items = {
            { ["object"] = "prop_trailr_fridge", ["price"] = 300, ["label"] = "Geladeira Antiga" },
            { ["object"] = "v_res_fh_speaker", ["price"] = 300, ["label"] = "Alto-falante" },
            { ["object"] = "v_res_fh_speakerdock", ["price"] = 300, ["label"] = "Base do Alto-falante" },
            { ["object"] = "v_res_fh_bedsideclock", ["price"] = 300, ["label"] = "Relógio de Cama" },
            { ["object"] = "v_res_fa_phone", ["price"] = 300, ["label"] = "Telefone" },
            { ["object"] = "v_res_fh_towerfan", ["price"] = 300, ["label"] = "Ventilador de Torre" },
            { ["object"] = "v_res_fa_fan", ["price"] = 300, ["label"] = "Ventilador" },
            { ["object"] = "v_res_lest_bigscreen", ["price"] = 300, ["label"] = "Tela Grande" },
            { ["object"] = "v_res_lest_monitor", ["price"] = 300, ["label"] = "Monitor" },
            { ["object"] = "v_res_tre_mixer", ["price"] = 300, ["label"] = "Mixer" },
            { ["object"] = "prop_cs_cctv", ["price"] = 100, ["label"] = "CCTV" },
            { ["object"] = "prop_ld_lap_top", ["price"] = 100, ["label"] = "Laptop" },
            { ["object"] = "prop_ld_monitor_01", ["price"] = 100, ["label"] = "Monitor" },
            { ["object"] = "prop_speaker_05", ["price"] = 500, ["label"] = "Alto-falante Montado" },
            { ["object"] = "prop_tv_flat_03b", ["price"] = 1000, ["label"] = "Televisão Plana Pequena" },
            { ["object"] = "prop_laptop_01a", ["price"] = 750, ["label"] = "Laptop Aberto" },
            { ["object"] = "prop_tv_flat_michael", ["price"] = 3000, ["label"] = "Televisão Plana Suspensa" },
            { ["object"] = "prop_dyn_pc", ["price"] = 1000, ["label"] = "PC" },
            { ["object"] = "prop_keyboard_01b", ["price"] = 100, ["label"] = "Teclado" },
            { ["object"] = "prop_mouse_01b", ["price"] = 100, ["label"] = "Mouse de Computador" },
            { ["object"] = "v_ret_gc_phone", ["price"] = 100, ["label"] = "Telefone de Escritório" },
            { ["object"] = "prop_tv_flat_01", ["price"] = 5000, ["label"] = "Grande Televisão Plana" },
            { ["object"] = "prop_arcade_01", ["price"] = 5000, ["label"] = "Máquina de Arcade" },
            { ["object"] = "prop_console_01", ["price"] = 250, ["label"] = "Console de Jogo" },
            { ["object"] = "v_res_tre_dvdplayer", ["price"] = 250, ["label"] = "Leitor de DVD" },
            { ["object"] = "prop_speaker_08", ["price"] = 500, ["label"] = "Alto-falante de Madeira" },
            { ["object"] = "prop_cctv_mon_02", ["price"] = 300, ["label"] = "Monitor CCTV" },
            { ["object"] = "prop_tv_flat_02", ["price"] = 2500, ["label"] = "Televisão Plana em Pé" },
            { ["object"] = "prop_cctv_cam_01a", ["price"] = 300, ["label"] = "CCTV 2" },
            { ["object"] = "prop_dest_cctv_02", ["price"] = 300, ["label"] = "Monitor CCTV 2" },
            { ["object"] = "prop_cctv_cam_07a", ["price"] = 300, ["label"] = "CCTV 3" },
            { ["object"] = "apa_mp_h_str_avunits_04", ["price"] = 5500, ["label"] = "Móvel com Televisão Plana" },
            { ["object"] = "apa_mp_h_str_avunits_01", ["price"] = 5500, ["label"] = "Móvel com Televisão Plana 2" },
            { ["object"] = "v_club_vu_deckcase", ["price"] = 1000, ["label"] = "Set de DJ" },
            { ["object"] = "v_corp_servercln", ["price"] = 1000, ["label"] = "Rack de Servidor" },
            { ["object"] = "apa_mp_h_str_avunitl_01_b", ["price"] = 5500, ["label"] = "Móvel com Televisão Plana 3" },
            { ["object"] = "apa_mp_h_str_avunitl_04", ["price"] = 5500, ["label"] = "Móvel com Televisão Plana 4" },
            { ["object"] = "apa_mp_h_str_avunitm_01", ["price"] = 5500, ["label"] = "Móvel com Televisão Plana 5" },
            { ["object"] = "apa_mp_h_str_avunitm_03", ["price"] = 5500, ["label"] = "Móvel com Televisão Plana 6" },
            { ["object"] = "apa_mp_h_str_avunits_04", ["price"] = 5500, ["label"] = "Móvel com Televisão Plana 7" },
            { ["object"] = "v_res_printer", ["price"] = 300, ["label"] = "Impressora" },
            { ["object"] = "apa_mp_h_acc_phone_01", ["price"] = 100, ["label"] = "Telefone Antigo" },
            { ["object"] = "v_res_mousemat", ["price"] = 300, ["label"] = "Mouse Pad" },
            { ["object"] = "v_res_pcheadset", ["price"] = 300, ["label"] = "Headset" },
            { ["object"] = "v_res_pcspeaker", ["price"] = 300, ["label"] = "Alto-falante de PC" },
            { ["object"] = "ba_prop_battle_club_speaker_small", ["price"] = 500, ["label"] = "Caixa Pequena" },
            { ["object"] = "ba_prop_battle_club_speaker_med", ["price"] = 750, ["label"] = "Caixa" },
            { ["object"] = "ba_prop_battle_club_speaker_large", ["price"] = 1000, ["label"] = "Caixa Grande" },
            { ["object"] = "v_res_pcspeaker", ["price"] = 300, ["label"] = "Alto-falante de PC" },
            { ["object"] = "v_res_pcwoofer", ["price"] = 300, ["label"] = "Subwoofer de PC" },
            { ["object"] = "prop_controller_01", ["price"] = 300, ["label"] = "Controle" },
            { ["object"] = "prop_cs_remote_01", ["price"] = 300, ["label"] = "Controle Remoto" },
            { ["object"] = "prop_portable_hifi_01", ["price"] = 300, ["label"] = "Rádio" },
            { ["object"] = "prop_dj_deck_02", ["price"] = 300, ["label"] = "Mesa de DJ" },
            { ["object"] = "prop_speaker_01", ["price"] = 300, ["label"] = "Alto-falante" },
        }
    },

    {
        category = "Camas",
        items = {
            { ["object"] = "v_res_d_bed", ["price"] = 700, ["label"] = "Cama 1" },
            { ["object"] = "v_res_lestersbed", ["price"] = 700, ["label"] = "Cama 2" },
            { ["object"] = "v_res_mbbed", ["price"] = 700, ["label"] = "Cama MB" },
            { ["object"] = "v_res_mdbed", ["price"] = 700, ["label"] = "Cama MD" },
            { ["object"] = "v_res_msonbed", ["price"] = 700, ["label"] = "Cama 3" },
            { ["object"] = "v_res_tre_bed1", ["price"] = 700, ["label"] = "Cama 4" },
            { ["object"] = "v_res_tre_bed2", ["price"] = 700, ["label"] = "Cama T" },
            { ["object"] = "v_res_tt_bed", ["price"] = 700, ["label"] = "Cama TT" },
            { ["object"] = "apa_mp_h_bed_with_table_02", ["price"] = 5000, ["label"] = "Cama Elegante" },
            { ["object"] = "apa_mp_h_bed_wide_05", ["price"] = 5000, ["label"] = "Cama Vermelha" },
            { ["object"] = "apa_mp_h_bed_double_08", ["price"] = 3000, ["label"] = "Cama Quadrada" },
            { ["object"] = "apa_mp_h_bed_double_09", ["price"] = 3000, ["label"] = "Cama Moderna" },
            { ["object"] = "apa_mp_h_yacht_bed_01", ["price"] = 5000, ["label"] = "Cama King da Califórnia" },
            { ["object"] = "apa_mp_h_yacht_bed_02", ["price"] = 5000, ["label"] = "Cama King da Califórnia 2" },
            { ["object"] = "bkr_prop_biker_campbed_01", ["price"] = 100, ["label"] = "Cama de Camping" },
            { ["object"] = "ex_prop_exec_bed_01", ["price"] = 700, ["label"] = "Cama Pequena" },
            { ["object"] = "gr_prop_bunker_bed_01", ["price"] = 700, ["label"] = "Cama Pequena 2" },
            { ["object"] = "p_mbbed_s", ["price"] = 700, ["label"] = "Cama 5" },
        }
    },

    {
        category = "Lâmpadas",
        items = {
            { ["object"] = "v_corp_cd_desklamp", ["price"] = 100, ["label"] = "Lâmpada de Mesa Corporativa" },
            { ["object"] = "v_res_desklamp", ["price"] = 100, ["label"] = "Lâmpada de Mesa" },
            { ["object"] = "v_res_d_lampa", ["price"] = 100, ["label"] = "Lâmpada AA" },
            { ["object"] = "v_res_fa_lamp1on", ["price"] = 100, ["label"] = "Lâmpada 1" },
            { ["object"] = "v_res_fh_floorlamp", ["price"] = 100, ["label"] = "Lâmpada de Piso" },
            { ["object"] = "v_res_fh_lampa_on", ["price"] = 100, ["label"] = "Lâmpada 2" },
            { ["object"] = "v_res_j_tablelamp1", ["price"] = 100, ["label"] = "Lâmpada de Mesa" },
            { ["object"] = "v_res_j_tablelamp2", ["price"] = 100, ["label"] = "Lâmpada de Mesa 2" },
            { ["object"] = "v_res_mdbedlamp", ["price"] = 100, ["label"] = "Lâmpada de Cama" },
            { ["object"] = "v_res_mplanttongue", ["price"] = 100, ["label"] = "Lâmpada Planta Língua" },
            { ["object"] = "v_res_mtblelampmod", ["price"] = 100, ["label"] = "Lâmpada de Mesa 3" },
            { ["object"] = "v_res_m_lampstand", ["price"] = 100, ["label"] = "Suporte para Lâmpada" },
            { ["object"] = "v_res_m_lampstand2", ["price"] = 100, ["label"] = "Suporte para Lâmpada 2" },
            { ["object"] = "v_res_m_lamptbl", ["price"] = 100, ["label"] = "Lâmpada de Mesa 4" },
            { ["object"] = "v_res_tre_lightfan", ["price"] = 100, ["label"] = "Ventilador de Luz" },
            { ["object"] = "v_res_tre_talllamp", ["price"] = 100, ["label"] = "Lâmpada Alta" },
            { ["object"] = "v_ret_fh_walllighton", ["price"] = 100, ["label"] = "Luz de Parede" },
            { ["object"] = "v_ret_gc_lamp", ["price"] = 100, ["label"] = "Lâmpada GC" },
            { ["object"] = "prop_dummy_light", ["price"] = 100, ["label"] = "Luz Piscante" },
            { ["object"] = "prop_ld_cont_light_01", ["price"] = 100, ["label"] = "Luz de Parede Lateral" },
            { ["object"] = "V_44_D_emis", ["price"] = 100, ["label"] = "Luz de Teste" },
            { ["object"] = "prop_wall_light_07a", ["price"] = 100, ["label"] = "Lâmpada" },
            { ["object"] = "prop_wall_light_01a", ["price"] = 100, ["label"] = "Lâmpada Barata" },
            { ["object"] = "v_serv_tu_light2_", ["price"] = 100, ["label"] = "Luz Industrial" },
            { ["object"] = "v_serv_tu_light3_", ["price"] = 100, ["label"] = "Luz Industrial 2" },
            { ["object"] = "ba_prop_battle_lights_ceiling_l_a", ["price"] = 300, ["label"] = "Lâmpada Pendente" },
            { ["object"] = "v_med_p_floorlamp", ["price"] = 300, ["label"] = "Grande Lâmpada" },
            { ["object"] = "v_club_vu_lamp", ["price"] = 100, ["label"] = "Lâmpada Pequena" },
            { ["object"] = "ba_prop_battle_lights_wall_l_a", ["price"] = 100, ["label"] = "Lâmpada de Parede" },
            { ["object"] = "ba_prop_battle_lights_ceiling_l_c", ["price"] = 300, ["label"] = "Lâmpada Pendente 2" },
            { ["object"] = "ba_prop_battle_lights_ceiling_l_b", ["price"] = 300, ["label"] = "Candelabro 2" },
            { ["object"] = "ba_prop_battle_lights_wall_l_c", ["price"] = 100, ["label"] = "Lâmpada de Parede 2" },
            { ["object"] = "ba_prop_battle_lights_wall_l_b", ["price"] = 100, ["label"] = "Lâmpada de Parede 3" },
            { ["object"] = "hei_heist_lit_lightpendant_02", ["price"] = 300, ["label"] = "Lâmpada Pendente 3" },
            { ["object"] = "prop_oldlight_01b", ["price"] = 100, ["label"] = "Lâmpada de Parede 4" },
            { ["object"] = "apa_mp_h_lit_floorlampnight_07", ["price"] = 100, ["label"] = "Lâmpada Azul" },
            { ["object"] = "apa_mp_h_ceiling_light_01", ["price"] = 100, ["label"] = "Comercial" },
            { ["object"] = "apa_mp_h_ceiling_light_01_day", ["price"] = 100, ["label"] = "Comercial 2" },
            { ["object"] = "apa_mp_h_ceiling_light_02", ["price"] = 100, ["label"] = "Luz de Teto" },
            { ["object"] = "apa_mp_h_ceiling_light_02_day", ["price"] = 100, ["label"] = "Luz de Teto 2" },
            { ["object"] = "ba_prop_battle_lights_ceiling_l_d", ["price"] = 100, ["label"] = "Comercial 3" },
            { ["object"] = "ba_prop_battle_lights_ceiling_l_f", ["price"] = 100, ["label"] = "Luz de Teto 3" },
            { ["object"] = "ba_prop_battle_lights_ceiling_l_e", ["price"] = 100, ["label"] = "Luz de Teto 4" },
            { ["object"] = "apa_mp_h_floorlamp_a", ["price"] = 100, ["label"] = "Lâmpada de Piso" },
            { ["object"] = "apa_mp_h_floorlamp_b", ["price"] = 100, ["label"] = "Lâmpada de Piso 2" },
            { ["object"] = "apa_mp_h_floorlamp_c", ["price"] = 100, ["label"] = "Lâmpada de Piso 3" },
            { ["object"] = "apa_mp_h_floor_lamp_int_08", ["price"] = 100, ["label"] = "Lâmpada de Piso 4" },
            { ["object"] = "apa_mp_h_lampbulb_multiple_a", ["price"] = 100, ["label"] = "Luz de Teto 5" },
            { ["object"] = "apa_mp_h_lit_floorlamp_02", ["price"] = 100, ["label"] = "Lâmpada de Piso 5" },
            { ["object"] = "apa_mp_h_lit_floorlampnight_14", ["price"] = 100, ["label"] = "Lâmpada de Piso 6" },
            { ["object"] = "apa_mp_h_lit_floorlamp_03", ["price"] = 100, ["label"] = "Lâmpada de Piso 7" },
            { ["object"] = "apa_mp_h_lit_floorlamp_06", ["price"] = 100, ["label"] = "Lâmpada de Piso 8" },
            { ["object"] = "apa_mp_h_lit_floorlamp_10", ["price"] = 100, ["label"] = "Lâmpada de Piso 9" },
            { ["object"] = "apa_mp_h_lit_floorlamp_13", ["price"] = 100, ["label"] = "Lâmpada de Piso 10" },
            { ["object"] = "apa_mp_h_lit_floorlamp_17", ["price"] = 100, ["label"] = "Lâmpada de Piso 11" },
            { ["object"] = "apa_mp_h_lit_lamptablenight_16", ["price"] = 100, ["label"] = "Luz Noturna" },
            { ["object"] = "apa_mp_h_lit_lamptablenight_24", ["price"] = 100, ["label"] = "Luz Noturna 2" },
            { ["object"] = "apa_mp_h_lit_lamptable_005", ["price"] = 100, ["label"] = "Luz Noturna 3" },
            { ["object"] = "apa_mp_h_lit_lamptable_04", ["price"] = 100, ["label"] = "Luz Noturna 4" },
            { ["object"] = "apa_mp_h_lit_lamptable_09", ["price"] = 100, ["label"] = "Luz Noturna 5" },
            { ["object"] = "apa_mp_h_lit_lamptable_14", ["price"] = 100, ["label"] = "Luz Noturna 6" },
            { ["object"] = "apa_mp_h_lit_lamptable_17", ["price"] = 100, ["label"] = "Luz Noturna 7" },
            { ["object"] = "apa_mp_h_yacht_table_lamp_01", ["price"] = 100, ["label"] = "Luz Noturna 8" },
        },
    },

    {
        category = "Mesas",
        items = {
            { ["object"] = "v_res_d_coffeetable", ["price"] = 500, ["label"] = "Mesa de Café 1" },
            { ["object"] = "v_res_d_roundtable", ["price"] = 500, ["label"] = "Mesa Redonda" },
            { ["object"] = "v_res_d_smallsidetable", ["price"] = 500, ["label"] = "Mesa Lateral Pequena" },
            { ["object"] = "v_res_fh_coftablea", ["price"] = 500, ["label"] = "Mesa A" },
            { ["object"] = "v_res_fh_coftableb", ["price"] = 500, ["label"] = "Mesa B" },
            { ["object"] = "v_res_fh_coftbldisp", ["price"] = 500, ["label"] = "Mesa C" },
            { ["object"] = "v_res_fh_diningtable", ["price"] = 500, ["label"] = "Mesa de Jantar" },
            { ["object"] = "v_res_j_coffeetable", ["price"] = 500, ["label"] = "Mesa de Café 2" },
            { ["object"] = "v_res_j_lowtable", ["price"] = 500, ["label"] = "Mesa Baixa" },
            { ["object"] = "v_res_mdbedtable", ["price"] = 500, ["label"] = "Mesa de Cama" },
            { ["object"] = "v_res_mddesk", ["price"] = 500, ["label"] = "Escrivaninha" },
            { ["object"] = "v_res_msidetblemod", ["price"] = 500, ["label"] = "Mesa Lateral" },
            { ["object"] = "v_res_m_console", ["price"] = 500, ["label"] = "Mesa Console" },
            { ["object"] = "v_res_m_dinetble_replace", ["price"] = 500, ["label"] = "Mesa de Jantar 2" },
            { ["object"] = "v_res_m_h_console", ["price"] = 500, ["label"] = "Mesa Console H" },
            { ["object"] = "v_res_m_stool", ["price"] = 500, ["label"] = "Banqueta?" },
            { ["object"] = "v_res_tre_sideboard", ["price"] = 500, ["label"] = "Mesa Buffet" },
            { ["object"] = "v_res_tre_table2", ["price"] = 500, ["label"] = "Mesa 2" },
            { ["object"] = "v_res_tre_tvstand", ["price"] = 500, ["label"] = "Mesa para TV" },
            { ["object"] = "v_res_tre_tvstand_tall", ["price"] = 500, ["label"] = "Mesa para TV Alta" },
            { ["object"] = "v_med_p_coffeetable", ["price"] = 500, ["label"] = "Mesa de Café Médica" },
            { ["object"] = "v_med_p_desk", ["price"] = 500, ["label"] = "Escrivaninha Médica" },
            { ["object"] = "prop_yacht_table_01", ["price"] = 100, ["label"] = "Mesa de Iate 1" },
            { ["object"] = "prop_yacht_table_02", ["price"] = 100, ["label"] = "Mesa de Iate 2" },
            { ["object"] = "prop_yacht_table_03", ["price"] = 100, ["label"] = "Mesa de Iate 3" },
            { ["object"] = "v_ret_csr_table", ["price"] = 100, ["label"] = "Mesa CSR" },
            { ["object"] = "v_res_mconsoletrad", ["price"] = 250, ["label"] = "mesa lateral alta" },
            { ["object"] = "v_ilev_liconftable_sml", ["price"] = 500, ["label"] = "mesa de escritório" },
            { ["object"] = "v_ret_tablesml", ["price"] = 350, ["label"] = "Mesa Lateral Marillaux" },
            { ["object"] = "apa_mp_h_yacht_coffee_table_02", ["price"] = 500, ["label"] = "Mesa de Café Marrom" },
            { ["object"] = "apa_mp_h_yacht_side_table_01", ["price"] = 300, ["label"] = "Mesa Lateral Marrom" },
            { ["object"] = "apa_mp_h_yacht_side_table_02", ["price"] = 300, ["label"] = "Mesa Lateral Redonda" },
            { ["object"] = "apa_mp_h_tab_sidelrg_04", ["price"] = 300, ["label"] = "Mesa Lateral Redonda 2" },
            { ["object"] = "v_club_vu_table", ["price"] = 300, ["label"] = "Mesa Coberta" },
            { ["object"] = "apa_mp_h_tab_sidelrg_07", ["price"] = 500, ["label"] = "Mesa de Café de Vidro" },
            { ["object"] = "bkr_prop_weed_table_01b", ["price"] = 100, ["label"] = "Mesa Clap" },
            { ["object"] = "ba_prop_int_trad_table", ["price"] = 300, ["label"] = "Mesa de Apoio" },
            { ["object"] = "apa_mp_h_str_sideboards_02", ["price"] = 750, ["label"] = "Mesa Lateral de Vidro" },
            { ["object"] = "apa_mp_h_yacht_coffee_table_01", ["price"] = 750, ["label"] = "Mesa de Café Moderna" },
            { ["object"] = "apa_mp_h_din_table_04", ["price"] = 1000, ["label"] = "Mesa de Jantar de Vidro" },
            { ["object"] = "xm_prop_base_staff_desk_01", ["price"] = 5000, ["label"] = "Escrivaninha + Configuração" },
            { ["object"] = "apa_mp_h_tab_coffee_07", ["price"] = 1000, ["label"] = "Mesa Lateral Triangular" },
            { ["object"] = "apa_mp_h_tab_coffee_08", ["price"] = 1000, ["label"] = "Mesa Lateral Branca" },
            { ["object"] = "apa_mp_h_tab_sidelrg_01", ["price"] = 1000, ["label"] = "Mesa Lateral de Vidro" },
            { ["object"] = "apa_mp_h_tab_sidelrg_02", ["price"] = 1000, ["label"] = "Mesa Lateral de Vidro 2" },
            { ["object"] = "apa_mp_h_tab_sidesml_01", ["price"] = 1000, ["label"] = "Mesa Dobrável" },
            { ["object"] = "ba_prop_int_edgy_table_01", ["price"] = 500, ["label"] = "Mesa de Mármore" },
            { ["object"] = "ba_prop_int_edgy_table_02", ["price"] = 500, ["label"] = "Mesa de Mármore Alta" },
            { ["object"] = "apa_mp_h_tab_sidelrg_01", ["price"] = 1000, ["label"] = "Mesa Lateral de Vidro" },
            { ["object"] = "xm_prop_lab_desk_01", ["price"] = 1000, ["label"] = "Mesa de Laboratório" },
        }
    },

    {
        category = "Banheiro",
        items = {
            { ["object"] = "prop_ld_toilet_01", ["price"] = 100, ["label"] = "Vaso Sanitário 1" },
            { ["object"] = "prop_toilet_01", ["price"] = 100, ["label"] = "Vaso Sanitário 2" },
            { ["object"] = "prop_toilet_02", ["price"] = 100, ["label"] = "Vaso Sanitário 3" },
            { ["object"] = "prop_sink_02", ["price"] = 100, ["label"] = "Pia 1" },
            { ["object"] = "prop_sink_04", ["price"] = 100, ["label"] = "Pia 2" },
            { ["object"] = "prop_sink_05", ["price"] = 100, ["label"] = "Pia 3" },
            { ["object"] = "prop_sink_06", ["price"] = 100, ["label"] = "Pia 4" },
            { ["object"] = "prop_soap_disp_01", ["price"] = 100, ["label"] = "Dispensador de Sabonete" },
            { ["object"] = "prop_shower_rack_01", ["price"] = 100, ["label"] = "Prateleira de Chuveiro" },
            { ["object"] = "prop_handdry_01", ["price"] = 100, ["label"] = "Secador de Mãos 1" },
            { ["object"] = "prop_handdry_02", ["price"] = 100, ["label"] = "Secador de Mãos 2" },
            { ["object"] = "prop_towel_rail_01", ["price"] = 100, ["label"] = "Suporte para Toalhas 1" },
            { ["object"] = "prop_towel_rail_02", ["price"] = 100, ["label"] = "Suporte para Toalhas 2" },
            { ["object"] = "prop_towel_01", ["price"] = 100, ["label"] = "Toalha 1" },
            { ["object"] = "v_res_mbtowel", ["price"] = 100, ["label"] = "Toalha 2" },
            { ["object"] = "v_res_mbtowelfld", ["price"] = 100, ["label"] = "Toalha 3" },
            { ["object"] = "v_res_mbath", ["price"] = 100, ["label"] = "Banheira" },
            { ["object"] = "v_res_mbsink", ["price"] = 100, ["label"] = "Pia" },
            { ["object"] = "v_ilev_mm_faucet", ["price"] = 100, ["label"] = "Torneira" },
            { ["object"] = "v_res_tre_washbasket", ["price"] = 250, ["label"] = "Cesto de Lavagem" },
            { ["object"] = "prop_toilet_soap_02", ["price"] = 100, ["label"] = "Sabonete em Tray" },
            { ["object"] = "prop_bar_sink_01", ["price"] = 100, ["label"] = "Pia" },
            { ["object"] = "apa_mp_h_bathtub_01", ["price"] = 1000, ["label"] = "Banheira" },
            { ["object"] = "prop_toilet_brush_01", ["price"] = 1000, ["label"] = "Escova" },
            { ["object"] = "prop_toilet_roll_01", ["price"] = 1000, ["label"] = "Rolo de Papel Higiênico" },
            { ["object"] = "prop_toilet_roll_02", ["price"] = 1000, ["label"] = "Rolo de Papel Higiênico 2" },
            { ["object"] = "prop_toilet_shamp_01", ["price"] = 1000, ["label"] = "Shampoo" },
            { ["object"] = "prop_toilet_shamp_02", ["price"] = 1000, ["label"] = "Shampoo 2" },
        }
    },

    {
        category = "Decoração",
        items = {
            { ["object"] = "apa_p_h_acc_artwalll_02", ["price"] = 1000, ["label"] = "Pintura com Marcas" },
            { ["object"] = "v_ind_cs_toolboard", ["price"] = 500, ["label"] = "Ferramentas" },
            { ["object"] = "apa_mp_stilts_bed_art", ["price"] = 300, ["label"] = "Arte 3D" },
            { ["object"] = "ex_office_swag_paintings03", ["price"] = 1000, ["label"] = "Pintura no Chão" },
            { ["object"] = "ex_mp_h_acc_artwallm_03", ["price"] = 750, ["label"] = "Pintura Abstrata" },
            { ["object"] = "ex_p_h_acc_artwallm_04", ["price"] = 750, ["label"] = "Pintura Abstrata 2" },
            { ["object"] = "ex_p_h_acc_artwalll_01", ["price"] = 1250, ["label"] = "Pintura Abstrata Grande" },
            { ["object"] = "apa_p_h_acc_artwalll_03", ["price"] = 750, ["label"] = "Pintura Abstrata 3" },
            { ["object"] = "ex_mp_h_acc_artwallm_02", ["price"] = 750, ["label"] = "Pintura Abstrata 4" },
            { ["object"] = "ex_p_h_acc_artwallm_03", ["price"] = 750, ["label"] = "Pintura Abstrata 5" },
            { ["object"] = "apa_mp_stilts_a_study_pics", ["price"] = 500, ["label"] = "Pintura" },
            { ["object"] = "apa_mp_h_acc_artwallm_02", ["price"] = 750, ["label"] = "Pintura Abstrata 6" },
            { ["object"] = "apa_mp_h_acc_artwalll_02", ["price"] = 750, ["label"] = "Pintura Abstrata 7" },
            { ["object"] = "apa_mp_h_acc_artwallm_04", ["price"] = 750, ["label"] = "Pintura Abstrata 8" },
            { ["object"] = "prop_dart_bd_cab_01", ["price"] = 250, ["label"] = "Alvo de Dardos" },
            { ["object"] = "prop_dart_bd_01", ["price"] = 250, ["label"] = "Alvo de Dardos 2" },
            { ["object"] = "hei_heist_acc_artwalll_01", ["price"] = 250, ["label"] = "Decoração de Parede 1" },
            { ["object"] = "hei_heist_acc_artgolddisc_01", ["price"] = 250, ["label"] = "Decoração de Parede 2" },
            { ["object"] = "hei_heist_acc_artgolddisc_02", ["price"] = 250, ["label"] = "Decoração de Parede 3" },
            { ["object"] = "hei_heist_acc_artgolddisc_03", ["price"] = 250, ["label"] = "Decoração de Parede 4" },
            { ["object"] = "hei_heist_acc_artgolddisc_04", ["price"] = 250, ["label"] = "Decoração de Parede 5" },
            { ["object"] = "v_ilev_ra_doorsafe", ["price"] = 250, ["label"] = "Decoração de Luxo" },
            { ["object"] = "v_res_r_figcat", ["price"] = 300, ["label"] = "Estátua de Gato" },
            { ["object"] = "v_res_r_figclown", ["price"] = 300, ["label"] = "Estátua de Palhaço" },
            { ["object"] = "v_res_r_figauth2", ["price"] = 300, ["label"] = "Estátua de Autor" },
            { ["object"] = "v_res_r_figfemale", ["price"] = 300, ["label"] = "Estátua Feminina" },
            { ["object"] = "v_res_r_figflamenco", ["price"] = 300, ["label"] = "Estátua Flamenca" },
            { ["object"] = "v_res_r_figgirl", ["price"] = 300, ["label"] = "Estátua de Menina" },
            { ["object"] = "v_res_r_figgirlclown", ["price"] = 300, ["label"] = "Estátua de Menina Palhaço" },
            { ["object"] = "v_res_r_figoblisk", ["price"] = 300, ["label"] = "Estátua Obelisco" },
            { ["object"] = "v_res_r_figpillar", ["price"] = 300, ["label"] = "Estátua Pilar" },
            { ["object"] = "v_res_r_teapot", ["price"] = 300, ["label"] = "Bule" },
            { ["object"] = "v_res_sculpt_dec", ["price"] = 300, ["label"] = "Escultura 1" },
            { ["object"] = "v_res_sculpt_decd", ["price"] = 300, ["label"] = "Escultura 2" },
            { ["object"] = "v_res_sculpt_dece", ["price"] = 300, ["label"] = "Escultura 3" },
            { ["object"] = "v_res_sculpt_decf", ["price"] = 300, ["label"] = "Escultura 4" },
            { ["object"] = "v_res_skateboard", ["price"] = 300, ["label"] = "Skateboard" },
            { ["object"] = "v_res_sketchpad", ["price"] = 300, ["label"] = "Caderno de Esboços" },
            { ["object"] = "v_res_tissues", ["price"] = 300, ["label"] = "Lenços" },
            { ["object"] = "v_res_tre_basketmess", ["price"] = 300, ["label"] = "Cesta" },
            { ["object"] = "v_res_tre_bin", ["price"] = 300, ["label"] = "Lixeira" },
            { ["object"] = "v_res_tre_cushiona", ["price"] = 300, ["label"] = "Travesseiro 1" },
            { ["object"] = "v_res_tre_cushionb", ["price"] = 300, ["label"] = "Travesseiro 2" },
            { ["object"] = "v_res_tre_cushionc", ["price"] = 300, ["label"] = "Travesseiro 3" },
            { ["object"] = "v_res_tre_cushiond", ["price"] = 300, ["label"] = "Travesseiro 4" },
            { ["object"] = "v_res_tre_cushnscuzb", ["price"] = 300, ["label"] = "Travesseiro 5" },
            { ["object"] = "v_res_tre_cushnscuzd", ["price"] = 300, ["label"] = "Travesseiro 6" },
            { ["object"] = "v_res_tre_fruitbowl", ["price"] = 300, ["label"] = "Fruteira" },
            { ["object"] = "v_med_p_sideboard", ["price"] = 300, ["label"] = "Aparador" },
            { ["object"] = "prop_idol_01", ["price"] = 100, ["label"] = "Ídolo 1" },
            { ["object"] = "v_res_r_fighorsestnd", ["price"] = 300, ["label"] = "Estátua de Cavalo Preto" },
            { ["object"] = "v_res_r_fighorse", ["price"] = 300, ["label"] = "Estátua de Cavalo Grande" },
            { ["object"] = "v_res_r_figdancer", ["price"] = 300, ["label"] = "Estátua de Dançarina" },
            { ["object"] = "v_res_fa_idol02", ["price"] = 300, ["label"] = "Estátua de Elefante" },
            { ["object"] = "v_res_m_statue", ["price"] = 300, ["label"] = "Estátua" },
            { ["object"] = "v_20_ornaeagle", ["price"] = 300, ["label"] = "Estátua de Águia" },
            { ["object"] = "v_med_p_vaseround", ["price"] = 300, ["label"] = "Vaso Redondo" },
            { ["object"] = "ex_mp_h_acc_vase_05", ["price"] = 300, ["label"] = "Vaso Violet" },
            { ["object"] = "apa_mp_h_acc_dec_head_01", ["price"] = 300, ["label"] = "Obra de Arte" },
            { ["object"] = "apa_mp_h_acc_dec_sculpt_02", ["price"] = 300, ["label"] = "Obra de Arte 2" },
            { ["object"] = "ex_mp_h_acc_dec_plate_02", ["price"] = 300, ["label"] = "Obra de Arte 3" },
            { ["object"] = "apa_mp_h_acc_bowl_ceramic_01", ["price"] = 300, ["label"] = "Tigela" },
            { ["object"] = "apa_mp_h_acc_dec_plate_01", ["price"] = 300, ["label"] = "Prato 2" },
            { ["object"] = "apa_mp_h_acc_vase_01", ["price"] = 300, ["label"] = "Vaso Preto e Branco" },
            { ["object"] = "apa_mp_h_acc_vase_02", ["price"] = 300, ["label"] = "Vaso Vermelho" },
            { ["object"] = "apa_mp_h_acc_vase_05", ["price"] = 300, ["label"] = "Vaso" },
            { ["object"] = "apa_mp_h_acc_vase_06", ["price"] = 300, ["label"] = "Vaso Preto e Branco 2" },
        }
    },

    {
        category = "Cozinha",
        items = {
            { ["object"] = "prop_washer_01", ["price"] = 150, ["label"] = "Máquina de Lavar 1" },
            { ["object"] = "prop_washer_02", ["price"] = 150, ["label"] = "Máquina de Lavar 2" },
            { ["object"] = "prop_washer_03", ["price"] = 150, ["label"] = "Máquina de Lavar 3" },
            { ["object"] = "prop_washing_basket_01", ["price"] = 150, ["label"] = "Cesta de Lavagem" },
            { ["object"] = "v_res_fridgemoda", ["price"] = 150, ["label"] = "Geladeira 1" },
            { ["object"] = "v_res_fridgemodsml", ["price"] = 150, ["label"] = "Geladeira 2" },
            { ["object"] = "prop_fridge_01", ["price"] = 150, ["label"] = "Geladeira 3" },
            { ["object"] = "prop_fridge_03", ["price"] = 150, ["label"] = "Geladeira 4" },
            { ["object"] = "prop_cooker_03", ["price"] = 150, ["label"] = "Fogão" },
            { ["object"] = "prop_micro_01", ["price"] = 150, ["label"] = "Micro-ondas 1" },
            { ["object"] = "prop_micro_02", ["price"] = 150, ["label"] = "Micro-ondas 2" },
            { ["object"] = "prop_wok", ["price"] = 150, ["label"] = "Wok" },
            { ["object"] = "v_res_cakedome", ["price"] = 150, ["label"] = "Prato de Bolo" },
            { ["object"] = "v_res_fa_chopbrd", ["price"] = 150, ["label"] = "Tábua de Corte" },
            { ["object"] = "v_res_mutensils", ["price"] = 150, ["label"] = "Utensílios" },
            { ["object"] = "v_res_pestle", ["price"] = 150, ["label"] = "Pilão" },
            { ["object"] = "v_ret_ta_paproll", ["price"] = 150, ["label"] = "Rolo de Papel 1" },
            { ["object"] = "v_ret_ta_paproll2", ["price"] = 150, ["label"] = "Rolo de Papel 2" },
            { ["object"] = "v_ret_fh_pot01", ["price"] = 150, ["label"] = "Panela 1" },
            { ["object"] = "v_ret_fh_pot02", ["price"] = 150, ["label"] = "Panela 2" },
            { ["object"] = "v_ret_fh_pot05", ["price"] = 150, ["label"] = "Panela 3" },
            { ["object"] = "prop_pot_03", ["price"] = 150, ["label"] = "Panela 4" },
            { ["object"] = "prop_pot_04", ["price"] = 150, ["label"] = "Panela 5" },
            { ["object"] = "prop_pot_05", ["price"] = 150, ["label"] = "Panela 6" },
            { ["object"] = "prop_pot_06", ["price"] = 150, ["label"] = "Panela 7" },
            { ["object"] = "prop_pot_rack", ["price"] = 150, ["label"] = "Suporte para Panelas" },
            { ["object"] = "prop_kitch_juicer", ["price"] = 150, ["label"] = "Centrífuga" },
            { ["object"] = "v_res_ovenhobmod", ["price"] = 1000, ["label"] = "Fogão" },
            { ["object"] = "v_res_mkniferack", ["price"] = 100, ["label"] = "Faca" },
            { ["object"] = "v_res_mchopboard", ["price"] = 100, ["label"] = "Tábua de Cortar" },
            { ["object"] = "prop_cs_kitchen_cab_l", ["price"] = 750, ["label"] = "Armário de Cozinha Largura" },
            { ["object"] = "prop_cs_kitchen_cab_r", ["price"] = 500, ["label"] = "Armário de Cozinha Pequeno" },
            { ["object"] = "v_res_tre_fridge", ["price"] = 500, ["label"] = "Refrigerador" },
            { ["object"] = "apa_mp_h_acc_coffeemachine_01", ["price"] = 500, ["label"] = "Máquina de Café" },
            { ["object"] = "p_new_j_counter_02", ["price"] = 500, ["label"] = "Balcão" },
            { ["object"] = "prop_bar_pump_09", ["price"] = 500, ["label"] = "Bomba 1" },
            { ["object"] = "prop_bar_pump_01", ["price"] = 500, ["label"] = "Bomba 2" },
            { ["object"] = "prop_chip_fryer", ["price"] = 500, ["label"] = "Fritadeira" },
            { ["object"] = "prop_cleaver", ["price"] = 500, ["label"] = "Faca" },
            { ["object"] = "prop_coffee_mac_02", ["price"] = 500, ["label"] = "Máquina de Café" },
            { ["object"] = "prop_coffee_mac_01", ["price"] = 500, ["label"] = "Máquina de Café 2" },
            { ["object"] = "prop_cs_fork", ["price"] = 500, ["label"] = "Garfo" },
            { ["object"] = "prop_cs_sink_filler", ["price"] = 500, ["label"] = "Tampa da Pia" },
            { ["object"] = "prop_toaster_01", ["price"] = 500, ["label"] = "Torradeira" },
            { ["object"] = "prop_cs_plate_01", ["price"] = 500, ["label"] = "Prato" },
            { ["object"] = "prop_foodprocess_01", ["price"] = 500, ["label"] = "Processador de Alimentos" },
            { ["object"] = "prop_food_sugarjar", ["price"] = 500, ["label"] = "Açucareiro" },
            { ["object"] = "prop_juice_dispenser", ["price"] = 500, ["label"] = "Dispensador" },
            { ["object"] = "prop_knife_stand", ["price"] = 500, ["label"] = "Suporte para Facas" },
            { ["object"] = "prop_knife", ["price"] = 500, ["label"] = "Faca 2" },
            { ["object"] = "prop_micro_04", ["price"] = 500, ["label"] = "Micro-ondas 4" },
            { ["object"] = "v_ret_fh_plate3", ["price"] = 500, ["label"] = "Prato 5" },
            { ["object"] = "v_ilev_tt_plate01", ["price"] = 500, ["label"] = "Prato 6" },
            { ["object"] = "v_res_fa_grater", ["price"] = 500, ["label"] = "Ralador" },
            { ["object"] = "v_res_tt_pizzaplate", ["price"] = 500, ["label"] = "Prato de Pizza" },
            { ["object"] = "v_ret_247_ketchup2", ["price"] = 500, ["label"] = "Ketchup" },
        }
    },

    {
        category = "Plantas",
        items = {
            { ["object"] = "prop_fib_plant_01", ["price"] = 150, ["label"] = "Planta Fib" },
            { ["object"] = "v_corp_bombplant", ["price"] = 170, ["label"] = "Planta Bomba" },
            { ["object"] = "v_res_mflowers", ["price"] = 170, ["label"] = "Planta Flores" },
            { ["object"] = "v_res_mvasechinese", ["price"] = 170, ["label"] = "Planta Chinesa" },
            { ["object"] = "v_res_m_bananaplant", ["price"] = 170, ["label"] = "Planta Banana" },
            { ["object"] = "v_res_m_palmplant1", ["price"] = 170, ["label"] = "Planta Palmeira" },
            { ["object"] = "v_res_m_palmstairs", ["price"] = 170, ["label"] = "Planta Palmeira 2" },
            { ["object"] = "v_res_m_urn", ["price"] = 170, ["label"] = "Planta Urna" },
            { ["object"] = "v_res_rubberplant", ["price"] = 170, ["label"] = "Planta Borracha" },
            { ["object"] = "v_res_tre_plant", ["price"] = 170, ["label"] = "Planta" },
            { ["object"] = "v_res_tre_tree", ["price"] = 170, ["label"] = "Planta Árvore" },
            { ["object"] = "v_med_p_planter", ["price"] = 170, ["label"] = "Vaso" },
            { ["object"] = "v_ret_flowers", ["price"] = 100, ["label"] = "Flores" },
            { ["object"] = "v_ret_j_flowerdisp", ["price"] = 100, ["label"] = "Flores 1" },
            { ["object"] = "v_ret_j_flowerdisp_white", ["price"] = 100, ["label"] = "Flores 2" },
            { ["object"] = "v_res_m_vasefresh", ["price"] = 300, ["label"] = "Vaso de Flores" },
            { ["object"] = "v_res_rosevasedead", ["price"] = 300, ["label"] = "Vaso Rosa 2" },
            { ["object"] = "v_res_exoticvase", ["price"] = 300, ["label"] = "Vaso de Flores 2" },
            { ["object"] = "v_res_rosevase", ["price"] = 300, ["label"] = "Vaso Rosa" },
            { ["object"] = "prop_pot_plant_6a", ["price"] = 300, ["label"] = "Planta Suspensa" },
            { ["object"] = "prop_pot_plant_02a", ["price"] = 300, ["label"] = "Vaso de Flores" },
            { ["object"] = "apa_mp_h_acc_plant_palm_01", ["price"] = 300, ["label"] = "Planta Palmeira" },
            { ["object"] = "prop_plant_interior_05a", ["price"] = 300, ["label"] = "Caixa de Flores" },
            { ["object"] = "prop_plant_int_01a", ["price"] = 300, ["label"] = "Planta" },
            { ["object"] = "prop_plant_int_01b", ["price"] = 300, ["label"] = "Planta 2" },
            { ["object"] = "prop_plant_int_02a", ["price"] = 300, ["label"] = "Planta 3" },
            { ["object"] = "prop_plant_int_02b", ["price"] = 300, ["label"] = "Planta 4" },
            { ["object"] = "prop_plant_int_03a", ["price"] = 300, ["label"] = "Planta 5" },
            { ["object"] = "prop_plant_int_03b", ["price"] = 300, ["label"] = "Planta 6" },
            { ["object"] = "prop_plant_int_03c", ["price"] = 300, ["label"] = "Planta 7" },
            { ["object"] = "prop_plant_int_04a", ["price"] = 300, ["label"] = "Planta 8" },
            { ["object"] = "prop_plant_int_04c", ["price"] = 300, ["label"] = "Planta 9" },
            { ["object"] = "prop_plant_int_05b", ["price"] = 300, ["label"] = "Caixa de Flores 2" },
            { ["object"] = "prop_pot_plant_01a", ["price"] = 300, ["label"] = "Vaso de Planta 2" },
            { ["object"] = "prop_pot_plant_01b", ["price"] = 300, ["label"] = "Vaso de Planta 3" },
            { ["object"] = "prop_pot_plant_01c", ["price"] = 300, ["label"] = "Vaso de Planta 4" },
            { ["object"] = "prop_pot_plant_01d", ["price"] = 300, ["label"] = "Vaso de Planta 5" },
            { ["object"] = "prop_pot_plant_01e", ["price"] = 300, ["label"] = "Vaso de Planta 6" },
            { ["object"] = "prop_pot_plant_03b", ["price"] = 300, ["label"] = "Vaso de Planta 7" },
            { ["object"] = "prop_pot_plant_05a", ["price"] = 300, ["label"] = "Vaso de Planta 8" },
            { ["object"] = "prop_pot_plant_05b", ["price"] = 300, ["label"] = "Vaso de Planta 9" },
            { ["object"] = "p_int_jewel_plant_01", ["price"] = 300, ["label"] = "Vaso de Planta 10" },
            { ["object"] = "p_int_jewel_plant_02", ["price"] = 300, ["label"] = "Vaso de Planta 11" },
            { ["object"] = "apa_mp_h_acc_vase_flowers_01", ["price"] = 300, ["label"] = "Vaso de Planta 12" },
            { ["object"] = "apa_mp_h_acc_vase_flowers_02", ["price"] = 300, ["label"] = "Vaso de Planta 13" },
            { ["object"] = "apa_mp_h_acc_vase_flowers_03", ["price"] = 300, ["label"] = "Vaso de Planta 14" },
            { ["object"] = "apa_mp_h_acc_vase_flowers_04", ["price"] = 300, ["label"] = "Vaso de Planta 15" },
        }
    },

    {
        category = "Portas",
        items = {
            { ["object"] = "v_ilev_fa_frontdoor", ["price"] = 300, ["type"] = "door", ["label"] = "Porta Branca" },
            { ["object"] = "v_ilev_247_offdorr", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Madeira 24/7" },
            { ["object"] = "v_ilev_arm_secdoor", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Segurança" },
            { ["object"] = "v_ilev_bank4door01", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Vidro do Banco" },
            { ["object"] = "v_ilev_bk_gate", ["price"] = 300, ["type"] = "door", ["label"] = "Portão de Metal Elegante" },
            { ["object"] = "v_ilev_cbankcountdoor01", ["price"] = 300, ["type"] = "door", ["label"] = "Porta do Escritório do Banco" },
            { ["object"] = "v_ilev_cd_door", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Madeira com Vidro" },
            { ["object"] = "v_ilev_cm_door1", ["price"] = 300, ["type"] = "door", ["label"] = "Porta Azul Clara" },
            { ["object"] = "v_ilev_dev_door", ["price"] = 300, ["type"] = "door", ["label"] = "Porta Preta da Casa" },
            { ["object"] = "v_ilev_door_orangesolid", ["price"] = 300, ["type"] = "door", ["label"] = "Porta Laranja Sólida" },
            { ["object"] = "v_ilev_fa_backdoor", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Vidro Suja" },
            { ["object"] = "v_ilev_gangsafedoor", ["price"] = 300, ["type"] = "door", ["label"] = "Porta do Cofre de Gangue" },
            { ["object"] = "v_ilev_gc_door02", ["price"] = 300, ["type"] = "door", ["label"] = "Porta do Escritório" },
            { ["object"] = "v_ilev_janitor_frontdoor", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Malha Branca" },
            { ["object"] = "v_ilev_rc_door1", ["price"] = 300, ["type"] = "door", ["label"] = "Porta Amarela de Incêndio" },
            { ["object"] = "v_ilev_roc_door2", ["price"] = 300, ["type"] = "door", ["label"] = "Porta Vermelha Sólida" },
            { ["object"] = "v_ilev_sol_off_door01", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Madeira Sólida" },
            { ["object"] = "v_ilev_stad_fdoor", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Vidro com Trilhos" },
            { ["object"] = "v_ilev_tort_door", ["price"] = 300, ["type"] = "door", ["label"] = "Porta com Placa de Perigo" },
            { ["object"] = "v_ilev_trevtraildr", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Trailer" },
            { ["object"] = "prop_cs_fridge_door", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Geladeira" },
            { ["object"] = "prop_artgallery_dl", ["price"] = 300, ["type"] = "door", ["label"] = "Porta Branca da Galeria de Arte" },
            { ["object"] = "prop_bh1_09_mp_l", ["price"] = 300, ["type"] = "door", ["label"] = "Porta da Weazel Plaza" },
            { ["object"] = "prop_bh1_48_backdoor_l", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Vidro Preta" },
            { ["object"] = "prop_casino_door_01r", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Vidro do Cassino" },
            { ["object"] = "prop_cs4_11_door", ["price"] = 300, ["type"] = "door", ["label"] = "Porta Branca com Pequena Janela" },
            { ["object"] = "prop_cs6_03_door_r", ["price"] = 300, ["type"] = "door", ["label"] = "Porta de Madeira Antiga" },
            { ["object"] = "prop_grumandoor_r", ["price"] = 300, ["type"] = "door", ["label"] = "Porta da Cobra Dourada" },
            { ["object"] = "prop_motel_door_09", ["price"] = 300, ["type"] = "door", ["label"] = "Porta do Motel" },
            { ["object"] = "prop_fnclink_03gate5", ["price"] = 300, ["type"] = "door", ["label"] = "Cerca de Cadeado" },
        }
    },

    {
        category = "Paredes",
        items = {
            { ["object"] = "ps_wall_aqua", ["price"] = 1000, ["label"] = "Parede Aqua" },
            { ["object"] = "ps_wall_black", ["price"] = 1000, ["label"] = "Parede Preta" },
            { ["object"] = "ps_wall_green", ["price"] = 1000, ["label"] = "Parede Verde" },
            { ["object"] = "ps_wall_grey", ["price"] = 1000, ["label"] = "Parede Cinza" },
            { ["object"] = "ps_wall_purple", ["price"] = 1000, ["label"] = "Parede Roxa" },
            { ["object"] = "ps_wall_red", ["price"] = 1000, ["label"] = "Parede Vermelha" },
            { ["object"] = "ps_wall_white", ["price"] = 1000, ["label"] = "Parede Branca" },
            { ["object"] = "ps_wall_yellow", ["price"] = 1000, ["label"] = "Parede Amarela" },
            { ["object"] = "ps_wall_wall", ["price"] = 1000, ["label"] = "Parede de Tijolos" },
        }
    },

    {
        category = "Variados",
        items = {
            { ["object"] = "v_corp_facebeanbag", ["price"] = 100, ["label"] = "Saco de Feijão 1" },
            { ["object"] = "v_res_cherubvase", ["price"] = 2500, ["label"] = "Vaso Branco" },
            { ["object"] = "v_res_d_paddedwall", ["price"] = 300, ["label"] = "Parede Acolchoada" },
            { ["object"] = "v_res_d_ramskull", ["price"] = 300, ["label"] = "Crânio de Carneiro" },
            { ["object"] = "v_res_d_whips", ["price"] = 300, ["label"] = "Chicotes" },
            { ["object"] = "v_res_fashmag1", ["price"] = 300, ["label"] = "Revistas" },
            { ["object"] = "v_res_fashmagopen", ["price"] = 300, ["label"] = "Revistas Abertas" },
            { ["object"] = "v_res_fa_magtidy", ["price"] = 300, ["label"] = "Revistas Organizadas" },
            { ["object"] = "v_res_fa_yogamat002", ["price"] = 300, ["label"] = "Tapete de Yoga 1" },
            { ["object"] = "v_res_fa_yogamat1", ["price"] = 300, ["label"] = "Tapete de Yoga 2" },
            { ["object"] = "v_res_fh_aftershavebox", ["price"] = 300, ["label"] = "Loção Pós-Barba" },
            { ["object"] = "v_res_fh_flowersa", ["price"] = 300, ["label"] = "Flores" },
            { ["object"] = "v_res_fh_fruitbowl", ["price"] = 300, ["label"] = "Tigela de Frutas" },
            { ["object"] = "v_res_fh_laundrybasket", ["price"] = 300, ["label"] = "Cesto de Roupa" },
            { ["object"] = "v_res_fh_pouf", ["price"] = 300, ["label"] = "Pufe" },
            { ["object"] = "v_res_fh_sculptmod", ["price"] = 300, ["label"] = "Escultura" },
            { ["object"] = "v_res_j_magrack", ["price"] = 300, ["label"] = "Suporte de Revistas" },
            { ["object"] = "v_res_jewelbox", ["price"] = 300, ["label"] = "Caixa de Jóias" },
            { ["object"] = "v_res_mbbin", ["price"] = 300, ["label"] = "Lixeira" },
            { ["object"] = "v_res_mbowlornate", ["price"] = 300, ["label"] = "Tigela Ornamental" },
            { ["object"] = "v_res_mbronzvase", ["price"] = 300, ["label"] = "Vaso de Bronze" },
            { ["object"] = "v_res_mchalkbrd", ["price"] = 300, ["label"] = "Quadro de Giz" },
            { ["object"] = "v_res_mddresser", ["price"] = 300, ["label"] = "Cômoda" },
            { ["object"] = "v_res_mplinth", ["price"] = 300, ["label"] = "Plinto" },
            { ["object"] = "v_res_mp_ashtrayb", ["price"] = 300, ["label"] = "Cinzeiro" },
            { ["object"] = "v_res_m_candle", ["price"] = 300, ["label"] = "Vela" },
            { ["object"] = "v_res_m_candlelrg", ["price"] = 300, ["label"] = "Vela Grande" },
            { ["object"] = "v_res_m_kscales", ["price"] = 300, ["label"] = "Balança" },
            { ["object"] = "v_res_tt_bedpillow", ["price"] = 300, ["label"] = "Travesseiro" },
            { ["object"] = "v_med_cor_whiteboard", ["price"] = 300, ["label"] = "Quadro Branco" },
            { ["object"] = "prop_ashtray_01", ["price"] = 100, ["label"] = "Cinzeiro Preto" },
            { ["object"] = "v_ret_fh_ashtray", ["price"] = 100, ["label"] = "Cinzeiro de Pedra" },
            { ["object"] = "v_24_wdr_mesh_rugs", ["price"] = 500, ["label"] = "Tapete" },
            { ["object"] = "apa_mp_h_acc_rugwooll_04", ["price"] = 500, ["label"] = "Tapete 2" },
            { ["object"] = "ex_mp_h_acc_rugwoolm_04", ["price"] = 500, ["label"] = "Tapete 3" },
            { ["object"] = "apa_mp_h_acc_rugwoolm_03", ["price"] = 500, ["label"] = "Tapete 4" },
            { ["object"] = "apa_mp_h_acc_rugwooll_03", ["price"] = 500, ["label"] = "Tapete 5" },
            { ["object"] = "apa_mp_h_acc_rugwoolm_04", ["price"] = 500, ["label"] = "Tapete 6" },
            { ["object"] = "v_club_rack", ["price"] = 500, ["label"] = "Cabideiro" },
            { ["object"] = "prop_a4_pile_01", ["price"] = 100, ["label"] = "Pilha de A4" },
            { ["object"] = "prop_amb_40oz_03", ["price"] = 100, ["label"] = "40 onças" },
            { ["object"] = "prop_amb_beer_bottle", ["price"] = 100, ["label"] = "Garrafa de Cerveja" },
            { ["object"] = "prop_aviators_01", ["price"] = 100, ["label"] = "Óculos Aviador" },
            { ["object"] = "prop_barry_table_detail", ["price"] = 100, ["label"] = "Detalhe da Mesa" },
            { ["object"] = "prop_beer_box_01", ["price"] = 100, ["label"] = "Caixa de Cervejas" },
            { ["object"] = "prop_binoc_01", ["price"] = 100, ["label"] = "Binóculos" },
            { ["object"] = "prop_blox_spray", ["price"] = 100, ["label"] = "Spray Blox" },
            { ["object"] = "prop_bongos_01", ["price"] = 100, ["label"] = "Bongôs" },
            { ["object"] = "prop_bong_01", ["price"] = 100, ["label"] = "Bong" },
            { ["object"] = "prop_boombox_01", ["price"] = 100, ["label"] = "Boombox" },
            { ["object"] = "prop_bowl_crisps", ["price"] = 100, ["label"] = "Tigela de Batata" },
            { ["object"] = "prop_candy_pqs", ["price"] = 100, ["label"] = "Doces" },
            { ["object"] = "prop_carrier_bag_01", ["price"] = 100, ["label"] = "Sacola" },
            { ["object"] = "prop_ceramic_jug_01", ["price"] = 100, ["label"] = "Jarra de Cerâmica" },
            { ["object"] = "prop_cigar_pack_01", ["price"] = 100, ["label"] = "Pacote de Charutos 1" },
            { ["object"] = "prop_cigar_pack_02", ["price"] = 100, ["label"] = "Pacote de Charutos 2" },
            { ["object"] = "prop_cs_beer_box", ["price"] = 100, ["label"] = "Caixa de Cerveja 2" },
            { ["object"] = "prop_cs_binder_01", ["price"] = 100, ["label"] = "Pasta" },
            { ["object"] = "prop_cs_bs_cup", ["price"] = 100, ["label"] = "Copo" },
            { ["object"] = "prop_cs_cashenvelope", ["price"] = 100, ["label"] = "Envelope de Dinheiro" },
            { ["object"] = "prop_cs_champ_flute", ["price"] = 100, ["label"] = "Taça de Champanhe" },
            { ["object"] = "prop_cs_duffel_01", ["price"] = 100, ["label"] = "Bolsa de Viagem" },
            { ["object"] = "prop_cs_dvd", ["price"] = 50, ["label"] = "DVD" },
            { ["object"] = "prop_cs_dvd_case", ["price"] = 50, ["label"] = "Capa de DVD" },
            { ["object"] = "prop_cs_film_reel_01", ["price"] = 100, ["label"] = "Rolo de Filme" },
            { ["object"] = "prop_cs_ilev_blind_01", ["price"] = 100, ["label"] = "Persiana" },
            { ["object"] = "p_ld_bs_bag_01", ["price"] = 100, ["label"] = "Bolsa" },
            { ["object"] = "prop_cs_ironing_board", ["price"] = 100, ["label"] = "Tábua de Passar" },
            { ["object"] = "prop_cs_katana_01", ["price"] = 100, ["label"] = "Katana" },
            { ["object"] = "prop_cs_kettle_01", ["price"] = 100, ["label"] = "Chaleira" },
            { ["object"] = "prop_cs_lester_crate", ["price"] = 100, ["label"] = "Caixa" },
            { ["object"] = "prop_cs_petrol_can", ["price"] = 100, ["label"] = "Galão de Gasolina" },
            { ["object"] = "prop_cs_sack_01", ["price"] = 100, ["label"] = "Saco" },
            { ["object"] = "prop_cs_script_bottle_01", ["price"] = 100, ["label"] = "Garrafa com Rótulo 1" },
            { ["object"] = "prop_cs_script_bottle", ["price"] = 100, ["label"] = "Garrafa com Rótulo 2" },
            { ["object"] = "prop_cs_street_binbag_01", ["price"] = 100, ["label"] = "Saco de Lixo" },
            { ["object"] = "prop_cs_whiskey_bottle", ["price"] = 100, ["label"] = "Garrafa de Uísque" },
            { ["object"] = "prop_sh_bong_01", ["price"] = 100, ["label"] = "Bong" },
            { ["object"] = "prop_peanut_bowl_01", ["price"] = 100, ["label"] = "Tigela de Amendoim" },
            { ["object"] = "prop_tumbler_01", ["price"] = 100, ["label"] = "Copo de Whisky" },
            { ["object"] = "prop_weed_bottle", ["price"] = 100, ["label"] = "Garrafa de Maconha" },
            { ["object"] = "p_cs_lighter_01", ["price"] = 100, ["label"] = "Isqueiro" },
            { ["object"] = "p_cs_papers_01", ["price"] = 100, ["label"] = "Papel de Enrolar" },
            { ["object"] = "v_res_d_dildo_f", ["price"] = 100, ["label"] = "Dildo Preto" },
            { ["object"] = "v_res_d_dildo_c", ["price"] = 100, ["label"] = "Dildo Branco" },
            { ["object"] = "v_res_d_dildo_a", ["price"] = 100, ["label"] = "Brinquedo da Mamãe" },
            { ["object"] = "prop_champ_cool", ["price"] = 100, ["label"] = "Balde de Champanhe" },
            { ["object"] = "prop_champ_01b", ["price"] = 100, ["label"] = "Garrafa de Champanhe" },
            { ["object"] = "prop_champ_flute", ["price"] = 100, ["label"] = "Taça de Champanhe" },
            { ["object"] = "ba_prop_club_champset", ["price"] = 300, ["label"] = "Conjunto de Champanhe" },
            { ["object"] = "v_res_fa_candle01", ["price"] = 100, ["label"] = "Vela Azul" },
            { ["object"] = "v_res_fa_candle02", ["price"] = 100, ["label"] = "Vela Vermelha" },
            { ["object"] = "v_res_fa_candle03", ["price"] = 100, ["label"] = "Vela Preta" },
            { ["object"] = "v_res_fa_candle04", ["price"] = 100, ["label"] = "Vela Pequena" },
            { ["object"] = "v_med_bottles2", ["price"] = 100, ["label"] = "Produtos Químicos" },
            { ["object"] = "v_res_desktidy", ["price"] = 100, ["label"] = "Material de Escritório" },
            { ["object"] = "v_med_p_notebook", ["price"] = 100, ["label"] = "Caderno de Anotações" },
            { ["object"] = "bkr_prop_weed_dry_01a", ["price"] = 100, ["label"] = "Montanha de Maconha" },
            { ["object"] = "ba_prop_battle_trophy_battler", ["price"] = 100, ["label"] = "Troféu de Punho" },
            { ["object"] = "ba_prop_battle_trophy_no1", ["price"] = 100, ["label"] = "Troféu de Estrela" },
            { ["object"] = "prop_golf_bag_01c", ["price"] = 100, ["label"] = "Bolsa de Golfe" },
            { ["object"] = "hei_heist_kit_bin_01", ["price"] = 100, ["label"] = "Lixeira" },
            { ["object"] = "prop_wooden_barrel", ["price"] = 100, ["label"] = "Barril de Madeira" },
            { ["object"] = "bkr_prop_bkr_cash_scatter_01", ["price"] = 100, ["label"] = "Dinheiro Espalhado" },
            { ["object"] = "bkr_prop_bkr_cashpile_01", ["price"] = 100, ["label"] = "Pilha de Dinheiro" },
            { ["object"] = "bkr_prop_bkr_cash_roll_01", ["price"] = 100, ["label"] = "Rolo de Dinheiro" },
            { ["object"] = "bkr_prop_bkr_cashpile_04", ["price"] = 100, ["label"] = "Montante de Dinheiro" },
            { ["object"] = "bkr_prop_weed_bigbag_open_01a", ["price"] = 100, ["label"] = "Saco Aberto de Maconha" },
            { ["object"] = "bkr_prop_weed_bigbag_02a", ["price"] = 100, ["label"] = "Saco de Maconha 2" },
            { ["object"] = "bkr_prop_weed_bigbag_03a", ["price"] = 100, ["label"] = "Saco de Maconha 3" },
            { ["object"] = "bkr_prop_weed_scales_01a", ["price"] = 100, ["label"] = "Balança de Maconha" },
            { ["object"] = "bkr_prop_weed_smallbag_01a", ["price"] = 100, ["label"] = "Saco Pequeno de Maconha" },
            { ["object"] = "prop_gold_bar", ["price"] = 100, ["label"] = "Barra de Ouro" },
            { ["object"] = "beerrow_world", ["price"] = 100, ["label"] = "Garrafas de Cerveja" },
            { ["object"] = "beerrow_local", ["price"] = 100, ["label"] = "Garrafas de Cerveja 2" },
            { ["object"] = "p_cs_bbbat_01", ["price"] = 100, ["label"] = "Taco de Beisebol" },
            { ["object"] = "p_cs_cuffs_02_s", ["price"] = 100, ["label"] = "Algemas" },
            { ["object"] = "p_cs_joint_02", ["price"] = 100, ["label"] = "Baseado" },
            { ["object"] = "p_ing_coffeecup_01", ["price"] = 100, ["label"] = "Caneca de Café" },
            { ["object"] = "p_tumbler_cs2_s", ["price"] = 100, ["label"] = "Copo" },
            { ["object"] = "prop_turkey_leg_01", ["price"] = 100, ["label"] = "Coxa de Peru" },
            { ["object"] = "prop_amb_donut", ["price"] = 100, ["label"] = "Rosquinha" },
            { ["object"] = "prop_donut_02", ["price"] = 100, ["label"] = "Rosquinha 2" },
            { ["object"] = "prop_bar_shots", ["price"] = 100, ["label"] = "Shots de Bar" },
            { ["object"] = "prop_bar_stirrers", ["price"] = 100, ["label"] = "Mexedores de Bar" },
            { ["object"] = "prop_beer_amopen", ["price"] = 100, ["label"] = "Cerveja Aberta" },
            { ["object"] = "prop_beer_blr", ["price"] = 100, ["label"] = "Cerveja 1" },
            { ["object"] = "prop_beer_logger", ["price"] = 100, ["label"] = "Cerveja 2" },
            { ["object"] = "prop_beer_stzopen", ["price"] = 100, ["label"] = "Cerveja 3" },
            { ["object"] = "prop_bikerset", ["price"] = 100, ["label"] = "Conjunto de Motoqueiro" },
            { ["object"] = "prop_bottle_brandy", ["price"] = 100, ["label"] = "Garrafa de Conhaque" },
            { ["object"] = "prop_tequila_bottle", ["price"] = 100, ["label"] = "Garrafa de Tequila" },
            { ["object"] = "prop_tequila", ["price"] = 100, ["label"] = "Tequila" },
            { ["object"] = "prop_bottle_cognac", ["price"] = 100, ["label"] = "Garrafa de Cognac" },
            { ["object"] = "prop_bottle_macbeth", ["price"] = 100, ["label"] = "Garrafa de Macbeth" },
            { ["object"] = "prop_brandy_glass", ["price"] = 100, ["label"] = "Copo de Conhaque" },
            { ["object"] = "prop_mug_01", ["price"] = 100, ["label"] = "Caneca 1" },
            { ["object"] = "prop_mug_02", ["price"] = 100, ["label"] = "Caneca 2" },
            { ["object"] = "prop_mug_03", ["price"] = 100, ["label"] = "Caneca 3" },
            { ["object"] = "prop_optic_vodka", ["price"] = 100, ["label"] = "Vodka" },
            { ["object"] = "prop_optic_jd", ["price"] = 100, ["label"] = "Jack Daniels" },
            { ["object"] = "prop_pint_glass_01", ["price"] = 100, ["label"] = "Copo de Cerveja" },
            { ["object"] = "prop_pizza_box_03", ["price"] = 100, ["label"] = "Caixa de Pizza" },
            { ["object"] = "prop_sandwich_01", ["price"] = 100, ["label"] = "Sanduíche" },
            { ["object"] = "prop_cava", ["price"] = 100, ["label"] = "Cava" },
            { ["object"] = "prop_drink_redwine", ["price"] = 100, ["label"] = "Vinho Tinto" },
            { ["object"] = "vodkarow", ["price"] = 100, ["label"] = "Linha de Vodka" },
            { ["object"] = "prop_cherenkov_02", ["price"] = 100, ["label"] = "Cherenkov" },
            { ["object"] = "prop_cherenkov_03", ["price"] = 100, ["label"] = "Cherenkov 2" },
            { ["object"] = "prop_cocktail_glass", ["price"] = 100, ["label"] = "Copo de Coquetel" },
            { ["object"] = "prop_cs_bottle_opener", ["price"] = 100, ["label"] = "Abridor de Garrafa" },
            { ["object"] = "prop_food_bs_chips", ["price"] = 100, ["label"] = "Chips" },
            { ["object"] = "prop_cs_burger_01", ["price"] = 100, ["label"] = "Hambúrguer" },
            { ["object"] = "prop_cs_hand_radio", ["price"] = 100, ["label"] = "Rádio de Mão" },
            { ["object"] = "prop_cs_hotdog_01", ["price"] = 100, ["label"] = "Cachorro-Quente" },
            { ["object"] = "prop_cs_milk_01", ["price"] = 100, ["label"] = "Leite" },
            { ["object"] = "prop_cs_panties", ["price"] = 100, ["label"] = "Calcinha" },
            { ["object"] = "prop_cs_steak", ["price"] = 100, ["label"] = "Bife" },
            { ["object"] = "v_ret_csr_bin", ["price"] = 100, ["label"] = "Lixeira CSR" },
            { ["object"] = "v_ret_fh_wickbskt", ["price"] = 100, ["label"] = "Cesto de Vime" },
            { ["object"] = "v_ret_gc_bag01", ["price"] = 100, ["label"] = "Bolsa GC 1" },
            { ["object"] = "v_ret_gc_bag02", ["price"] = 100, ["label"] = "Bolsa GC 2" },
            { ["object"] = "v_ret_gc_bin", ["price"] = 100, ["label"] = "Lixeira GC" },
            { ["object"] = "v_ret_gc_cashreg", ["price"] = 100, ["label"] = "Caixa Registradora" },
            { ["object"] = "v_ret_gc_chair01", ["price"] = 100, ["label"] = "Cadeira GC 1" },
            { ["object"] = "v_ret_gc_chair02", ["price"] = 100, ["label"] = "Cadeira GC 2" },
            { ["object"] = "v_ret_gc_clock", ["price"] = 100, ["label"] = "Relógio" },
            { ["object"] = "v_ret_hd_prod1_", ["price"] = 100, ["label"] = "Produto 1" },
            { ["object"] = "v_ret_hd_prod2_", ["price"] = 100, ["label"] = "Produto 2" },
            { ["object"] = "v_ret_hd_prod3_", ["price"] = 100, ["label"] = "Produto 3" },
            { ["object"] = "v_ret_hd_prod4_", ["price"] = 100, ["label"] = "Produto 4" },
            { ["object"] = "v_ret_hd_prod5_", ["price"] = 100, ["label"] = "Produto 5" },
            { ["object"] = "v_ret_hd_prod6_", ["price"] = 100, ["label"] = "Produto 6" },
            { ["object"] = "v_ret_hd_unit1_", ["price"] = 100, ["label"] = "Unidade HD 1" },
            { ["object"] = "v_ret_hd_unit2_", ["price"] = 100, ["label"] = "Unidade HD 2" },
            { ["object"] = "v_ret_ml_fridge02", ["price"] = 100, ["label"] = "Geladeira" },
            { ["object"] = "v_ret_ps_bag_01", ["price"] = 100, ["label"] = "Bolsa 1" },
            { ["object"] = "v_ret_ps_bag_02", ["price"] = 100, ["label"] = "Bolsa 2" },
            { ["object"] = "v_ret_ta_book1", ["price"] = 100, ["label"] = "Livro 1" },
            { ["object"] = "v_ret_ta_book2", ["price"] = 100, ["label"] = "Livro 2" },
            { ["object"] = "v_ret_ta_book3", ["price"] = 100, ["label"] = "Livro 3" },
            { ["object"] = "v_ret_ta_book4", ["price"] = 100, ["label"] = "Livro 4" },
            { ["object"] = "v_ret_ta_camera", ["price"] = 100, ["label"] = "Câmera" },
            { ["object"] = "v_ret_ta_firstaid", ["price"] = 100, ["label"] = "Primeiros Socorros" },
            { ["object"] = "v_ret_ta_hero", ["price"] = 100, ["label"] = "Herói" },
            { ["object"] = "v_ret_ta_mag1", ["price"] = 100, ["label"] = "Revista 1" },
            { ["object"] = "v_ret_ta_mag2", ["price"] = 100, ["label"] = "Revista 2" },
            { ["object"] = "v_ret_ta_skull", ["price"] = 100, ["label"] = "Caveira" },
            { ["object"] = "prop_acc_guitar_01", ["price"] = 100, ["label"] = "Violão" },
            { ["object"] = "prop_amb_handbag_01", ["price"] = 100, ["label"] = "Bolsa de Mão" },
            { ["object"] = "prop_attache_case_01", ["price"] = 100, ["label"] = "Maleta" },
            { ["object"] = "prop_big_bag_01", ["price"] = 100, ["label"] = "Bolsa Grande" },
            { ["object"] = "prop_bonesaw", ["price"] = 100, ["label"] = "Serrote" },
            { ["object"] = "prop_cs_fertilizer", ["price"] = 100, ["label"] = "Fertilizante" },
            { ["object"] = "prop_cs_shopping_bag", ["price"] = 100, ["label"] = "Sacola de Compras" },
            { ["object"] = "prop_cs_vial_01", ["price"] = 100, ["label"] = "Frasco" },
            { ["object"] = "prop_defilied_ragdoll_01", ["price"] = 100, ["label"] = "Boneco de Pano" },
            { ["object"] = "v_res_fa_book03", ["price"] = 100, ["label"] = "Livro Kamasutra" },
            { ["object"] = "prop_weight_rack_02", ["price"] = 500, ["label"] = "Suporte de Halteres" },
            { ["object"] = "prop_weight_bench_02", ["price"] = 500, ["label"] = "Banco de Musculação" },
            { ["object"] = "prop_tool_broom", ["price"] = 100, ["label"] = "Vassoura" },
            { ["object"] = "prop_fire_exting_2a", ["price"] = 100, ["label"] = "Extintor de Incêndio" },
            { ["object"] = "v_res_vacuum", ["price"] = 100, ["label"] = "Aspirador de Pó" },
            { ["object"] = "v_ret_gc_fan", ["price"] = 100, ["label"] = "Ventilador" },
            { ["object"] = "prop_paint_stepl01b", ["price"] = 100, ["label"] = "Escada" },
            { ["object"] = "bkr_prop_weed_bucket_01b", ["price"] = 100, ["label"] = "Fertilizante" },
            { ["object"] = "v_club_vusnaketank", ["price"] = 500, ["label"] = "Terrário" },
            { ["object"] = "prop_pooltable_02", ["price"] = 1500, ["label"] = "Mesa de Sinuca" },
            { ["object"] = "prop_pool_rack_02", ["price"] = 100, ["label"] = "Suporte de Tacos" },
            { ["object"] = "v_club_vu_deckcase", ["price"] = 1000, ["label"] = "Conjunto de DJ" },
            { ["object"] = "v_corp_servercln", ["price"] = 1000, ["label"] = "Servidor" },
            { ["object"] = "prop_dummy_01", ["price"] = 100, ["label"] = "Manequim" },
            { ["object"] = "prop_egg_clock_01", ["price"] = 100, ["label"] = "Relógio Ovo" },
            { ["object"] = "prop_el_guitar_01", ["price"] = 100, ["label"] = "Guitarra Elétrica 1" },
            { ["object"] = "prop_el_guitar_02", ["price"] = 100, ["label"] = "Guitarra Elétrica 2" },
            { ["object"] = "prop_el_guitar_03", ["price"] = 100, ["label"] = "Guitarra Elétrica 3" },
            { ["object"] = "prop_feed_sack_01", ["price"] = 100, ["label"] = "Saco de Ração" },
            { ["object"] = "prop_floor_duster_01", ["price"] = 100, ["label"] = "Mopa de Chão" },
            { ["object"] = "prop_fruit_basket", ["price"] = 100, ["label"] = "Cesta de Frutas" },
            { ["object"] = "prop_f_duster_02", ["price"] = 100, ["label"] = "Pano de Poeira" },
            { ["object"] = "prop_grapes_02", ["price"] = 100, ["label"] = "Uvas" },
            { ["object"] = "prop_hotel_clock_01", ["price"] = 100, ["label"] = "Relógio de Hotel" },
            { ["object"] = "prop_idol_case_01", ["price"] = 100, ["label"] = "Vitrine de Ídolo" },
            { ["object"] = "prop_jewel_02a", ["price"] = 100, ["label"] = "Joias" },
            { ["object"] = "prop_jewel_02b", ["price"] = 100, ["label"] = "Joias 2" },
            { ["object"] = "prop_jewel_02c", ["price"] = 100, ["label"] = "Joias 3" },
            { ["object"] = "prop_jewel_03a", ["price"] = 100, ["label"] = "Joias 4" },
            { ["object"] = "prop_jewel_03b", ["price"] = 100, ["label"] = "Joias 5" },
            { ["object"] = "prop_jewel_04a", ["price"] = 100, ["label"] = "Joias 6" },
            { ["object"] = "prop_jewel_04b", ["price"] = 100, ["label"] = "Joias 7" },
            { ["object"] = "prop_j_disptray_01", ["price"] = 100, ["label"] = "Bandeja de Exposição" },
            { ["object"] = "prop_j_disptray_01b", ["price"] = 100, ["label"] = "Bandeja de Exposição 2" },
            { ["object"] = "prop_j_disptray_02", ["price"] = 100, ["label"] = "Bandeja de Exposição 3" },
            { ["object"] = "prop_j_disptray_03", ["price"] = 100, ["label"] = "Bandeja de Exposição 4" },
            { ["object"] = "prop_j_disptray_04", ["price"] = 100, ["label"] = "Bandeja de Exposição 5" },
            { ["object"] = "prop_j_disptray_04b", ["price"] = 100, ["label"] = "Bandeja de Exposição 6" },
            { ["object"] = "prop_j_disptray_05", ["price"] = 100, ["label"] = "Bandeja de Exposição 7" },
            { ["object"] = "prop_j_disptray_05b", ["price"] = 100, ["label"] = "Bandeja de Exposição 8" },
            { ["object"] = "prop_ld_greenscreen_01", ["price"] = 100, ["label"] = "Tela Verde" },
            { ["object"] = "prop_ld_handbag", ["price"] = 100, ["label"] = "Bolsa de Mão" },
            { ["object"] = "prop_ld_jerrycan_01", ["price"] = 100, ["label"] = "Galão de Combustível" },
            { ["object"] = "prop_ld_keypad_01", ["price"] = 100, ["label"] = "Teclado Numérico 1" },
            { ["object"] = "prop_ld_keypad_01b", ["price"] = 100, ["label"] = "Teclado Numérico 2" },
            { ["object"] = "prop_ld_suitcase_01", ["price"] = 100, ["label"] = "Mala 1" },
            { ["object"] = "prop_ld_suitcase_02", ["price"] = 100, ["label"] = "Mala 2" },
            { ["object"] = "hei_p_attache_case_shut", ["price"] = 100, ["label"] = "Maleta Fechada" },
            { ["object"] = "prop_mr_rasberryclean", ["price"] = 100, ["label"] = "Rasberry Clean" },
            { ["object"] = "prop_paper_bag_01", ["price"] = 100, ["label"] = "Saco de Papel" },
            { ["object"] = "prop_shopping_bags01", ["price"] = 100, ["label"] = "Sacolas de Compras" },
            { ["object"] = "prop_shopping_bags02", ["price"] = 100, ["label"] = "Sacolas de Compras 2" },
            { ["object"] = "prop_yoga_mat_01", ["price"] = 100, ["label"] = "Tapete de Yoga 1" },
            { ["object"] = "prop_yoga_mat_02", ["price"] = 100, ["label"] = "Tapete de Yoga 2" },
            { ["object"] = "prop_yoga_mat_03", ["price"] = 100, ["label"] = "Tapete de Yoga 3" },
            { ["object"] = "p_ld_sax", ["price"] = 100, ["label"] = "Saxofone" },
            { ["object"] = "p_ld_soc_ball_01", ["price"] = 100, ["label"] = "Bola de Futebol" },
            { ["object"] = "p_watch_01", ["price"] = 100, ["label"] = "Relógio 1" },
            { ["object"] = "p_watch_02", ["price"] = 100, ["label"] = "Relógio 2" },
            { ["object"] = "p_watch_03", ["price"] = 100, ["label"] = "Relógio 3" },
            { ["object"] = "p_watch_04", ["price"] = 100, ["label"] = "Relógio 4" },
            { ["object"] = "p_watch_05", ["price"] = 100, ["label"] = "Relógio 5" },
            { ["object"] = "p_watch_06", ["price"] = 100, ["label"] = "Relógio 6" },
            { ["object"] = "apa_mp_h_acc_candles_01", ["price"] = 100, ["label"] = "Vela" },
            { ["object"] = "apa_mp_h_acc_candles_02", ["price"] = 100, ["label"] = "Vela 2" },
            { ["object"] = "apa_mp_h_acc_candles_04", ["price"] = 100, ["label"] = "Vela 3" },
            { ["object"] = "apa_mp_h_acc_candles_06", ["price"] = 100, ["label"] = "Vela 4" },
            { ["object"] = "apa_mp_h_acc_fruitbowl_02", ["price"] = 100, ["label"] = "Tigela de Frutas" },
            { ["object"] = "apa_mp_h_acc_tray_01", ["price"] = 100, ["label"] = "Bandeja" },
            { ["object"] = "prop_bskball_01", ["price"] = 100, ["label"] = "Bola de Basquete" },
            { ["object"] = "prop_cs_wrench", ["price"] = 100, ["label"] = "Chave Inglesa" },
            { ["object"] = "prop_cs_bowie_knife", ["price"] = 100, ["label"] = "Faca Bowie" },
            { ["object"] = "prop_w_me_hatchet", ["price"] = 100, ["label"] = "Machado" },
        }
    }
}
