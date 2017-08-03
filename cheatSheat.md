# ちーとしーと

登録されているaliasなど

## zsh
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`ll`|`ls -lh`|||
|`la`|`ls -al`|||
|`o`|`open`|||
|`b`||ブラウザで開く||
|`d`|`dirs -v`|移動履歴を見る||
|`数字`||上記の場所に飛ぶ||
|`pdc`|`pbcopy`|||
|`pdp`|`pbpaste`|||
|`j`||よく行くディレクトリにjump||
|`mt`||ゴミ箱に移動||
|`tree -L 3`||ツリー||

## peco
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`Ctrl + R`||履歴検索||
|`Ctrl + S + S`||ssh検索||
|`pk`||プロセスを選んでkill||
|`Ctrl + B`||ブランチ検索|git|
|`Ctrl + S`||書き換えファイル検索|git|
|`Ctrl + V`||コミット検索|git|
|`Ctrl + V + V`||全コミット検索|git|

## git
### barnach (b)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gb`|`git branch -a`|ブランチ一覧、`-a`で全て||
|`gbv`|`git branch -a -vv`|詳しく`gb`、追跡ブランチの確認||
|`gbu`|`git branch -u`|追跡ブランチ更新(update)|`gbu origin/feature_deploy`|
|`gbd`|`git branch -D`|ブランチ強制削除||
|`gbm`|`git branch -M`|カレントブランチ名の強制変更||

### pull, fetch (p, f)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gp`|`git pull --rebase`<br>`--prune --tags`|フェッチとリベース<br>タグ追加と追跡ブランチの削除も|`gp [コレをrebaseする]`|
|`gf`|`git fetch --prune --tags`|タグ追加と追跡ブランチの削除も||

### rebase (rb)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`grb`|`git rebase`|リベース||
|`grbi`|`git rebase -i`||`grbi [コミットハッシュ]`|
|`grba`|`git rebase --abort`|rebaseの取り消し(コンフリクト時)||
|`grbc`|`git rebase --continue`|rebaseの続行(コンフリクト時)||
|`grbs`|`git rebase --skip`|？|||

### push (po)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gpo`|`git push -u origin`|プッシュ。追跡ブランチの更新も|`gpo [コレを]:[ココに]`<br>`gpo teature/test:master`|

### checkout (co)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gco`|`git checkout`|チェックアウト||
|`gcob`|`checkout -b`|ブランチ作成とチェックアウト||
|`gcop`|`checkout -p`|hunkごとにチェックアウト||

`checkout` = `reset HEAD` ← この認識であってます？

### cherry-pick, revert (cp, rv)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gcp`|`git cherry-pick --ff`|fastfowardでチェリーピック||
|`gcpa`|`git cherry-pick --abort`|チェリーピックの取り消し(コンフリクト時)||
|`gcpc`|`git cherry-pick --continue`|チェリーピックの続行(コンフリクト時)||
|`gcps`|`git cherry-pick --skip`|？||
|`grv`|`git revert`|リバーと||
|`grva`|`git revert --abort`|リバートの取り消し(コンフリクト時)||
|`grvc`|`git revert --continue`|リバートの続行(コンフリクト時)||

### add, commit (ad, cm)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gad`|`git add`|add||
|`gadp`|`git add -p`|hunkごとにadd||
|`gcm`|`git commit -v`|変更表示してコミット(view)||
|`gcmm`|`git commit -m`|コミットメッセージも一緒に|`gcmm 'コミットメッセージ'`|
|`gcma`|`git commit -v`<br>`--amend --date="`date`"'`|前のコミットに今のステージを<br>更新日付は現在時刻に||


###  reset (rs)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`grs`|`git reset`|リセット||
|`grs`|`git reset -p`|hunkごとリセット||
|`grsh`|`git reset --hard`|？||
|`grss`|`git reset --soft`|？||


### status (s)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gs`|`git status -sb`|シンプルにステータス表示||


### diff (d)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gd`|`git diff`|diff確認|`gd [コレと] [コレ(主体)]`|
|`gds`|`git diff --stat`|stsatのみを表示||
|`gdc`|`git diff --cached`|インデックスとHEADの差分||


### log (l)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gl`|`git log --stat --decorate`|ログ一覧表示||
|`glp`|`git log -p -1 --stat --decorate`|`git show`+ stat|`glp [コミットハッシュ]`|
|`glg`|`git log --graph`<br>`--format="%C(yellow)%h%C(reset)`<br>`%C(auto)%d%C(reset)%an%C(reset)`<br>` %C(black bold)[%ad]%C(reset)%n %w(80)%s%n"`|グラフ表示||
|`glga`|`git log --graph --all`<br>`--format="%C(yellow)%h%C(reset)`<br>`%C(auto)%d%C(reset) %an%C(reset)`<br>` %C(black bold)[%ad]%C(reset)%n %w(80)%s%n"`|追跡ブランチも||
|`glgb`|`git log --graph --all`<br>`--format="%C(white)%d%C(reset)`<br>`%C(black bold)[%ad]%C(reset)"`|ブランチ名のみ||


### stash (st)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gst`|`git stash`|スタッシュ||
|`gstl`|`git stash list`|スタッシュ一覧||
|`gsta`|`git stash apply --index`|適用。インデックスはインデックスに||
|`gstd`|`git stash drop`|削除|
|`gtsp`|`git stash pop --index`|適用&削除|


### submodule (sb)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gsbl`|`git submodule status`|サブモジュールのリスト||
|`gsbu`|`git submodule update --init --recursive`|サブモジュールの更新||


### skip worktree (sw)
|alias|command|内容|memo|
|:-:|:-:|:-:|:-:|
|`gsw`|`git update-index --skip-worktre`|無視||
|`gnsw`|`git update-index --no-skip-worktre`|無視解除||
|`gswl`|`git ls-files -v｜grep "S "`|無視ファイル一覧||

