# mozc-emacs-helper

Google日本語入力と連携するようにビルドした `mozc_emacs_helper.exe` を含むchocolateyパッケージです。主にWSL上のEmacsからWindowsのGoogle日本語入力を利用すことを想定してビルドしたものです。このパッケージをインストールすると `mozc_emacs_helper.exe` が自動的にパスに含まれます。

## **Caution**

ビルドの際にソースにパッチは当てていないため、`mozc_emacs_helper.exe` のセッション開始直後は直接入力モードになっています。ひらがな入力モードにするために、`init.el` に以下のような設定が必要です。

``` emacs-lisp
;; Windows の mozc では、セッション接続直後 directモード になるので hiraganaモード にする
(advice-add 'mozc-session-execute-command
            :after (lambda (&rest args)
                     (when (eq (nth 0 args) 'CreateSession)
                       (mozc-session-sendkey '(Hankaku/Zenkaku)))))
```

ref. [emacs-mozc を動かすための設定（emacs 設定編） - NTEmacs @ ウィキ - アットウィキ](https://www49.atwiki.jp/ntemacs/pages/48.html)

# Reference

- [How to build Mozc in Windows](https://github.com/google/mozc/blob/master/docs/build_mozc_in_windows.md)
- [emacs-mozc を動かすための設定（mozc_emacs_helper コンパイル編） - NTEmacs @ ウィキ - アットウィキ](https://www49.atwiki.jp/ntemacs/pages/50.html)
- [WSL の Emacs で日本語入力 - Qiita](https://qiita.com/ignorant/items/1c4f729f9147fb878f10)

# ライセンス

このパッケージに含まれる `Release/mozc_emacs_helper.exe`, `Release_x64/mozc_emacs_helper.exe` はmozcのライセンスに従い再配布するものです。mozcのライセンスについては https://github.com/google/mozc/blob/master/LICENSE を参照してください。
