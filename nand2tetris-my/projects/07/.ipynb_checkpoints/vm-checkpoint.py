class CodeWriter:  
    def __init__(self, file_name):
        self.file_name = file_name
        self.seg_to_label = {
            'argument': 'ARG',
            'local': 'LCL',
            'this': 'THIS',
            'that': 'THAT'
        }
        self.pointer_to_label = {
            '0': 'THIS',
            '1': 'THAT'
        }
        
    def write_arithmetic(self, command):
        if command == 'add':  
            string = self._binary('M+D')
        elif command == 'sub':  
            string = self._binary('M-D')
#         elif command == 'neg':  self._unary('-D')
#         elif command == 'eq':   self._compare('JEQ')
#         elif command == 'gt':   self._compare('JGT')
#         elif command == 'lt':   self._compare('JLT')
#         elif command == 'and':  self._binary('D&A')
#         elif command == 'or':   self._binary('D|A')
#         elif command == 'not':  self._unary('!D')
        return string

        
    def write_push_pop(self, command, seg, index):
        if command == 'push':   
            string = self._push(seg, index)
        elif command == 'pop':  
            string = self._pop(seg, index)
        else:
            raise
        return string
            
    def _binary(self, op='D+M'):
        string = f"""
            @SP
            M=M-1
            A=M
            D=M // M=y
            @SP
            M=M-1
            A=M // M=x
            D={op}
            M=D // stack now points to sum
            @SP
            M=M+1
        """
        return string
            
    def _push(self, seg, index):
        if seg == 'constant':
            string = f""" 
                // *SP=i
                @{index}
                D=A
            """
        elif seg in self.seg_to_label:
            label = self.seg_to_label[seg]
            string = f"""
                // addr=ARG+i
                @{index}
                D=A
                @{label}
                D=D+M

                // *SP=*addr
                A=D
                D=M
            """
        elif seg == 'static':
            string = f"""
                @{self.file_name}.{index}
                D=M
            """
        elif seg == 'pointer':
            label = self.pointer_to_label[index]
            string = f"""
                @{label}
                D=M
            """
        elif seg == 'temp':
            string = f"""
                @{index}
                D=A
                @5
                A=D+A
                D=M
            """
        else:
            raise
        inc = """
            @SP
            A=M
            M=D
            
            @SP
            M=M+1 // SP++
        """
        string += inc
        return string
            
        
    def _pop(self, seg, index):
        dec = """
            // SP--
            @SP
            M=M-1
        """
        if seg == 'constant':
            raise
        elif seg in self.seg_to_label:
            label = self.seg_to_label[seg]
            string = f"""
                // addr=ARG+i
                @{index}
                D=A
                @{label}
                D=D+M
                @R13
                M=D // RAM[13] = addr

                // *addr=*SP
                @SP
                A=M
                D=M // D = *SP
                @R13
                A=M // A = addr
                M=D // *addr = *SP
            """
        elif seg == 'static':
            string = f"""
                @SP
                A=M
                D=M
                @{self.file_name}.{index}
                M=D
            """
        elif seg == 'pointer':
            label = self.pointer_to_label[index]
            string = f"""
                @SP
                A=M
                D=M
                @{label}
                M=D
            """
        elif seg == 'temp':
            string = f"""
                @{index}
                D=A
                @5
                D=D+A
                @R13
                M=D
                @SP
                A=M
                D=M
                @R13
                A=M
                M=D
            """
        else:
            raise
        string = dec + string
        return string