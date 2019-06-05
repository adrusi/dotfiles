define-command -hidden adrusi-go-tools-menu %{
    menu "Show documentation" %{
        go-doc-info
    } "Show signature" %{
        go-print-signature
    } "Jump to definition" %{
        go-jump
    }
}

hook global WinSetOption filetype=go %{
    go-enable-autocomplete

    hook -group adrusi-go window BufWritePre .* %{
        go-format -use-goimports
    }

    map window user g %{: adrusi-go-tools-menu<ret>}

    hook -once -always window WinSetOption filetype=.* %{
        go-disable-autocomplete

        remove-hooks window adrusi-go

        unmap window user g %{: adrusi-go-tools-menu<ret>}
    }
}

