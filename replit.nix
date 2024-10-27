{ pkgs, legacyPolygott }: {
    deps = [
        pkgs.sqlite
    ] ++ legacyPolygott;
}