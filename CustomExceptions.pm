use Exception::Nano;

package CustomExceptions::SomeError0;
use parent 'Exception::Nano';
sub description {"Some text 0"};

package CustomExceptions::SomeError1;
use parent 'Exception::Nano';
sub description {"Some text 1"};

package CustomExceptions::SomeError2;
use parent 'Exception::Nano';
sub description {"Some text 2"};

package CustomExceptions::SomeError3;
use parent 'Exception::Nano';
sub description {"Some text 3"};

1;