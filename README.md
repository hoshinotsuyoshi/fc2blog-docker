fc2blog-docker
==============

fc2blog-docker

#### 動いている様子

http://fc2blog-tmp-sandbox.webtext.pw/admin/install.php

#### 準備

* Dockerをインストールしておく

#### ダウンロード・起動方法

    git clone http://github.com/hoshinotsuyoshi/fc2blog-docker
    cd fc2blog-docker
    vi httpd/httpd.conf #バーチャルホスト名を編集する
    vi config.php #ホスト名を編集する
    docker build -t fc2 . 
    
#### 起動方法

    source runner.sh
