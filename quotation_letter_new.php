<?php require_once("includes/initialize.php");
if (!$session->is_logged_in()) {
    redirect_to("logout.php");
}
if (!isset($_GET['id']) && isset($_SESSION['set_plan_id'])) {
    redirectUrl();
}
$date = date('Y-m-d', time());
$ward_address = WardWiseAddress();
$address = getAddress();
if (isset($_POST['submit'])) {
    $letter = new LetterFormat();
    $letter->letter_type = $_POST['letter_type'];
    $letter->date = date('Y-m-d', time());
    $letter->plan_type = 6;
    $letter->letter_text = $_POST['letter_text'];
    $letter->save();
}

//?>

<?php include("menuincludes/header.php"); ?>
<!-- js ends -->
<title>पत्र</title>

</head>

<body>
    <?php include("menuincludes/topwrap.php"); ?>
    <div id="body_wrap_inner">


        <div class="maincontent">
            <h2 class="headinguserprofile">
                <a class="btn btn-primary" href="quotation_letter_view.php">पत्रहरु हेर्नुहोस्</a> |
                <a href="quotation_letter.php" class="btn">पछि जानुहोस </a>
            </h2>

            <div class="OurContentFull">

                <form method="post">
                    <div class="row centered">
                        <div class="col-md-4">
                            पत्रको नाम:
                            <input placeholder="पत्रको नाम" type="text" class="form-control" name="letter_type"
                                id="letter_type_text" required>
                        </div>

                        <div class="row" style="margin-left: 10px; margin-top: 10px">

                            <div class="document-editor__toolbar"></div>
                        </div>
                        <div class="row row-editor" style="margin-left: 10px; border: 1px solid #e3d9d9;">
                            <div class="editor" id="" style="height: 400px; width: 950px !important;">


                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="letter_text" name="letter_text" />


                    <br>
                    <input type="hidden" name="update_id" id="update_id" value="">
                    <input type="submit" id="submit" class="btn btn-primary" name="submit"
                        value="नया पत्र सेभ गर्नुहोस्" onclick="return confirm('के तपाई निश्चित हुनुन्छ ?');"
                        style="margin-left: 10px;">
                </form>
            </div>

            <div class="userprofiletable" id="div_print">
                <div class="printPage">
                </div>
                <div class="myspacer"></div>
            </div>
            <!--<div class="settingsMenu1"><a href="settings_topic_add_sub.php">सह शिर्षक थप्नुहोस +</a></div>-->
        </div>
    </div>
    </div>
    </div><!-- main menu ends -->

    </div><!-- top wrap ends -->

    <?php include("menuincludes/footer.php"); ?>


    <script>
        var myEditor;

        var param = {};
        var items = [];
        JQ.post('get_all_indices.php', param, function(res) {
            var obj = JSON.parse(res);
            //console.log(res);
            //        alert(obj.html);exit;
            var data = obj.data;
            items = data;



            // alert(obj.enlist_id);
        });

        JQ(document).on("click", "#submit", function() {
            var data = myEditor.getData();
            // console.log(data);
            JQ('#letter_text').val(data);


        });

        function getFeedItems(queryText) {
            return new Promise(resolve => {
                setTimeout(() => {
                    const itemsToDisplay = items
                        // Filter out the full list of all items to only those matching the query text.
                        .filter(isItemMatching)
                        // Return 10 items max - needed for generic queries when the list may contain hundreds of elements.
                        .slice(0, 10);

                    resolve(itemsToDisplay);
                }, 50);
            });

            // Filtering function - it uses `name` and `username` properties of an item to find a match.
            function isItemMatching(item) {
                // Make the search case-insensitive.
                const searchString = queryText.toLowerCase();


                // Include an item in the search results if name or username includes the current user input.
                return (
                    item.name.toLowerCase().includes(searchString) ||
                    item.id.toLowerCase().includes(searchString)
                );
            }
        }

        function customItemRenderer(item) {
            const itemElement = document.createElement('span');

            itemElement.classList.add('custom-item');
            itemElement.id = `mention-list-item-id-${item.userId}`;
            itemElement.textContent = `${item.id} `;

            const usernameElement = document.createElement('span');

            usernameElement.classList.add('custom-item-username');
            usernameElement.textContent = item.name;

            itemElement.appendChild(usernameElement);

            return itemElement;
        }

        DecoupledDocumentEditor
            .create(document.querySelector('.editor'), {

                toolbar: {
                    items: [
                        'heading',
                        '|',
                        'fontSize',
                        'fontFamily',
                        '|',
                        'bold',
                        'italic',
                        'underline',
                        'strikethrough',
                        'highlight',
                        '|',
                        'alignment',
                        '|',
                        'numberedList',
                        'bulletedList',
                        '|',
                        'indent',
                        'outdent',
                        '|',
                        'todoList',
                        'link',
                        'blockQuote',
                        'imageUpload',
                        'insertTable',
                        'mediaEmbed',
                        '|',
                        'undo',
                        'redo'
                    ]
                },
                language: 'en',
                image: {
                    toolbar: [
                        'imageTextAlternative',
                        'imageStyle:full',
                        'imageStyle:side'
                    ]
                },
                table: {
                    contentToolbar: [
                        'tableColumn',
                        'tableRow',
                        'mergeTableCells'
                    ]
                },
                licenseKey: '',
                mention: {
                    feeds: [{
                        marker: '[',
                        feed: getFeedItems,
                        itemRenderer: customItemRenderer
                    }]
                },

            })
            .then(editor => {


                myEditor = editor;
                window.editor = myEditor;


                //  Set a custom container for the toolbar.
                document.querySelector('.document-editor__toolbar').appendChild(editor.ui.view.toolbar.element);
                // document.querySelector( '.ck-toolbar' ).classList.add( 'ck-reset_all' );
            })
            .catch(error => {
                console.error('Oops, something went wrong!');
                console.error(
                    'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:'
                );
                console.warn('Build id: 8b7q7fdksnho-ucn1dsls94e0');
                console.error(error);
            });

        JQ(document).on("change", "#letter_type", function() {
            var param = {};
            var plan_type = JQ('#plan_type').val() || 0;
            var letter_type = JQ('#letter_type').val() || 0
            // alert(letter_type);
            param.plan_type = 6;
            param.letter_type = letter_type;
            JQ.post('get_letter_format.php', param, function(res) {
                var obj = JSON.parse(res);
                myEditor.setData(obj.html);
                //     // JQ('#view_editor').html(obj.html);
                JQ('#update_id').val(obj.update_id);
                JQ('#letter_type_text').prop('required', false);
            });
        });
    </script>


</body>