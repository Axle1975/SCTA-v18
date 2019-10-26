-- Note that the order here will determine the faction index
-- (it's the automatically assigned array index)
Factions = {
    {
        Key = 'uef',
        Category = 'UEF',
        DisplayName = "<LOC _UEF>UEF",
        SoundPrefix = 'UEF',
        InitialUnit = 'uel0001',
        CampaignFileDesignator = 'E',
        TransmissionLogColor = 'ff00c1ff',
        Icon = "/widgets/faction-icons-alpha_bmp/uef_ico.dds",
        VeteranIcon = "/game/veteran-logo_bmp/uef-veteran_bmp.dds",
        SmallIcon = "/faction_icon-sm/uef_ico.dds",
        LargeIcon = "/faction_icon-lg/uef_ico.dds",
        TooltipID = 'lob_uef',
        DefaultSkin = 'uef',
        loadingMovie = '/movies/UEF_load.sfd',
        loadingColor = 'FFbadbdb',
        loadingTexture = '/UEF_load.dds',
        IdleEngTextures = {
            T1 = '/icons/units/uel0105_icon.dds',
            T2 = '/icons/units/uel0208_icon.dds',
            T2F = '/icons/units/xel0209_icon.dds',
            T3 = '/icons/units/uel0309_icon.dds',
            SCU = '/icons/units/uel0301_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/icons/units/ueb0101_icon.dds',
                '/icons/units/ueb0201_icon.dds',
                '/icons/units/ueb0301_icon.dds',
            },
            AIR = {
                '/icons/units/ueb0102_icon.dds',
                '/icons/units/ueb0202_icon.dds',
                '/icons/units/ueb0302_icon.dds',
            },
            NAVAL = {
                '/icons/units/ueb0103_icon.dds',
                '/icons/units/ueb0203_icon.dds',
                '/icons/units/ueb0303_icon.dds',
            },
        },
    },

    {
        Key = 'aeon',
        Category = 'AEON',
        DisplayName = "<LOC _Aeon>Aeon",
        SoundPrefix = 'Aeon',
        InitialUnit = 'ual0001',
        CampaignFileDesignator = 'A',
        TransmissionLogColor = 'ffff0000',
        Icon = "/widgets/faction-icons-alpha_bmp/aeon_ico.dds",
        VeteranIcon = "/game/veteran-logo_bmp/aeon-veteran_bmp.dds",
        SmallIcon = "/faction_icon-sm/aeon_ico.dds",
        LargeIcon = "/faction_icon-lg/aeon_ico.dds",
        TooltipID = 'lob_aeon',
        DefaultSkin = 'aeon',
        loadingMovie = '/movies/aeon_load.sfd',
        loadingColor = 'FFc7e98a',
        loadingTexture = '/aeon_load.dds',
        IdleEngTextures = {
            T1 = '/icons/units/ual0105_icon.dds',
            T2 = '/icons/units/ual0208_icon.dds',
            T3 = '/icons/units/ual0309_icon.dds',
            SCU = '/icons/units/ual0301_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/icons/units/uab0101_icon.dds',
                '/icons/units/uab0201_icon.dds',
                '/icons/units/uab0301_icon.dds',
            },
            AIR = {
                '/icons/units/uab0102_icon.dds',
                '/icons/units/uab0202_icon.dds',
                '/icons/units/uab0302_icon.dds',
            },
            NAVAL = {
                '/icons/units/uab0103_icon.dds',
                '/icons/units/uab0203_icon.dds',
                '/icons/units/uab0303_icon.dds',
            },
        },
    },

    {
        Key = 'cybran',
        Category = 'CYBRAN',
        DisplayName = "<LOC _Cybran>Cybran",
        SoundPrefix = 'Cybran',
        InitialUnit = 'url0001',
        CampaignFileDesignator = 'R',
        TransmissionLogColor = 'ff89d300',
        Icon = "/widgets/faction-icons-alpha_bmp/cybran_ico.dds",
        VeteranIcon = "/game/veteran-logo_bmp/cybran-veteran_bmp.dds",
        SmallIcon = "/faction_icon-sm/cybran_ico.dds",
        LargeIcon = "/faction_icon-lg/cybran_ico.dds",
        TooltipID = 'lob_cybran',
        DefaultSkin = 'cybran',
        loadingMovie = '/movies/cybran_load.sfd',
        loadingColor = 'FFe24f2d',
        loadingTexture = '/cybran_load.dds',
        IdleEngTextures = {
            T1 = '/icons/units/url0105_icon.dds',
            T2 = '/icons/units/url0208_icon.dds',
            T3 = '/icons/units/url0309_icon.dds',
            SCU = '/icons/units/url0301_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/icons/units/urb0101_icon.dds',
                '/icons/units/urb0201_icon.dds',
                '/icons/units/urb0301_icon.dds',
            },
            AIR = {
                '/icons/units/urb0102_icon.dds',
                '/icons/units/urb0202_icon.dds',
                '/icons/units/urb0302_icon.dds',
            },
            NAVAL = {
                '/icons/units/urb0103_icon.dds',
                '/icons/units/urb0203_icon.dds',
                '/icons/units/urb0303_icon.dds',
            },
        },
    },

    {
        Key = 'seraphim',
        Category = 'SERAPHIM',
        DisplayName = "<LOC _Seraphim>Seraphim",
        SoundPrefix = 'Seraphim',
        InitialUnit = 'xsl0001',
        CampaignFileDesignator = 'S',
        TransmissionLogColor = 'ff00FF00',
        Icon = "/widgets/faction-icons-alpha_bmp/seraphim_ico.dds",
        VeteranIcon = "/game/veteran-logo_bmp/seraphim-veteran_bmp.dds",
        SmallIcon = "/faction_icon-sm/seraphim_ico.dds",
        LargeIcon = "/faction_icon-lg/seraphim_ico.dds",
        TooltipID = 'lob_seraphim',
        DefaultSkin = 'seraphim',
        loadingMovie = '/movies/seraphim_load.sfd',
        loadingColor = 'FFffd700',
        loadingTexture = '/seraphim_load.dds',
        IdleEngTextures = {
            T1 = '/icons/units/xsl0105_icon.dds',
            T2 = '/icons/units/xsl0208_icon.dds',
            T3 = '/icons/units/xsl0309_icon.dds',
            SCU = '/icons/units/xsl0301_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/icons/units/xsb0101_icon.dds',
                '/icons/units/xsb0201_icon.dds',
                '/icons/units/xsb0301_icon.dds',
            },
            AIR = {
                '/icons/units/xsb0102_icon.dds',
                '/icons/units/xsb0202_icon.dds',
                '/icons/units/xsb0302_icon.dds',
            },
            NAVAL = {
                '/icons/units/xsb0103_icon.dds',
                '/icons/units/xsb0203_icon.dds',
                '/icons/units/xsb0303_icon.dds',
            },
        },
    },
    {
        Key = 'arm',
        Category = 'ARM',
        DisplayName = "ARM",
        SoundPrefix = 'ARM',
        InitialUnit = 'ARMCOM',
        CampaignFileDesignator = 'M',
        TransmissionLogColor = 'ff0000ff',
        Icon = "/mods/SCTA/textures/ui/common/widgets/faction-icons-alpha_bmp/arm_ico.dds",
        VeteranIcon = "/mods/SCTA/textures/ui/common/game/veteran-logo_bmp/arm-veteran_bmp.dds",
        SmallIcon = "/mods/SCTA/textures/ui/common/faction_icon-sm/arm_ico.dds",
        LargeIcon = "/mods/SCTA/textures/ui/common/faction_icon-lg/arm_ico.dds",
        TooltipID = 'lob_arm',
        DefaultSkin = 'uef',
        loadingMovie = '/movies/UEF_load.sfd',
        loadingColor = 'FFbadbdb',
        loadingTexture = '/UEF_load.dds',
        IdleEngTextures = {
            T1 = '/mods/SCTA/textures/ui/common/icons/units/armck_icon.dds',
            T2 = '/mods/SCTA/textures/ui/common/icons/units/armack_icon.dds',
            T3 = '/icons/units/xsl0309_icon.dds',
            SCU = '/icons/units/xsl0301_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/mods/SCTA/textures/ui/common/icons/units/armlab_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/armalab_icon.dds',
                '/icons/units/xsb0301_icon.dds',
            },
            AIR = {
                '/mods/SCTA/textures/ui/common/icons/units/armap_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/armaap_icon.dds',
                '/icons/units/xsb0302_icon.dds',
            },
            NAVAL = {
                '/mods/SCTA/textures/ui/common/icons/units/armsy_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/armasy_icon.dds',
                '/icons/units/xsb0303_icon.dds',
            },
        },
    },

    {
        Key = 'core',
        Category = 'CORE',
        DisplayName = 'CORE',
        SoundPrefix = 'CORE',
        InitialUnit = 'CORCOM',
        CampaignFileDesignator = 'K',
        TransmissionLogColor = 'ffff0000',
        Icon = "/mods/SCTA/textures/ui/common/widgets/faction-icons-alpha_bmp/core_ico.dds",
        VeteranIcon = "/mods/SCTA/textures/ui/common/game/veteran-logo_bmp/core-veteran_bmp.dds",
        SmallIcon = "/mods/SCTA/textures/ui/common/faction_icon-sm/core_ico.dds",
        LargeIcon = "/mods/SCTA/textures/ui/common/faction_icon-lg/core_ico.dds",
        TooltipID = 'lob_core',
        DefaultSkin = 'cybran',
        loadingMovie = '/movies/cybran_load.sfd',
        loadingColor = 'FFe24f2d',
        loadingTexture = '/cybran_load.dds',
        IdleEngTextures = {
            T1 = '/mods/SCTA/textures/ui/common/icons/units/corck_icon.dds',
            T2 = '/mods/SCTA/textures/ui/common/icons/units/corack_icon.dds',
            T3 = '/icons/units/xsl0309_icon.dds',
            SCU = '/icons/units/xsl0301_icon.dds',
        },
        IdleFactoryTextures = {
            LAND = {
                '/mods/SCTA/textures/ui/common/icons/units/corlab_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/coralab_icon.dds',
                '/icons/units/xsb0301_icon.dds',
            },
            AIR = {
                '/mods/SCTA/textures/ui/common/icons/units/corap_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/coraap_icon.dds',
                '/icons/units/xsb0302_icon.dds',
            },
            NAVAL = {
                '/mods/SCTA/textures/ui/common/icons/units/corsy_icon.dds',
                '/mods/SCTA/textures/ui/common/icons/units/corasy_icon.dds',
                '/icons/units/xsb0303_icon.dds',
            },
        },
    },
}

-- map faction key to index, as this lookup is done frequently
FactionIndexMap = {}

-- file designator to faction key
FactionDesToKey = {}

for index, value in Factions do
    FactionIndexMap[value.Key] = index
    FactionDesToKey[value.CampaignFileDesignator] = value.Key
end
