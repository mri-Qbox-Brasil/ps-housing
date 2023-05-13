-- TBH I should have learnt how lua inheritance worked instead of making a new class but oh well. Maybe next time

Apartment = {
    apartmentData = {},
    apartments = {},

    RegisterPropertyEntrance = function (self)
        local door = self.apartmentData.door
        local targetName = string.format("%s_apartment",self.apartmentData.label)

        -- not sure why but referencing self directy runs it when registering the zones
        local function enterApartment() 
            self:EnterApartment()
        end

        local function seeAll()
            self:GetMenuForAll()
        end

        if Config.Target == "qb" then
            exports['qb-target']:AddBoxZone(targetName, vector3(door.x, door.y, door.z), door.length, door.width, {
                name = targetName,
                heading = door.h,
                debugPoly = Config.DebugZones,
                minZ = door.z - 1.0,
                maxZ = door.z + 2.0,
            }, {
                options = {
                    {
                        label = "Enter Apartment",
                        action = enterApartment,
                    },
                    {
                        label = "See all apartments",
                        action = seeAll,
                    }
                }
            })
        elseif Config.Target == "ox" then
            exports.ox_target:addBoxZone({
                id = targetName,
                coords = vector3(door.x, door.y, door.z),
                size = vector3(door.length, door.width, 3.0),
                rotation = door.h,
                debug = Config.DebugZones,
                options = {
                    {
                        name = "enter",
                        label = "Enter Apartment",
                        onSelect = enterApartment,
                    },
                    {
                        name = "seeall",
                        label = "See all apartments",
                        onSelect = seeAll,
                    }
                }
            })
        end
    end,

    EnterApartment = function(self)
        if next(self.apartments) == nil then 
            lib.notify({title="You dont have an apartment here.", type="error"})
            return
        end

        for propertyId, _  in pairs(self.apartments) do
            local property = PropertiesTable[propertyId]

            if property.propertyData.owner then
                TriggerServerEvent('ps-housing:server:enterProperty', property.property_id)
            else
                lib.notify({title="You dont have an apartment here.", type="error"})
            end
        end
    end,

    GetMenuForAll = function(self)
        if next(self.apartments) == nil then 
            lib.notify({title="There are no apartments here.", type="error"})
            return
        end

        local id = "apartments-" .. self.apartmentData.label
        local menu = {
            id = id,
            title = "Apartments",
            options = {}
        }

        for propertyId, _ in pairs(self.apartments) do
            table.insert(menu.options,{
                title = PropertiesTable[propertyId].propertyData.label,
                onSelect = function()
                    TriggerServerEvent('ps-housing:server:enterProperty', propertyId) 
                end,
            })
        end 

        lib.registerContext(menu)
        lib.showContext(id)
    end,

    AddProperty = function(self, propertyId)
        self.apartments[propertyId] = true
    end,

    RemoveProperty = function(self, propertyId) 
        if self.apartments[propertyId] == nil then return end

        self.apartments[propertyId] = nil
    end,
}

function Apartment:new(apartmentData)
    local obj = {}

    obj.apartmentData = apartmentData
    obj.apartments = apartmentData.apartments or {}

    setmetatable(obj, self)
    self.__index = self

    obj:RegisterPropertyEntrance()

    return obj
end