'''
Filename: file_listing.py
Author: Nicholas Olson
Description: Script to convert files in do_files and sv_files directories into LaTeX markup
'''
import sys
from pathlib import Path
import posixpath
import json

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
    section_type = ''
    if extension == 'do':
        caption_text = 'Do Script'
        style_text = ''
        section_type = 'listings'
    elif extension == 'sv':
        caption_text = 'SystemVerilog'
        style_text = 'style=verilog-style'
        section_type = 'listings'
    elif extension == 'png' or extension == 'jpg':
        section_type = 'figures'

    if section_type == 'listings':
        # List all files in directory using pathlib
        for functional_unit_dir in Path(functional_dir).iterdir():

            # Escaped name of functional unit
            fu_name_escaped = functional_unit_dir.name
            i = 0
            while i < len(fu_name_escaped):
                if fu_name_escaped[i] == '_':
                    fu_name_escaped = fu_name_escaped[:i] + '\\' + fu_name_escaped[i:]
                    i = i + 1
                i = i + 1

            output.write('\\subsection{' + fu_name_escaped + '}\n')

            for item in functional_unit_dir.iterdir():
                if item.name == functional_unit_dir.name+'.'+extension:
                    with open(posixpath.join(functional_unit_dir, item.name), 'r') as f:
                        output.write('\\begin{figure}[h]\n\\lstinputlisting['+style_text+']{'+rel_dir+'/'+functional_unit_dir.name+'/'+item.name+'}\n\\subcaption{'+caption_text+' code for the '+fu_name_escaped+' block used in the design.}\n\\end{figure}\n\n\\clearpage\n\n')
            overall_first = True
            for item in functional_unit_dir.iterdir():
                if not item.name == functional_unit_dir.name+'.'+extension:
                    if item.is_file() and item.name.endswith('.' + extension):
                        with open(posixpath.join(functional_unit_dir, item.name), 'r') as f:
                            output.write('\\begin{figure}[h]\n\\lstinputlisting['+style_text+']{'+rel_dir+'/'+functional_unit_dir.name+'/'+item.name+'}\n\\subcaption{'+caption_text+' code for the '+fu_name_escaped+' block used in the design.}\n\\end{figure}\n\n')
                    elif not item.is_file():
                        first = True
                        overall_first = False
                        for individual_block in item.iterdir():
                            if individual_block.is_file() and individual_block.name.endswith('.' + extension):
                                if first:
                                    first = False
                                    output.write('\\subsubsection{Component Blocks of ' + fu_name_escaped + ' Unit}\n')
                                with open(posixpath.join(functional_unit_dir, item.name, individual_block.name), 'r') as f:
                                    output.write('\\begin{figure}[h]\n\\lstinputlisting['+style_text+']{'+rel_dir+'/'+functional_unit_dir.name+'/'+item.name+'/'+individual_block.name+'}\n\\subcaption{'+caption_text+' code for the '+fu_name_escaped+' block used in the design.}\n\\end{figure}\n\n')
            if not overall_first:
                output.write('\\clearpage\n\n')


    elif section_type == 'figures':
        fig_num = 1

        # List all files in directory using pathlib
        for functional_unit_dir in Path(functional_dir).iterdir():

            # Name of functional unit
            fu_name = functional_unit_dir.name

            # Escaped name of functional unit
            fu_name_escaped = functional_unit_dir.name
            i = 0
            while i < len(fu_name_escaped):
                if fu_name_escaped[i] == '_':
                    fu_name_escaped = fu_name_escaped[:i] + '\\' + fu_name_escaped[i:]
                    i = i + 1
                i = i + 1

            # Load and parse json
            with open(posixpath.join(functional_unit_dir, (fu_name + '.json'))) as f:
                json_data = json.load(f)

            intro_text  = json_data['intro_text']
            input_text  = json_data['input_text']
            output_text = json_data['output_text']

            # Strings to write
            intro_to_write = ''
            body_to_write = ''

            # Subsection and intro text
            intro_to_write += '\\catcode`\_=13\n\\def_{\textunderscore}\n\\subsection{' + fu_name_escaped + ' Functional Unit}\n\\catcode`_=8\n' + intro_text

            # if block image exists
            for item in functional_unit_dir.iterdir():
                if item.is_file() and item.name == fu_name + '_block.' + extension:
                    intro_to_write += ' A block diagram follows in \\textbf{Figure ' + str(fig_num) + '}. '
                    body_to_write += '\\begin{figure}[h]\n\\centering\n\\includegraphics[width=.8\\textwidth]{' + posixpath.join(rel_dir, fu_name, (fu_name + '_block.' + extension)) + '}\n\\caption{The logic design of the ' + fu_name_escaped + ' functional unit used in the final design.}\n\\end{figure}\n'
                    fig_num + 1
            # if symbol image exists
            for item in functional_unit_dir.iterdir():
                if item.is_file() and item.name == fu_name + '_symbol.' + extension:
                    intro_to_write += ' The logic symbol follows in \\textbf{Figure ' + str(fig_num) + '}. '
                    body_to_write += '\\begin{figure}[h]\n\\centering\n\\includegraphics[width=.48\\textwidth]{' + posixpath.join(rel_dir, fu_name, (fu_name + '_symbol.' + extension)) + '}\n\\caption{The block symbol of the ' + fu_name_escaped + ' functional unit used in the final design.}\n\\end{figure}\n'
                    fig_num + 1
            # if sim exists
            for item in functional_unit_dir.iterdir():
                if item.is_file() and item.name == fu_name + '_sim.' + extension:
                    intro_to_write += ' The simulation results follow in \\textbf{Figure ' + str(fig_num) + '}. '
                    body_to_write += '\\begin{figure}[h]\n\\centering\n\\includegraphics[width=.98\\textwidth]{' + posixpath.join(rel_dir, fu_name, (fu_name + '_sim.' + extension)) + '}\n\\caption{The simulation results for the ' + fu_name_escaped + ' module.}\n\\end{figure}\n'
                    fig_num + 1
            # write functional unit stuff
            output.write(intro_to_write + '\n\\begin{itemize}\n\\item \\textbf{Inputs:  } ' + input_text + '\n\\item \\textbf{Outputs: } ' + output_text + '\n\\end{itemize}\n' + body_to_write + '\\clearpage\n\n')


            # begin individual block stuff
            block_list = json_data['individual_blocks']
            for ind_block_json in block_list:

                # Name of individual block
                ind_name = ind_block_json['name']

                # Escaped name of functional unit
                ind_name_escaped = ind_block_json['name']
                i = 0
                while i < len(ind_name_escaped):
                    if ind_name_escaped[i] == '_':
                        ind_name_escaped = ind_name_escaped[:i] + '\\' + ind_name_escaped[i:]
                        i = i + 1
                    i = i + 1

                # Parse Json
                intro_text  = ind_block_json['intro_text']
                input_text  = ind_block_json['input_text']
                output_text = ind_block_json['output_text']

                # Strings to write
                intro_to_write = ''
                body_to_write = ''

                # Subsubsection and intro text
                intro_to_write += '\\catcode`\_=13\n\\def_{\textunderscore}\n\\subsubsection{' + ind_name_escaped + ' Component Block}\n\\catcode`_=8\n' + intro_text

                # if block image exists
                for item in Path(posixpath.join(functional_unit_dir, 'individual_blocks')).iterdir():
                    if item.is_file() and item.name == ind_name + '_block.' + extension:
                        intro_to_write += ' A block diagram follows in \\textbf{Figure ' + str(fig_num) + '}. '
                        body_to_write += '\\begin{figure}[h]\n\\centering\n\\includegraphics[width=.8\\textwidth]{' + posixpath.join(rel_dir, fu_name, 'individual_blocks', (ind_name + '_block.' + extension)) + '}\n\\caption{The logic design of the ' + ind_name_escaped + ' module used in the ' + fu_name_escaped + ' functional unit.}\n\\end{figure}\n'
                        fig_num + 1
                # if symbol image exists
                for item in Path(posixpath.join(functional_unit_dir, 'individual_blocks')).iterdir():
                    if item.is_file() and item.name == ind_name + '_symbol.' + extension:
                        intro_to_write += ' The logic symbol follows in \\textbf{Figure ' + str(fig_num) + '}. '
                        body_to_write += '\\begin{figure}[h]\n\\centering\n\\includegraphics[width=.48\\textwidth]{' + posixpath.join(rel_dir, fu_name, 'individual_blocks', (ind_name + '_symbol.' + extension)) + '}\n\\caption{The block symbol of the ' + ind_name_escaped + ' module used in the ' + fu_name_escaped + ' functional unit.}\n\\end{figure}\n'
                        fig_num + 1
                # if sim exists
                for item in Path(posixpath.join(functional_unit_dir, 'individual_blocks')).iterdir():
                    if item.is_file() and item.name == ind_name + '_sim.' + extension:
                        intro_to_write += ' The simulation results follow in \\textbf{Figure ' + str(fig_num) + '}. '
                        body_to_write += '\\begin{figure}[h]\n\\centering\n\\includegraphics[width=.98\\textwidth]{' + posixpath.join(rel_dir, fu_name, 'individual_blocks', (ind_name + '_sim.' + extension)) + '}\n\\caption{The simulation results for the ' + ind_name_escaped + ' module used in the ' + fu_name_escaped + ' functional unit.}\n\\end{figure}\n'
                        fig_num + 1
                # write functional unit stuff
                output.write(intro_to_write + '\n\\begin{itemize}\n\\item \\textbf{Inputs:  } ' + input_text + '\n\\item \\textbf{Outputs: } ' + output_text + '\n\\end{itemize}\n' + body_to_write + '\\clearpage\n\n')


if len(sys.argv) == 3:
    list_files(sys.argv[1], 'sv',  sys.argv[2]+'_sv')
    list_files(sys.argv[1], 'do',  sys.argv[2]+'_do')
    list_files(sys.argv[1], 'png', sys.argv[2]+'_main')
else:
    print("Improper arguments (list path to functional_unit dir and base name of output files)! Try again...")
