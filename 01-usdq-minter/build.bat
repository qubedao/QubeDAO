@echo off
cls
toncli run_tests >toncli.log 2>toncli.err
show-log.py
more build\dump-suffix.fif >>build\contract.fif
more build\dump-suffix-w.fif >>build\wallet-contract.fif
echo ==========================================
toncli fift run build\contract.fif
toncli fift run build\wallet-contract.fif
dump-hex.py build\boc\wallet-contract.boc >build\boc\wallet-contract.hex
dump-hex.py build\boc\contract.boc >build\boc\contract.hex
