:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
venv\Scripts\python -m jinja gaspy\jinja world\contentdb\templates\npc-clothes --for-each gaspy\jinja\items.csv --bits "%bits%"
if %errorlevel% neq 0 pause
popd
