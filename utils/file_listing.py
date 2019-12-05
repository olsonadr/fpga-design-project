'''
Filename: file_listing.py
Author: Nicholas Olson
Description: Script to convert files in do_files and sv_files directories into LaTeX markup
'''
import sys
from pathlib import Path
import posixpath

def list_files(functional_dir, extension, output_file):
    # Create output file
    output = open(f'{output_file}.txt', 'w')

    # Accurate Rel Path
    while functional_dir[-1:] == '/':
        functional_dir = functional_dir[:-1]
    rel_dir = ''.join(functional_dir.split('/')[-1:])

    # Create custom caption_text
    caption_text = ''
    style_text = ''
    if extension == 'do':
        caption_text = 'Do Script'
        style_text = ''
    elif extension == 'sv':
        caption_text = 'SystemVerilog'
        style_text = 'style=verilog-style'

    # List all files in directory using pathlib
    for functional_unit_dir in Path(functional_dir).iterdir():

        # Escaped name of functional unit
        fu_name = functional_unit_dir.name
        i = 0
        while i < len(fu_name):
            if fu_name[i] == '_':
                fu_name = fu_name[:i] + '\\' + fu_name[i:]
                i = i + 1
            i = i + 1

        output.write('\\subsection{' + fu_name + '}\n')

        for item in functional_unit_dir.iterdir():
            if item.name == functional_unit_dir.name+'.'+extension:
                with open(posixpath.join(functional_unit_dir, item.name), 'r') as f:
                    output.write('\\begin{figure}[h]\n\\lstinputlisting['+style_text+']{'+rel_dir+'/'+functional_unit_dir.name+'/'+item.name+'}\n\\subcaption{'+caption_text+' code for the '+fu_name+' block used in the design.}\n\\end{figure}\n\n\\clearpage\n\n')

        overall_first = True
        for item in functional_unit_dir.iterdir():
            if not item.name == functional_unit_dir.name+'.'+extension:
                if item.is_file() and item.name.endswith('.' + extension):
                    with open(posixpath.join(functional_unit_dir, item.name), 'r') as f:
                        output.write('\\begin{figure}[h]\n\\lstinputlisting['+style_text+']{'+rel_dir+'/'+functional_unit_dir.name+'/'+item.name+'}\n\\subcaption{'+caption_text+' code for the '+fu_name+' block used in the design.}\n\\end{figure}\n\n')
                elif not item.is_file():
                    first = True
                    overall_first = False
                    for individual_block in item.iterdir():
                        if individual_block.is_file() and individual_block.name.endswith('.' + extension):
                            if first:
                                first = False
                                output.write('\\subsubsection{Component Blocks of ' + fu_name + ' Unit}\n')
                            with open(posixpath.join(functional_unit_dir, item.name, individual_block.name), 'r') as f:
                                output.write('\\begin{figure}[h]\n\\lstinputlisting['+style_text+']{'+rel_dir+'/'+functional_unit_dir.name+'/'+item.name+'/'+individual_block.name+'}\n\\subcaption{'+caption_text+' code for the '+fu_name+' block used in the design.}\n\\end{figure}\n\n')

        if not first:
            output.write('\\clearpage\n\n')


if len(sys.argv) == 3:
    list_files(sys.argv[1], 'sv', sys.argv[2]+'_sv')
    list_files(sys.argv[1], 'do', sys.argv[2]+'_do')
else:
    print("Improper arguments! Try again...")
