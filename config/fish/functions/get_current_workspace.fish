# 現在の作業ディレクトリがWORKSPACE環境変数で指定されたパスの下にある場合、
# そのパスの直下のディレクトリ名（数字）を取得する関数
function get_current_workspace
    if not set -q WORKSPACE
        return 1
    end

    set -l match (string match -r "^$WORKSPACE/([0-9]+)" $PWD)
    if test (count $match) -gt 0
        echo $match[2]
        return 0
    end

    return 1
end
