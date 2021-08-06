from JackConstant import *

class VMWriter:
    def __init__(self):
        self.stack = []

    def add(self, string):
        self.stack.append(string)

    # ---------Push pop

    def write_push(self, segment, index):
        assert segment in {'constant', 'static', 'pointer', 'temp', 'local', 'argument', 'this', 'that'}
        index = int(index)
        self.add(f'push {segment} {index}')

    def write_pop(self, segment, index):
        assert segment in {'constant', 'static', 'pointer', 'temp', 'local', 'argument', 'this', 'that'}
        index = int(index)
        self.add(f'pop {segment} {index}')

    # ---------Arithmetic

    def write_arithmetic(self, op):
        assert op in OP_SYMBOLS_TO_VM.values() or op in {'neg', 'not'}
        self.add(f'{op}')

    # ---------Branching

    def write_label(self, label: str):
        self.add(f'label {label}')

    def write_goto(self, label: str):
        self.add(f'goto {label}')

    def write_if(self, label: str):
        self.add(f'if-goto {label}')

    # ---------Functions

    def write_call(self, name: str, nArgs: int):
        assert isinstance(nArgs, int)
        self.add(f'call {name} {nArgs}')

    def write_function(self, name: str, nArgs: int):
        assert isinstance(nArgs, int)
        self.add(f'function {name} {nArgs}')

    def write_return(self):
        self.add(f'return')