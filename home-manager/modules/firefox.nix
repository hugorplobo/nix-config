{
  programs.firefox = {
    enable = true;
    
    policies = {
      DefaultDownloadDirectory = "\${home}/downloads";
    };
  };
}
