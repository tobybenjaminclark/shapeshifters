{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rmMatchPose",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_1E3F78B8","path":"rooms/rmMatchPose/rmMatchPose.yy",},
    {"name":"inst_7DEAF1F4","path":"rooms/rmMatchPose/rmMatchPose.yy",},
    {"name":"inst_7A34AFF7","path":"rooms/rmMatchPose/rmMatchPose.yy",},
    {"name":"inst_603B4B49","path":"rooms/rmMatchPose/rmMatchPose.yy",},
    {"name":"inst_4F2E4203","path":"rooms/rmMatchPose/rmMatchPose.yy",},
    {"name":"inst_27ED0BC3","path":"rooms/rmMatchPose/rmMatchPose.yy",},
    {"name":"inst_287671ED","path":"rooms/rmMatchPose/rmMatchPose.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"ShakeLayer","depth":0,"effectEnabled":true,"effectType":"_filter_twist_blur","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_TwistBlurCenter","type":0,"value":"0.5",},
        {"name":"g_TwistBlurCenter","type":0,"value":"0.5",},
        {"name":"g_TwistBlurIntensity","type":0,"value":"0",},
        {"name":"g_TwistBlurTexture","type":2,"value":"_filter_twist_blur_texture",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_603B4B49","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"testObj","path":"objects/testObj/testObj.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":39.0,"y":687.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"StartOther","depth":200,"effectEnabled":true,"effectType":"_filter_stripes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7DEAF1F4","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oOtherPlayerPose","path":"objects/oOtherPlayerPose/oOtherPlayerPose.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":1024.0,"y":352.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_4F2E4203","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oGameState","path":"objects/oGameState/oGameState.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":128.0,"y":672.0,},
      ],"layers":[],"properties":[
        {"name":"g_StripesWidth","type":0,"value":"64",},
        {"name":"g_StripesDirection","type":0,"value":"0",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesDisplacement","type":0,"value":"0.5",},
        {"name":"g_StripesSpeed","type":0,"value":"0.85",},
        {"name":"g_StripesFrequency","type":0,"value":"128",},
        {"name":"g_StripesAmplitude","type":0,"value":"0",},
        {"name":"g_StripesColours","type":0,"value":"4",},
        {"name":"g_StripesSharpness","type":0,"value":"0.5",},
        {"name":"g_StripesPalette","type":2,"value":"sprLosePallette",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Start","depth":300,"effectEnabled":true,"effectType":"_filter_stripes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1E3F78B8","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oPose","path":"objects/oPose/oPose.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"oPose","path":"objects/oPose/oPose.yy",},"propertyId":{"name":"pose_struct","path":"objects/oPose/oPose.yy",},"value":"",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":315.0,"y":352.0,},
      ],"layers":[],"properties":[
        {"name":"g_StripesWidth","type":0,"value":"92",},
        {"name":"g_StripesDirection","type":0,"value":"186",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesDisplacement","type":0,"value":"0.5",},
        {"name":"g_StripesSpeed","type":0,"value":"1.25",},
        {"name":"g_StripesFrequency","type":0,"value":"128",},
        {"name":"g_StripesAmplitude","type":0,"value":"59",},
        {"name":"g_StripesColours","type":0,"value":"4",},
        {"name":"g_StripesSharpness","type":0,"value":"0.5",},
        {"name":"g_StripesPalette","type":2,"value":null,},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Logo","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_19E7F47_1","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.123528145,"scaleY":0.12352816,"spriteId":{"name":"sprLogo","path":"sprites/sprLogo/sprLogo.yy",},"x":547.65955,"y":694.0,},
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_1975CE9D","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.58494025,"scaleY":0.5849402,"spriteId":{"name":"sprThem","path":"sprites/sprThem/sprThem.yy",},"x":928.0,"y":128.0,},
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_63F628AF","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.59461546,"scaleY":0.5946154,"spriteId":{"name":"sprYou","path":"sprites/sprYou/sprYou.yy",},"x":233.00006,"y":98.134766,},
      ],"depth":400,"effectEnabled":true,"effectType":"_filter_stripes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_StripesWidth","type":0,"value":"64",},
        {"name":"g_StripesDirection","type":0,"value":"226",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesDisplacement","type":0,"value":"0.825",},
        {"name":"g_StripesSpeed","type":0,"value":"2",},
        {"name":"g_StripesFrequency","type":0,"value":"128",},
        {"name":"g_StripesAmplitude","type":0,"value":"19",},
        {"name":"g_StripesColours","type":0,"value":"2",},
        {"name":"g_StripesSharpness","type":0,"value":"1.2",},
        {"name":"g_StripesPalette","type":2,"value":"sprLogoOverlay",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Podium","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_7380D39A","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":1.0,"scaleY":0.84313726,"spriteId":{"name":"sprPodium","path":"sprites/sprPodium/sprPodium.yy",},"x":352.0,"y":224.0,},
      ],"depth":500,"effectEnabled":true,"effectType":"_filter_stripes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_StripesWidth","type":0,"value":"52",},
        {"name":"g_StripesDirection","type":0,"value":"39",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesDisplacement","type":0,"value":"0.875",},
        {"name":"g_StripesSpeed","type":0,"value":"1.25",},
        {"name":"g_StripesFrequency","type":0,"value":"143",},
        {"name":"g_StripesAmplitude","type":0,"value":"84",},
        {"name":"g_StripesColours","type":0,"value":"5",},
        {"name":"g_StripesSharpness","type":0,"value":"0",},
        {"name":"g_StripesPalette","type":2,"value":"sprLogoOverlay",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Presenter","depth":600,"effectEnabled":true,"effectType":"_filter_stripes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_7A34AFF7","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oPresenter","path":"objects/oPresenter/oPresenter.yy",},"properties":[],"rotation":7.9276123,"scaleX":0.3225,"scaleY":0.3225,"x":524.8274,"y":89.30412,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_27ED0BC3","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oScore","path":"objects/oScore/oScore.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":522.0,"y":659.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_287671ED","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oScore","path":"objects/oScore/oScore.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":777.0,"y":659.0,},
      ],"layers":[],"properties":[
        {"name":"g_StripesWidth","type":0,"value":"30",},
        {"name":"g_StripesDirection","type":0,"value":"59",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesDisplacement","type":0,"value":"0.95",},
        {"name":"g_StripesSpeed","type":0,"value":"0.7",},
        {"name":"g_StripesFrequency","type":0,"value":"128",},
        {"name":"g_StripesAmplitude","type":0,"value":"48",},
        {"name":"g_StripesColours","type":0,"value":"4",},
        {"name":"g_StripesSharpness","type":0,"value":"0.5",},
        {"name":"g_StripesPalette","type":2,"value":"sprLogoOverlay",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Gradient2","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_269389B4","animationSpeed":1.0,"colour":3388997631,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":180.0,"scaleX":0.7114584,"scaleY":0.17777766,"spriteId":{"name":"StageGrad","path":"sprites/StageGrad/StageGrad.yy",},"x":1366.0,"y":767.9999,},
      ],"depth":700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Stage","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_F802810","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":21.343752,"scaleY":3.0,"spriteId":{"name":"Stagefloor","path":"sprites/Stagefloor/Stagefloor.yy",},"x":0.0,"y":576.0,},
      ],"depth":800,"effectEnabled":true,"effectType":"_filter_stripes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_StripesWidth","type":0,"value":"28",},
        {"name":"g_StripesDirection","type":0,"value":"84",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesDisplacement","type":0,"value":"0.95",},
        {"name":"g_StripesSpeed","type":0,"value":"0.95",},
        {"name":"g_StripesFrequency","type":0,"value":"512",},
        {"name":"g_StripesAmplitude","type":0,"value":"23",},
        {"name":"g_StripesColours","type":0,"value":"4",},
        {"name":"g_StripesSharpness","type":0,"value":"0.5",},
        {"name":"g_StripesPalette","type":2,"value":"sprLobbyPallette",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Gradient","assets":[
        {"resourceType":"GMRSpriteGraphic","resourceVersion":"1.0","name":"graphic_209F7811","animationSpeed":1.0,"colour":4294967295,"frozen":false,"headPosition":0.0,"ignore":false,"inheritedItemId":null,"inheritItemSettings":false,"rotation":0.0,"scaleX":0.7114584,"scaleY":0.5555556,"spriteId":{"name":"StageGrad","path":"sprites/StageGrad/StageGrad.yy",},"x":0.0,"y":0.0,},
      ],"depth":900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Spotlight","depth":1000,"effectEnabled":true,"effectType":"_filter_dots","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_DotsScale","type":0,"value":"512",},
        {"name":"g_DotsSize","type":0,"value":"0.4",},
        {"name":"g_DotsSize","type":0,"value":"0.6",},
        {"name":"g_DotsOffset","type":0,"value":"0",},
        {"name":"g_DotsOffset","type":0,"value":"0",},
        {"name":"g_DotsDisplacement","type":0,"value":"1",},
        {"name":"g_DotsSpeed","type":0,"value":"0.9",},
        {"name":"g_DotsColourSpeed","type":0,"value":"0",},
        {"name":"g_DotsColours","type":0,"value":"4",},
        {"name":"g_DotsSharpness","type":0,"value":"0.5",},
        {"name":"g_DotsPalette","type":2,"value":"sprLobbyLights",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Wave","depth":1100,"effectEnabled":true,"effectType":"_filter_stripes","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_StripesWidth","type":0,"value":"59",},
        {"name":"g_StripesDirection","type":0,"value":"306",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesOffset","type":0,"value":"0",},
        {"name":"g_StripesDisplacement","type":0,"value":"0.45",},
        {"name":"g_StripesSpeed","type":0,"value":"1.35",},
        {"name":"g_StripesFrequency","type":0,"value":"286",},
        {"name":"g_StripesAmplitude","type":0,"value":"45",},
        {"name":"g_StripesColours","type":0,"value":"6",},
        {"name":"g_StripesSharpness","type":0,"value":"0",},
        {"name":"g_StripesPalette","type":2,"value":"sprLobbyPallette",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":1200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 768,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1366,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": false,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}