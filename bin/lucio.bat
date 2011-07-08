@echo off
if "%1"=="" goto repl
:run
  echo running %1
  goto end

:repl
  if exist bin\repl.rb ruby bin\repl.rb
  if exist repl.rb ruby repl.rb
  goto end

:end
