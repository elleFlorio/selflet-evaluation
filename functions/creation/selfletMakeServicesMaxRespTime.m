function selfletServicesMaxRespTime = selfletMakeServicesMaxRespTime()

applySubtitles = 1200;
bitDepthReduction = 3900;
checkIfAvailable = 2400;
checkIfSubtitlesAvailable = 2100;
checkIfSubtitlesExists = 3000;
downloadVideo = 4500;
getDefaultSubtitle = 2400;
getSubtitles = 13117;
getVideoResource = 13125;
scaleVideo = 85500;
transcodeVideo = 1800;
translateSubtitleToLanguage = 1500;
videoProvisioner = 102302;

selfletServicesMaxRespTime = [
    applySubtitles; bitDepthReduction;... 
    checkIfAvailable; checkIfSubtitlesAvailable;... 
    checkIfSubtitlesExists; downloadVideo;... 
    getDefaultSubtitle; getSubtitles;... 
    getVideoResource; scaleVideo;... 
    transcodeVideo; translateSubtitleToLanguage;... 
    videoProvisioner
    ];

end

