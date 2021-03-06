@echo off 

rem goto TEST_ONLY

echo cleaning up ...
del dist\*.*  /Q 
rmdir dist /s /q
del   robotFramework_DebugUiLibrary.egg-info\*.*   /Q 
rmdir robotFramework_DebugUiLibrary.egg-info /s /q
echo Should have removed the files 
rem pause 

rem windows distribution - nah ...
rem python setup.py bdist_wininst

rem pip distribution
rem python setup.py sdist

rem preferred python wheel distribution which is working in Pypi 
python setup.py bdist_wheel
goto EXIT

echo Packaged up
rem pause

:TEST_ONLY
pip uninstall robotFramework-DebugUiLibrary -y
echo Should have uninstalled 
rem pause 

rem goto EXIT
pip install dist\robotFramework-DebugUiLibrary-0.9.0.zip
echo Should have installed
rem pause 

python c:\robotFramework\test_check.py

rem pip list
rem pause Hopefully installed the new version ... 

:EXIT