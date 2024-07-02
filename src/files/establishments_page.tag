<establishments>
    <style scoped>
        root{
        }

        .no_results_container {
            height: 0;
            overflow: visible;
            z-index: -1;
        }
        .page_container {
            width: 100%;
            text-align: center;
            max-width: 1000px;
            margin: 20px auto 100px auto;
        }
        #establishment_control_fixed{
            width: 100%;
        }
        #tableContainer{
            padding: 10px 20px;
            max-width: 95%;
            /*box-shadow: 0 2px 3px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 1px 2px -1px rgba(0, 0, 0, 0.4);*/
        }
        form{
            width: 500px;
        }
        textbox{
            width: 100%;
        }
        drop_down > div{
            margin-top: 0px;
        }

        .table{
            overflow: hidden;
        }

        ul{
            padding: 0;
            margin: 0;
        }


        ul > li.table_row:nth-child(odd) {
            background-color: #DDDDDD;
        }

        ul > li.table_row:hover {
            background-color: #FFFF88;
        }

        .table_row_lg {
            font-size: 2em;

        }

        .column {
            border-right: 1px solid white;
            padding: 5px;
            overflow: hidden;
        }
        .column div{
            width: calc(100% - 10px);
        }

        #table_header > .column {
            font-weight: bolder;
        }

        .hand {
            cursor: pointer;
        }

        .next_previous {
            margin: 10px 0;
        }

        .loading {
            color: gray;
        }

        .tenant_colors {
            background: var(--primary_default_background_color);
            color: var(--secondary_default_background_color);
        }

        .table{
            overflow: hidden;
            width: 100%;
            border: 1px solid rgba(0,0,0,0.05);
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            min-height: 500px;
        }

        ul{
            padding: 0;
            margin: 0;
        }


        ul > li.table_row:nth-child(odd) {
            background-color: floralwhite;
        }

        ul > li.table_row:hover {
            background-color: #FFFF88;
        }

        .table_row_lg {
            font-size: 2em;

        }

        .column {
            border-right: 1px solid rgba(224, 209, 165, 0.25);
            padding: 5px;
            overflow: hidden;
        }
        .column_header {
            align-items:center;
            display: flex;
            justify-content: center;
        }
        .column:nth-last-child(1){
            border: 0;
        }
        .column a {
            color: var(--primary_default_background_color);
        }

        /*.table_header > .column {*/
        /*font-weight: bolder;*/
        /*}*/

        .column img {
            width: 20px !Important;
            margin-right:5px;
        }

        .sort {
            display: flex;
            flex-direction: column;
        }

    </style>
    <div class="page_container" style="">
        <h1>Find an Establishment</h1>
        <div class="layout horizontal center center-justified input_group card_style" style="width: 100%;  margin-bottom: 1rem;">
            <form onsubmit="{search_keyword}" style="width: 100%; max-width: 850px;" class="layout horizontal center center-justified flex">
                <textbox id="search_input" label_disabled="true" style="margin: 0px;width: 100%;"  type="search" name="keyword" ref="keyword_tb" place_holder="Filter by keyword"  width="100%"></textbox>
                <is_button type="submit" id="search_button"
                           path="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"
                           width="85px" height="40px" font_size="16px">
                    Search
                </is_button>
            </form>
        </div>
        <div id="tableContainer" class="layout horizontal center-center">
            <div class="layout vertical start table" style="width: 800px; min-height: 100px;" >

                <div id="establishment_control_fixed" ref="establishment_control_fixed" class="close_div">
                    <div class="layout horizontal justified" id="ac_top">
                        <button onclick="{previous}" class="button" style="margin-left: 0;margin-bottom: 5px; width: 35px;  height: 35px; border-radius: 50px; padding:0;">
                            <svg viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" style="pointer-events: none; width: 1.25em; height: 1.25em;" fill="var(--secondary_default_background_color) !important">
                                <g> <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"> </path> </g>
                            </svg>
                        </button>
                        <div class="layout horizontal center" style="margin-top: -5px; color: var(--primary_default_background_color); font-weight: bolder;">
                            <span>Page</span>
                            <drop_down classes="{dropdown_classes}" style="padding: 5px 5px 0 5px;" title="Page Number" list="{page_no}" max_width="25px" max_height="300px" pre_scale_class="pre_scale_top_center" selected_callback="{page_no_changed}"
                                       scale_type="scale_height" direction="ltr" selected_item_id="{page_no_id}"></drop_down>
                            <span>of {page_count.length ? page_count.length : '?'}</span>
                        </div>
                        <div class="layout center" id="filter_table_establishments">
                            <drop_down classes="{dropdown_classes}" style="padding:0;" title="Number of Results per Page" list="{no_of_results}" max_width="25px" max_height="300px" pre_scale_class="pre_scale_top_center" selected_callback="{no_of_results_changed}"
                                       scale_type="scale_height" direction="ltr" selected_item_id="{no_of_results_id}"></drop_down>
                        </div>
                        <button onclick="{next}" class="button" style="margin-right: 0; margin-bottom: 5px;  width: 35px;height: 35px; border-radius: 50px; padding:0;">
                            <svg viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" style="pointer-events: none; width: 1.25em; height: 1.25em;" fill="var(--secondary_default_background_color) !important"> <g> <path d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z"> </path> </g> </svg>
                        </button>
                    </div>
                    <div class="layout horizontal table_header tenant_colors" id="ac_bottom" style="width: 100%;">
                        <div class="column column_header " style="width:250px">
                            <span style="margin: 5px;">Name</span>
                            <div class="sort">
                                <a data-message="name-desc-3" onclick="{sort_changed}">
                                    <svg riot-style="fill:{order_by.sort_num === 3 ? 'var(--secondary_default_background_color)' : 'white'}; cursor:pointer; display: block; width: 12px" viewBox="7 7 10 10" preserveAspectRatio="xMidYMid meet" focusable="false">
                                        <g><path d="M7 14l5-5 5 5z"></path></g>
                                    </svg>
                                </a>
                                <a data-message="name-asc-4" onclick="{sort_changed}">
                                    <svg riot-style="fill:{order_by.sort_num === 4 ? 'var(--secondary_default_background_color)' : 'white'}; cursor:pointer; display: block; width: 12px" viewBox="7 7 10 10" preserveAspectRatio="xMidYMid meet" focusable="false">
                                        <g><path d="M7 10l5 5 5-5z"></path></g>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div class="column column_header" style="width:150px">
                            <span style="margin: 5px;">Country</span>
                            <div class="sort">
                                <a data-message="country-desc-5" onclick="{sort_changed}">
                                    <svg riot-style="fill:{order_by.sort_num === 5 ? 'var(--secondary_default_background_color)' : 'white'}; cursor:pointer; display: block; width: 12px" viewBox="7 7 10 10" preserveAspectRatio="xMidYMid meet" focusable="false">
                                        <g><path d="M7 14l5-5 5 5z"></path></g>
                                    </svg>
                                </a>
                                <a data-message="country-asc-6" onclick="{sort_changed}">
                                    <svg riot-style="fill:{order_by.sort_num === 6 ? 'var(--secondary_default_background_color)' : 'white'}; cursor:pointer; display: block; width: 12px" viewBox="7 7 10 10" preserveAspectRatio="xMidYMid meet" focusable="false">
                                        <g><path d="M7 10l5 5 5-5z"></path></g>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div class="column column_header " style="width:150px">
                            <span style="margin: 5px;">Classification</span>
                            <div class="sort">
                                <a data-message="classification-desc-7" onclick="{sort_changed}">
                                    <svg riot-style="fill:{order_by.sort_num === 7 ? 'var(--secondary_default_background_color)' : 'white'}; cursor:pointer; display: block; width: 12px" viewBox="7 7 10 10" preserveAspectRatio="xMidYMid meet" focusable="false">
                                        <g><path d="M7 14l5-5 5 5z"></path></g>
                                    </svg>
                                </a>
                                <a data-message="classification-asc-8" onclick="{sort_changed}">
                                    <svg riot-style="fill:{order_by.sort_num === 8 ? 'var(--secondary_default_background_color)' : 'white'}; cursor:pointer; display: block; width: 12px" viewBox="7 7 10 10" preserveAspectRatio="xMidYMid meet" focusable="false">
                                        <g><path d="M7 10l5 5 5-5z"></path></g>
                                    </svg>
                                </a>
                            </div>
                        </div>
                        <div class="column column_header " style="width:250px">
                            <span style="margin: 5px;">Parent</span>
                            <div class="sort">
                                <a data-message="parent-desc-7" onclick="{sort_changed}">
                                    <svg riot-style="fill:{order_by.sort_num === 7 ? 'var(--secondary_default_background_color)' : 'white'}; cursor:pointer; display: block; width: 12px" viewBox="7 7 10 10" preserveAspectRatio="xMidYMid meet" focusable="false">
                                        <g><path d="M7 14l5-5 5 5z"></path></g>
                                    </svg>
                                </a>
                                <a data-message="parent-asc-8" onclick="{sort_changed}">
                                    <svg riot-style="fill:{order_by.sort_num === 8 ? 'var(--secondary_default_background_color)' : 'white'}; cursor:pointer; display: block; width: 12px" viewBox="7 7 10 10" preserveAspectRatio="xMidYMid meet" focusable="false">
                                        <g><path d="M7 10l5 5 5-5z"></path></g>
                                    </svg>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <ul ref="results_establishments" style="width: 100%; cursor: pointer;">
                    <li each="{ establishment, i in filtered_establishments }" class="layout horizontal table_row" onclick="{go_to_est}">
                        <div class="column " style="width:236px">
                            <div>{establishment.name}</div>
                        </div>
                        <div class="column " style="width:142px">
                            <div>{establishment.country}</div>
                        </div>
                        <div class="column " style="width:142px">
                            <div>{establishment.classification}</div>
                        </div>
                        <div class="column " style="width:auto;">
                            <div>{establishment.parent}</div>
                        </div>
                    </li>
                </ul>
                <div class="no_results_container">
                    <ul class="non_loading_results" ref="no_results">
                        <li class="table_row_lg layout horizontal center center-justified self-stretch" style="width: 100%; height: 100px;">
                            <is_loading  container_height="10%" container_width="100%" style="transition: all .5s ease; width: 100%; height: 100%;"
                                         text_styles="font-weight:700;font-size:1.5rem;color:var(--primary_default_background_color)"
                                         text="Loading.." height="25px" width="25px" color="var(--secondary_default_background_color)"></is_loading>
                        </li>
                        <li style="width: 100%; height: 500px;">
                        </li>
                    </ul>
                </div>
                <ul class="non_loading_results" show="{filtered_establishments.length === 0 && !loading_establishments}">
                    <li class="table_row_lg layout horizontal center center-justified self-stretch" style="width: 100%; height: 100px;">
                        No Results Found.
                    </li>
                    <li style="width: 100%; height: 500px;">
                    </li>
                </ul>
            </div>
        </div>
        <div class="layout horizontal center-center">
            <is_button type="click" id="create_button" onclick="{new_establishment}"
                       path="M13 7h-2v4H7v2h4v4h2v-4h4v-2h-4V7zm-1-5C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"
                       width="185px" height="40px" font_size="16px">
                Create a New Establishment
            </is_button>
        </div>
    </div>
    <script type="es6">
        const self = this;
        let page_inited = false;

        self.new_establishment = (e) => {
            window.location.replace('/' + ttw.info.acronym.toLowerCase() + '/admin/establishments/create');
        };
        self.go_to_est = (e) => {
            window.location.replace('/' + ttw.info.acronym.toLowerCase() + '/admin/establishments/update/' + e.item.establishment.id);
        };

        function sort_by(items, order, direction, array) {
            let items_sorted = items.sort(function (a, b) {
                let nameA = typeof a[order] == 'string' ? a[order].toUpperCase() : typeof a[order] == 'number' ? a[order] : '';
                let nameB = typeof b[order] == 'string' ? b[order].toUpperCase() : typeof b[order] == 'number' ? b[order] : '';

                /********mainly used for the title, consider using activities map so I don't have to do this here **************
                 // let nameA = typeof a[order] == 'string' ? a[order].replace('"', "").replace("'", "").replace(" ", "").replace("(", "").toUpperCase() : typeof a[order] == 'number' ? a[order] : '';
                 // let nameB = typeof b[order] == 'string' ? b[order].replace('"', "").replace("'", "").replace(" ", "").replace("(", "").toUpperCase() : typeof b[order] == 'number' ? b[order] : '';
                 **********************************************************/
                if (nameA < nameB) {
                    return direction == 'asc' ? -1 : 1;
                }
                if (nameA > nameB) {
                    return direction == 'desc' ? -1 : 1;
                }
                return a.idx && a.idx > b.idx ? 1 : a.idx && a.idx < b.idx ? -1 : 0;
                // return a.idx ? a.idx - b.idx : 0;
            });
            //            const items_sorted = items.sort(sort_items);
            let items_mapped = items_sorted.map(function (data, idx) {
                data.idx = idx;
                return data;
            });
            let order_by = array[0];
            if (array.length > 0) {
                array.shift();
                return sort_by(items_mapped, order_by.order, order_by.direction, array);
            } else {
                return items_sorted;
            }
        }

        //        const mem_sort_by = memoize_2(sort_by);
        function sort(items, order, direction, input) {
            if (order == 'name') {
                items = sort_by(items, order, direction, [
                    {order: 'parent', direction: 'asc'},
                    {order: 'classification', direction: 'asc'},
                    {order: 'country', direction: 'asc'},
                    {order: 'name', direction: direction}
                ]);
            } else if (order == 'country') {
                items = sort_by(items, order, direction, [
                    {order: 'parent', direction: 'asc'},
                    {order: 'classification', direction: 'asc'},
                    {order: 'name', direction: 'asc'},
                    {order: 'country', direction: direction}
                ]);
            } else if (order == 'classification') {
                items = sort_by(items, order, direction, [
                    {order: 'parent', direction: 'asc'},
                    {order: 'country', direction: 'asc'},
                    {order: 'name', direction: 'asc'},
                    {order: 'classification', direction: direction}
                ]);
            } else if (order == 'parent') {
                items = sort_by(items, order, direction, [
                    {order: 'classification', direction: 'asc'},
                    {order: 'country', direction: 'asc'},
                    {order: 'name', direction: 'asc'},
                    {order: 'parent', direction: direction}
                ]);
            } else {
                items =sort_by(items, order, direction, [
                    {order: 'parent', direction: 'asc'},
                    {order: 'classification', direction: 'asc'},
                    {order: 'country', direction: 'asc'},
                    {order: 'name', direction: direction}
                ]);
            }
            return items;
        }
        self.classifications = [{_id: 0, title: 'University System'},
            {_id: 1, title: 'Community College'},
            {_id: 2, title: 'University'},
            {_id: 3, title: 'College'},
            {_id: 4, title: 'Academic Program'},
            {_id: 5, title: 'University Campus'},
            {_id: 6, title: 'Business or Corporation'},
            {_id: 7, title: 'Association'},
            {_id: 8, title: 'Government Administration'},
            {_id: 9, title: 'Hospital'},
            {_id: 10, title: 'Department'},
            {_id: 11, title: 'Recruitment Agency'},
            {_id: 12, title: 'Institute'},
            {_id: 13, title: 'School'},
            {_id: 14, title: 'Academy'},
            {_id: 15, title: 'Centre / Center'},
            {_id: 16, title: 'Foundation'},
            {_id: 17, title: 'Other Non-Governmental Organization'},
            {_id: 18, title: 'Ministry'},
            {_id: 19, title: 'Secretariat'},
            {_id: 20, title: 'Department'},
            {_id: 21, title: 'Other Governmental Organization'}];

        function fade_out_in(is_loading) {
            return new Promise(function (resolve, reject) {
                function fade(element, fade_type) {
                    return new Promise(function (resolve, reject) {
                        if (fade_type === 'fade_out') {
                            element.classList.remove('fade_in', 'show');
                            element.classList.add(fade_type);
                            setTimeout(function () {
                                // element.style.display = 'none';
                                element.classList.add('hide');
                                resolve();
                            }, 250);
                        } else {
                            // element.style.display = 'block';
                            element.classList.remove('fade_out', 'hide');
                            element.classList.add(fade_type, 'show');
                            setTimeout(function () {
                                resolve();
                            }, 0);
                        }
                    });
                }

                self.refs.no_results.style.height = self.refs.no_results.clientHeight ? (self.refs.no_results.clientHeight + 50) + 'px' : '600px;';
                if (is_loading) {
                    self.loading_establishments = true;
                    self.update();

                    Promise.all([fade(self.refs.no_results, 'fade_in')]).then((values) => {
                        setTimeout(() => {
                            resolve();
                        }, 100)
                    })
                        .catch(err => {
                            console.error(err);
                        });
                } else {
                    Promise.all([fade(self.refs.no_results, 'fade_out')]).then((values) => {
                        setTimeout(() => {
                            resolve();
                            self.loading_establishments = false;
                            self.update();
                            if(!page_inited){
                                set_scroll();
                                page_inited = true;
                            }
                        }, 100);
                    })
                        .catch(err => {
                            console.error(err);
                        });
                }
            });
        }


        self.loading_establishments = true;
        self.paging = {
            page: 1
            , size: 10
        };
        self.establishment_count = 0;
        self.location_count = 0;
        self.people_count = 0;
        self.page_count = new Array(0);
        self.filtered_establishments = [];
        self.date_from_text = '';
        self.date_to_text = '';
        self.keyword = '';
        self.institution = {};
        self.country_ids = null;
        self.establishment_type_ids = null;
        self.since = null;
        self.until = null;
        self.include_undated = true;
        self.order_by = {order: 'recency', direction: 'desc', sort_num: 7};
        self.ancestor_id = null;
        self.table_type = 'establishments';
        self.table_type = 'people';

        self.no_of_results_id = null;
        self.no_of_results = [
            {
                _id: 0,
                title: 'Show 10 Results per Page'
            },
            {
                _id: 1,
                title: 'Show 20 Results per Page'
            },
            {
                _id: 2,
                title: 'Show 50 Results per Page'
            },
            {
                _id: 3,
                title: 'Show 100 Results per Page'
            },
            {
                _id: 4,
                title: 'Show 250 Results per Page'
            }
        ];



        function filter_establishments(input) {
            if(input.keyword){
                const keyword = input.keyword.toLocaleLowerCase();
                return self.establishments.filter((est) => {
                    return est.name.toLocaleLowerCase().includes(input.keyword) || est.country.toLocaleLowerCase().includes(input.keyword) || est.classification.toLocaleLowerCase().includes(input.keyword);
                });
            }else{
                return self.establishments;
            }
        }

        function map_establishments(est) {
            return est.map((e) => {
                e.country = self.locations_search.find(l => l._id === e.country_id);
                e.country = e.country ? e.country.title : '';
                e.classification = self.classifications.find(c => c._id === e.classification_id);
                e.classification = e.classification ? e.classification.title : '';
                let parent = est.find(p => e.parent_id === p.id);
                e.parent = parent && parent.name;
                if(parent){
                    e.country = self.locations_search.find(l => l._id === parent.country_id);
                    e.country = e.country ? e.country.title : '';
                    e.classification = self.classifications.find(c => c._id === parent.classification_id);
                    e.classification = e.classification ? e.classification.title : '';
                    parent = est.find(p => parent.parent_id === p.id);
                    if(parent){/*go three deep*/
                        e.country = self.locations_search.find(l => l._id === parent.country_id);
                        e.country = e.country ? e.country.title : '';
                        e.classification = self.classifications.find(c => c._id === parent.classification_id);
                        e.classification = e.classification ? e.classification.title : '';
                    }
                }
                return e;
            })
        }

        self.previous = () => {
            if (self.paging.page > 1) {
                self.input.paging.page = self.input.paging.page - 1;
                self.page_no_id = self.input.paging.page - 1;
                self.filter_changed(self.input, true);
            }
        };
        self.next = () => {
            if (self.establishment_count > (self.paging.size * self.paging.page)) {
                self.input.paging.page = self.input.paging.page + 1;
                self.filter_changed(self.input, true);
            }
        };

        self.page_no_id = null;
        self.page_no = [];

        //        self.change_page = (event) => {
        //            self.input.paging.page = parseInt(event.target.value);
        //            self.filter_changed(self.input, true);
        //        };

        self.page_no_changed = (_id) => {
            self.input.paging.page = _id + 1;
            self.filter_changed(self.input, true);
        };

        //        self.sort_changed = (event) => {
        //            const sort = event.target.value.split('-');
        //            self.input.order_by = {order: sort[0], direction: sort[1]};
        //            self.filter_changed(self.input, true);
        //        };

        self.sort_changed = (e) => {
            let i = e.currentTarget.getAttribute('data-message');
            let sort = i.split('-');
            self.order_by = {order: sort[0], direction: sort[1], sort_num: sort[2]};
            self.input.order_by = {order: sort[0], direction: sort[1], sort_num: sort[2]};
            self.filter_changed(self.input, true);
        };
        self.page_size_changed = (event) => {

            self.input.paging.size = parseInt(event.target.value);
            self.page_no_changed(0);
        };

        self.no_of_results_changed = (_id) => {
            self.no_of_results_id = _id;
            self.input.no_of_results_id = self.no_of_results_id;
            switch(_id){
                case 0:
                    self.input.paging.size = 10;
                    break;
                case 1:
                    self.input.paging.size = 20;
                    break;
                case 2:
                    self.input.paging.size = 50;
                    break;
                case 3:
                    self.input.paging.size = 100;
                    break;
                case 4:
                    self.input.paging.size = 250;
                    break;
                default:
                    break;
            }
            self.page_no_changed(0);
//            }
        };


        self.search_keyword = (event) => {
            event ? event.preventDefault() : null;
            const keyword = self.refs.keyword_tb.refs ? self.refs.keyword_tb.refs.input.value : self.refs.keyword_tb._tag.refs.input.value;
            if (self.keyword !== keyword) {
                self.keyword = keyword;
                self.input.keyword = self.keyword;
                self.filter_changed(self.input);
            }
        };


        const setup_search_clear = () => {
            let searching = false;
            let input = self.refs.keyword_tb.refs.input;
            if(input){
                input.addEventListener("keyup", (e) => {
                    e.keyCode === 13 ? self.search_keyword(e) : null;
                    e.keyCode === 1813 ? self.search_keyword(e) : null;
                });
            }else{
                self.refs.keyword_tb.on('mount', function () {
                    input.addEventListener("keyup", (e) => {
                        e.key === 13 ? self.search_keyword(e) : null;
                        e.key === 1813 ? self.search_keyword(e) : null;
                    });
                });
            }

        };

        self.reset_filters = () => {
            self.input = {
                paging: {
                    page: 1,
                    size: 10
                },
                keyword: '',
                order_by: {order: 'recency', direction: 'desc'},
                establishments: self.establishments,
                ancestor_id: null,   //self.opts.ttw.tenant_id
                sort_num: null
                ,update: Date.now()
            };
            self.no_of_results_changed(0);
        };

        self.filter_changed = (input, is_page_change) => {
            if (!is_page_change) {
                self.paging = self.input.paging = input.paging = {
                    page: 1
                    , size: self.input.paging && self.input.paging.size < 1000 ? self.input.paging.size : 10
                };
            }else{
                self.paging = self.input.paging = input.paging;
            }

            const input_to_save = Object.assign({}, input);
            delete input_to_save.establishments;

            self.ttw.save_to_idb("faculty_staff_establishment_table_map_input", input_to_save).then(() => {})
                .catch(err => {
                    console.error(err);
                });

            fade_out_in(true).then(() => {
                let filtered_establishments = filter_establishments(self.input);
                self.establishment_count = filtered_establishments.length;
                // self.location_count = results.location_count;
                // self.people_count = results.people_count;
                self.page_count = new Array(parseInt(self.establishment_count / self.paging.size + (((self.establishment_count % self.paging.size) > 0) ? 1 : 0)));
                // Page Number //
                self.page_no = [];
                self.page_no_id = self.input.paging.page - 1;
                for(let i=0; i < self.page_count.length; i++) {
                    self.page_no.push({
                        _id: i,
                        title: i+1
                    });
                }
                let paging = self.paging;
                self.no_of_results_id = self.input.no_of_results_id;
                const ref = self.refs.keyword_tb.refs ? self.refs.keyword_tb : self.refs.keyword_tb._tag
                // self.refs.keyword_tb.refs.input.value = self.input.keyword;
                ref.update_input_value(self.input.keyword);
                let slice_start = (paging.page - 1) * paging.size;
                let slice_end = (paging.page - 1) * paging.size + paging.size;
                filtered_establishments = self.input.order_by ? sort(filtered_establishments, self.input.order_by.order, self.input.order_by.direction) : filtered_establishments;
                filtered_establishments = filtered_establishments.slice(slice_start, slice_end);

                self.filtered_establishments = filtered_establishments;
                self.update();
                sessionStorage.setItem('admin_establishments_search_input', JSON.stringify(input));

                fade_out_in(false)
            })
                .catch(err => {
                    console.error(err);
                });
        };


        const get_places = function get_places() {
            return new Promise(function (resolve) {
                self.ttw.data_access_all({ url: "Places/Places", milli_to_refresh: 60 * 60 * 1000 * 24,
                    fb_stream_type: 'once', fb_stream_by_type: 'value' }).then(function (places) {
                    var locations = Object.keys(places.data).map(function (key) {
                        var obj = places.data[key];
                        obj.id = parseInt(key);
                        return obj;
                    });
                    self.locations_search = locations.sort(function (a, b) {
                        if (a.place < b.place) {
                            return -1;
                        }
                        if (a.place > b.place) {
                            return 1;
                        }
                        return 0;
                    }).map(function (value) {
                        return { _id: value.id, title: value.place };
                    });
                    resolve();

                    // self.refs.side_bar_filter.refs.location_list.update_original_list(self.locations_search);
                });
            });
        };

        function load_firebase_firestore_module() {
            return new Promise(resolve => {
                const script = document.createElement('script');
                script.src = `/bower_components/firebase/firebase-firestore.js`;
                script.async = true;
                script.onload = () => {
                    const firestore = firebase.firestore();
                    const settings = { timestampsInSnapshots: true };
                    firestore.settings(settings);
                    resolve();
                };
                script.onerror = () => {
                    throw new Error();
                };
                document.head.appendChild(script);
            });
        }

        self.on('mount', () => {
            self.ttw = self.opts.ttw;
            // self.refs.classifications_list.update();
            self.update();

            function init() {
                self.ttw.load_files([{url: '/utilities/check_firebase_user.js'}]).then((data) => {
                    !location.href.includes("localhost") && self.ttw.check_firebase_user().then((user) => {
                        console.log(user);
                    })
                });
                Promise.all([
                    self.ttw.get_firebase_list("establishments2/establishments", 60 * 60 * 1000 * 24)
                    , self.ttw.load_files([{url: '/utilities/establishments.js'}, {url: '/utilities/locations.js'}])
                    ,self.ttw.data_access_all({
                            url: "establishments2/establishments_info",
                            milli_to_refresh: 1,
                            fb_stream_type: 'once',
                            fb_stream_by_type: 'value'
                        })
                    , get_places()
                    // , self.ttw.get_firebase_list("Establishments/Establishments", 60 * 60 * 1000 * 24) /*!!!!!!take this out later after map from old sys to new!!!!!!!*/
                ]).then((values) => {
                    self.establishments = map_establishments(values[0]);
                    // self.old_establishments =
                    self.input = sessionStorage.getItem('admin_establishments_search_input');
                    if(!self.input || self.input === 'undefined'){
                        self.reset_filters();
                    }else{
                        self.input = JSON.parse(self.input);
                    }

                    self.filter_changed(self.input, true);
                });
            }

            if (self.ttw.firebase_auth_loaded) {

                load_firebase_firestore_module().then(() => {
                    if (self.ttw.data_access_ready) {
                        init();
                    } else {
                        self.ttw.RiotControl.on('db_access_ready', (ttw) => {
                            init();
                        })
                    }
                });
//                });
            } else {
                self.ttw.RiotControl.on('firebase_auth_loaded', (ttw) => {
                    load_firebase_firestore_module().then(() => {
                        if (self.ttw.data_access_ready) {
                            init();
                        } else {
                            self.ttw.RiotControl.on('db_access_ready', (ttw) => {
                                init();
                            })
                        }
                    });
//                    })
                })
            }
        });
        self.dropdown_classes = `
                auto_drop_down .layout.vertical, drop_down .layout.vertical {
                    align-items: center;
                    margin-bottom: 5px;
                }
                .float_text {
                    display: none;
                }
                auto_drop_down #title, drop_down #title {
                    box-sizing: border-box;
                    background-color: var(--primary_default_background_color);
                    color: var(--secondary_default_background_color);
                    padding: .5rem;
                    border: 0;
                    margin: 0;
                    border-radius: 5px;
                    text-indent: 0.01px;
                    text-overflow: '';
                    width: 100%;
                }
                auto_drop_down #title div:nth-last-child(1), drop_down #title div:nth-last-child(1) {
                    background: none;
                }
                auto_drop_down #title div:first-of-type + div, drop_down #title div:first-of-type + div {
                    background: transparent !important;
                }
                auto_drop_down .layout.horizontal.end div:first-of-type, drop_down .layout.horizontal.end div:first-of-type {
                    width: 100%;
                }
                auto_drop_down svg, drop_down #title svg {
                    fill: var(--primary_text_color);
                }
                auto_drop_down #label, drop_down #label {
                    display: none;
                }
                auto_drop_down input#input, drop_down #input1 #input {
                    color: var(--secondary_default_background_color);
                    font-family: var(--font_family);
                    font-size: inherit;
                }
                auto_drop_down input#input::placeholder, drop_down #input1 #input::placeholder, drop_down #placeholder {
                    color: rgba(255,255,255,0.5);
                }

                auto_drop_down input#input {
                    border: none !important;
                    margin: 0 !important;
                    color: var(--secondary_default_background_color);
                }

                #ddl_container {
                    width: 100% !important;
                }
                #list_div, #list {
                    width: 100%;
                    background: var(--primary_text_color);
                }
                #list_div ul, #list ul {
                    border-radius: 5px;
                    padding: 5px;
                    width: 100% !important;
                    box-sizing: border-box;
                    max-height: 300px;
                    overflow-y: scroll;
                    background: white;
                }
                #list_div ul li, #list ul li {
                    margin: 5px;
                    padding: 5px !important;
                    -webkit-border-radius: 5px;
                    -moz-border-radius: 5px;
                    border-radius: 5px;
                    margin: 0;
                    margin-bottom: 5px;
                    align-items: flex-start;
                }
                #list_div ul li:hover, #list ul li:hover {
                    background: var(--primary_default_background_color);
                    color: var(--secondary_default_background_color);
                }
                .month #list ul {
                    display: flex;
                    flex-wrap: wrap;
                    width: 160px !important;
                }
                .month #list ul li:nth-last-child(1) {
                    width: 100%;
                    justify-content: center;
                }

                multiselect_auto .placeholder_div {
                    border : 1px solid var(--secondary_default_background_color);
                    -webkit-border-radius: 5px;
                    -moz-border-radius: 5px;
                    border-radius: 5px;
                    align-items: center !important;
                }
                multiselect_auto .multiselect_auto_input {
                    border: none !important;
                }
                multiselect_auto #title>div:nth-last-child(1) {
                    display: none !important;
                }
                multiselect_auto .multiselect_arrow, multiselect_auto .multiselect_arrow_shift {
                    display: block;
                }
                multiselect_auto .multiselect_arrow svg {
                    fill: var(--primary_default_background_color);
                }
                multiselect_auto #selected_items_container {
                    text-align: start;
                    background: none;
                    border: none;
                }
                multiselect_auto #selected_items_container .tag_btn .remove_tag_btn, multiselect_auto #selected_items_container .tag_btn_clear .remove_tag_btn{
                    color: var(--primary_text_color);
                    margin-top: -1px;
                }
                multiselect_auto #selected_items_container .tag_btn {
                    background: var(--primary_default_background_color);
                    color: var(--secondary_default_background_color);
                }
                multiselect_auto #selected_items_container .tag_btn_clear {
                    color: var(--primary_text_color);
                    border: 1px solid var(--primary_default_background_color);
                    margin-right: 0;
                    background: var(--primary_default_background_color);
                }
                multiselect_auto #ddl_container {
                    width: 100% !important;
                }
                multiselect_auto #ddl_container #list_div {
                    width: 100% !important;
                }
                multiselect_auto #ddl_container #list_div ul {
                    padding: 5px !important;
                    width: 100% !important;
                    border-radius: 5px;
                    box-sizing: border-box;
                }
                multiselect_auto #ddl_container #list_div ul li{
                    padding: 5px !important;
                    -webkit-border-radius: 5px;
                    -moz-border-radius: 5px;
                    border-radius: 5px;
                    margin: 0;
                    margin-bottom: 5px;
                }
                multiselect_auto #ddl_container #list_div ul li:hover {
                    background: var(--primary_default_background_color);
                    color: var(--secondary_default_background_color);
                }
                textbox input {
                    background: floralwhite;
                    padding: 10px;
                    border-radius: 5px;
                    border: 1px solid var(--secondary_default_background_color) !important;
                    margin-top: 0;
                }
                textbox #textbox_clear {
                    top: 1.1em;
                }
            `;


    </script>
</establishments>