from xml.sax.saxutils import escape
from JackConstant import *
from JackTokenizer import *


class JackCompiler(object):
    def __init__(self, file):
        self.tokenizer = JackTokenizer(file)
        self.res_xml = []
        self.compile_class()

    # ===============HELPERS===============

    def add(self, string):
        self.res_xml.append(string)

    def xml(tag):
        def inside_wrap(func):
            def wrapper(self):
                self.add(f'<{tag}>')
                func(self)
                self.add(f'</{tag}>')
            return wrapper
        return inside_wrap

    def _require(self, word=''):
        token_type, cur_val = self.tokenizer.advance()
        if word: assert cur_val == word
        self.writexml(token_type, cur_val)

    def writexml(self, token_type, token):
        self.add('<'+TYPE_TO_TAG[token_type]+'> ')
        if token_type == T_SYM:
            self.add(escape(token))
        elif token_type == T_ERROR:
            self.add('<<ERROR>>')
        else:
            self.add(token)
        self.add(' </'+TYPE_TO_TAG[token_type]+'>')

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
        return self.next_token_is_in({'+', '-', '*', '/', '&', '|', '<', '>', '='})

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
        self.compile_var_name()
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
        self._require()
        self.compile_dec()

    def compile_dec(self):
        self.compile_type()
        self.compile_var_name()
        while self.next_token_is(T_SYM, ','):
            self._require(',')
            self.compile_var_name()
        self._require(';')

    def compile_type(self):
        assert self.next_token_is_type()
        self._require()

    def compile_var_name(self):
        assert self.next_token_is(T_ID)
        self._require()

    # ===============SUBROUTINES===============

    @xml('subroutineDec')
    def compile_subroutine(self):
        assert self.next_token_is_subroutine()
        self._require()  # KW_CONSTRUCTOR, KW_METHOD, KW_FUNCTION
        if self.next_token_is(T_KEYWORD, KW_VOID):
            self._require(KW_VOID)
        else:
            self.compile_type()
        self.compile_var_name()
        self._require('(')
        self.compile_parameter_list()
        self._require(')')
        self.compile_subroutine_body()

    @xml('parameterList')
    def compile_parameter_list(self):
        if self.next_token_is_type():
            self.compile_type()
            self.compile_var_name()
            while self.next_token_is(T_SYM, ','):
                self._require(',')
                self.compile_type()
                self.compile_var_name()

    @xml('subroutineBody')
    def compile_subroutine_body(self):
        self._require('{')
        while self.next_token_is_var_dec():
            self.compile_var_dec()
        self.compile_statements()
        self._require('}')

    @xml('varDec')
    def compile_var_dec(self):
        assert self.next_token_is_var_dec()
        self._require('var')
        self.compile_dec()

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

    def compile_subroutine_call(self):
        # .fire(exp_list)
        while not self.next_token_is(T_SYM, '('):
            self._require('.')
            self.compile_var_name()
        self._require('(')
        self.compile_expression_list()
        self._require(')')

    @xml('expressionList')
    def compile_expression_list(self):
        # pos, size, x, y, true, null, -7, a+8, kek(), a[1]
        if self.next_token_is_exp():
            self.compile_expression()
            while self.next_token_is(T_SYM, ','):
                self._require(',')
                self.compile_expression()

    @xml('expression')
    def compile_expression(self):
        # one of: pos, size, true, null, -7, a+8+4, kek(), a[1]
        assert self.next_token_is_exp()
        self.compile_term()
        while self.next_token_is_op():
            self._require()
            self.compile_term()

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
        if (self.next_token_is(T_NUM) or
                self.next_token_is(T_STR) or
                self.next_token_is_in({KW_TRUE, KW_FALSE, KW_NULL, KW_THIS})):
            self._require()
        elif self.next_token_is_in({'-', '~'}):
            self._require()
            self.compile_term()
        elif self.next_token_is(T_SYM, '('):
            self._require('(')
            self.compile_expression()
            self._require(')')
        elif self.next_token_is(T_ID):
            self.compile_var_name()
            if self.next_token_is(T_SYM, '['):
                self.compile_array()
            elif self.next_token_is(T_SYM, '(') or self.next_token_is(T_SYM, '.'):
                self.compile_subroutine_call()

    def compile_array(self):
        self._require('[')
        self.compile_expression()
        self._require(']')

    # 5 statements:
    @xml('doStatement')
    def compile_do(self):
        self._require(KW_DO)
        self.compile_var_name()
        self.compile_subroutine_call()
        self._require(';')

    @xml('letStatement')
    def compile_let(self):
        self._require(KW_LET)
        self.compile_var_name()
        if self.next_token_is(T_SYM, '['):
            self.compile_array()
        self._require('=')
        self.compile_expression()
        self._require(';')

    @xml('ifStatement')
    def compile_if(self):
        self._require(KW_IF)
        self._require('(')
        self.compile_expression()
        self._require(')')
        self._require('{')
        self.compile_statements()
        self._require('}')
        if self.next_token_is(T_KEYWORD, KW_ELSE):
            self._require(KW_ELSE)
            self._require('{')
            self.compile_statements()
            self._require('}')

    @xml('whileStatement')
    def compile_while(self):
        self._require(KW_WHILE)
        self._require('(')
        self.compile_expression()
        self._require(')')
        self._require('{')
        self.compile_statements()
        self._require('}')

    @xml('returnStatement')
    def compile_return(self):
        self._require(KW_RETURN)
        if not self.next_token_is(T_SYM, ';'):
            self.compile_expression()
        self._require(';')


# JackCompiler('/Users/Alexander/Desktop/nand2tetris/projects/10/ExpressionLessSquare/Square.jack')
