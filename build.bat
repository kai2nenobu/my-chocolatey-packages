
for %%p in (a5m2 cpdf-cr) do (
    echo Build a package for %%p

    REM Build package
    cd %SourcesPath%\%%p
    choco pack

    REM Verify package
    call test.bat
)
