# removing-sensitive-data-from-a-repository


:warning: 以下の様な対応で commit log を削除できます。commit log を削除することで GitHub 上で問題のある commit に辿り着くことは困難になりますが、commit hash が分かれば、以下の対応をしていたとしても閲覧することができます。完全に見られないようにするためには、下記ページから引用すると以下のようになります。

> 警告: コミットを GitHub にプッシュしたら、そこに含まれるデータが危険にさらされることを考慮する必要があります。パスワードをコミットした場合は、変更してください。 キーをコミットした場合は、新たに生成してください。

> この記事では、機密データを含むコミットに GitHub リポジトリのブランチやタグから到達できないようにする方法を説明しています。 ただし、こうしたコミットも、リポジトリのクローンやフォークからは、GitHub でキャッシュされているビューの SHA-1 ハッシュによって直接、また参照元のプルリクエストによって、到達できる可能性があることに注意することが重要です。 GitHub では、リポジトリに既存のクローンやフォークについては何もできませんが、キャッシュされているビューや、プルリクエストでの機密データへの参照は、GitHub Supportまたは GitHub Premium Support へ連絡することにより恒久的に削除することができます。

- https://help.github.com/en/articles/removing-sensitive-data-from-a-repository
- https://help.github.com/ja/articles/removing-sensitive-data-from-a-repository

## Example

以下の手順で試すことができます。Fork すれば自分の repository で試せます。

```
$ bash install-bfg.sh
```
```
$ bash add-sentitive-data.sh
Switched to a new branch 'add-sensitive-data'
[add-sensitive-data 22e22dd] Add sensitive file
 1 file changed, 1 insertion(+)
 create mode 100644 src/sensitive-file
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (4/4), 382 bytes | 382.00 KiB/s, done.
Total 4 (delta 0), reused 0 (delta 0)
remote:
remote: Create a pull request for 'add-sensitive-data' on GitHub by visiting:
remote:      https://github.com/tkuchiki/removing-sensitive-data-from-a-repository/pull/new/add-sensitive-data
remote:
To github.com:tkuchiki/removing-sensitive-data-from-a-repository
 * [new branch]      add-sensitive-data -> add-sensitive-data
```
```
$ delete-sensitive-data.sh

Using repo : /Users/tkuchiki/git/github/tkuchiki/removing-sensitive-data-from-a-repository/.git

Found 0 objects to protect
Found 6 commit-pointing refs : HEAD, refs/heads/add-sensitive-data, refs/heads/master, ...

Protected commits
-----------------

You're not protecting any commits, which means the BFG will modify the contents of even *current* commits.

This isn't recommended - ideally, if your current commits are dirty, you should fix up your working copy and commit that, check that your build still works, and only then run the BFG to clean up your hist
ory.

Cleaning
--------

Found 2 commits
Cleaning commits:       100% (2/2)
Cleaning commits completed in 105 ms.

Updating 2 Refs
---------------

        Ref                                      Before     After
        ------------------------------------------------------------
        refs/heads/add-sensitive-data          | 3e799b6e | 5e79b3df
        refs/remotes/origin/add-sensitive-data | 3e799b6e | 5e79b3df

Updating references:    100% (2/2)
...Ref update completed in 29 ms.

Commit Tree-Dirt History
------------------------

        Earliest      Latest
        |                  |
            .         D

        D = dirty commits (file tree fixed)
        m = modified commits (commit message or parents changed)
        . = clean commits (no changes to file tree)

                                Before     After
        -------------------------------------------
        First modified commit | 3e799b6e | 5e79b3df
        Last dirty commit     | 3e799b6e | 5e79b3df

Deleted files
-------------

        Filename         Git id
        --------------------------------
        sensitive-file | 83b04dba (23 B)


In total, 3 object ids were changed. Full details are logged here:

        /Users/tkuchiki/git/github/tkuchiki/removing-sensitive-data-from-a-repository.bfg-report/2019-09-20/20-36-36

BFG run is complete! When ready, run: git reflog expire --expire=now --all && git gc --prune=now --aggressive


--
You can rewrite history in Git - don't let Trump do it for real!
Trump's administration has lied consistently, to make people give up on ever
being told the truth. Don't give up: https://www.aclu.org/
--

[add-sensitive-data 5af35e6] Deleted sensitive file
Enumerating objects: 2, done.
Counting objects: 100% (2/2), done.
Delta compression using up to 12 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 289 bytes | 289.00 KiB/s, done.
Total 2 (delta 1), reused 0 (delta 0)
remote: Resolving deltas: 100% (1/1), done.
To github.com:tkuchiki/removing-sensitive-data-from-a-repository
 + 3e799b6...5af35e6 add-sensitive-data -> add-sensitive-data (forced update)
```
```
$ bash delete-branch.sh
To github.com:tkuchiki/removing-sensitive-data-from-a-repository
 - [deleted]         add-sensitive-data
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
Deleted branch add-sensitive-data (was 5af35e6).
```
