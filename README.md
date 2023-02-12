=======

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation
[![](https://mermaid.ink/img/pako:eNqFU11vgjAU_SvNfRYDKhj7ZhzzRceiLssWEtNBVTKgpJSoA_77ypeiuOw-3dxz7jm3t20KDnMpYKD8ySN7TgI7RDLe1uYKZZmisBS9WusNwuhA4i62MqezAuSUOKILz6zl0nwpCA4LAhrWlFKxQ7kYtOHG4AI2_L_wZ2uxsN5RzhQly6phMNox32fHlnoBy-7NdH6jPd2Yc2v10YjfwaVYWuVFxIJ74R6FJKCdIg2I53eqEYnjI-PuFfBCQfeUI878WiRvjdk1E57wW26CnoTcrRRpdltxiUjiRvuBWXFb8dZhSdNVm1bb7LqWDeTLp1txjm7nvOwsvZvqupb89ua68g8OUNfLR3Nn_M9JoAcB5XL9rnzWpZcN4kDlMIBl6hL-bYMdFjySCLY-hw5gwRPagyRyiaD1RwC8I34sqxEJAadwAjwc6v3JQFPHhqFpw7Gq9-AMWNFGfbWIwcSY6MZIV_W8Bz-MSQmtbP8s81qOup5gfFl9u_L35b8qXgyZ?type=png)](https://mermaid.live/edit#pako:eNqFU11vgjAU_SvNfRYDKhj7ZhzzRceiLssWEtNBVTKgpJSoA_77ypeiuOw-3dxz7jm3t20KDnMpYKD8ySN7TgI7RDLe1uYKZZmisBS9WusNwuhA4i62MqezAuSUOKILz6zl0nwpCA4LAhrWlFKxQ7kYtOHG4AI2_L_wZ2uxsN5RzhQly6phMNox32fHlnoBy-7NdH6jPd2Yc2v10YjfwaVYWuVFxIJ74R6FJKCdIg2I53eqEYnjI-PuFfBCQfeUI878WiRvjdk1E57wW26CnoTcrRRpdltxiUjiRvuBWXFb8dZhSdNVm1bb7LqWDeTLp1txjm7nvOwsvZvqupb89ua68g8OUNfLR3Nn_M9JoAcB5XL9rnzWpZcN4kDlMIBl6hL-bYMdFjySCLY-hw5gwRPagyRyiaD1RwC8I34sqxEJAadwAjwc6v3JQFPHhqFpw7Gq9-AMWNFGfbWIwcSY6MZIV_W8Bz-MSQmtbP8s81qOup5gfFl9u_L35b8qXgyZ)
- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
```
│   config.ru
│   babel.config.js
│   render.yaml
│   .gitignore
│   package.json
│   README.md
│   .gitattributes
│   Gemfile.lock
│   postcss.config.js
│   .ruby-version
│   Gemfile
│   ER-diagram.png
│   Rakefile
│   Capfile
│   yarn.lock
│   .browserslistrc
│   .rspec
│   .env
│
├───coverage
│   │   .resultset.json.lock
│   │   index.html
│   │   .resultset.json
│   │   .last_run.json
│   │
│   └───assets
│       └───0.12.3
│           │   application.css
│           │   magnify.png
│           │   favicon_green.png
│           │   loading.gif
│           │   application.js
│           │   favicon_red.png
│           │   favicon_yellow.png
│           │
│           ├───colorbox
│           │       loading.gif
│           │       border.png
│           │       controls.png
│           │       loading_background.png
│           │
│           ├───DataTables-1.10.20
│           │   └───images
│           │           sort_asc.png
│           │           sort_desc_disabled.png
│           │           sort_desc.png
│           │           sort_both.png
│           │           sort_asc_disabled.png
│           │
│           └───images
│                   ui-icons_2e83ff_256x240.png
│                   ui-bg_flat_75_ffffff_40x100.png
│                   ui-icons_cd0a0a_256x240.png
│                   ui-bg_flat_0_aaaaaa_40x100.png
│                   ui-icons_454545_256x240.png
│                   ui-icons_888888_256x240.png
│                   ui-bg_glass_75_e6e6e6_1x400.png
│                   ui-icons_222222_256x240.png
│                   ui-bg_glass_55_fbf9ee_1x400.png
│                   ui-bg_glass_75_dadada_1x400.png
│                   ui-bg_highlight-soft_75_cccccc_1x100.png
│                   ui-bg_glass_65_ffffff_1x400.png
│                   ui-bg_glass_95_fef1ec_1x400.png
│
├───storage
│       .keep
│
├───.git
│   │   index
│   │   HEAD
│   │   packed-refs
│   │   config
│   │   description
│   │
│   ├───branches
│   ├───hooks
│   │       fsmonitor-watchman.sample
│   │       update.sample
│   │       pre-applypatch.sample
│   │       pre-push.sample
│   │       pre-receive.sample
│   │       pre-merge-commit.sample
│   │       applypatch-msg.sample
│   │       pre-commit.sample
│   │       prepare-commit-msg.sample
│   │       commit-msg.sample
│   │       post-update.sample
│   │       pre-rebase.sample
│   │
│   ├───objects
│   │   ├───pack
│   │   │       pack-f916a7d5f4925c4a5251ebf28e9390ee4f7bc188.pack
│   │   │       pack-f916a7d5f4925c4a5251ebf28e9390ee4f7bc188.idx
│   │   │
│   │   └───info
│   ├───info
│   │       exclude
│   │
│   ├───refs
│   │   ├───tags
│   │   ├───remotes
│   │   │   └───origin
│   │   │           HEAD
│   │   │
│   │   └───heads
│   │           main
│   │
│   └───logs
│       │   HEAD
│       │
│       └───refs
│           ├───remotes
│           │   └───origin
│           │           HEAD
│           │
│           └───heads
│                   main
│
├───spec
│   │   rails_helper.rb
│   │   factories.rb
│   │   spec_helper.rb
│   │
│   ├───jobs
│   │       check_draft_job_spec.rb
│   │       notification_broadcast_job_spec.rb
│   │       create_notification_job_spec.rb
│   │
│   ├───support
│   │       factory_bot.rb
│   │       controller_helpers.rb
│   │
│   ├───helpers
│   │       bookmarks_helper_spec.rb
│   │
│   ├───models
│   │       post_spec.rb
│   │       notification_spec.rb
│   │       user_spec.rb
│   │
│   └───requests
│           reacts_controller_spec.rb
│           comments_controller_spec.rb
│           categories_controller_spec.rb
│           bookmarks_spec.rb
│           follows_controller_spec.rb
│           tags_controller_spec.rb
│           users_controller_spec.rb
│           notifications_controller_spec.rb
│           posts_controller_spec.rb
│           home_controller_spec.rb
│
├───db
│   │   schema.rb
│   │   seeds.rb
│   │
│   └───migrate
│           20230104165056_remove_post_id_from_reacts.rb
│           20221214075238_create_reacts.rb
│           20230109163752_change_column_name_in_notifications.rb
│           20221207105124_create_posts.rb
│           20221212170305_change_role_to_be_integer_in_users.rb
│           20230106063325_add_post_ref_to_reacts.rb
│           20230106050519_add_post_ref_to_comments.rb
│           20221214095812_create_comments.rb
│           20230104072321_create_follows.rb
│           20230104163951_add_reactable_to_reacts.rb
│           20221209072642_add_devise_to_users.rb
│           20221226172844_create_action_text_tables.action_text.rb
│           20230106045241_add_post_ref_to_notifications.rb
│           20230103020517_add_commentable_to_comments.rb
│           20230109043039_add_status_to_notifications.rb
│           20230106021923_add_action_to_notifications.rb
│           20221228093724_create_categories.rb
│           20221229040904_change_column_name_in_categories.rb
│           20230109163318_change_status_to_be_boolean_in_notifications.rb
│           20221226022212_create_active_storage_tables.active_storage.rb
│           20230116103758_add_post_id_to_notifications.rb
│           20221216052131_change_column_name.rb
│           20230116102920_remove_post_ref_of_notifications.rb
│           20230106084728_change_null_to_true_in_notifications.rb
│           20221216050056_add_status_to_posts.rb
│           20221228093900_create_tags.rb
│           20221207102430_create_users.rb
│           20221226095754_remove_avatar_from_users.rb
│           20230103023310_remove_post_id_from_comments.rb
│           20230105074415_create_notifications.rb
│           20230207101930_create_bookmarks.rb
│           20221223100525_populate_post_reacts_count.rb
│           20221223073329_add_reacts_count_to_posts.rb
│           20230208164931_add_columns_to_users.rb
│           20230105020917_add_reacts_count_to_comments.rb
│           20221207104037_add_role_to_users.rb
│           20230112105348_change_column_in_notifications.rb
│
├───lib
│   ├───tasks
│   │       .keep
│   │       post.rake
│   │
│   └───assets
│           .keep
│
├───config
│   │   spring.rb
│   │   environment.rb
│   │   routes.rb
│   │   cable.yml
│   │   database.yml
│   │   webpacker.yml
│   │   storage.yml
│   │   schedule.rb
│   │   application.rb
│   │   boot.rb
│   │   deploy.rb
│   │   puma.rb
│   │   credentials.yml.enc
│   │
│   ├───webpack
│   │   │   development.js
│   │   │   production.js
│   │   │   test.js
│   │   │   environment.js
│   │   │
│   │   └───loaders
│   │           jquery.js
│   │
│   ├───initializers
│   │       mime_types.rb
│   │       content_security_policy.rb
│   │       backtrace_silencers.rb
│   │       pagy.rb
│   │       permissions_policy.rb
│   │       wrap_parameters.rb
│   │       assets.rb
│   │       inflections.rb
│   │       dotenv.erb
│   │       filter_parameter_logging.rb
│   │       html_sanitinzation.rb
│   │       cookies_serializer.rb
│   │       devise.rb
│   │       application_controller_renderer.rb
│   │       bugsnag.rb
│   │       sentry.rb
│   │
│   ├───deploy
│   │       production.rb
│   │
│   ├───environments
│   │       test.rb
│   │       production.rb
│   │       development.rb
│   │
│   └───locales
│           devise.en.yml
│           en.yml
│
├───app
│   ├───services
│   │       notification_creator_for_post_service.rb
│   │       application_service.rb
│   │       notification_creator_for_react_service.rb
│   │       notification_creator_for_comment_service.rb
│   │       notification_creator_for_follow_service.rb
│   │
│   ├───views
│   │   ├───home
│   │   │       index.html.slim
│   │   │       _scrollable_list.html.slim
│   │   │       _next_user_search_page.html.slim
│   │   │       _scrollable_post_search_list.html.slim
│   │   │       _next_page.html.slim
│   │   │       search.html.slim
│   │   │       _scrollable_user_search_list.html.slim
│   │   │       _next_post_search_page.html.slim
│   │   │
│   │   ├───users
│   │   │       edit.html.slim
│   │   │       show.html.slim
│   │   │       _users.html.slim
│   │   │
│   │   ├───active_storage
│   │   │   └───blobs
│   │   │           _blob.html.erb
│   │   │
│   │   ├───header
│   │   │       _header2.html.slim
│   │   │       _header.html.slim
│   │   │
│   │   ├───notifications
│   │   │       index.html.slim
│   │   │       mark_all_read.js.erb
│   │   │       _counter.html.slim
│   │   │       _notification.html.slim
│   │   │       _notifications_center.html.slim
│   │   │
│   │   ├───tags
│   │   │       index.html.erb
│   │   │       create.js.erb
│   │   │       destroy.html.erb
│   │   │       destroy.js.erb
│   │   │       create.html.erb
│   │   │
│   │   ├───reacts
│   │   │       create.js.erb
│   │   │       destroy.js.erb
│   │   │       _reacted.html.erb
│   │   │       _react.html.erb
│   │   │
│   │   ├───layouts
│   │   │       mailer.html.erb
│   │   │       mailer.text.erb
│   │   │       without_create_post.html.slim
│   │   │       application.html.slim
│   │   │
│   │   ├───devise
│   │   │   ├───confirmations
│   │   │   │       new.html.erb
│   │   │   │
│   │   │   ├───unlocks
│   │   │   │       new.html.erb
│   │   │   │
│   │   │   ├───passwords
│   │   │   │       new.html.erb
│   │   │   │       edit.html.erb
│   │   │   │
│   │   │   ├───shared
│   │   │   │       _links.html.erb
│   │   │   │       _error_messages.html.erb
│   │   │   │
│   │   │   ├───sessions
│   │   │   │       new.html.slim
│   │   │   │
│   │   │   ├───registrations
│   │   │   │       new.html.slim
│   │   │   │       edit.html.slim
│   │   │   │
│   │   │   └───mailer
│   │   │           email_changed.html.erb
│   │   │           password_change.html.erb
│   │   │           unlock_instructions.html.erb
│   │   │           confirmation_instructions.html.erb
│   │   │           reset_password_instructions.html.erb
│   │   │
│   │   ├───comments
│   │   │       _comment.html.slim
│   │   │       _comments_of_post.html.slim
│   │   │       edit.html.slim
│   │   │       destroy.js.erb
│   │   │
│   │   ├───posts
│   │   │       _user_dashboard.html.slim
│   │   │       _posts.html.slim
│   │   │       index.html.slim
│   │   │       update.js.erb
│   │   │       _status_posts.html.slim
│   │   │       edit.html.slim
│   │   │       _admin_dashboard.html.slim
│   │   │       show.js.erb
│   │   │       show.html.slim
│   │   │       _next_status_posts.html.slim
│   │   │       _scrollable_status_posts.html.slim
│   │   │
│   │   ├───follows
│   │   │       _unfollow_button.html.slim
│   │   │       create.js.erb
│   │   │       _follow_button.html.slim
│   │   │       destroy.js.erb
│   │   │
│   │   ├───categories
│   │   │       show.html.slim
│   │   │
│   │   └───bookmarks
│   │           _bookmarked.html.slim
│   │           create.js.erb
│   │           index.html.slim
│   │           _bookmark.html.slim
│   │           destroy.js.erb
│   │
│   ├───channels
│   │   │   notifications_channel.rb
│   │   │
│   │   └───application_cable
│   │           channel.rb
│   │           connection.rb
│   │
│   ├───jobs
│   │       create_notification_job.rb
│   │       notification_broadcast_job.rb
│   │       application_job.rb
│   │       check_draft_job.rb
│   │
│   ├───assets
│   │   ├───config
│   │   │       manifest.js
│   │   │
│   │   ├───images
│   │   │       mail.svg
│   │   │       twitter-icon.svg
│   │   │       cake.svg
│   │   │       reacted.svg
│   │   │       location.svg
│   │   │       bookmark-white.svg
│   │   │       bell.svg
│   │   │       threedot.svg
│   │   │       github-icon.svg
│   │   │       like.svg
│   │   │       .keep
│   │   │       apple-icon.svg
│   │   │       forem-icon.svg
│   │   │       bookmark.svg
│   │   │       comment-icon.svg
│   │   │       logo.png
│   │   │       search-icon.svg
│   │   │       share-facebook.svg
│   │   │
│   │   └───stylesheets
│   │           bookmarks.scss
│   │           application.css
│   │           follows.scss
│   │           notifications.scss
│   │           reacts.scss
│   │           tags.scss
│   │           categories.scss
│   │           comments.scss
│   │           actiontext.scss
│   │           home.scss
│   │
│   ├───helpers
│   │       posts_helper.rb
│   │       notifications_helper.rb
│   │       application_helper.rb
│   │       categories_helper.rb
│   │       tags_helper.rb
│   │       home_helper.rb
│   │       bookmarks_helper.rb
│   │       follows_helper.rb
│   │       reacts_helper.rb
│   │       users_helper.rb
│   │       comments_helper.rb
│   │
│   ├───controllers
│   │   │   tags_controller.rb
│   │   │   users_controller.rb
│   │   │   categories_controller.rb
│   │   │   reacts_controller.rb
│   │   │   application_controller.rb
│   │   │   comments_controller.rb
│   │   │   bookmarks_controller.rb
│   │   │   notifications_controller.rb
│   │   │   home_controller.rb
│   │   │   posts_controller.rb
│   │   │   follows_controller.rb
│   │   │
│   │   ├───concerns
│   │   │       .keep
│   │   │
│   │   └───users
│   │           registrations_controller.rb
│   │
│   ├───models
│   │   │   user.rb
│   │   │   react.rb
│   │   │   bookmark.rb
│   │   │   post.rb
│   │   │   tag.rb
│   │   │   application_record.rb
│   │   │   comment.rb
│   │   │   notification.rb
│   │   │   category.rb
│   │   │   follow.rb
│   │   │
│   │   └───concerns
│   │           .keep
│   │
│   ├───javascript
│   │   ├───channels
│   │   │       consumer.js
│   │   │       index.js
│   │   │       notifications_channel.js
│   │   │
│   │   ├───packs
│   │   │       dropdown.js
│   │   │       login.js
│   │   │       edit_user.js
│   │   │       comment.js
│   │   │       edit_post.js
│   │   │       application.js
│   │   │
│   │   └───stylesheets
│   │           bookmarks.scss
│   │           notifications.scss
│   │           header.scss
│   │           application.scss
│   │           users.scss
│   │           posts.scss
│   │           search.scss
│   │           actiontext.scss
│   │
│   └───mailers
│           application_mailer.rb
│
├───test
│   │   application_system_test_case.rb
│   │   test_helper.rb
│   │
│   ├───channels
│   │   │   notifications_channel_test.rb
│   │   │
│   │   └───application_cable
│   │           connection_test.rb
│   │
│   ├───jobs
│   │       notification_broadcast_job_test.rb
│   │       create_notification_job_test.rb
│   │       check_draft_job_test.rb
│   │
│   ├───fixtures
│   │   │   notifications.yml
│   │   │   users.yml
│   │   │   follows.yml
│   │   │   posts.yml
│   │   │   reacts.yml
│   │   │   categories.yml
│   │   │   tags.yml
│   │   │   comments.yml
│   │   │
│   │   ├───action_text
│   │   │       rich_texts.yml
│   │   │
│   │   └───files
│   │           .keep
│   │
│   ├───integration
│   │       .keep
│   │
│   ├───system
│   │       .keep
│   │
│   ├───helpers
│   │       .keep
│   │
│   ├───controllers
│   │       categories_controller_test.rb
│   │       users_controller_test.rb
│   │       reacts_controller_test.rb
│   │       posts_controller_test.rb
│   │       .keep
│   │       tags_controller_test.rb
│   │       notifications_controller_test.rb
│   │       home_controller_test.rb
│   │       follows_controller_test.rb
│   │       comments_controller_test.rb
│   │
│   ├───models
│   │       notification_test.rb
│   │       react_test.rb
│   │       category_test.rb
│   │       tag_test.rb
│   │       post_test.rb
│   │       follow_test.rb
│   │       .keep
│   │       comment_test.rb
│   │       user_test.rb
│   │
│   └───mailers
│           .keep
│
├───bin
│       webpack
│       setup
│       yarn
│       rails
│       spring
│       render-build.sh
│       webpack-dev-server
│       bundle
│       rake
│
├───public
│       500.html
│       robots.txt
│       apple-touch-icon-precomposed.png
│       favicon.ico
│       404.html
│       apple-touch-icon.png
│       422.html
│
├───tmp
│   │   .keep
│   │
│   └───pids
│           .keep
│
├───log
│       .keep
│
└───vendor
        .keep
```
