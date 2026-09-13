:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
venv\Scripts\python -m jinja gaspy\jinja\npc-clothes world\contentdb\templates\npc-clothes --for-each gaspy\jinja\npc-clothes\items.csv --bits "%bits%"
if %errorlevel% neq 0 pause

venv\Scripts\python -m jinja gaspy\jinja\npc-clothes-mart world\contentdb\templates\npc-clothes-mart --for-all gaspy\jinja\npc-clothes\items.csv --bits "%bits%"
if %errorlevel% neq 0 pause
popd
