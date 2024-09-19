{
    programs.git = {
        enable = true;
        userName = "Hugo Lobo";
        userEmail = "hugorplobo@gmail.com";
	extraConfig = {
		credential.helper = "store";
		pull.rebase = true;
	};
    };
}
