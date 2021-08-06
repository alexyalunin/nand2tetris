from VMConstants import *

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
        self._labelnum = 0
    
    def write_init(self):
        print('init')
        string = """
            @256
            D=A
            @0
            M=D
        """
        string += """
            // call Sys.init 0
        """
        string += self.write_call('Sys.init', 0)      # call Sys.init
        return string
        
    def write_arithmetic(self, command):
        if command == 'add':  
            string = self._binary('M+D')
        elif command == 'sub':  
            string = self._binary('M-D')
        elif command == 'and':  
            string = self._binary('D&M')
        elif command == 'or':   
            string = self._binary('D|M')
        elif command == 'neg':  
            string = self._unary('-M')
        elif command == 'not':  
            string = self._unary('!M')
        elif command == 'eq':   
            string = self._compare('JEQ')
        elif command == 'gt':   
            string = self._compare('JGT')
        elif command == 'lt':   
            string = self._compare('JLT')
        return string
    
    
    def write_push_pop(self, command, seg, index):
        if command == 'push':   
            string = self._push(seg, index)
        elif command == 'pop':  
            string = self._pop(seg, index)
        else:
            raise
        return string
    
    
    def write_label(self, label):
        string = f"""
            ({label})
        """
        return string
        
    def write_goto(self, label):
        string = f"""
            @{label}
            0;JMP
        """
        return string
            
    def write_if(self, label):
        string = f"""
            @SP
            M=M-1
            A=M
            D=M
            @{label}
            D;JNE
        """
        return string
    
    
    def write_function(self, func_name, num_arg):
        string = f"""
            ({func_name})
        """
        for _ in range(int(num_arg)):
            string += self._push('constant', 0)
        return string
    
    
    def write_call(self, func_name, num_arg):
        return_label = self._new_label()
        string = f"""
            // push return address
            @{return_label}
            D=A
        """
        string += self._push_D_inc()
        string += self._push('reg', R_LCL)
        string += self._push('reg', R_ARG)
        string += self._push('reg', R_THIS)
        string += self._push('reg', R_THAT)
        
        string += f"""
            @SP
            D=M
            @{5+int(num_arg)}
            D=D-A
            @ARG
            M=D
            
            @SP
            D=M
            @LCL
            M=D
        """
        string += self.write_goto(func_name)
        string += f'({return_label})'
        return string
            
    
    def write_return(self):
        string = f"""
            @LCL
            D=M
            @R{R_FRAME}
            M=D
            
            @5
            A=D-A
            D=M
            @R{R_RET}
            M=D
        """
        string += self._pop('argument', 0)
        string += """
            @ARG
            D=M+1
            @SP
            M=D
        """
        for seg in ['THAT', 'THIS', 'ARG', 'LCL']:
            string += f"""
                @R{R_FRAME}
                MD=M-1
                A=D
                D=M
                @{seg}
                M=D
            """
        string += f"""
            @R{R_RET}
            A=M
            0;JMP
        """
#         string += self.write_goto('R14')
        return string

         
    def _binary(self, op='D+M'):
        string = f"""
            @SP
            M=M-1
            A=M
            D=M // D=y
            @SP
            M=M-1
            A=M // M=x
            D={op}
            M=D // stack now points to sum
            @SP
            M=M+1
        """
        return string
    
    def _unary(self, op='-M'):
        string = f"""
            @SP
            M=M-1
            A=M
            M={op}
            @SP
            M=M+1
        """
        return string
    
    def _compare(self, op='-M'):
        LABELTRUE = self._new_label()
        LABELFALSE = self._new_label()
        string = f"""
            @SP
            M=M-1
            A=M
            D=M // D=y
            @SP
            M=M-1
            A=M // M=x
            D=M-D
            @{LABELTRUE}
            D;{op}
            @SP
            A=M
            M=0
            @{LABELFALSE}
            0;JMP
            ({LABELTRUE})
            @SP
            A=M
            M=-1
            ({LABELFALSE})
            @SP
            M=M+1
        """
        return string
    
    # Generate a new label    
    def _new_label(self):
        self._labelnum += 1
        return 'LABEL'+str(self._labelnum)
    
            
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
        elif seg == 'reg':
            string = f"""
                @R{index}
                D=M
            """
        else:
            raise
        string += self._push_D_inc()
        return string
            
        
    def _push_D_inc(self):
        string = """
            @SP
            A=M
            M=D
            
            @SP
            M=M+1 // SP++
        """
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
                @R{R_COPY}
                M=D // RAM[15] = addr

                // *addr=*SP
                @SP
                A=M
                D=M // D = *SP
                @R{R_COPY}
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
                @R{R_COPY}
                M=D
                @SP
                A=M
                D=M
                @R{R_COPY}
                A=M
                M=D
            """
        else:
            raise
        string = dec + string
        return string