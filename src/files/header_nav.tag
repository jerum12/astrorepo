<header_nav>
    <style>
        #header_nav_container {
            /*width: 100%;*/
            background-color: var(--secondary_default_background_color);
            color: var(--primary_text_color);
            padding: 10px 5px 0;
        }
        #header_nav_inner {
            width: 1000px;
        }
        a{
            box-shadow: none;
            padding: 8px;
            background-color: var(--primary_default_background_color);
            color: var(--primary_text_color);
            cursor: pointer;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            margin: 0 2px;
            filter: brightness(130%);
            transition: all 500ms;
        }
        a span{
            filter: brightness(80%);
            text-shadow: 0 2px 3px #000;
        }
        .selected{
            filter: brightness(100%);
            font-weight: bold;
        }
        .selected span{
            filter: brightness(100%)
        }
        a:hover{
            filter: brightness(100%);
        }
        a:hover span{
            filter: brightness(100%);
        }

    </style>
    <div id="header_nav_container" class="layout horizontal  center-justified">
        <div id="header_nav_inner" class="layout horizontal start-justified end">
            <a  each="{ page, i in nav_pages }" href="{page.url}" class="{page.url.split('/')[page.url.split('/').length-2].toLowerCase() ===  current_page ? 'selected' : ''}">
                <span>{page.title}</span>
            </a>
        </div>
    </div>
    <script type="es6">
        const self = this;

        self.nav_pages = self.opts.ttw.nav_pages;

        if(!self.opts.ttw.is_functions){
            self.current_page = self.opts.ttw.last_page.split('/')[1];
        }

        self.on('mount', () => {
        });
    </script>
</header_nav>