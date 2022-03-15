# PrintDrive検証環境の準備手順

（Scratch Org作成を前提にしていますが、Sandbox環境で試す場合には、「4.」から実行ください）

## 1. scratch orgを作成

```
$ sfdx force:org:create -f ./config/project-scratch-def.json -a pd.sc -d 30
```

### 2. パスワードを発行

```
$ sfdx force:user:password:generate -u (ユーザ名)
```

### 3. ユーザ情報を確認

```
$ sfdx force:user:display -u (ユーザ名)
```

### 4. PrintDrive (v1.31) をインストール

1. https://test.salesforce.com/packaging/installPackage.apexp?p0=04t2K0000008KXl にアクセスします
2. ユーザ名とパスワードを入力してパッケージをインストールします


## 5. PxDoc4をローカルPCにインストール

* (PxDoc3がインストールされている場合)
    * PxDoc3をインストールしたフォルダ内にある`unins000.exe`を実行して、PxDoc3をアンインストールしてください。

* 以下のダウンロードサイトから `install_px400_05_32.zip` をダウンロードします
    * https://github.com/taodrive/PrintDrive/releases/tag/4.00.05
* zipを解凍してインストーラーを起動してPxDoc4をインストールしてください

## 6. サンプルプログラムの移送

```
$ git clone git@github.com:takahiro-yonei/PrintDrive-example.git
$ sfdx force:source:push -u xxx -f
```


# Apexクラス/VisualforcePage構成について

帳票本体のVisualforcePage, Apexクラスと、その帳票を起動するためのVisualforcePage, Apexクラスで構成されます

本サンプルプログラムでは、以下のような構成となります

|種別|VisualforcePage|ApexClass|
|:--|:--|:--|
|帳票本体|PxDoc_Sample.page|Con_PxDoc_Sample|
|帳票起動|BootPxDoc_Sample01|ConBootPxDoc_Sample|
||BootPxDoc_Sample02|ConBootPxDoc_Sample|

# サンプルプログラム

本サンプルプログラムでは、2パターンの起動方法について実装しています

## サンプル(1)

* 帳票用VisualforcePageのURLを受け取って帳票を起動します

```
/apex/BootPxDoc_Sample01?url=xxxx にアクセス

---> BootPxDoc_Sample01ページから、ConBootPxDoc_Sample.doBootPxDoc_01 を起動

---> クエリパラメータとして受け取ったURLを、BootPxDoc_Sample01に渡す

---> BootPxDoc_Sample01からPxDoc3を起動
＊最初に起動する際、アラートが表示されるかもしれません。その場合は再度お試しください。
```

## サンプル(2)

* 帳票起動用のApexクラス内で、帳票用VisualforcePageのURLを生成して帳票を起動します

```
/apex/BootPxDoc_Sample02 にアクセス

---> BootPxDoc_Sample02ページから、ConBootPxDoc_Sample.doBootPxDoc_02 を起動

---> doBootPxDoc_02 の起動処理内で、帳票用VisualforcePageのURLを生成して、BootPxDoc_Sample02 に渡す

---> BootPxDoc_Sample02からPxDoc3を起動
＊最初に起動する際、アラートが表示されるかもしれません。その場合は再度お試しください。
```

## その他

### PxDoc2からの移行について

すでにPxDoc2を使っている場合、帳票本体となるVisualforcePageとApexクラスは存在していると思います。

その場合、帳票本体のVisualfocePageを起動するための帳票起動用のVisualforcePageとApexクラスを作成することとなります。

帳票起動用のサンプルについては、`BootPxDoc_Sample01`, `BootPxDoc_Sample02` および `ConBootPxDoc_Sample` を参考にしてみてください。
