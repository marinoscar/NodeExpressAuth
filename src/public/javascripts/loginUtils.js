var loginUtils = {
    init: function(){
        $('#githubBtn').on('click', function(){
            loginUtils.doGitHub();
        });
    },
    doGitHub: function(){
        window.location.href = '/auth/github/';
    }
}
