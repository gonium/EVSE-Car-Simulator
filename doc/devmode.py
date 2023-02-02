#!/usr/bin/env python
import sys

if __name__ == '__main__':
  try:
    from livereload import Server, shell
  except ImportError as error:
    print("Cannot import livereload: please run ")
    print("  pip install livereload")
    sys.exit(-1)

  print("Open http://localhost:5500/EVSE-Car-Simulator.html")
  server = Server()
  server.watch('*.md', shell('make'))
  server.serve(root='.')
