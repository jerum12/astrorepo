<layout>
    <header_container ttw="{opts.ttw}"></header_container>
    <div class="layout vertical" id="content_footer">
        <content ttw="{opts.ttw}"></content>
        <div class="flex"></div>
        <layout_footer></layout_footer>
    </div>
    <script type="es6">

        "use strict";
        const self = this;
        self.ttw = self.opts.ttw;
        self.on('mount', function () {
            self.ttw = self.opts.ttw;
//            var test2 = self.ttw.nav_pages;
        })

    </script>
</layout>