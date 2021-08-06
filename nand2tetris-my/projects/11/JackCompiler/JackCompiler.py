from xml.sax.saxutils import escape
from JackConstant import *
from JackTokenizer import JackTokenizer
from VMWriter import VMWriter
from SymbolTable import SymbolTable


class JackCompiler(object):
    def __init__(self, file):
        self.tokenizer = JackTokenizer(file)
        self.vm = VMWriter()
        self.symbol_table = SymbolTable()
        self.res_xml = []
        self._class_name = None
        self._subroutine_name = None
        self._subroutine_kind = None
        self.compile_class()

    # ===============HELPERS===============
    @property
    def display_res_xml(self):
        return '\n'.join(self.res_xml)

    def add(self, string):
        self.res_xml.append(string)

    def xml(tag):
        def inside_wrap(func):
            def wrapper(self):
                self.add(f'<{tag}>')
                val = func(self)
                self.add(f'</{tag}>')
                return val
            return wrapper

        return inside_wrap

    def _require(self, word=''):
        token_type, cur_val = self.tokenizer.advance()
        if word:
            assert cur_val == word, f'{cur_val} != {word}'
        self.writexml(token_type, cur_val)
        return cur_val

    def writexml(self, token_type, token):
        self.add('<' + TYPE_TO_TAG[token_type] + '> ')
        if token_type == T_SYM:
            self.add(escape(token))
        elif token_type == T_ERROR:
            self.add('<<ERROR>>')
        else:
            self.add(token)
        self.add(' </' + TYPE_TO_TAG[token_type] + '>')

    # ===============NEXT TOKEN===============

    def next_token_is(self, type, value=None):
        next_token_type, next_token_value = self.tokenizer.peek()
        if value == None:
            return next_token_type == type
        else:
            return (next_token_type, next_token_value) == (type, value)

    def next_token_is_in(self, set_of_values):
        next_token_type, next_token_value = self.tokenizer.peek()
        return next_token_value in set_of_values

    def next_token_is_class_var_dec(self):
        return self.next_token_is_in({KW_STATIC, KW_FIELD})

    def next_token_is_type(self):
        return self.next_token_is(T_ID) or \
               self.next_token_is_in({KW_INT, KW_CHAR, KW_BOOLEAN})

    def next_token_is_var_dec(self):
        return self.next_token_is(T_KEYWORD, KW_VAR)

    def next_token_is_subroutine(self):
        return self.next_token_is_in({KW_CONSTRUCTOR, KW_METHOD, KW_FUNCTION})

    def next_token_is_statement(self):
        return self.next_token_is_in({KW_DO, KW_LET, KW_IF, KW_WHILE, KW_RETURN})

    def next_token_is_exp(self):
        return self.next_token_is_term()

    def next_token_is_op(self):
        return self.next_token_is_in(OP_SYMBOLS)

    def next_token_is_term(self):
        return self.next_token_is(T_NUM) or \
               self.next_token_is(T_STR) or \
               self.next_token_is_in({KW_TRUE, KW_FALSE, KW_NULL, KW_THIS}) or \
               self.next_token_is(T_ID) or \
               self.next_token_is_in({'-', '~', '('})

    # ===============CLASS===============

    @xml('class')
    def compile_class(self):
        self._require(KW_CLASS)
        self._class_name = self.compile_var_name()
        self._require('{')
        while self.next_token_is_class_var_dec():
            self.compile_class_var_dec()
        while self.next_token_is_subroutine():
            self.compile_subroutine()
        self._require('}')

    # ===============VARIABLES===============

    @xml('classVarDec')
    def compile_class_var_dec(self):
        assert self.next_token_is_in({KW_STATIC, KW_FIELD})
        static_or_field = self._require()
        self.compile_dec(static_or_field)

    def compile_dec(self, kind):
        type = self.compile_type()
        var_name = self.compile_var_name()
        self.symbol_table.define(var_name, type, kind)
        while self.next_token_is(T_SYM, ','):
            self._require(',')
            var_name = self.compile_var_name()
            self.symbol_table.define(var_name, type, kind)
        self._require(';')

    def compile_type(self):
        assert self.next_token_is_type()
        return self._require()

    def compile_var_name(self):
        assert self.next_token_is(T_ID)
        return self._require()

    # ===============SUBROUTINES===============

    @xml('subroutineDec')
    def compile_subroutine(self):
        assert self.next_token_is_subroutine()
        self._subroutine_kind = self._require()  # KW_CONSTRUCTOR, KW_METHOD, KW_FUNCTION

        if self.next_token_is(T_KEYWORD, KW_VOID):
            type = self._require(KW_VOID)
        else:
            type = self.compile_type()
        self._subroutine_name = self.compile_var_name()
        self.symbol_table.start_subroutine()
        if self._subroutine_kind == KW_METHOD:  # put self as first argument
            self.symbol_table.define('this', self._class_name, 'arg')
        self._require('(')
        self.compile_parameter_list()
        self._require(')')
        self.compile_subroutine_body()

    def write_function_dec(self):
        name = f'{self._class_name}.{self._subroutine_name}'
        n_locals = self.symbol_table.counter['var']
        self.vm.write_function(name, n_locals)
        self.load_this_ptr()

    def load_this_ptr(self):
        if self._subroutine_kind == KW_METHOD:
            self.vm.write_push('argument', 0)  # first arg is self
            self.vm.write_pop('pointer', 0)  # THIS -> self, don't do if func
        elif self._subroutine_kind == KW_CONSTRUCTOR:
            size_of_obj = self.symbol_table.counter['field']
            self.vm.write_push('constant', size_of_obj)
            self.vm.write_call('Memory.alloc', 1)  # takes size_of_obj as an arg
            # top of stack points to where obj will be
            self.vm.write_pop('pointer', 0)  # THIS -> self

    @xml('parameterList')
    def compile_parameter_list(self):
        if self.next_token_is_type():
            self.compile_parameter()
            while self.next_token_is(T_SYM, ','):
                self._require(',')
                self.compile_parameter()

    def compile_parameter(self):
        type = self.compile_type()
        name = self.compile_var_name()
        self.symbol_table.define(name, type, 'arg')

    @xml('subroutineBody')
    def compile_subroutine_body(self):
        self._require('{')
        while self.next_token_is_var_dec():
            self.compile_var_dec()

        self.write_function_dec()

        self.compile_statements()
        self._require('}')

    @xml('varDec')
    def compile_var_dec(self):
        assert self.next_token_is_var_dec()
        self._require('var')
        self.compile_dec('var')

    # ===============STATEMENTS===============

    @xml('statements')
    def compile_statements(self):
        while self.next_token_is_statement():
            self.compile_statement()

    def compile_statement(self):
        assert self.next_token_is_statement()
        if self.next_token_is(T_KEYWORD, KW_DO):
            self.compile_do()
        elif self.next_token_is(T_KEYWORD, KW_LET):
            self.compile_let()
        elif self.next_token_is(T_KEYWORD, KW_IF):
            self.compile_if()
        elif self.next_token_is(T_KEYWORD, KW_WHILE):
            self.compile_while()
        elif self.next_token_is(T_KEYWORD, KW_RETURN):
            self.compile_return()

    def compile_subroutine_call(self, func_or_var_name):
        """
            # do b.fire() -> Bullet.fire() bullet method
            # do fire() -> fire() our method/function
            # do Point.fire() -> Point.fire() function
        """
        if self.next_token_is(T_SYM, '.'):  # b.fire() or Point.fire()
            num_args, call_name = self.compile_dotted_subroutine_call(func_or_var_name)
        else:
            self.vm.write_push('pointer', 0)  # push self to stack, will be first arg
            num_args = 1
            call_name = self._class_name + '.' + func_or_var_name
        self._require('(')
        num_args += self.compile_expression_list()
        self._require(')')
        self.vm.write_call(call_name, num_args)  # call Bullet.fire 2

    def compile_dotted_subroutine_call(self, first_var_name):
        symbol = self.symbol_table.lookup(first_var_name)
        num_args = 0
        self._require('.')
        second_var_name = self.compile_var_name()
        if symbol == None:  # Point.print() -> Point.print
            call_name = first_var_name + '.' + second_var_name
        elif symbol.type in {KW_INT, KW_CHAR, KW_BOOLEAN, KW_VOID}:  # int.func(123) not allowed
            raise
        else:  # b.fire(x, y) -> Bullet.fire
            num_args = 1  # rest of args will be compiled later
            self.vm_push_var(first_var_name)  # push object ptr onto stack
            call_name = symbol.type + '.' + second_var_name
        return num_args, call_name

    def vm_push_var(self, var_name):
        symbol = self.symbol_table.lookup(var_name)
        try:
            self.vm.write_push(symbol.segment(), symbol.index)
        except:
            raise Exception(f'symbol "{var_name}" not found')

    def vm_pop_var(self, var_name):
        symbol = self.symbol_table.lookup(var_name)
        try:
            self.vm.write_pop(symbol.segment(), symbol.index)
        except:
            raise Exception(f'symbol "{var_name}" not found')

    @xml('expressionList')
    def compile_expression_list(self):
        # pos, size, x, y, true, null, -7, a+8, kek(), a[1]
        num_args = 0
        if self.next_token_is_exp():
            self.compile_expression()
            num_args += 1
            while self.next_token_is(T_SYM, ','):
                self._require(',')
                self.compile_expression()
                num_args += 1
        return num_args

    @xml('expression')
    def compile_expression(self):
        # one of: pos, size, true, null, -7, a+8+4, kek(), a[1]
        assert self.next_token_is_exp()
        self.compile_term()
        while self.next_token_is_op():
            op = self._require()
            self.compile_term()
            self.vm.write_arithmetic(OP_SYMBOLS_TO_VM[op])

    @xml('term')
    def compile_term(self):
        """
            + integerConstant: (123)
            + stringConstant: ('dcsdcsc')
            + keywordConstant: (true) (false) (null) (this)
            + unaryOp: -term, ~term
            + '(' expression ')': ((True))
            + varName: isVarname
            + varName '[' expression ']'
            + subroutineCall: isTrue() varName(x,4) or varName.varName(x,4)
        """
        assert self.next_token_is_term()
        if (
                self.next_token_is(T_NUM) or
                self.next_token_is(T_STR) or
                self.next_token_is_in({KW_TRUE, KW_FALSE, KW_NULL, KW_THIS})
        ):
            type, name = self.tokenizer.peek()
            self._require()
            if type == T_NUM:
                self.vm.write_push('constant', name)
            elif type == T_STR:
                self.vm.write_push('constant', len(name))
                self.vm.write_call('String.new', 1)
                for letter in name:
                    self.vm.write_push('constant', ord(letter))
                    self.vm.write_call('String.appendChar', 2)
            else:
                if name == KW_TRUE:
                    self.vm.write_push('constant', 1)
                    self.vm.write_arithmetic('neg') # 111111
                elif name == KW_FALSE or name == KW_NULL:
                    self.vm.write_push('constant', 0)
                elif name == KW_THIS:
                    self.vm.write_push('pointer', 0)
                else:
                    raise

        elif self.next_token_is_in({'-', '~'}):
            name = self._require()
            self.compile_term()
            if name == '-':
                self.vm.write_arithmetic('neg')
            else:
                self.vm.write_arithmetic('not')

        elif self.next_token_is(T_SYM, '('):
            self._require('(')
            self.compile_expression()
            self._require(')')

        elif self.next_token_is(T_ID):
            name = self.compile_var_name()
            if self.next_token_is(T_SYM, '['):
                self.compile_array(name)
            elif self.next_token_is_in({'(', '.'}):
                self.compile_subroutine_call(name)
            else:
                self.vm_push_var(name)

    def compile_array(self, name):
        self.vm_push_var(name)  # push ST(a) - base index of array
        self._require('[')
        self.compile_expression()
        self._require(']')
        self.vm.write_arithmetic('add')  # base+index
        self.vm.write_pop('pointer', 1)  # pop into 'that' ptr
        self.vm.write_push('that', 0)    # push *(base+index) onto stack

    # 5 statements:
    @xml('doStatement')
    def compile_do(self):
        self._require(KW_DO)
        func_or_var_name = self.compile_var_name()
        self.compile_subroutine_call(func_or_var_name)
        self.vm.write_pop('temp', TEMP_RETURN)  # Pop return value and discard
        self._require(';')

    @xml('letStatement')
    def compile_let(self):
        self._require(KW_LET)
        name = self.compile_var_name()
        is_array = self.next_token_is(T_SYM, '[')
        if is_array:
            self.vm_push_var(name)  # push array ptr onto stack
            self._require('[')
            self.compile_expression()  # push index onto stack
            self._require(']')
            self.vm.write_arithmetic('add')  # base+index
        self._require('=')
        self.compile_expression()
        self._require(';')
        if is_array:
            self.vm.write_pop('temp', TEMP_ARRAY)  # Pop expr value to temp register
            self.vm.write_pop('pointer', 1)  # Pop base+index into 'that' register
            self.vm.write_push('temp', TEMP_ARRAY)  # Push expr back onto stack
            self.vm.write_pop('that', 0)  # Pop value into *(base+index)
        else:
            self.vm_pop_var(name)

    @xml('ifStatement')
    def compile_if(self):
        self._require(KW_IF)
        end_label = self.new_label()
        self._compile_cond_expression_statements(end_label)
        if self.next_token_is(T_KEYWORD, KW_ELSE):
            self._require(KW_ELSE)
            self._require('{')
            self.compile_statements()
            self._require('}')
        self.vm.write_label(end_label)  # label end_label

    @xml('whileStatement')
    def compile_while(self):
        self._require(KW_WHILE)
        top_label = self.new_label()
        self.vm.write_label(top_label)
        self._compile_cond_expression_statements(top_label)

    label_num = 0
    def new_label(self):
        self.label_num += 1
        return 'label' + str(self.label_num)

    def _compile_cond_expression_statements(self, label):
        self._require('(')
        self.compile_expression()
        self._require(')')
        self.vm.write_arithmetic('not')  # ~(cond)
        notif_label = self.new_label()
        self.vm.write_if(notif_label)  # if-goto notif_label
        self._require('{')
        self.compile_statements()
        self._require('}')
        self.vm.write_goto(label)  # goto label
        self.vm.write_label(notif_label)  # label notif_label

    @xml('returnStatement')
    def compile_return(self):
        self._require(KW_RETURN)
        if not self.next_token_is(T_SYM, ';'):
            self.compile_expression()
        else:
            self.vm.write_push('constant', 0)  # push 0 if not returning a value
        self._require(';')
        self.vm.write_return()

# JackCompiler('/Users/Alexander/Desktop/nand2tetris/projects/10/ExpressionLessSquare/Square.jack')
