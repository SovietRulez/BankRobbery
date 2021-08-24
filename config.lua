Config = {}
Config.RegisterItem = "advancedlockpick"
Config.DoorItem = "security_card_01"
Config.VaultItem = "c4"
Config.SDBItem = "drill"
Config.Banks = {
    PacificStandard = {
        requiredCops = 0,
        Zones = {
            register1 = { 
                coords = vector3(254.58, 222.46, 106.29), 
                type = 'register',
                status = {opened = false, cooldown = 10, onCooldown = false},
                heading = 161.27,
                pedCoords = vector3(254.58, 222.46, 105.29),
                pedHeading = 248.97,
            },
            register2 = {
                coords = vector3(244.02, 226.2, 106.29), 
                type = 'register',
                status = {opened = false, cooldown = 10, onCooldown = false},
                heading = 161.27,
                pedCoords = vector3(244.02, 226.2, 105.29),
                pedHeading = 248.97,
           },
           register3 = { 
                coords = vector3(246.81, 225.29, 106.29),
                type = 'register',
                status = {opened = false, cooldown = 10, onCooldown = false},
                heading = 161.27,
                pedCoords = vector3(246.81, 225.29, 105.29),
                pedHeading = 248.97,
            },
            register4 = { 
                coords = vector3(249.25, 224.19, 106.29),
                type = 'register',
                status = {opened = false, cooldown = 10, onCooldown = false},
                heading = 161.27,
                pedCoords = vector3(249.25, 224.19, 105.29),
                pedHeading = 248.97,
            },
            register5 = { 
                coords = vector3(252.04, 223.28, 106.29),
                type = 'register',
                status = {opened = false, cooldown = 10, onCooldown = false},
                heading = 161.27,
                pedCoords = vector3(252.04, 223.28, 105.29),
                pedHeading = 248.97,
            },
            register6 = { 
                coords = vector3(241.67, 227.13, 106.29),
                type = 'register',
                status = {opened = false, cooldown = 10, onCooldown = false},
                heading = 161.27,
                pedCoords = vector3(241.67, 227.13, 105.29),
                pedHeading = 248.97,
            },
            MainDoor = { 
                coords = vector3(261.66, 222.24, 106.28),
                type = 'door',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = 746855201,
                heading = 250.0,
                pedCoords = vector3(261.0, 221.90, 105.28),
                pedHeading = 248.97,
            },
            deskDoor = {
                coords = vector3(256.82, 219.97, 106.29), 
                type = 'door',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = -222270721,
                heading = 340.0,
                pedCoords = vector3(256.82, 219.54, 105.29),
                pedHeading = 330.68
           },
           sideDoor = { 
                coords = vector3(236.88, 227.7, 106.29), 
                type = 'door',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = 1956494919,
                heading = 340.0,
                pedCoords = vector3(236.04, 227.28, 105.29),
                pedHeading = 156.7
            },
            topOfStairs = { 
                coords = vector3(266.1, 218.4, 110.28), 
                type = 'door',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = 1956494919,
                heading = 340.0,
                pedCoords = vector3(265.83, 218.87, 109.28),
                pedHeading = 154.94,
            },
            basementDoor = { 
                coords = vector3(252.73, 221.31, 101.68), 
                type = 'door',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = -1508355822,
                heading = 160.31,
                pedCoords = vector3(253.47, 221.57, 100.68),
                pedHeading = 156.34,
            },
            inSafeDoor = { 
                coords = vector3(261.03, 215.42, 101.68), 
                type = 'door',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = -1508355822,
                heading = 250.0,
                pedCoords = vector3(260.79, 216.22, 100.68),
                pedHeading = 248.97,
            },
            vaultDoor = { 
                coords = vector3(254.05, 225.15, 101.88),
                type = 'vault',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = 961976194,
                heading = 160.02,
                pedCoords = vector3(254.2, 225.03, 100.88),
                pedHeading = 163.26,
                bombSite = vector3(253.99, 224.66, 101.88),
                openHeading = 330.0,
            },
            safe1 = {
                coords = vector3(257.96, 218.61, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(257.65, 218.16, 100.68),
                pedHeading = 335.47,
            },
            safe2 = {
                coords = vector3(258.96, 218.25, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(258.61, 217.84, 100.68),
                pedHeading = 335.47,
            },
            safe3 = {
                coords = vector3(260.0, 217.9, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(259.67, 217.53, 100.68),
                pedHeading = 335.47,
            },
            safe4 = {
                coords = vector3(261.09, 217.43, 101.68), 
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(260.94, 216.89, 100.68),
                pedHeading = 335.47,
            },
            safe5 = {
                coords = vector3(263.2, 216.68, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(262.82, 216.47, 100.68),
                pedHeading = 335.47,
            },
            safe6 = {
                coords = vector3(264.16, 216.39, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(264.06, 215.91, 100.68),
                pedHeading = 335.47,
            },
            safe7 = {
                coords = vector3(265.32, 215.87, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(265.07, 215.66, 100.68),
                pedHeading = 335.47,
            },
            safe8 = {
                coords = vector3(266.37, 214.27, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                heading = 245.97,
                pedCoords = vector3(265.93, 214.49, 100.68),
                pedHeading = 248.11,
            },
            safe9 = {
                coords = vector3(265.78, 212.76, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                heading = 245.97,
                pedCoords = vector3(265.45, 212.96, 100.68),
                pedHeading = 248.11,
            },
            safe10 = {
                coords = vector3(264.66, 211.89, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(264.94, 212.23, 100.68),
                pedHeading = 149.19,
            },
            safe11 = {
                coords = vector3(263.62, 212.22, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(263.92, 212.59, 100.68),
                pedHeading = 149.19,
            },
            safe12 = {
                coords = vector3(262.41, 212.72, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(262.66, 213.0, 100.68),
                pedHeading = 149.19,
            },
            safe13 = {
                coords = vector3(259.9, 213.62, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(260.08, 214.12, 100.68),
                pedHeading = 155.84,
            },
            safe14 = {
                coords = vector3(258.74, 214.16, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(258.99, 214.45, 100.68),
                pedHeading = 155.84,
            },
            safe15 = {
                coords = vector3(257.28, 214.77, 101.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(257.46, 215.0, 100.68),
                pedHeading = 153.84,
            },
        },
    },
    LegionBank = {
        requiredCops = 1,
        Zones = {
            vaultDoor = { 
                coords = vector3(148.02, -1044.36, 29.5),
                type = 'vault',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = 2121050683,
                heading = 249.84,
                pedCoords = vector3(147.26, -1044.87, 28.37),
                pedHeading = 247.72,
                bombSite = vector3(147.71,-1045.09,29.37),
                openHeading = 84.1,
            },
            insideDoor = { 
                coords = vector3(149.54, -1046.78, 29.6), 
                type = 'door',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = -1591004109,
                heading = 160.31,
                pedCoords = vector3(149.67, -1046.29, 28.35),
                pedHeading = 154.43,
            },
            safe1 = {
                coords = vector3(150.35, -1045.17, 29.35),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(150.16, -1045.49, 28.35),
                pedHeading = 337.64,
            },
            safe2 = {
                coords = vector3(151.17, -1046.43, 29.35),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(150.73, -1046.23, 28.35),
                pedHeading = 245.34,
            },
            safe3 = {
                coords = vector3(150.28, -1049.72, 29.35),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(149.93, -1049.66, 28.35),
                pedHeading = 251.53,
            },
            safe4 = {
                coords = vector3(148.94, -1050.98, 29.35),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(149.09, -1050.38, 28.35),
                pedHeading = 148.0,
            },
            safe5 = {
                coords = vector3(147.63, -1050.52, 29.35),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(147.98, -1049.92, 28.35),
                pedHeading = 149.07,
            },
            safe6 = {
                coords = vector3(146.85, -1048.63, 29.35),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(147.34, -1048.8, 28.35),
                pedHeading = 68.07,
            },
        },
    },
    GreatOceanBank = {
        requiredCops = 1,
        Zones = {
            vaultDoor3 = { 
                coords = vector3(-2957.77, 481.86, 15.7),
                type = 'vault',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = -63539571,
                heading = 357.54,
                pedCoords = vector3(-2957.88, 481.7, 14.7),
                pedHeading = 339.58,
                bombSite = vector3(-2957.58, 482.12, 15.8),
                openHeading = 84.1,
            },
            insideDoor2 = { 
                coords = vector3(-2956.51, 484.8, 15.9), 
                type = 'door',
                status = {opened = false, cooldown = 10, onCooldown = false},
                hash = -1591004109,
                heading = 267.54,
                pedCoords = vector3(-2957.12, 484.54, 14.68),
                pedHeading = 259.5,
            },
            safe1 = {
                coords = vector3(-2958.52, 483.9, 15.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(-2958.04, 483.93, 14.68),
                pedHeading = 85.43,
            },
            safe2 = {
                coords = vector3(-2957.48, 485.7, 15.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(-2957.63, 485.35, 14.68),
                pedHeading = 0.98,
            },
            safe3 = {
                coords = vector3(-2954.33, 486.26, 15.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(-2954.48, 485.87, 14.68),
                pedHeading = 356.47,
            },
            safe4 = {
                coords = vector3(-2952.6, 485.18, 15.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(-2953.03, 485.25, 14.68),
                pedHeading = 261.46,
            },
            safe5 = {
                coords = vector3(-2952.6, 483.81, 15.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(-2953.11, 483.91, 14.68),
                pedHeading = 267.57,
            },
            safe6 = {
                coords = vector3(-2954.22, 482.47, 15.68),
                type = 'sdb',
                status = {broken = false, opened = false, cooldown = 10, onCooldown = false},
                pedCoords = vector3(-2954.19, 482.94, 14.68),
                pedHeading = 176.07,
            },
        },
    },
}
