<header_container>
    <style>
        :scope {
            font-family: var(--font_family,"Segoe UI", Tahoma, Geneva, Verdana, sans-serif);
        }
        #header_container {
            width: 100%;
            position: absolute;
            right: 0px;
            top: 0px;
            z-index: 2;
            /*background-color: var(--primary_default_background_color);*/
            /*color: var(--primary_text_color);*/
        }
        a{
            text-decoration: none;
            /*font-family:"Segoe UI", Tahoma, Geneva, Verdana, sans-serif;*/
        }

        #header {
            opacity: 1;
            height: var(--header_height);
        }

        #banner_container{
            background-color: var(--primary_default_background_color);
            /*box-shadow: 0px 1px 5px black;*/
        }
        header_bib_nav{
            box-shadow: 0px 2px 2px rgba(0,0,0,.5);
        }



    </style>
    <div id="header_container" class="layout horizontal">
        <div id="header" ref="header" class="layout vertical center start-justified flex">
            <header_account ttw="{opts.ttw}" user="{user}" class="self-stretch"></header_account>
            <header_nav ttw="{opts.ttw}" class="self-stretch"></header_nav>
            <div id="banner_container"  class="layout horizontal center center-justified self-stretch">
                <div style="width: 1000px;" class="layout horizontal center start-justified">
                    <img src="/tenants/{ttw.info.acronym.toLowerCase()}/resources/images/{ttw.header.logo.toLowerCase()}"/>
                    <!--<img src="/tenants/{ttw.info.acronym.toLowerCase()}/resources/images/banner-logo.png"/>-->
                </div>
            </div>
            <header_bib_nav ttw="{opts.ttw}" class="self-stretch"></header_bib_nav>
            <div class="flex"></div>
        </div>
    </div>
    <script type="es6">
        const self = this;

        self.logo = 'banner_logo.png';
        if(!self.opts.ttw.is_functions){
            // const tenant = self.opts.ttw.last_page.split('/')[0].toLowerCase();
            // self.tenant_name = tenant.replace('.' + tenant.split(/\.(?=[^\.]+$)/)[1], '');
        }


        self.on('mount', () => {

        });

    </script>
</header_container>