from dataclasses import dataclass
from JackConstant import *

@dataclass()
class Symbol:
    var_name: str
    type: str
    kind: str
    index: int

    def segment(self):
        return SEGMENTS[self.kind]


class SymbolTable:
    def __init__(self):
        self.class_symbols = {}
        self.subroutine_symbols = {}
        self.counter = {'static': 0, 'field': 0, 'arg': 0, 'var': 0}

    def define(self, var_name, type, kind):
        index = self.counter[kind]
        self.counter[kind] += 1
        symbol = Symbol(var_name=var_name, type=type, kind=kind, index=index)
        if kind in {'static', 'field'}:
            self.class_symbols[var_name] = symbol
        else:
            self.subroutine_symbols[var_name] = symbol

    def start_subroutine(self):
        self.subroutine_symbols = {}
        self.counter['arg'] = 0
        self.counter['var'] = 0

    def lookup(self, name):
        if name in self.subroutine_symbols:
            return self.subroutine_symbols[name]
        elif name in self.class_symbols:
            return self.class_symbols[name]
        else:
            return None