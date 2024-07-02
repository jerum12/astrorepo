<layout_footer>
    <style>

    </style>
    <footer>
        <div id="footer" class="layout horizontal center center-justified">
            <nav class="layout horizontal start" style="width: 1000px;">
                <div class="layout horizontal start">
                    <a href="{ttw.root_url_2}/">
                        Home
                    </a>
                    <span> | </span>
                    <a href="{ttw.root_url_2}/usf.edu/agreements">
                        Agreements
                    </a>
                    <span> | </span>
                    <a href="{ttw.root_url_2}/usf.edu/employees">
                        Faculty
                    </a>
                    <span> | </span>
                    <a href="{ttw.root_url_2}/usf/students/coming_soon">
                        Students
                    </a>
                    <span> | </span>
                    <a href="{ttw.root_url_2}/usf/alumni/coming_soon">
                        Alumni
                    </a>

                    <span> | </span>
                    <a href="{ttw.root_url_2}/usf/summary/map">
                        Summary
                    </a>
                </div>
                <div class="flex">
                </div>
                <div class="layout horizontal start">
                    <a href="{ttw.root_url_2}/home">
                        Powered by GDH
                    </a>
                    <span> | </span>
                    <a href="{ttw.root_url_2}/home">
                        Copyright © 2011 - {new Date(Date.now()).getFullYear()}
                    </a>
                    <span> | </span>
                    <a href="#" onclick="{clear_tenant_cookie}">Clear Tenant</a>
                </div>
            </nav>
        </div>
    </footer>
    <script type="es6">
        const self = this;
        function delete_service_worker_cache() {
            function sendMessage(message) {
                return new Promise(function (resolve, reject) {
                    let messageChannel = new MessageChannel();
                    messageChannel.port1.onmessage = function (event) {
                        if (event.data.error) {
                            reject(event.data.error);
                        } else {
                            resolve(event.data);
                        }
                    };
                    if (navigator.serviceWorker.controller) {
                        navigator.serviceWorker.controller.postMessage(message, [messageChannel.port1]);
                    }
                });
            }
            sendMessage('delete cache');
        }
        function deleteAllCookies() {
            let cookies = document.cookie.split("; ");
            for (let c = 0; c < cookies.length; c++) {
                let d = window.location.hostname.split(".");
                while (d.length > 0) {
                    let cookieBase = encodeURIComponent(cookies[c].split(";")[0].split("=")[0]) + '=; expires=Thu, 01-Jan-1970 00:00:01 GMT; domain=' + d.join('.') + ' ;path=';
                    let p = location.pathname.split('/');
                    document.cookie = cookieBase + '/';
                    while (p.length > 0) {
                        document.cookie = cookieBase + p.join('/');
                        p.pop();
                    };
                    d.shift();
                }
            }
        }

        self.clear_tenant_cookie = (e) => {
            e.preventDefault();
            delete_service_worker_cache();
            localStorage.clear();
            sessionStorage.clear();
            deleteAllCookies();
            if (window.location.href.indexOf('?') > 1) {
                window.location.href = window.location + '&timestamp=' + Date.now();
            } else {
                window.location.href = window.location + '?timestamp=' + Date.now();
            }
            event ? event.preventDefault() : null;
        }
    </script>
</layout_footer>