source autoload/javacomplete/imports.vim
source t/javacomplete.vim

call vspec#hint({'sid': 'g:SID("imports")', 'scope': 'SScope()'})

describe 'javacomplete imports test'
    it 'AddImport test'
        new
        source autoload/javacomplete.vim
        put! ='package kg.ash.foo;'

        call Call('s:AddImport', 'java.util.List')
        Expect getline(3) == 'import java.util.List;'

        call Call('s:AddImport', 'java.util.ArrayList')
        Expect getline(3) == 'import java.util.List;'

        call Call('s:AddImport', 'foo.bar.Baz')
        Expect getline(5) == 'import foo.bar.Baz;'

        call Call('s:AddImport', 'zoo.bar.Baz')
        Expect getline(5) == 'import foo.bar.Baz;'

        new

        source autoload/javacomplete.vim
        call Call('s:AddImport', 'java.util.List')
        Expect getline(2) == 'import java.util.List;'

        call Call('s:AddImport', 'java.util.ArrayList')
        Expect getline(3) == 'import java.util.ArrayList;'

        call Call('s:AddImport', 'foo.bar.Baz')
        Expect getline(4) == 'import foo.bar.Baz;'

        call Call('s:AddImport', 'zoo.bar.Baz')
        Expect getline(4) == 'import foo.bar.Baz;'

    end
end
