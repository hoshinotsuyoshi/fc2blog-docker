<?php

//error_reporting(-1);
error_reporting(0);

// 直接呼び出された場合は終了
if (count(get_included_files())==1) {
  exit;
}

// DBの接続情報
define('DB_HOST',     'localhost');          // dbのホスト名
define('DB_USER',     'root');     // dbのユーザー名
define('DB_PASSWORD', 'your_password');      // dbのパスワード
define('DB_DATABASE', 'test'); // dbのデータベース名
define('DB_CHARSET',  'UTF8');            // MySQL 5.5未満の場合はUTF8を指定してください

// サーバーの設定情報
define('DOMAIN',        'fc2blog-tmp-sandbox.webtext.pw');           // ドメイン名
define('PASSWORD_SALT', '206ea6e1c3edba4cbe8e3b365a19355a'); // 適当な英数字を入力してください

// 設定クラス読み込み
define('WWW_DIR', dirname(__FILE__) . '/');
require(dirname(__FILE__) . '/../app/core/bootstrap.php');
