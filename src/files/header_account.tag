<header_account>
    <style>
        #header_account_container {
            width: 100%;
            background-color: var(--secondary_default_background_color);
            color: var(--secondary_text_color);
        }
        #header_account_inner {
            width: 1000px;
        }
        a{
            color: var(--secondary_text_color);
            font-weight: bold;
            text-decoration: underline;
            font-size: .9em;
            padding: 0 5px;
            transition: all 0.3s ease;
        }
        a:hover{
            text-decoration: none;
            background-color: var(--primary_default_background_color);
            color: var(--primary_text_color);
        }

    </style>
    <div id="header_account_container" class="layout horizontal  center-justified">
        <div id="header_account_inner" class="layout horizontal end-justified center">
            <span if="{user && user.username}">
<!--                <a if="{!ttw.user.user_type || !ttw.user.user_type.toLowerCase().includes('student')}" href="{ttw.root_url_1}/person/">{user.username.substring(0, user.username.indexOf('@'))} - My Profile</a>-->
                <a href="/{ttw.info.acronym}/{ttw.user.user_type && ttw.user.user_type.toLowerCase().includes('student') ? 'student' : 'faculty'}_profile/my_profile">{user.username.substring(0, user.username.indexOf('@'))} - My Profile</a>
                <span style="font-size: 1.6em; font-weight: 300; line-height: 1em;">|</span>
                <a if="{!__session.is_impersonating}" href="/unauth">Sign out</a>
                <a if="{__session.is_impersonating}" href="/auth_back">Sign back</a>
            </span>
            <a href="/login/sso" if="{!user || !user.username}">Sign in</a>
        </div>
    </div>
    <script type="es6">
        const self = this;
        self.ttw = self.opts.ttw;
        self.user = self.ttw.user;
        self.__session = {};
        function get_cookie(name) {
            const match = document.cookie.match(new RegExp(name + '=([^;]+)'));
            if (match) return match[1];
        }
        const cookie = get_cookie('__session');
        const cookie_decoded = cookie ? decodeURIComponent(cookie) : null;
        try {
            self.__session = cookie_decoded ? JSON.parse(cookie_decoded) : {};
            // __session.impersonate_prev_id == 'undefined' ? __session.impersonate_prev_id = undefined : null;
            self.update();
        }catch(e){

        }

    </script>
</header_account>