create table student(
	roll_no integer,
	sname varchar(20),
    email varchar(50),
    admission_year integer,
    username varchar(20),
    pass_wd varchar(20),
    course varchar(20),
    department varchar(20),
    primary key (roll_no)
);

create table subjects(
	sub_code varchar(20),
    subject_name varchar(100),
    sem integer,
    course varchar(20),
    department varchar(20)
);

create table syllabus(
	subject_id integer not null primary key,
	subject_name varchar(1000),
	Readings varchar(1000)
);

create table lectures(
	subject_id integer,
    topic_name varchar(1000),
    website_link varchar(1000),
    FOREIGN KEY (subject_id) REFERENCES syllabus(subject_id)
);

create table subsyllabus(
	subject_id integer,
    prequisties varchar(5000),
    detsyllabus longtext,
    experiments longtext,
    FOREIGN KEY (subject_id) REFERENCES syllabus(subject_id)
    
);

create table faculty(
	faculty_id integer,
    faculty_name varchar(100),
    email varchar(100),
    dept varchar(100),
    subject_id integer,
    foreign key(subject_id) references syllabus(subject_id)
);



insert into syllabus(subject_id,subject_name,Readings)
 values(1,"OBJECT ORIENTED PROGRAMMING","Java: The Complete Reference, Herbert Schildt, 11th edition, Mc Graw Hill, 2019.|Head First Java, Kathy Sierra & Bert Bates, 3rd edition, O’Reilly, 2005.|Clean Code, Robert C Martin, Pearson, 2012"),
 (2,"DATA ANALYSIS AND ALGORITHMS","Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest and Clifford Stein,Introduction to Algorithms, Third Edition, PHI, 2009.|Michael T. Goodrich and Roberto Tamassia, Algorithm Design: Foundations,Analysis and Internet Examples, Second Edition, Wiley-India, 2006"),
 (3,"COMPUTER ORGANISATION AND ARCHITECURE","Computer Organization, Carl Hamacher, 5th Edition, McGraw Hill Publishers, 2002.|Computer System Architecture, Morris Mano, 3rd Edition, PHI, 2017."),
 (4,"THEORY OF COMPUTATION","Michael Sipser, Introduction to Theory of Computation, Third Edition, Course Technology, 2012.|Automata and Computability, Dexter C. Kozen, First Edition, Springer Publishers,2007."),
 (5,"DATABASE MANAGEMENT SYSTEM","Sumitabha Das, Unix Concepts and Applications, TMH, 4th edition, 2008.|John R Levine, Tony Mason, Doug Brown, Lex and Yacc, Orielly, 2nd edition, 2009."),
 
 (6,'DATA STRUCTURES AND ALGORITHMS','Data structures and Algorithms in C++, Michael T. Goodrich, R. Tamassia, and
Mount, John Wiley and Sons, Second Edition, 2011.|Data structures and Algorithm Analysis in C++, Mark Allen Weiss, Pearson
Education. Ltd., Fourth Edition, 2014.|Data structures and algorithms in C++, Fourth Edition, Adam Drozdek, Thomson,
Cengage, 2013.| Data Structures: A Pseudocode Approach with C++, Richard F. Gilberg, Behrouz A.
Forouzan, Second Edition, Thomson Learning, 2004.| Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest and Clifford Stein,
Introduction to Algorithms, Third Edition, PHI, 2009.'),
 (7,'ENERGY CONVERSION TECHNOLOGIES',' Edward S. Cassedy, Peter Z. Grossman “Introduction to Energy: Resources,
Technology, and Society” Cambridge University Press, 1998|
Merlin H. Kleinbach, Carlton E. Salvagin “Energy technologies and conversion
systems” Prentice Hall, 1986|
Harry A. Sorenson “Energy Conversion Systems” Wiley, 1983.|
Charles R. Russell “Elements of Energy Conversion” Elsevier, 2013|
Archie W. Culp “Principles of energy conversion” McGraw-Hill, 1979|
Reiner Decher “Energy Conversion: Systems, Flow Physics, and Engineering”
Oxford University Press, 1994|
Reiner Decher “Direct Energy Conversion: Fundamentals of Electric Power
Production” Oxford University Press, 1997|
Fang Lin Luo, Ye Hong “Renewable Energy Systems: Advanced Conversion
Technologies and Applications” CRC Press, 2012|
Yogi Goswami and Frank Kreith “Energy Management and Conservation Handbook”
CRC Press 2007'),
 (8,'DC MACHINES AND TRANSFORMERS','A.E Fitzgerald, Charles Kingsley, Stephen D Umans Electrical Machines–TMH
Publishers, 6th Edition, 2003.| Nagarath & D.P. Kothari: Electrical Machines, TMH Publishers, 4th Edition, 2004|
P.C. Sen, “Principles of Electric Machines and Power Electronics”, Wiley Student
Edition, 2008.|
Irving L. Kosow, “Eectric Machinery and Transformers”, PHI, Second Edition, 2007.|A.E. Clayton & C.I. Hancock Performance and Design of DC Machines, CBS
Publishers, 2018.| P. S Bimbhra, Electrical Machines, Khanna Publishers, 2002'),
 (9,'SIGNALS AND SYSTEMS','Signals and Systems - A.V. Oppenheim, A.S. Willsky and S.H. Nawab, PHI, 2nd Ed,
2009.|
Signals & Systems - Simon Haykin and Van Veen, Wiley, 2nd Edition, 2019.|
Linear Systems and Signals – B. P. Lathi, Second Edition, Oxford University press,
2008.|
Fundamentals of Signals and Systems Michel J. Robert, MGH International Edition,
2008.|
Signals, Systems and Transforms - C. L. Philips, J. M. Parr and Eve A. Riskin,
Pearson education. 4th Ed, 2008'),
 (10,'CONTROL SYSTEMS','Norman S. Nise “Control Systems Engineering”, 7th edition, Wiley, 2015|
William Bolton “Control Systems” Newnes, 2002|
William S. Levine “Control System Fundamentals” CRC Press, 2010|
K. Warwick “Control systems: an introduction” Prentice Hall, 1989|
M. Gopal “Control Systems: Principles and Design” Tata McGraw-Hill Education,
2002'),
 
 (11,'MATRICES AND DIFFERNTIAL EQUATIONS','Norman S. Nise “Control Systems Engineering”, 7th edition, Wiley, 2015|
William Bolton “Control Systems” Newnes, 2002|
William S. Levine “Control System Fundamentals” CRC Press, 2010|
K. Warwick “Control systems: an introduction” Prentice Hall, 1989|
M. Gopal “Control Systems: Principles and Design” Tata McGraw-Hill Education,
2002'),
 (12,'ENGINEERING CHEMISTRY','Norman S. Nise “Control Systems Engineering”, 7th edition, Wiley, 2015|
William Bolton “Control Systems” Newnes, 2002|
William S. Levine “Control System Fundamentals” CRC Press, 2010|
K. Warwick “Control systems: an introduction” Prentice Hall, 1989|
M. Gopal “Control Systems: Principles and Design” Tata McGraw-Hill Education,
2002'),
 (13,'ELEMENTS OF ELECTRICAL ENGINEERING','Norman S. Nise “Control Systems Engineering”, 7th edition, Wiley, 2015|
William Bolton “Control Systems” Newnes, 2002|
William S. Levine “Control System Fundamentals” CRC Press, 2010|
K. Warwick “Control systems: an introduction” Prentice Hall, 1989|
M. Gopal “Control Systems: Principles and Design” Tata McGraw-Hill Education,
2002'),
 (14,'BIOLOGY FOR ENGINEERS','Norman S. Nise “Control Systems Engineering”, 7th edition, Wiley, 2015|
William Bolton “Control Systems” Newnes, 2002|
William S. Levine “Control System Fundamentals” CRC Press, 2010|
K. Warwick “Control systems: an introduction” Prentice Hall, 1989|
M. Gopal “Control Systems: Principles and Design” Tata McGraw-Hill Education,
2002'),
 (15,'BASICS OF MECHANICAL ENGINEERING','Norman S. Nise “Control Systems Engineering”, 7th edition, Wiley, 2015|
William Bolton “Control Systems” Newnes, 2002|
William S. Levine “Control System Fundamentals” CRC Press, 2010|
K. Warwick “Control systems: an introduction” Prentice Hall, 1989|
M. Gopal “Control Systems: Principles and Design” Tata McGraw-Hill Education,
2002');

insert into subjects(sub_code,subject_name,sem,course,department)
values
('cs255','DATABASE MANAGEMENT SYSTEM',4,'btech','cse'),
('cs254','THEORY OF COMPUTATION',4,'btech','cse'),
('cs253','COMPUTER ORGANISATION AND ARCHITECURE',4,'btech','cse'),
('cs252','DATA ANALYSIS AND ALGORITHMS',4,'btech','cse'),
('cs251','OBJECT ORIENTED PROGRAMMING',4,'btech','cse'),

('cs285','DATA STRUCTURES AND ALGORITHMS',4,'btech','eee'),
('ee251','ENERGY CONVERSION TECHNOLOGIES',4,'btech','eee'),
('ee252','DC MACHINES AND TRANSFORMERS',4,'btech','eee'),
('ee253','SIGNALS AND SYSTEMS',4,'btech','eee'),
('ee254','CONTROL SYSTEMS',4,'btech','eee'),

('MA151','MATRICES AND DIFFERNTIAL EQUATIONS',2,'btech','cse'),
('CY101','ENGINEERING CHEMISTRY',2,'btech','cse'),
('EE101','ELEMENTS OF ELECTRICAL ENGINEERING',2,'btech','cse'),
('BT101','BIOLOGY FOR ENGINEERS',2,'btech','cse'),
('ME101','BASICS OF MECHANICAL ENGINEERING',2,'btech','cse');

insert into lectures(subject_id,topic_name,website_link)
values(1,'introduction to classes','https://www.geeksforgeeks.org/classes-objects-java/'),
(1,'inheritance','https://www.geeksforgeeks.org/inheritance-in-java/'),
(1,'packages and interfaces','https://www.geeksforgeeks.org/packages-in-java/'),
(1,'exceptional handling','https://www.geeksforgeeks.org/exceptions-in-java/'),
(1,'multithreaded programming','https://www.geeksforgeeks.org/multithreading-in-java/'),
(1,'generics','https://www.geeksforgeeks.org/generics-in-java/'),
(2,'asymptotics notations','https://www.geeksforgeeks.org/asymptotic-notations-and-how-to-calculate-them/'),
(2,'divide and conquer','https://www.geeksforgeeks.org/divide-and-conquer/'),
(2,'greedy algorithms','https://www.geeksforgeeks.org/greedy-algorithms/'),
(2,'dynamic programmming','https://www.geeksforgeeks.org/dynamic-programming/'),
(2,'backtracking','https://www.geeksforgeeks.org/backtracking-algorithms/'),
(3,'number system','https://www.geeksforgeeks.org/what-is-a-number-system/'),
(3,'addressing modes','https://www.geeksforgeeks.org/addressing-modes/'),
(3,'register transfer language','https://www.geeksforgeeks.org/register-transfer-language-rtl/'),
(3,'assembly language','https://www.geeksforgeeks.org/microprocessor-tutorials/'),
(4,'deterministic finite autometa','https://www.geeksforgeeks.org/designing-deterministic-finite-automata-set-1/'),
(4,'non-deterministic finite autometa','https://www.geeksforgeeks.org/designing-non-deterministic-finite-automata-set-1/'),
(4,'context free grammer','https://www.geeksforgeeks.org/simplifying-context-free-grammars/'),
(4,'pushdown autometa','https://www.geeksforgeeks.org/introduction-of-pushdown-automata/'),
(4,'turing machines','https://www.geeksforgeeks.org/turing-machine-in-toc/'),
(5,'introduction to dbms','https://www.geeksforgeeks.org/introduction-of-dbms-database-management-system-set-1/'),
(5,'database models','https://www.geeksforgeeks.org/data-models-in-dbms/'),
(5,'structured query language','https://www.geeksforgeeks.org/sql-tutorial/'),
(5,'database design','https://www.geeksforgeeks.org/significance-of-database-design/'),
(5,'transaction,concurrency control and recovery','https://www.geeksforgeeks.org/recovery-with-concurrent-transactions/'),
(6,'Introduction to DataStructure Algorithm','https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/'),
(6,'LinkedList Datastructure','https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/'),
(6,'Tree Datastructure','https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/'),
(6,'Sorting Algorithms','https://www.geeksforgeeks.org/learn-data-structures-and-algorithms-dsa-tutorial/'),
(7,'Introduction to Energy','https://www.geeksforgeeks.org/energy-conservation/'),
(7,'Principles of Energy conversion','https://www.geeksforgeeks.org/energy-conservation/'),
(7,'Energy conversion Devices','https://www.geeksforgeeks.org/energy-conservation/'),
(8,'Dc machines','https://www.electricaltechnology.org/2020/04/dc-machine-types-working-applications.html'),
(8,'Single phase Transformers','https://www.electricaltechnology.org/2020/04/dc-machine-types-working-applications.html'),
(8,'Three pahse Transformers','https://www.electricaltechnology.org/2020/04/dc-machine-types-working-applications.html'),
(9,'Signas','https://www.tutorialspoint.com/signals_and_systems/index.htm'),
(9,'System','https://www.tutorialspoint.com/signals_and_systems/index.htm'),
(9,'Introduction to Fourier Series','https://www.tutorialspoint.com/signals_and_systems/index.htm'),
(10,'Introduction to Control Systems','https://www.tutorialspoint.com/control_systems/control_systems_introduction.htm'),
(10,'Time Response Analysis','https://www.tutorialspoint.com/control_systems/control_systems_introduction.htm'),
(10,'Modeling in the Time Domain','https://www.tutorialspoint.com/control_systems/control_systems_introduction.htm'),
(11,'Introduction to Matrices','https://byjus.com/jee/matrices/'),
(11,'Introduction to Differential Equations','https://byjus.com/maths/differential-equation/'),
(11,'Integrations','https://byjus.com/maths/differential-equation/'),
(12,'Physical Chemistry','https://www.geeksforgeeks.org/cbse-class-10-chemistry-notes/'),
(12,'Electro chemistry','https://www.geeksforgeeks.org/cbse-class-10-chemistry-notes/'),
(12,'Organic Chemistry','https://www.geeksforgeeks.org/cbse-class-10-chemistry-notes/'),
(13,'Introduction to Electrical Engineering','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee'),
(13,'Nodal and Mesh analysis','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee'),
(13,'AC and DC Motors','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee'),
(14,'Introduction to Biology for Engineers','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee'),
(14,'Meiosis and Mitosis','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee'),
(14,'Application of Biology','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee'),
(15,'Introduction to Basic mechanical engineering','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee'),
(15,'Materials','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee'),
(15,'Measurements','https://www.khanacademy.org/science/electrical-engineering/introduction-to-ee');


insert into subsyllabus(subject_id,prequisties,detsyllabus,experiments)
values(1,"Introduction to Algorithmic Thinking and Programming (CS101).|Introduction to Algorithmic Thinking and Programming Lab (CS102)|Data Structures and Algorithms (CS201)
|Data Structures and Algorithms Lab (CS204)","Overview of Object-Oriented Programming and its need, Java Programming Elements:
Classes and Objects, Data types, Constructors, Input-Output Handling, Control
structures, Method overloading and overriding, Abstraction and Inheritance, Interfaces,
understanding final and static: classes, blocks and methods, Packages.|
Exception Handling: Types of Exceptions, Exception classes, try, catch, throw, throws
and finally, Exception Handling with Method Overriding, Custom Exceptions, finalize.
Multithreaded Programming: Introduction to multitasking through processes and threads,
creating threads, thread life cycle, thread scheduling, thread priorities, daemon thread,
synchronization.|
Garbage Collection, Runtime class and Memory management in Java.
String handling: String, String Buffer, StringBuilder and tokenization.
Generics, Lambda expressions.|
The Collections framework: List, Set and Map interfaces and the corresponding
implementation classes, Enumerator and iterators.|
Event handling: Event, Listeners and adapter classes, anonymous inner classes.
Abstract Windowing Toolkit (AWT): Button, Label, Checkbox, Checkbox Group, Text
Field, Text Area, Choice, List, Menu, Panel, Scrollbar and Swing components, Layout
managers, Complex Components.|
MVC and introduction to creational, structural design patterns and behavioural patterns.
File I/O: Streams, Readers and Writers, Pipes and Filters, Random Access, Scanner.",
"Develop programs to familiarize with Object Oriented Design concepts.|
Implement programs to illustrate overloading and overriding.|
Implement programs to familiarize with the Testing and Debugging facilities.|
Implement abstract classes and Interfaces.|
Implement programs using Static classes, blocks and methods."),
(2,"Introduction to Algorithmic Thinking and Programming (CS101)|Introduction to Algorithmic Thinking and Programming Lab (CS102)|Data Structures and Algorithms (CS201)
|Data Structures and Algorithms Lab (CS204)|Discrete Mathematics (CS203)",
"Introduction to Algorithm Design and Analysis, Asymptotics, Correctness Proofs for
Algorithms.|
Divide and Conquer Algorithms: Solving Recurrences, Recurrence Trees, Substitution
method, Master’s Theorem, Merge Sort, Quick Sort and Randomized Quicksort with their
analyses, Maximum sub-array problem, Linear time Selection, Strassen’s Matrix
Multiplication, Multiplication of Large integers.|
Greedy Algorithms: Design scenarios calling for a greedy design, Making Change
problem, Activity Selection Problem, Fractional Knapsack problem, Prim’s and Kruskal’s
algorithms for Minimum Spanning Tree construction, Dijkstra’s algorithm for finding single
source shortest paths.|
Dynamic Programming: Design scenarios calling for a dynamic programming design,
Chained Matrix Multiplication problem, 0/1 Knapsack problem, Travelling Salesperson
Problem, Optimal Binary Search Tree, Floyd Warshall’s Algorithm, Vertex Cover of a
Tree.|
Backtracking: N-Queen’s problem, Enumeration of Independent Sets of a problem, Graph
Coloring problem, Robotic path finding problem in an unknown terrain.
Branch and Bound: TSP. Set Cover and 0/1 Knapsack problem.|
String algorithms: KMP Algorithm, Boyer Moore Algorithm and Rabin-Karp Algorithm.
Flow-based Algorithms: Max-flow Min-cut theorem, augmenting paths and finding mincuts.
Complexity classes: P, NP, NP-Complete and NP-Hard, Standard reductions",
""),
(3,"Introduction to Algorithmic Thinking and Programming (CS101)|Digital Logic Design (EC237)",
"Basic Structures of Computers: Computer Types, Functional Units, Basic Operational
Concepts, Bus Structures, Software, Performance, Multiprocessors and Multi-computers,
Historical Perspective.|Machine instructions and Programs: Numbers, Arithmetic Operations and Characters,
Memory Locations and Addresses, Memory Operations, Instructions and Instruction
Sequencing, Addressing Modes, Assembly Language, Basic Input Output Operations,
Stacks and Queues, Subroutines, Additional Instructions, Example Programs, Encoding
of Machine Instructions.|
Registers and addressing, IA-32 Instructions, IA-32 Assembly Language, Program Flow
Control, Logic and Shift/Rotate Instructions, I/O Operations, Subroutines, Other
Instructions, Program Examples.|
Input/output Organization: Accessing I/O Devices, Interrupts, Processor Examples,
Direct Memory Access, Buses, Interface Circuits, Standard I/O Interfaces.
The Memory System: Some Basic Concepts, Semiconductor RAM Memories, Read
Only Memories, Speed Size and Cost, Cache Memories: mapping functions, cache
performance and replacement algorithms, levels and locality, Performance
Considerations, Virtual Memories, Memory Management Requirements, Secondary
Storage.|
Arithmetic: Addition and Subtraction of Signed Numbers, Design of Fast Adders,
Multiplication of Positive Numbers, Signed-Operand Multiplication, Fast Multiplication,
Integer Division, Floating Point Numbers and Operations, Implementing Floating Point
Operations.|
Basic Processing Unit: Some Fundamental Concepts, Execution of a Complete
Instruction, Multiple-Bus Organization, Hardwired Control, Microprogrammed Control.
Pipelining: Basic Concepts, Data Hazards, Instruction Hazards, Influence on Instruction
Sets, Data Path and Control Considerations, Super Scalar Operation, UltraSPARC 2
Example, Performance Consideration.|
Introduction to superscalar architectures, VLIW machines.",
""),
(4,"None",
"Finite State Automata (FSA): Alphabets, Strings, Languages, Deterministic FSA
(DFSA), non-deterministic FSA (NFSA) with Epsilon-Transitions, Uses of ∈ Transitions.
Regular expressions, Finite Automata and Regular Expressions, Conversion among
Regular Expressions, DFSA and NFSA, Applications of Regular Expressions,
Applications of Regular Expressions in UNIX and Lexical Analysis, Algebraic Laws for
Regular Expressions, Laws Involving Closures, Subset Construction Algorithm, FSA
Minimization, Regular Languages and properties, Pumping Lemma, Myhill-Nerode
Theorem.|
Context Free Grammars - Derivations Using a Grammar, Leftmost and Rightmost
Derivations, The Language of a Grammar, Sentential Forms, Parse Trees, eliminating
useless symbols, Applications of Context-Free Grammars, Parsers, The YACC Parser
Generator, Ambiguity in Grammars and Languages, Ambiguous Grammars, Removing
Ambiguity from Grammars. Normal Forms: Chomsky Normal Form and Greibach Normal
Form, Chomsky Hierarchy, Context Free Languages (CFLs), properties, Pumping
Lemma for CFLs, CYK Algorithm.|
Push Down Automata (PDA): Definition, Instantaneous Descriptions of a PDA, The
Languages of a PDA, Acceptance by Final State, Acceptance by Empty Stack,
Equivalence of PDAs and CFGs, Deterministic Context Free Languages.
Turing Machines (TMs): Definition, Instantaneous Descriptions for the Turing Machines,
Transition Diagrams for Turing Machines, The Language of a Turing Machine, Turing
Machines and Halting, Configurations: TM as a computing device and as a recognition
device. Programming Techniques for Turing Machines: Storage in the State, Multiple
Tracks, Shifting Over, Subroutines, Extensions to the Basic Turing-Machines, Multiple
Turing Machines, Computable Functions. Multi-Tape Turing Machines, Linear Bounded
Automata.|
Recursive and recursively enumerable languages. Undecidability of Halting Problem.
Reductions, Theory of NP Completeness.",
""),
(5,"Data Structures and Algorithms (CS201)|Data Structures and Algorithms Lab (CS204)|Operating Systems (CS202)|Operating Systems Lab (CS205)| Discrete Mathematics (CS203)",
"Introduction: Basic concepts of database systems, Database System Applications,
Purpose of Database Systems, Data View, Database Languages, Characteristics of a
database approach, Advantages of DBMS over file system, Database Design, Database
Engine, Database and Application Architecture, Database Users and Administrators,
History of Database systems|
Database models: ER-model: Features of the E-R model, Database design using the ER model, Relational model: Relational Database Schemas, Keys, Integrity constraints
over relations, E-R model to relational schema, relational algebra, relational calculus.
SQL: Form of a basic SQL Query, Insert, Delete and Update database, Set Operations,
Nested queries, Aggregate Functions, Null Values, Integrity Constraints, Join
Expressions – Natural join, Equi-join, Inner join, Outer join, Views, Triggers.
Database design: Functional-Dependency, Soundness and completeness of
Armstrong’s axioms, Normal Forms, Loss-less decomposition, Dependency preservation,
Decomposition Using Functional Dependencies, Multivalued Dependencies and 4NF,
Join dependencies and 5NF, Decomposition Algorithms.|
Data Storage Structure and Indexing: Memory hierarchy, Redundant Arrays of
Independent Disks, File organization and indexing, Index Data Structures: Hash-based
indexing and Tree-based Indexing (B+ trees and B-trees), Introduction to Query
optimization and execution.|
Transactions, concurrency control and recovery: ACID properties, Transactions and
Schedules, Concurrent execution of transactions, Lock-Based Protocols, Deadlock
Handling, Concurrency control without locking, Introduction to crash recovery, ARIES,
Write-Ahead log protocol, checkpointing, recovery from a system crash, security,
authorization and access control.",
""),
(7,'EE101- Elements of Electrical Engineering.|PH101- Engineering physics.|EE202-Electromagnetic Field Theory','Introduction to Energy:
What is Energy, Types of Energy, Forms of Energy, Measures of Energy - Units &
Equivalences, Energy Transformation Matrix, Energy balance, Energy storage, Energy
Dissipation, Energy Efficiency.|
Principles of Energy Conversion:
Introduction to Energy, Laws - Thermodynamics, Faraday’s law, Ampere’s law, Conversion
processes - Direct: Single-step conversion process, Co-energy, Indirect: Multi-step
conversion process, singly excited magnetic systems, Multiple excited magnetic systems,
elementary concepts of rotating machines.|
Energy Conversion Devices and their working principles and efficiency:
Transformers, Transducers, Motors, Generators, Turbines, Engines, Boilers, Heater, drier,
Battery, Furnace, Lamp etc.|
Conventional Energy Conversion Technologies:
Fossil fuel power systems – Coal, Gas and Oil, Nuclear energy, Hydro Energy
Non-Conventional Energy Conversion Technologies
Solar thermal, Solar PV, Fuel Cell, Ocean Energy, Wind Energy, Geothermal energy, Wave
energy, Bio-fuel.',""),
(8,'EE101- Elements of Electrical Engineering, PH101- Engineering physics.|EE251- Energy Conversion Technologies.','DC Machines: Constructional details, Simplex and multiplex lap and wave windings;
Methods of excitation, torque equation, back emf, characteristics of saturated and unsaturated series, shunt, cumulatively and differentially compound excited machines operating
as motors and generators; Armature reaction, demagnetizing and cross magnetizing ampere
turns, compensating windings, commutation, inter poles.|
Speed control methods of D.C. shunt & series motors, losses and efficiency; 3 point starter,
4- point Starter for D.C. motors. Testing of D.C. machines: No-load test, Direct load test,
Hopkinson’s and Field’s test, Retardation test.|
Single Phase Transformers: Construction, principle of operation, ideal transformer, EMF
equation, phasor diagram; Equivalent circuit, determination of equivalent circuit parameters,
Losses, calculation of efficiency and regulation by direct and indirect methods;Predetermination of performance by Sumpner’s test, Load sharing and operation of
transformers in parallel, Separation of no load losses by experimental method, principle of
auto transformer, Saving of copper compared to two winding transformer and its application.|
Three Phase Transformer: Construction, Type of connections, Relation between line and
phase voltages and currents, use of tertiary winding, On-load tap changing, Scott connection
of transformers for phase conversion.',""),
(9,'EC101-Basic Electronics Engineering.| MA101- Differential and Integral
Calculus.|MA151- Matrices and Differential Equations.','Signals: definition of a Signal, real life examples for signals, Types of signals, Signal
representation, classification of signals, properties, Elementary Continuous Time Signals,
Elementary discrete Time Signals, basic operations on signals, Sampling theorem, shifting
and scaling properties.|
Systems: definition of a Systems, real life examples for systems, Types of systems,
classification of systems, system viewed as interconnection of operations, properties of
systems, Continuous and Discrete Time Systems.|Introduction to Fourier Analysis and Signal Transmission through Linear Systems
Fourier Series, Fourier Transforms, Introduction to linear system, impulse response of linear
system, Response of a linear system, linear time invariant (LTI) system, Transfer functions of
a LTI system, Filter characteristics of linear systems. Distortion less transmission through a
system, Ideal filter characteristics, Causality and Poly-Wiener criterion for physical
realization.|
Convolution and Correlation of Signals
Convolution: Concept of convolution in time domain and Frequency domain, Graphical
representation of convolution, convolution sum, convolution integral.|
Correlation: Cross correlation and auto correlation of functions, properties of correlation
function, Relation between convolution and correlation, Detection of periodic signals in the
presence of noise by correlation, Extraction of signal from noise by filtering.|
Laplace Transforms: Review of Laplace transforms (L.T), relation between L.T‘s, and F.T.
of a signal, Concept of region of convergence (ROC) for Laplace transforms, Constraints on
ROC for various classes of signals, Properties of L.T‘s. Laplace transform of certain signals
using waveform synthesis, Inverse Laplace transform.|
Z–Transforms: Concept of z-transform of a discrete sequence, Distinction between Laplace,
Fourier and z-transforms, Region of convergence in z-transform, constraints on ROC for
various classes of signals, properties of z-transforms, Inverse z-transform, analysis of LTI
discrete time systems using z-transforms.',''),
(10,'EE101- Elements of Electrical Engineering.|EC101- Basic Electronics
Engineering.','Introduction to Control Systems and its representations: General introduction, History of
control systems, Open-loop control, Closed-loop control, Some examples of control systems,
Definitions of standard terminology, Effect of Feedback, Classification of Control systems,
Transfer functions, Block diagrams, Signal flow graph.|
Time Response Analysis: Introduction, Poles, Zeros, System response, First order systems,
second order systems, System response with additional Poles and with Zeros
Modeling in the Time Domain
State space representation of Continuous Time systems, State variables, State equations,
converting a transfer function to state space, converting from state space to a transfer
function, Laplace transform solution of state equations, Time domain solution of state
equations, Effect of P, PI & PID controllers, Concept of controllability and observability
Modeling in the Frequency Domain: Review of Laplace transforms, Electrical Network
Transfer functions, Translational Mechanical system transfer function, Transfer functions for
systems with Gears, Electric Circuit analogs, polar plots, Nyquist stability criterion,
Frequency domain indices (gain margin, phase margin, bandwidth), Bode plots, Introduction
to lag and lead compensation.|
Steady State Errors: Introduction, steady state errors (SSE) for unity and non-unity
feedback systems, static error constants, system type, SSE specifications, SSE for
disturbances, SSE for systems in state space, Sensitivity.|
Stability Analysis: Introduction to Stability, Routh-Hurwitz Criterion, Special cases and
examples, Stability in State Space, Root Locus, Problems. ',""),
(6,'Introduction to Algorithmic Thinking and Programming (CS101).|Introduction to Algorithmic Thinking and Programming Lab (CS102)','Abstract Data Types (ADT), Arrays and Records, Memory Layout and implementation of
Stack, Queue, Linked List (Single, Double and Circular), Applications of Stack, Queue
and Linked Lists. Implementation of variants of the Stack, Queue and Linked List such as
Two-way Stack, Circular Queue and Doubly Circular Linked Lists. Implementation of
Stack and Queue using Linked List.|
Memory Layout and Implementation of operations on Trees: Binary Trees, Binary Search
Trees, AVL trees, B-Trees, Splay Trees and Tries.|
Hashing: Open and Closed addressed tables, Design of good hash functions, Analysis of
the efficiency of search operations, Bloom Filters.|
Priority Queues: Memory layout, implementation and applications of Heap and its variants
namely Skew Heaps, Leftist Heaps, Fibonacci Heaps and Binomial Queues.
Miscellaneous Data Structures: Skip Lists, Disjoint sets and k-d Trees.
Graphs: Memory representations, Depth First and Breadth First Traversals and
representative applications like Topological Sorting, Finding Connected Components and
Social Network Analysis.|
Sorting: Representative Internal Sorting Algorithms like Merge Sort, Quick Sort, Counting
Sort, Radix and Bucket Sorts. Analysis of efficiency of sorting, Notion of Stability in
Sorting, External Sorting Algorithms.|
Amortized Analysis of Data Structures: Accounting and Potential methods.',""),
(11,'','',''),
(12,'','',''),
(13,'','',''),
(14,'','',''),
(15,'','','');

insert into faculty (faculty_id,faculty_name,email,dept,subject_id)
values(1,'Dr.Srilatha CH','srilathaoops@gmail.com','Computer Science and Engineering',1),
(2,'Dr.Karthick S','Karthickdaa@gmail.com','Computer Science and Engineering',2),
(3,'Mr.S.Kousik','kousikcoa@gmail.com','Computer Science and Engineering',3),
(4,'Mrs.S.S.Monica B','monicatoc@gmail.com','Computer Science and Engineering',4),
(5,'Mr.D.Prasad','prasaddbms@gmail.com','Computer Science and Engineering',5),

(6,'Dr.Rajesh CH','rajeshdsa@gmail.com','Electrical and Electronic and Engineering',6),
(7,'Mr,Murali S','muraliee251@gmail.com','Electrical and Electronic and Engineering',7),
(8,'Mr.S.sankar','sankaree252@gmail.com','Electrical and Electronic and Engineering',8),
(9,'Mr.hari.s.s B','hariee253@gmail.com','Electrical and Electronic and Engineering',9),
(10,'Mr.D.yadagiri','naniee254@gmail.com','Electrical and Electronic and Engineering',10),

(11,'Dr.Rajesh CH','rajeshdsa@gmail.com','Electrical and Electronic and Engineering',11),
(12,'Mr,Murali S','muraliee251@gmail.com','Electrical and Electronic and Engineering',12),
(13,'Mr.S.sankar','sankaree252@gmail.com','Electrical and Electronic and Engineering',13),
(14,'Mr.hari.s.s B','hariee253@gmail.com','Electrical and Electronic and Engineering',14),
(15,'Mr.D.yadagiri','naniee254@gmail.com','Electrical and Electronic and Engineering',15);
