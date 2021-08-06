import sys, os, os.path, glob
from JackCompiler import JackCompiler

def get_files(file_or_dir):
    if file_or_dir.endswith('.jack'):
        return [file_or_dir], ['MyOutput/'+file_or_dir.replace('.jack', '.xml')]
    else:
        infiles = glob.glob(file_or_dir + '/*.jack')
        outfiles = ['MyOutput/'+x.replace('.jack', '.xml') for x in infiles]
        return infiles, outfiles

# def get_files(file_or_dir):
#     if file_or_dir.endswith('.jack'):
#         return [file_or_dir], [file_or_dir.replace('.jack', '.xml')]
#     else:
#         infiles = glob.glob(file_or_dir + '/*.jack')
#         outfiles = [x.replace('.jack', '.xml') for x in infiles]
#         return infiles, outfiles

def main():
    in_file_dir = 'Square'
    infiles, outfiles = get_files(in_file_dir)
    # if len(sys.argv) != 2:
    #     print( "Usage: JackAnalyzer [file.jack|dir]" )
    # else:
    #     infiles, outfiles = get_files( sys.argv[1] )
    for infile, outfile in zip(infiles, outfiles):
        jc = JackCompiler(infile)
        with open(outfile, 'w') as file:
            file.write(''.join(jc.res_xml))

main()
