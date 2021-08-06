from JackConstant import *
import re


class JackTokenizer:
    def __init__(self, file) -> None:
        with open(file, 'r') as infile:
            self._lines = infile.read()
        self._tokens = self._tokenize(self._lines)
        self._token_type = T_ERROR  # Current token type
        self._cur_val = 0  # Current token value


    def _tokenize(self, lines):
        wo_comments = self._remove_comments(lines)
        split = self._split(wo_comments)
        return [self._token(word) for word in split]


    def _remove_comments(self, line):
        _comment_re = re.compile(r'//[^\n]*\n|/\*(.*?)\*/', re.MULTILINE | re.DOTALL)
        return _comment_re.sub('', line)

    def _split(self, line):
        _keyword_re = '|'.join(list(KEYWORDS))
        _sym_re = '[' + re.escape(str(''.join(SYMBOLS))) + ']'
        _num_re = r'\d+'
        _str_re = r'"[^"\n]*"'
        _id_re = r'[\w\-]+'
        _word = re.compile(_keyword_re + '|' + _sym_re + '|' + _num_re + '|' + _str_re + '|' + _id_re)
        return _word.findall(line)


    def _token(self, word):
        if self._is_keyword(word):
            return (T_KEYWORD, word)
        elif self._is_sym(word):
            return (T_SYM, word)
        elif self._is_num(word):
            return (T_NUM, word)
        elif self._is_str(word):
            return (T_STR, word[1:-1])
        elif self._is_id(word):
            return (T_ID, word)
        else:
            return (T_ERROR, word)

    def _is_keyword(self, word):
        return word in KEYWORDS

    def _is_sym(self, word):
        return word in SYMBOLS

    def _is_num(self, word):
        return word.isdigit()

    def _is_str(self, word):
        return word[0] == '"' and word[-1] == '"'

    def _is_id(self, word):
        return re.match(r'[\w\-]+', word) != None

    def peek(self):
        if self.has_more_tokens():
            return self._tokens[0]
        else:
            return (T_ERROR, 0)

    def has_more_tokens(self):
        return self._tokens != []

    def advance(self):
        if self.has_more_tokens():
            self._token_type, self._cur_val = self._tokens.pop(0)
        else:
            self._token_type, self._cur_val = (T_ERROR, 0)
        return (self._token_type, self._cur_val)

    def token_type(self):
        return self._token_type


# JackTokenizer('/Users/Alexander/Desktop/nand2tetris/projects/10/ExpressionLessSquare/Square.jack')