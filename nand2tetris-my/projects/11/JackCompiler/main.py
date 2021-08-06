import glob
from JackCompiler import JackCompiler


def get_files(file_or_dir):
    if file_or_dir.endswith('.jack'):
        return [file_or_dir], [file_or_dir.replace('.jack', '.vm')]
    else:
        infiles = glob.glob(file_or_dir + '/*.jack')
        outfiles = [x.replace('.jack', '.vm') for x in infiles]
        return infiles, outfiles


def main():
    in_file_dir = '../../12/SysTest'
    infiles, outfiles = get_files(in_file_dir)
    for infile, outfile in zip(infiles, outfiles):
        print(infile)
        print(outfile)
        jc = JackCompiler(infile)
        with open(outfile, 'w') as file:
            file.write('\n'.join(jc.vm.stack))


main()
