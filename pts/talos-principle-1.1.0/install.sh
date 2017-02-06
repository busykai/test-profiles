#!/bin/sh

HOME=$DEBUG_REAL_HOME steam steam://install/257510

cd $DEBUG_REAL_HOME/.steam/steam/steamapps/common/The\ Talos\ Principle/Content/Talos/Config

mv AutoDetect.lua AutoDetect.lua.original
echo "return;" > AutoDetect.lua

cd ~

echo "RunAsync(function()
  -- wait until start screen is shown
  Wait(CustomEvent(\"StartScreen_Shown\"));
  -- handle initial interactions
  gamHandleInitialInteractions();
  
  -- use medium speed by default
  prj_psGameOptionPlayerSpeed = 1;
  -- make sure developer cheats are enabled
  cht_bEnableCheats = 2;
  -- enable the bot
  cht_bAutoTestBot = 1;
  -- optional: make bot skip terminals and QR codes
  bot_bSkipTerminalsAndMessages = 1;
  -- start a new game
  local episode = \"Content/Talos/Levels/Demo.nfo\"
  bmk_bAutoQuit = 1;
  bmkStartBenchmarking(3, 30);
  prjStartNewTalosGame(episode);
  Wait(Delay(36))
  bmkResults();
  Quit();
  
  -- wait until game ends
  BreakableRunHandled(
    WaitForever,
    -- if fame ended
    On(CustomEvent(\"GameEnded\")),
    function()
      print(\"Finished auto test bot run\");
      BreakRunHandled();
    end,
    -- if test bot failed
    On(CustomEvent(\"AutoTestBot_Failed\")),
    function()
      BreakRunHandled();
    end
  )
  -- quit the game after finished running the auto test bot
  quit();
end);" > $HOME/talos-run-test.lua

echo "#!/bin/bash
#!/bin/sh
export HOME=\$DEBUG_REAL_HOME
export SteamStreaming=\"\"
export LD_LIBRARY_PATH=\"\$DEBUG_REAL_HOME/.steam/ubuntu12_32:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/panorama:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/steam-runtime/i386/lib/i386-linux-gnu:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/steam-runtime/i386/lib:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/steam-runtime/i386/usr/lib/i386-linux-gnu:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/steam-runtime/i386/usr/lib:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/steam-runtime/amd64/lib/x86_64-linux-gnu:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/steam-runtime/amd64/lib:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu:\$DEBUG_REAL_HOME/.steam/ubuntu12_32/steam-runtime/amd64/usr/lib::/usr/lib32:\$DEBUG_REAL_HOME/.steam/ubuntu12_32:\$DEBUG_REAL_HOME/.steam/ubuntu12_64:\$DEBUG_REAL_HOME/.steam/steam/steamapps/common/The\ Talos\ Principle/Bin:\$DEBUG_REAL_HOME/.steam/steam/steamapps/common/The\ Talos\ Principle/Bin/bin\"
export STEAM_CLIENT_CONFIG_FILE=\"\$DEBUG_REAL_HOME/.steam/steam.cfg\"
export Steam3Master=\"127.0.0.1:57343\"
export SteamStreamingMaximumResolution=\"\"
export SteamStreamingAllowGameVsync=\"\"
export SDL_VIDEO_X11_DGAMOUSE=\"0\"
export SteamAppId=\"257510\"
export SteamTenfoot=\"0\"

cat <<EOF > \$HOME/.steam/steam/userdata/*/257510/local/Talos.ini
adq_fCorpseDebrisFpsTreshold = 25;
adq_fParticlesFpsTreshold = 25;
adq_fRagdollFpsTreshold = 25;
bmk_bBenchmarkDemos = 0;
bmk_bOnScreenReport = 1;
bot_bAllowDeath = 0;
bot_bAllowSprinting = 1;
bot_bGodMode = 0;
bot_bIgnoreEnemies = 0;
bot_bIgnoreSecrets = 0;
bot_bInfiniteAmmo = 0;
bot_bShowName = 1;
bot_bSkipTerminalsAndMessages = 0;
bot_bTouchScreenAiming = 0;
bot_fRotAngleAdd = 3;
bot_fRotAngleMulti = 1.5;
bot_fRotAngleMultiAdd = 0.055;
bot_fThreatAngleAdd = 1.1;
bot_fThreatAngleMulti = 1;
bot_fThreatDistanceMulti = 0.5;
bot_iLogActivity = 0;
bot_iRecordPlayerActions = 0;
bot_iStopBotOnErrors = 0;
ccn_fLineFadeTime = 2;
ccn_fLineLifeTime = 10;
ccn_fTextStretch = 0.7;
ccn_iLastLines = 8;
ccn_iMaxChatConsoleMessages = 50;
ccn_vBottomLeft.x = 10;
ccn_vBottomLeft.y = 350;
cht_bEnableCheats = 0;
cht_bUnlockMentalMode = 0;
cld_iMaxThreads = 0;
cli_iMaxBPS = 6000;
cli_iMaxOutBPS = 6000;
cmp_bLowQuality = 0;
cmp_iBaseMip = 0;
cmp_pixMaxSize = 4096;
cmt_bHighlightMine = 1;
cmt_bShowResolved = 0;
cmt_bUseSSL = 1;
cmt_iStatusFilter = 0;
con_fHeightRatio = 0.333;
con_fLastLinesFadeTime = 2;
con_fLastLinesStayTime = 5;
con_iLastLines = 0;
crm_bAllowRendering = 1;
crm_bCastShadows = 0;
crm_bDepthPrepass = 1;
crm_bOcclusionCulling = 1;
crm_bRenderFarCrumbs = 1;
crm_fDensityBias = 1.02;
crm_fDepthPrepassHeightTreshold = 2;
crm_fDistanceBias = 1.02;
crm_fMaxCachingTime = 1;
crm_iMaxAllowedLayers = 4;
ctd_fTypingMultiplier = 1;
dbg_bShowFreeMemory = 0;
dcl_bAutoRemoveCounterLimitedDecals = 1;
dcl_bAutoRemoveGeometryLimitedDecals = 1;
dcl_bAutoRemoveTimeLimitedDecals = 1;
dcl_ctMaxNewTrianglesPerFrame = 2048;
dcl_ctMaxTrianglesPerGroup = 4096;
dcl_iDynamicDecalAddingPerFrameLimitMilliseconds = 5;
dcl_iDynamicUpdateLevel = 0;
edt_bKeepTextureContent = 0;
efx_bAmbientOcclusion = 1;
efx_bAutoExposure = 1;
efx_bChannelOffset = 1;
efx_bDepthOfField = 1;
efx_bDistanceCue = 1;
efx_bExpandOcclusionEdges = 0;
efx_bFastBloomBlur = 0;
efx_bFastBlur = 1;
efx_bFixOcclusionEdges = 1;
efx_bGaussianBlur = 1;
efx_bLightStreaks = 1;
efx_bMotionBlur = 1;
efx_bOptimizeDoF = 1;
efx_bRealsRGB = 1;
efx_bSharpStreaks = 1;
efx_fBlurPrecision = 0.0001;
efx_fDesiredLuminance = 0.18000002;
efx_fFixedEV = 0;
efx_fOcclusionBufferScale = 0.9;
efx_fOcclusionDepthOffset = 15;
efx_fOcclusionDithering = 1;
efx_fOcclusionFallOff = 0.5;
efx_fOcclusionRadius = 0.5;
efx_fOcclusionRadiusMaxStretch = 15;
efx_fOcclusionRadiusMaxStretchDistance = 1000;
efx_fOcclusionRadiusMinStretchDistance = 1;
efx_fOcclusionRadiusWeaponStretch = 0.01;
efx_fStreaksDithering = 0.2;
efx_iBloom = 4;
efx_iDownsampleQuality = 2;
efx_iLensFlareQuality = 3;
efx_iMaxRippleSources = 15;
efx_iOcclusionBlur = 1;
efx_iOcclusionQuality = 1;
efx_iReadLumBuffers = 1;
efx_iStreaksQuality = 2;
fnt_bFontKerning = 1;
fnt_bFontMips = 1;
fnt_bGlyphCachingPass = 1;
fnt_bTrilinearFontFiltering = 1;
fnt_ctGlyphOutlinePoolSize = 100;
fnt_fOutlineStrength = 2;
fnt_iOutlineQuality = 2;
fnt_pixGlyphMapRegionSize = 512;
fnt_pixGlyphMapSize = 2048;
fnt_pixGlyphMapUploadSize = 256;
fnt_pixGlyphMaxSize = 100;
fxd_bAllowFillRateControl = 1;
fxd_bAutoAdaptiveQuality = 1;
fxd_ctMaxActiveEffects = 50;
fxd_ctMaxFadingEffects = 50;
fxd_fDesiredFrameTime = 33;
fxd_fEffectFadeOutTime = 0.5;
gam_bAllowArmorItems = -1;
gam_bAllowHealthItems = -1;
gam_bAllowJoinInProgress = -1;
gam_bAllowPowerupItems = -1;
gam_bAllowSeriousBombItems = -1;
gam_bAmmoStays = -1;
gam_bArmorStays = -1;
gam_bAutoCycleMaps = -1;
gam_bCustomizedDifficulty = -1;
gam_bExtraMPEnemies = -1;
gam_bFriendlyFire = -1;
gam_bHealthStays = -1;
gam_bInfiniteAmmo = -1;
gam_bPowerupsStay = -1;
gam_bRankedMatch = -1;
gam_bRespawnCreditsPerPlayer = 0;
gam_bRespawnInPlace = -1;
gam_bWeaponsStay = -1;
gam_ctFragsLimit = -1;
gam_ctGoalsLimit = -1;
gam_ctMaxPlayers = -1;
gam_ctMinPlayers = -1;
gam_ctPrivateSlots = -1;
gam_ctRoundLimit = -1;
gam_ctTimeLimit = -1;
gam_gdDifficulty = 0;
gam_iExtraEnemyDamagePerPlayer = -1;
gam_iExtraEnemyStrength = -1;
gam_iExtraEnemyStrengthPerPlayer = -1;
gam_iInvulnerableAfterSpawning = -1;
gam_iRespawnCredits = -1;
gfx_bAllowDiscards = 1;
gfx_bAllowMonitorSelection = 1;
gfx_bAutoConfigureExtraWideScreen = 1;
gfx_bAutoUploadGeometry = 1;
gfx_bBatchLimitIndexed = 1;
gfx_bDisableImmersiveMode = 0;
gfx_bFastSRGB = 1;
gfx_bFloatZBuffer = 1;
gfx_bFullScreen = 1;
gfx_bInvertZBuffer = 1;
gfx_bLastGoodFullScreen = 0;
gfx_bLocalPacketReplay = 0;
gfx_bMaximized = 0;
gfx_bPrecreateShaders = 1;
gfx_bReportCanvasManagement = 0;
gfx_bScreenShotAlpha = 0;
gfx_bSimulatedFullScreen = 0;
gfx_bVROverlayCurved = 1;
gfx_fAspectRatio = 0;
gfx_fBlueBias = 1;
gfx_fBrightness = 0;
gfx_fContrast = 1;
gfx_fFreeOcclusionTime = 60;
gfx_fGammaCorrection = 1;
gfx_fGreenBias = 1;
gfx_fNormalizeHDROutput = 0;
gfx_fRedBias = 1;
gfx_fSafeAreaPosX = 0.5;
gfx_fSafeAreaPosY = 0.5;
gfx_fSafeAreaSDX = 0.85;
gfx_fSafeAreaSDY = 0.85;
gfx_fSafeAreaX = 1;
gfx_fSafeAreaY = 1;
gfx_fSaturation = 0;
gfx_fSplitDepthDivisor = 2048;
gfx_fSplitDepthExponent = 4;
gfx_fVRGammaCorrectionDX11 = 1.8;
gfx_fVROverlayDistance = 6;
gfx_fVROverlaySize = 10;
gfx_iAllowPreClears = 1;
gfx_iAntiAliasingSamples = 2;
gfx_iCommandBufferSize = 1024;
gfx_iCommonVertexBuffers = 3;
gfx_iCommonVertexBufferSize = 1536;
gfx_iDebugPreClears = 1;
gfx_iDelayReleaseDuration = 1;
gfx_iDelayResourceRelease = 4;
gfx_iFinish = 0;
gfx_iFullscreenMonitor = 0;
gfx_iFXAA = 3;
gfx_iMaxCreatedShadersPerFrame = 1024;
gfx_iMaxFPSActive = 10000;
gfx_iMaxFPSInactive = 20;
gfx_iMaxQueryIterations = 999999;
gfx_iOutputLevels = 256;
gfx_iRefreshRate = 0;
gfx_iRelaxedOcclusionTest = 0;
gfx_iScreenShotFormat = 3;
gfx_iScreenShotJpgQuality = 90;
gfx_iScreenShotPngCompression = 3;
gfx_iTransparencyAntiAliasing = 1;
gfx_iWaitVSyncs = 0;
gfx_pixLastGoodResHeight = 2160;
gfx_pixLastGoodResWidth = 3840;
gfx_pixLastGoodWinHeight = 2160;
gfx_pixLastGoodWinWidth = 3840;
gfx_pixResHeight = 2160;
gfx_pixResWidth = 3840;
gfx_pixWinHeight = 2160;
gfx_pixWinPosX = 0;
gfx_pixWinPosXMaximized = 0;
gfx_pixWinPosY = 0;
gfx_pixWinPosYMaximized = 0;
gfx_pixWinWidth = 3840;
gst_iStatsUploadType = 0;
hud_bAllowBatching = 1;
hud_bAnimateRodSelection = 1;
hud_bFixedCrosshair = 0;
hud_bFullScreenClock = 1;
hud_bShowAnalyze = 1;
hud_bShowCheats = 1;
hud_bShowClock = 0;
hud_bShowCoords = 0;
hud_bShowCrosshair = 1;
hud_bShowGfxAPI = 0;
hud_bShowHudInfo = 1;
hud_bShowLevelName = 0;
hud_bShowPause = 1;
hud_bShowPing = 0;
hud_bShowRenderingResolution = 0;
hud_bShowShortPlayerList = 1;
hud_bShowTerminalUI = 1;
hud_bShowTime = 0;
hud_fCustomHudScale = 1;
hud_fNetricsaHUDSpeed = 10;
hud_fShortPlayerListScale = 1;
hud_fStereoDepth = 1;
hud_fVotingInfoScale = 1;
hud_iShowBandwidth = 0;
inp_bDebugTouchEvents = 0;
inp_bDisableGamepads = 0;
inp_bDisableWinMMGamepads = 0;
inp_bInvertTouchLook = 0;
inp_bInvertTouchMove = 0;
inp_bTouchGamepadControls = 0;
inp_bTouchLookInertia = 1;
inp_bTouchMoveInertia = 1;
inp_bTouchSmoothing = 0;
inp_fAutoMoveGoalThreshold = 1;
inp_fDesiredHorizonPitch = -8;
inp_fGamepadDetectionTime = 5;
inp_fGuidedJumpTapRadius = 0.5;
inp_fLookMinPitchRatio = 0.30000002;
inp_fTouchGamepadDeadzone = 0.10000001;
inp_fTouchLookIntertiaCutoff = 0.02;
inp_fTouchLookSensitivity = 1.5;
inp_fTouchLookVelocityDamping = 2;
inp_fTouchMoveIntertiaCutoff = 0.2;
inp_fTouchMoveSensitivityX = 2;
inp_fTouchMoveSensitivityZ = 5;
inp_fTouchMoveVelocityDamping = 5;
lmp_bLowQuality = 0;
lmp_iBaseMip = 0;
mdl_bHardwareSkinning = 1;
mdl_bMorphedShadows = 0;
mdl_ctMaxCachedModels = 256;
mem_iOptimizeCopy = 8;
men_bAllowGlowing = 0;
men_bDetectVideoChange = 0;
men_bDontWaitForConfirmations = 0;
men_bHideNetricsaExit = 0;
men_bHideNetricsaInfo = 0;
men_bHideNetricsaList = 0;
men_bShowActiveProfile = 0;
men_bShowIntroCutscene = 1;
men_bSplitScreenInputDeviceSharing = 0;
men_bUseMenuSimulation = 1;
men_ctMaxHistoryEntries = 40;
men_fFlashDelay = 5;
men_fFlashPeriod = 3;
men_fMusicVolumeLoadingMenu = 1;
men_fMusicVolumeMainMenu = 0.2;
men_fMusicVolumeStartMenu = 1;
men_fPulseFrequency = 1.3333;
men_fScaleOverride = 0;
men_fTextScrollSpeed = 30;
men_fWidgetGlowStrength = 0.12;
men_iMaxAllowedFPS = 66;
men_iMaxGlows = 4;
men_pixWidgetGlowRadius = 6;
mgr_fTextureSizeMultiplier = 1;
mgr_slMaxBatchTextureSize = 1024;
mgr_slMaxModelTextureSize = 1024;
nav_bRenderOneWayVerticalLinks = 1;
nav_bRenderVerticalLinks = 1;
nav_fRenderAlpha = 1;
net_bClientsMayPause = 0;
net_fConnectionTimeout = 15;
net_fProblemsTimeout = 15;
net_fRenderableRelevantDistanceMultiplier = 1.3;
nex_iTerminalDisplayQuality = 1;
nmp_bLowQuality = 0;
nmp_iBaseMip = 0;
nmp_pixMaxSize = 4096;
ogl_bCompressCachedShaders = 1;
ogl_bConservativeOcclusion = 1;
ogl_bDisableShaderCaching = 0;
ogl_bEnableVDPAU = 0;
ogl_bPreferDiscard = 0;
ogl_bStreamDynamicBuffers = 0;
ogl_bUseSamplerObjects = 0;
ogl_bUseSeparateShaders = 0;
ogl_bUseTextureStorage = 1;
ogl_bVSyncTearing = 0;
ogl_bWaitOcclusionResult = 0;
ogl_iFlushDynamicBuffers = 0;
ogl_iUseDynamicBuffers = 1;
pfx_lrmLightningRenderingMode = 0;
phy_fPolygonCacheExpand = 0.5;
phy_fPolygonCacheLimit = 5;
phy_fPolygonCacheTime = 0.5;
phy_iMaxSweepingThreads = 0;
phy_iMaxThreads = 0;
plr_bAllowGuidedJump = 1;
plr_bAllowPlayerAutoJump = 1;
plr_bDeathScreenMuffling = 0;
plr_fFOVOverride = -1;
prf_bShowFPS = 0;
prf_bShowFPSGraph = 0;
prf_bSimulationFPSGraph = 0;
prf_fFPSGraphMax = -1;
prf_fFPSGraphMin = -1;
prf_iShowFPSVariation = 1;
prf_tmGfxStallsInterval = 1;
prf_tmGraphInterval = 0;
prf_tmRefreshInterval = 1;
prj_bAimDOF = 1;
prj_bAllowGibs = 1;
prj_bDebrisCastShadow = 1;
prj_bDisableRagdollDeaths = 0;
prj_bEnableClientSideEffects = 1;
prj_bEnableDynamicDecals = 1;
prj_bForceGamepadActiveDevice = 0;
prj_bGenerateChapterAutoSaveThumbnail = 0;
prj_bHardwareMouseCursor = 1;
prj_bIdleAutoRestart = 0;
prj_bIdleAutoShutdownInstead = 0;
prj_bKioskMode = 0;
prj_bKioskModeSkipStartScreen = 0;
prj_bStartupAutoDetection = 1;
prj_bSymbolicPingDisplay = 0;
prj_ctFeetAdjustmentIKIterations = 4;
prj_ctMaxCorpses = 20;
prj_ctMaxCorpsesCoop = 8;
prj_ctMaxDebris = 50;
prj_ctMaxDebrisCoop = 20;
prj_ctMaxFlamesPerSurface = 20;
prj_ctMaxFlamesPerSurfaceCoop = 10;
prj_ctMaxMovingCorpses = 4;
prj_ctMaxMovingCorpsesCoop = 2;
prj_ctMaxMovingDebris = 50;
prj_ctMaxMovingDebrisCoop = 20;
prj_ctMaxQuickMatchTries = 5;
prj_ctTimeBanMinutes = 60;
prj_fAllItemsDistanceFar = 300;
prj_fAllItemsDistanceNear = 30;
prj_fCutSceneDontSkipPeriod = 1;
prj_fDebrisScreenSizeRatioCull = 0.01;
prj_fDebrisScreenSizeRatioCullCoop = 0.015;
prj_fIdleAutoRestartTimer = 120;
prj_fMaxFeetAdjustmentDistance = 100;
prj_fMaxWaitForPeacefulAutoSaveTimeOut = 30;
prj_fMinAutoSaveDeltaTime = 60;
prj_fMinFlameFastLightDistance = 1;
prj_fVoteDuration = 60;
prj_fVoteEndDelay = 3;
prj_fVotePercentageToPass = 0.5;
prj_iBloodAndGoreSkin = 0;
prj_iBotViewType = 0;
prj_iCPUSpeed = 4;
prj_iFlashlightType = 2;
prj_iGPUMemory = 4;
prj_iGPUSpeed = 3;
prj_iWorldCacheMode = 3;
prj_smSubtitleMode_copy = 1;
prt_bSmoothTextureAnimation = 1;
prt_fParticleBias = 1.1;
rcon_slMaxBufferSize = 131072;
rcts_bDebugNegotiations = 0;
rcts_bLocalMode = 0;
ren_bAllowMainThreadRecording = 1;
ren_bAmbientShadows = 1;
ren_bAntiAliasedMirrors = 0;
ren_bDynamicFastLights = 1;
ren_bEffectsOcclusion = 1;
ren_bFixFastLightsEdges = 1;
ren_bForceOcclusionHullsTest = 0;
ren_bGeometryInstancing = 1;
ren_bHeatShimmer = 1;
ren_bInstancedOcclusion = 1;
ren_bLightsOcclusion = 1;
ren_bMaterialSort = 1;
ren_bMirrorFastLights = 1;
ren_bMirrorReflections = 1;
ren_bModelGrouping = 1;
ren_bMultiThreadedRendering = 1;
ren_bOcclusionCulling = 1;
ren_bPrebakedDynamicLights = 0;
ren_bShowComments = 0;
ren_bUseDissolvingTexture = 1;
ren_fCullDistanceBias = 0.5;
ren_fFarClipPlaneDistance = 10000;
ren_fLODBias = 0.75;
ren_fLODOffset = 0;
ren_fMax3DRenderingMPix = 0;
ren_fMirrorBias = 2.5;
ren_fMirrorQuality = 0.75;
ren_fNearClipPlaneDistance = 0.10000001;
ren_fOcclusionSizeTreshold = 0.5;
ren_fRenderingPixelRatio = 1;
ren_fRenderingSizeRatio = 1;
ren_fWireDistanceCullingBias = 1;
ren_iCutFrustumOcclusion = 0;
ren_iMaxThreads = 3;
ren_iMirrorLevelBias = 2;
ren_iRescalingFilter = 3;
ren_iTransparencySorting = 1;
ren_iWiresCastShadows = 2;
res_bStreamingShowDebug = 0;
res_fBigResourcesLimit = 2048;
res_iUnloadResourcesAfterFrames = 0;
ser_iMaxClientBPS = 20000;
sfx_bAllowEAX = 1;
sfx_bLowSampleRate = 0;
sfx_bSoftwareMixer = 1;
sfx_bUseCompressor = 1;
sfx_bUseReverb = 1;
sfx_ctSoundMixerOutputPackets = 3;
sfx_fAttenuationByVoiceOver = 0.30000002;
sfx_fCompressorAttackTime = 2;
sfx_fCompressorHighRatio = 20;
sfx_fCompressorHighThreshold = 0.7;
sfx_fCompressorLookAheadTime = 5;
sfx_fCompressorLowRatio = 2.5;
sfx_fCompressorLowReleaseTime = 5000;
sfx_fCompressorLowThreshold = 0.2;
sfx_fCompressorReleaseTime = 500;
sfx_fCompressorRMSLength = 0.5;
sfx_fDopplerEffectBias = 1;
sfx_fMasterVolume = 0.9;
sfx_fMaxTotalVolume = 3;
sfx_fMixingTimeFactor = 1;
sfx_fSoundMixerReverbGain = 1;
sfx_fSoundMixerThreadInterval = 0.02;
sfx_iMaxActiveSounds = 35;
sfx_iStreamingBufferSize = 88;
sha_bAllowRefractions = 1;
sha_bAllowZoomBlurring = 1;
sha_bCreateAllVariations = 1;
sha_bEdgeSmoothing = 1;
sha_bFastVolumeticShader = 0;
sha_bNoProgressBar = 0;
sha_bShadowFiltering = 1;
sha_bShadowTrilinearDithering = 0;
sha_bVertexShadows = 1;
sha_fBumpsDistanceBias = 1.5;
sha_fCascadeChoiceBias = 0.01;
sha_fFilledHighlightingDistance = 40;
sha_fParallaxDistanceBias = 1.5;
sha_fPCFDarkness = 1;
sha_fPCFDithering = 0.25;
sha_fPCFSmoothness = 0.75;
sha_fShadowTrilinearSpan = 0.5;
sha_fVSMDarkness = 4;
sha_fVSMMinVariance = 1.E-005;
sha_fVSMSmoothness = 0.5;
sha_iAllowTreeSwaying = 2;
sha_iMaxShockwaves = 15;
sha_iParallaxMappingMethod = 2;
sha_iParallaxMappingQuality = 1;
sha_iShadowThickness = 1;
sha_iZoomBlurMip = 0;
sha_iZoomBlurSamples = 16;
shb_bForceBilinearFiltering = 0;
shb_bGeometryInstancing = 1;
shb_bOcclusionCulling = 1;
shb_bPCFSoftShadows = 1;
shb_bVarianceShadowMaps = 1;
shb_bVSMSoftShadows = 1;
shb_fCascadedStepFactor = 3;
shb_fNearShadowDistance = 10;
shb_fOcclusionSizeTreshold = 15;
shb_fPCFDepthScaleDistant = 0.0001;
shb_fPCFDepthScaleOmni = 0.0020000002;
shb_fPCFDepthScaleSpot = 0.0010000001;
shb_iPCFOverSampling = 1;
shb_iPCFShadowFormat = 0;
shb_iPCFSlopeBias = 2;
shb_iVSMOverSampling = 1;
shb_iVSMShadowFormat = 0;
shb_pixMaxShadowSize = 3840;
shb_pixShadowDensity = 96;
sim_bAutoDecreaseQuality = 1;
sim_bAutoPause = 1;
sim_bBlockingWorldPreparing = 0;
sim_bFinalizeOutEntitiesInEditor = 1;
sim_bPrecacheStreamingResources = 1;
sim_fWorldPrecachingStreamingLoadingDoneThreshold = 0.9;
sim_iFixMicroStuttering = 2;
snd_fDistanceAttenuationPower = 2;
snd_fEffectsVolume = 0.8;
snd_fMovieVolume = 0.7;
snd_fMusicVolume = 0.60000004;
snd_fVoiceCommVolume = 0.7;
snd_fVoiceoverVolume = 1;
tex_bAllowDownload = 1;
tex_bAutoUploading = 1;
tex_bLowQuality = 0;
tex_bNoProgressBar = 0;
tex_bReloadDefragsVRAM = 1;
tex_fLODBias = 0;
tex_iAnisotropy = 8;
tex_iBaseMip = 0;
tex_iFiltering = 22;
tex_iSquishCompressionQuality = 2;
tex_pixMaxSize = 4096;
thr_bBusyWaitingWorkers = 0;
thr_iAffinityStrictness = 2;
thr_iCoreOffset = 0;
thr_iMaxWorkerThreads = 0;
thr_iOverrideNumberOfCPUs = -1;
thr_iOverrideSupportThreadCores = -1;
thr_iOverrideWorkerCoresSharing = -1;
thr_iOverrideWorkerThreadCores = -1;
tim_bLogTimerOffsets = 0;
vis_iScannerPolyFilter = -1;
vlk_bAlternateBufferUpload = 0;
vlk_bBatchQueryResets = 1;
vlk_bBatchQueryResults = 1;
vlk_bCompressCachedPipelines = 1;
vlk_bDisablePipelineCaching = 0;
vlk_bMultiThreadedDevice = 1;
vlk_bSafeLayoutChanges = 0;
vlk_bUseDedicatedAlloc = 1;
vlk_bUseTransferQueue = 1;
vlk_bVSyncTearing = 1;
vlk_bWaitOcclusionResult = 0;
vlk_iAllowValidation = 1;
vlk_iBackBuffers = 2;
vlk_iConstantsBufferSize = 16;
vlk_iConstantsBufferUpdateMethod = 2;
vlk_iDirectAllocThreshold = 1024;
vlk_iDynamicBuffersUpdateMethod = 2;
vlk_iOcclusionFramesDelay = 1;
vlk_iRenderingDevice = 0;
vo_bMicBoost = 1;
vo_bUsingPushToTalk = 1;
vo_bVoiceEnabled = 1;
vo_fMicSensitivity = 0;
vo_fVoiceReceiveVolume = 0.7;
vo_fVoiceTransmitVolume = 1;
vsl_fGlobalVibrationStrength = 1;
EOF

cd \$DEBUG_REAL_HOME/.steam/steam/steamapps/common/The\ Talos\ Principle/Bin
./Talos \$@ +exec $HOME/talos-run-test.lua
cat \$DEBUG_REAL_HOME/.steam/steam/steamapps/common/The\ Talos\ Principle/Log/Talos.log > \$LOG_FILE
rm -f \$DEBUG_REAL_HOME/.steam/steam/steamapps/common/The\ Talos\ Principle/Log/Talos.log
" > talos-principle
chmod +x talos-principle