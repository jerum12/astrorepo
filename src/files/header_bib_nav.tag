<header_bib_nav>
    <style>
        #header_bib_nav_container {
            /*width: 100%;*/
            background-color: var(--secondary_default_background_color);
            color: var(--primary_text_color);
            padding: 0 5px 5px;
        }
        #header_bib_nav_inner {
            width: 1000px;
        }
        a{
            box-shadow: none;
            padding: 8px;
            background-color: var(--secondary_default_background_color);
            color: var(--secondary_text_color);
            cursor: pointer;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
            margin: 0 2px;
            filter: brightness(100%);
            transition: all 500ms;
        }
        a span{
            filter: brightness(100%)
        }
        .selected{
            filter: brightness(100%);
            background-color: var(--primary_default_background_color) !important;
            color: var(--primary_text_color) !important;
            font-weight: bold;
        }
        .selected span{
            filter: brightness(100%)
        }
        a:hover{
            filter: brightness(80%);
        }
        a:hover span{
            filter: brightness(120%);
        }

    </style>
    <div id="header_bib_nav_container" class="layout horizontal  center-justified">
        <div id="header_bib_nav_inner" class="layout horizontal start-justified start">
            <a each="{ page, i in bib_nav_pages }" if="{!page.not_shown}" href="{page.url}" class="{page.title.includes(current_page_title.replace('_', ' ')) ? 'selected' : ''}">
                <span>{page.title}</span>
            </a>
        </div>
    </div>
    <script type="es6">
        const self = this;

        /*
         don't forget admin
         */

//                self.ttw = self.opts.ttw;

//        self.current_page = self.opts.ttw.last_page.split('/')[1];
//        self.bib_nav_pages = self.opts.ttw.bib_nav_pages;
        if(!self.opts.ttw.is_functions){
            const last_page_url_length = self.opts.ttw.last_page.length-1;
            const last_page_url = self.opts.ttw.last_page[last_page_url_length] === '/' ? self.opts.ttw.last_page.substr(0, last_page_url_length) : self.opts.ttw.last_page
            const page_arr = last_page_url.split('/');
            self.current_module = page_arr[1];
            if(self.current_module === "profile"){
                self.current_page = page_arr[3];
            }else if(page_arr[2] === "profile"){
                self.current_page = page_arr[2];
            }
            else{
                self.current_page = page_arr[page_arr.length-1];
            }
            self.current_page = self.current_page.replace('/', '');
            self.bib_nav_pages = self.opts.ttw.bib_nav_pages.filter((page) => {
                return page.root === self.current_module;
            });
            const title = self.bib_nav_pages.find(x => x.url.includes(self.current_page));
            self.current_page_title = title ? title.title : 'Profile';/*TODO: fix the null case...*/
        }

        self.on('mount', () => {
        });
    </script>
</header_bib_nav>