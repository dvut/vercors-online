# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: vercors2
# Generation Time: 2017-06-21 13:32:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Author
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Author`;

CREATE TABLE `Author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;

INSERT INTO `Author` (`id`, `firstname`, `lastname`)
VALUES
	(2,'Wytse','Oortwijn');

/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Backend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Backend`;

CREATE TABLE `Backend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Backend` WRITE;
/*!40000 ALTER TABLE `Backend` DISABLE KEYS */;

INSERT INTO `Backend` (`id`, `name`)
VALUES
	(1,'Chalice'),
	(2,'Silicon'),
	(3,'Dafny'),
	(4,'VeriFast'),
	(5,'Boogie');

/*!40000 ALTER TABLE `Backend` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Example
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Example`;

CREATE TABLE `Example` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backendid` int(11) NOT NULL,
  `languageid` int(11) NOT NULL,
  `publicationid` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `doesverify` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'A boolean value indicating whether the example program verifies or not.',
  `linesofcode` int(11) DEFAULT NULL,
  `linesofspec` int(11) DEFAULT NULL,
  `computationtime` double DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx-example-backendid` (`backendid`),
  KEY `idx-example-languageid` (`languageid`),
  KEY `idx-example-publicationid` (`publicationid`),
  CONSTRAINT `fk-example-backendid` FOREIGN KEY (`backendid`) REFERENCES `Backend` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-example-languageid` FOREIGN KEY (`languageid`) REFERENCES `Language` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-example-publicationid` FOREIGN KEY (`publicationid`) REFERENCES `Publication` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Example` WRITE;
/*!40000 ALTER TABLE `Example` DISABLE KEYS */;

INSERT INTO `Example` (`id`, `backendid`, `languageid`, `publicationid`, `title`, `link`, `description`, `doesverify`, `linesofcode`, `linesofspec`, `computationtime`, `date`)
VALUES
	(1,2,1,NULL,'Matrix transpose','arrays/Transpose.pvl','Specified and verified implementation of a (copying) matrix transpose.',1,23,19,40484,'2017-06-12'),
	(2,2,2,NULL,'Array zipping','arrays/JavaArrayExamples.java','Zipping the contents of two given arrays `a` and `b` of equal length into an array of length `|a| + |b|`. This is also the answer to question 4 of the FMSE exam on April 16, 2015 (University of Twente). Also some other verification examples are added (such as shifting elements of the array to the left/right).',1,109,35,61485,'2017-06-12'),
	(4,2,1,NULL,'Parallel prefix sum','case-studies/prefixsum-drf.pvl','This file shows how to specify the permission flow of an efficient prefix sum implementation for GP-GPU.',1,78,42,828957,'2017-06-12'),
	(5,2,1,NULL,'ArrayGetList','arrays/array-example.pvl','This program transforms an array for a sequence (but axiomatised, via interface specification) and checks certain properties on the resulting sequence.',1,54,17,23589,'2017-06-15'),
	(6,2,4,NULL,'Backward dependencies (error 1)','arrays/backward-dep-e1.c','Verification example with backward loop dependencies that does not verify.',0,35,17,NULL,'2017-06-15'),
	(7,2,4,NULL,'Basic C example','arrays/basic-examples.c','This file shows how arrays and matrices can be initialized to 0 and/or copied. There are also various failing mutants in this directory, but those are on per file for testing purposes.',1,233,101,NULL,'2017-06-15'),
	(8,2,4,NULL,'Forward dependencies (error 1)','arrays/forward-dep-e1.c','Verification example with forward loop dependencies that does not verify (the example is included for testing puposes).',0,32,13,NULL,'2017-06-15'),
	(9,1,1,NULL,'Forward dependencies (kernel 1)','arrays/forward-dep-noauto.pvl','A kernel program (written in PVL) with forward dependencies. Barrier synchronisation is used to redistribute permissions for this. This program currently does not verify due to refactoring of the Chalice back-end (we will use Silicon from now).',0,36,16,NULL,'2017-06-15'),
	(10,1,1,NULL,'Forward dependencies (kernel 2)','arrays/forward-dep.pvl','A kernel program (written in PVL) with forward dependencies. Barrier synchronisation is used to redistribute permissions for this. This program currently does not verify due to refactoring of the Chalice back-end (we will use Silicon from now).',0,39,18,NULL,'2017-06-15'),
	(11,1,1,NULL,'Forward dependencies (kernel 3)','arrays/forward-kernel.pvl','A kernel program (written in PVL) with forward dependencies. Barrier synchronisation is used to redistribute permissions for this. This program currently does not verify due to refactoring of the Chalice back-end (we will use Silicon from now).',0,37,16,NULL,'2017-06-15'),
	(12,1,1,NULL,'PVL kernel (version 2)','arrays/kernel-example-v2.pvl','A kernel program (written in PVL) with forward dependencies. Barrier synchronisation is used to redistribute permissions for this. This program currently does not verify due to refactoring of the Chalice back-end (we will use Silicon from now).',0,34,15,NULL,'2017-06-15'),
	(13,1,1,NULL,'PVL kernel (version 3)','arrays/kernel-example-v3.pvl','A kernel program (written in PVL) with forward dependencies. Barrier synchronisation is used to redistribute permissions for this. This program currently does not verify due to refactoring of the Chalice back-end (we will use Silicon from now).',0,28,10,NULL,'2017-06-15'),
	(14,1,1,NULL,'PVL kernel (version 1)','arrays/kernel-example.pvl','A kernel program (written in PVL) with forward dependencies. Barrier synchronisation is used to redistribute permissions for this. This program currently does not verify due to refactoring of the Chalice back-end (we will use Silicon from now).',0,24,6,NULL,'2017-06-15'),
	(15,1,1,NULL,'Vector addition','arrays/vector-add.pvl','A very simple GPU kernel (written in PVL) that adds the content of two matrices and stores it in an \"output\" array (in GPU programming fashion). This program is currently disabled due to refactoring of the Chalice back-end.',0,23,9,NULL,'2017-06-15'),
	(16,2,4,NULL,'Array clearing in C (failing)','arrays/zero-array-ic-e1.c','A failing verification example that clears an array by setting each element to \"0\". The example fails, since the program actually sets \"2\" instead of \"0\". This example is included for testing purposes (e.g. to test whether VerCors correctly rejects verification examples).',0,18,5,NULL,'2017-06-15'),
	(17,1,2,NULL,'Atomic read/write witnesses','atomics/AtomicReadWrite.java','Atomically reading and writing to a shared variable, using witness encoding.',1,75,32,12903,'2017-06-15'),
	(18,1,2,NULL,'Deposit/withdraw lock','atomics/DWLock.java','How to implement a single-entrant lock using AtomicInteger? A single-entrant lock which uses deposit-withdraw approach of AtomicInteger specification.',1,102,39,13517,'2017-06-15'),
	(19,1,2,NULL,'Single-entrant spin lock','atomics/RBLock.java','SESLock is the single-entrant spin lock using an AtomicInteger as synchroniser. The contracts for the AtomicInteger is the version without magic-wand (delta).',1,117,53,13039,'2017-06-15'),
	(20,1,2,NULL,'Single producer/consumer','atomics/RBProdCons.java','Single producer and single-consumer verification using AtomicInteger. The contracts for the AtomicInteger is the version without magic-wand (delta).',1,141,59,19242,'2017-06-15'),
	(21,1,2,NULL,'Simple hash table (with find-or-put)','atomics/RBSingleCell.java','SingleCell is the simplified version of the single method lock-less hash-table using AtomicInteger as synchroniser. The contracts for the AtomicInteger is the version without magic-wand (delta).',1,144,62,19392,'2017-06-15'),
	(22,1,2,NULL,'Reentrant locking','atomics/ReentLock.java','ReentLock is the re-entrant lock using AtomicInteger as synchronizer. The contracts for the AtomicInteger is the version without magic-wand (delta).',1,209,90,15594,'2017-06-15'),
	(23,1,2,NULL,'Single cell','atomics/SingleCell.java','An atomic integer is used to protect a data field of SingleCell. Multiple threads trying to assign or find the value of the field. This verification example is very related to the \"simple hash table\" example.',1,116,34,19392,'2017-06-15'),
	(24,2,2,NULL,'Basic assertion (failing)','basic/BasicAssert-e1.java','This is a very simple example program with a single assignment and an assertion. The verification fails, as the \"t1\" method does not have permission to perform the assignment. ',0,14,2,18063,'2017-06-15'),
	(25,1,2,NULL,'Basic assertion (succeeding)','basic/BasicAssert.java','A very simple verification example with an assignment and an assertion. The assertion tests whether the assignment was successful. ',1,14,2,20009,'2017-06-15'),
	(26,2,1,NULL,'Basic collections','basic/CollectionTest.pvl','A very simple verification example where properties of various collections (sets, bag, sequences) are verified.',1,22,5,18212,'2017-06-15'),
	(27,4,1,NULL,'Output binding (failing)','basic/outputbinder-e1.pvl','This verification example demonstrates the use of output binders in the style of VeriFast. ',1,14,2,NULL,'2017-06-15'),
	(28,4,1,NULL,'Output binding (succeeding)','basic/outputbinder.pvl','This verification example demonstrates the use of output binders in the style of VeriFast. ',1,14,2,NULL,'2017-06-15'),
	(29,2,1,NULL,'Postfix unary operators','basic/postfix-increment.pvl','This verification example tests support for verifying the unary \"++\" and \"--\" operators, by incrementing and decrementing some value, respectively.',1,24,2,18773,'2017-06-15'),
	(30,2,4,NULL,'Basic contracts','basic/test-1.c','This verification example has a very simple method contract, which can be verified correct.',1,10,2,NULL,'2017-06-15'),
	(31,2,2,NULL,'Resource permissions','basic/test-scale.java','Simple verification example that shows resource permissions (with usage in good order and in bad order).',0,21,8,18548,'2017-06-15'),
	(32,2,2,NULL,'Array clearing (succeeding)','carp/ZeroArrayIC.java','Verification example in which a input array is \"cleared\" or \"zero-ed\" by assigning \'0\' to each element. ',1,17,5,23129,'2017-06-15'),
	(33,2,4,NULL,'Matrix accessing','carp/access-sub-matrix.c','Several succeeding and failing verification examples of accessing parts of a matrix (in kernel fashion).',1,33,14,NULL,'2017-06-15'),
	(34,2,1,NULL,'Kernel with host code','carp/forward-host.pvl','Verification example of a GPU kernel, written in PVL, together with host code. Moreover, the kernel has a forward dependency in its execution, and a barrier is used there to redistribute permissions.',1,72,27,45850,'2017-06-15'),
	(35,2,4,NULL,'Forward dependencies (succeeding)','carp/forward-loop.c','Verification example with a loop where the iterations have forward dependencies. Permissions are redistributed via sends receives.',1,47,27,NULL,'2017-06-15'),
	(36,2,4,NULL,'Histogram matrix','carp/histogram-matrix.c','Proving correctness of an algorithm that determines the histogram of a matrix.',1,23,15,NULL,'2017-06-15'),
	(37,2,4,NULL,'Histogram submatrix','carp/histogram-submatrix.c','Proving correctness of a program that calculates the histogram of a part of some input matrix.',1,48,25,NULL,'2017-06-15'),
	(38,2,1,NULL,'Summation kernel (version 1)','carp/summation-kernel-0.pvl','Verification of a GPU kernel program, encoded in PVL, that sums the elements of an input array.',1,28,10,38449,'2017-06-15'),
	(39,2,1,NULL,'Summation kernel (version 2)','carp/summation-kernel-1.pvl','Verification of a GPU kernel program, encoded in PVL, that sums the elements of an input array.',1,64,23,75863,'2017-06-15'),
	(40,2,4,NULL,'Summation reduction','carp/summation.c','Verification of a reduction pattern (summation in this case) of an array of floats.',1,NULL,NULL,NULL,'2017-06-15'),
	(41,2,1,NULL,'Array clearing kernel','carp/zero-kernel.pvl','GPU kernel, implemented in PVL, that \"clears\" an array by setting each element to zero. This verification example is currently disabled due to refactoring of the backends (from Chalice to Silicon).',0,8,2,NULL,'2017-06-15'),
	(42,2,4,NULL,'Array clearing in C (succeeding)','carp/zero-loop.c','Verification example in which an array of integers is \"cleared\" by assigning 0 to each of its elements. ',1,17,7,NULL,'2017-06-15'),
	(43,2,4,NULL,'Submatrix clearing','carp/zero-sub-matrix.c','Clears the content of a submatrix by setting all elements to 0. ',1,29,17,NULL,'2017-06-15'),
	(44,2,4,NULL,'Annotating function declarations in C','clang/c-example-use.c','This verification example shows a \".h\" file with an annotated function declaration, and a \".c\" file that contains the implementation of the header file. We verify that the implementing method adheres to the contract. See also c-example.h and (c-example-impl.c for the implementation).',1,10,2,NULL,'2017-06-15'),
	(45,2,2,NULL,'Overloading in Java','classes/Overloading.java','Verifying overloaded methods in Java.',1,30,5,26375,'2017-06-15'),
	(46,3,2,NULL,'Incrementing with Dafny (succeeding)','dafny/DafnyIncr.java','A simple program where a shared integer is incremented by one. Dafny is used as backend for this example, so permission annotations are not needed. Note that support for Dafny is still very limited.',1,20,4,NULL,'2017-06-15'),
	(47,3,2,NULL,'Incrementing with Dafny (failing)','dafny/DafnyIncrE1.java','Verification example where a single shared variable is incremented by one. The example fails, since a \"modifies\" clause is missing in the specification.',0,19,3,NULL,'2017-06-15'),
	(48,2,5,NULL,'Domain of floats','domains/float.sil','This verification example contains a domain of floats, together with a testing method that uses the floats.',1,58,5,25844,'2017-06-15'),
	(49,2,5,NULL,'Domain of lists','domains/list.sil','This verification example contains a (Silver) domain of lists and some example code that uses its axioms.',1,23,3,17396,'2017-06-15'),
	(50,2,5,NULL,'Domain of option types','domains/option.sil','This verification example contains a (Silver) domain for option types, as well as a testing method that use the axioms.',1,31,3,14928,'2017-06-15'),
	(51,2,1,NULL,'Constructor error','errors/constructor_requires_this.pvl','A failing verification example due to a constructor that requires a certain (impossible) state.',0,11,3,7279,'2017-06-15'),
	(52,2,1,NULL,'Not-a-location error (case 1)','errors/not_a_location1.pvl','Failing verification example since reading permissions are required on something that is not a field (but an input parameter). Assuming that the class \"C\" has a field \"f\", then requiring \"Value(arg.f)\" would have been correct.',1,7,1,1129,'2017-06-15'),
	(53,2,1,NULL,'Not-a-location error (case 2)','errors/not_a_location2.pvl','Failing verification example since writing permissions are required on something that is not a field. Assuming that the class \"C\" would have a field \"f\", then requiring \"Perm(arg.f,1)\" would have been correct.',1,7,1,1426,'2017-06-15'),
	(54,2,1,NULL,'Type error (case 1)','errors/type_error_1.pvl','Failing example due to an assertion \"assert e1 == e2\" where the expressions \"e1\" and \"e2\" have incompatible types (in this case \"e1\" is of type integer and \"e2\" of type boolean).',1,7,1,1056,'2017-06-15'),
	(55,2,1,NULL,'Type error (case 2)','errors/type_error_2.pvl','Failing verification example due to the use of a quantifier \"(\\forall decl; e1; e2)\" where \"e2\" is of type resource instead of type boolean. For resources the separation-quantified version (\\forall*) of the forall quantifier should be used instead.',1,10,1,999,'2017-06-15'),
	(56,2,2,NULL,'Counting test','floats/TestCount.java','This verification example demonstrates summation patterns, that is, the use of \"\\sum\" expressions to calculate summations over sequences. The program contains both passing and failing verification cases.',1,44,21,39674,'2017-06-16'),
	(57,2,2,NULL,'Float summations','floats/TestFloat.java','This verification example contains summations (i.e. the use of \"\\sum\" expressions) over sequences of floats. Both passing and failing cases are included.',1,89,32,57872,'2017-06-16'),
	(58,2,2,NULL,'Histogram with summations','floats/TestHist.java','Verification example of a method that calculates the histogram of an input array `a`. Summation patterns (i.e. the use of \"\\sum\" expressions) are used in the verification.',1,34,15,71529,'2017-06-16'),
	(59,1,1,NULL,'Fork/join updates','forkjoin/update-point.pvl','Two threads that concurrently attempt to increase the values `p.x` and `p.y`, respectively, of an object `p` of type Point. The shared state can be splitted into two: one thread having writing permission to `p.x` and the other thread to `p.y`. ',1,47,5,7551,'2017-06-16'),
	(60,2,2,NULL,'No-send-after-read','futures/NoSendAfterRead.java','This verification example covers a common security property: a secure device does not send out data when it received privacy-sensitive information. Model-based abstraction is used to verify that the program adheres to a process algebra abstraction, which does not perform a \'send\' action after receiving privacy-sensitive information.',1,127,66,25291,'2017-06-16'),
	(61,2,1,NULL,'Parallel GCD','futures/ParallelGCD.pvl','In this example a concurrent GCD algorithm is proven correct, meaning that after the algorithm terminates it has calculated the GCD of the two input values. The verification is done by using model-based abstraction. A process algebraic model of the GCD algorithm is defined and we prove that the program adheres to this abstraction. By analysing the process algebra term we finally verify that the program calculates the correct GCD. ',1,80,37,24919,'2017-06-16'),
	(62,2,1,NULL,'Simple model abstraction','futures/TestFuture.pvl','Very simple verification example with model-based abstraction. A process algebraic model is created that is able to perform a single action: \"step\", which increments some shared variable by one. We verify that this is a valid abstraction of a program that increases some shared value by one.',1,57,20,24786,'2017-06-16'),
	(63,2,1,NULL,'Model-abstraction permissions','futures/TestFuturePerms.pvl','To establish links/simulations between programs and their abstractions, multiple kinds of points-to predicates are used. This verification example tests the behaviour of these predicates via multiple methods, some of which are failing and some succeeding.',1,80,29,25171,'2017-06-16'),
	(64,2,1,NULL,'Model-based reasoning: concurrent counting ','futures/counteradd_2.pvl','An example verification program with concurrent counting: two threads that concurrently decrement a shared counter. The verification uses model-based abstraction/reasoning.',1,46,13,27905,'2017-06-19'),
	(65,2,1,NULL,'Model-based reasoning: generalised concurrent counting ','futures/counteradd_n.pvl','Verification example with `n` threads, each decrementing a shared variable. This verification problem shows that our model-based abstraction approach can be applied to applications that spawn a dynamic number of threads. ',1,91,26,27905,'2017-06-19'),
	(66,2,1,NULL,'Model-based reasoning: locking protocol','futures/locking.pvl','Verification example where model-based reasoning is used to verify that the program adheres to a certain locking protocol.',1,80,36,25560,'2017-06-19'),
	(67,2,1,NULL,'Model-based reasoning: unequal counting','futures/unequalcounting.pvl','A variant on the verification example of concurrent counting: two threads that concurrently decrement a shared value, but with unequal amounts. ',1,52,19,19881,'2017-06-19'),
	(68,2,1,NULL,'Verifying goto (failing)','goto/goto1.pvl','Failing verification example in which a program is verified that uses goto\'s and labels. ',0,14,2,18043,'2017-06-19'),
	(69,2,1,NULL,'Verifying goto (succeeding)','goto/goto2.pvl','Verifying example with goto\'s and labels. We verify a program with goto\'s to skip certain code fragments, and show that these fragments do not update the code in some way.',1,16,2,17038,'2017-06-19'),
	(70,2,1,NULL,'History-based reasoning: correctness checking (PVL)','histories/History.pvl','A failing verification case in which the correctness of processes and axioms is checked, in the context of history-based reasoning. Currently this example does not verify due to refactoring of VerCors.',1,51,15,27045,'2017-06-19'),
	(71,2,2,NULL,'History-based reasoning: incrementing','histories/HistoryAppl.java','Very simple verification example with histories: recording a single update (increment) to a shared integer. ',1,30,14,25575,'2017-06-19'),
	(72,2,2,NULL,'History-based reasoning: correctness checking (Java)','histories/HistoryJava.java','Verification example in Java where there correctness of defined processes and axioms is verified.',1,33,16,25575,'2017-06-19'),
	(73,2,2,NULL,'History-based reasoning: loops','histories/HistoryLoop.java','Verification example with history-based reasoning in which the actions in a loop are recorded. In particular, this verification example shows how histories are maintained in loop invariants.',1,41,18,27045,'2017-06-19'),
	(74,2,1,NULL,'History-based reasoning: incrementing','histories/TestHist.pvl','Simple verification example where history-based reasoning is used to capture the incrementation of a shared variable.',1,23,7,23867,'2017-06-19'),
	(75,1,2,NULL,'Parallel Fibonacci','inheritance/Fibonacci.java','Verifying a parallel Fibonacci algorithm implemented in Java. The algorithm spawns two threads capturing the left and right recursive invocation of Fibonacci. ',1,48,19,NULL,'2017-06-19'),
	(76,2,2,NULL,'Java threading','inheritance/SimpleThreadMain.java','Simple example verification with Java threads. A simple thread (extending from java\'s Thread class) is forked and later joined. The thread increments a shared integer by one, which is asserted on after joining. Note, this verification example covers more than one file; \'SimpleThreadMain.java\' is merely the main file.',1,25,10,25841,'2017-06-19'),
	(77,2,1,NULL,'Function problem','known-problems/FunctionProblem.pvl','This verification example passes, but produces a Silver warning that \"abstract predicates cannot be (un)folded\". VerCors does however not report this error.',1,12,5,17104,'2017-06-19'),
	(78,2,2,NULL,'Array problems (case 2)','known-problems/array-problem-2.java','Simple verification example in which reading permissions (that is, `Value` predicates) for arrays are tested.',1,31,11,33001,'2017-06-19'),
	(79,2,1,NULL,'Array problems (case 1)','known-problems/array-problem.pvl','Verification example in which known problems and challenges of VerCors (and the back-ends) are tested. In this case, we assert properties of functions (specified via function interfaces, without implementation) that generate sequences from arrays.',1,74,25,37801,'2017-06-19'),
	(80,2,2,NULL,'Layered verification approach','layers/HistoryApplication.java','This verification example demonstrates a layered verification approach, where the functional properties of the program are verified via history-based reasoning (that is, recording the changes to a certain shared states as a process algebra). ',1,318,96,NULL,'2017-06-19'),
	(81,1,2,NULL,'Verifying Java 6 Lock','layers/Java6Lock.java','In this verification example several functions of the Java 6 lock are verified.',1,218,97,NULL,'2017-06-19'),
	(82,2,2,NULL,'Verifying a queue','layers/LFQ.java','Verification example in which certain operations on a Queue are verified. The verification example also shows the use of methods/functions as lemmas to do certain parts of the proof.',1,210,80,39824,'2017-06-19'),
	(83,2,2,NULL,'History-based reasoning: verifying a queue','layers/LFQHist.java','In this verification example a queue implementation is verified. History-based reasoning is applied to capture the behaviour of the queue, in which the queue is abstracted as a sequence. After using the queue the (process algebraic) history is analysed to see how the shared state has changed.',1,317,150,52104,'2017-06-20'),
	(84,2,1,NULL,'Linked list','lists/linkedlist.pvl','Verifying several operations (e.g. append, clone, concatenate, prepend, etc.) on a linked list structure. ',1,215,98,NULL,'2017-06-20'),
	(85,2,1,NULL,'Bad typing (Java)','manual/BadType.java','Failing verification example with a bad type: a fractional permission `p` that is not \"write\" (e.g. `1`) nor \"read\" (e.g. `0 < p < 1`) nor \"none\" (e.g. `p = none`).',1,10,2,1241,'2017-06-20'),
	(86,2,1,NULL,'Bad typing (PVL)','manual/BadType.pvl','Failing verification example with a bad type: a fractional permission `p` that is not \"write\" (e.g. `1`) nor \"read\" (e.g. `0 < p < 1`) nor \"none\" (e.g. `p = none`).',1,10,2,1427,'2017-06-20'),
	(87,2,1,NULL,'Owicki-Gries','manual/OwickiGries.pvl','Classical Owicki-Gries verification example: forking two threads that write to a shared location.',1,16,1,21137,'2017-06-20'),
	(88,2,1,NULL,'Array properties','manual/array.pvl','is example show how to prove functional properties about the contents of arrays using notation that avoids the problem with functions ensuring quantified properties about quantified permissions.',1,28,15,36405,'2017-06-20'),
	(89,1,2,NULL,'Exponentials','manual/exp.pvl','This verification example shows how to verify code with exponentials (that is, code that uses the binary `^^` operator). This example currently does not verify (not quite sure if it ever did).',0,21,6,NULL,'2017-06-20'),
	(90,2,1,NULL,'Parallel Fibonacci (PVL)','manual/fibonacci.pvl','Verifying parallel Fibonacci, with fork/join parallelism.',1,24,4,20655,'2017-06-20'),
	(91,2,1,NULL,'Fork/join states','manual/fork.pvl','Several test methods that assert the state of forked/joined threads. Threads can either be \"idle\" or \"running\", depending on whether they are joined or not.',1,37,8,14326,'2017-06-20'),
	(92,2,2,NULL,'Functions and resources','manual/functions.pvl','Simple verification example where the contract of a function invocation relies on resources and functional interfaces.',1,22,9,19439,'2017-06-20'),
	(93,2,1,NULL,'Induction lemma (succeeding)','manual/induction-lemma.pvl','A lemma, written out as a PVL function, that applies induction on the length of an input list.',1,18,4,19162,'2017-06-20'),
	(94,2,1,NULL,'Induction lemma (failing)','manual/induction-problem.pvl','This program targets the same problem as in the \"Induction lemma (succeeding)\" example, but does not use induction internally. As a result, the property of interest cannot be proven.',1,7,2,13093,'2017-06-20'),
	(95,1,2,NULL,'Linked list properties','manual/list.pvl','In this verification problem several properties of linked lists are verified. This is done via abstraction to sequences and asserting certain properties over these sequences.',1,30,11,22981,'2017-06-20'),
	(96,2,1,NULL,'Loop invariants','manual/loop.pvl','Very simple verification example in which a loop invariant is used to prove correctness of a single while-loop (provided that it terminates).',1,16,7,18319,'2017-06-20'),
	(97,1,2,NULL,'Option types','manual/option.pvl','In this verification example several properties on option types are asserted. Note that `None` cannot be type checked. Type inference is needed and is only implemented for assignment (`=`), and the equality operators (`!=` and `==`).',1,16,4,24931,'2017-06-20'),
	(98,2,1,NULL,'Input/output parameters (failing)','manual/parameters1.pvl','Function contracts allow for input- and output parameters, in this case a fractional permission. In this verification example a (unsuccessfully) verify passing input parameters to functions. The verification fails, since the output parameter is not used (i.e. arbitrary).',1,17,4,14438,'2017-06-20'),
	(99,2,1,NULL,'Input/output parameters (succeeding)','manual/parameters2.pvl','Function contracts allow for input- and output parameters, in this case a fractional permission. The `drop` function takes as input a fractional permission `p` and gives as output a fractional permission `q` that is at most `p` (so that `q <= p`). This verification example shows how to handle such input/output parameters.',1,18,4,14523,'2017-06-20'),
	(100,1,1,NULL,'Witness encoding','manual/witness.pvl','This short verification example shows how witness encodings work. This program verifies using Chalice. Witnesses are less needed in Silver, since predicates may have arguments in Silver. However, witnesses still should be used with magic wands.',1,30,12,9238,'2017-06-20'),
	(101,2,1,NULL,'Zero Array (PVL)','manual/zero_array.pvl','Simple verification example in which an array is \"cleared\" (all its elements set to `0`) using a while-loop. This example shows the use of quantified permissions and iteration contracts.',1,17,7,29037,'2017-06-20'),
	(102,2,3,NULL,'Incrementing in OpenCL','opencl/opencl_incr.c','Simple OpenCL kernel that increments a single element of a shared array. This verification example shows that VerCors is capable of verifying actual OpenCL kernel code.',1,14,3,NULL,'2017-06-20'),
	(103,2,4,NULL,'OpenMP: SIMD programs','openmp/add-spec-simd.c','Simple SIMD program written in OpenMP for C, where several arrays are read and written in parallel. We verify that the `#pragma` annotations are correct, meaning that the parallelised version of this program has the same functional meaning as the sequential program.',1,53,13,NULL,'2017-06-20'),
	(104,2,4,NULL,'OpenMP: Loop fusion','openmp/add-spec.c','This verification example demonstrates how two loops that must be fused to be race free can be specified and verified.',1,62,15,NULL,'2017-06-20'),
	(105,2,1,NULL,'OpenMP: Vector addition (PVL)','openmp/addvec1.pvl','Simple test case for a vector block. Note that vector blocks do not require iteration contracts.',1,17,8,25018,'2017-06-20'),
	(106,2,1,NULL,'OpenMP: SIMD translation','openmp/addvec2.pvl','A handwritten translation of a SIMD loop (in the context of OpenMP) to PVL.',1,26,14,33918,'2017-06-20'),
	(107,2,4,NULL,'OpenMP: Array copying','openmp/copy-spec.c','A simple OpenMP program that performs an array copy in parallel (via parallel for-loops, annotated with pragmas). ',1,54,8,NULL,'2017-06-20'),
	(108,2,4,NULL,'OpenMP: Thread identifiers','openmp/init-spec.c','Verification problem in which the elements of an array `a` are updated, and the update depends o thread identifiers. Currently this example does not verify, since `omp_get_thread_num` is not supported (that is, the OpenMP function that gives the identifier of the calling thread).',0,40,9,NULL,'2017-06-20'),
	(109,2,1,NULL,'Statically-scoped parallelism','openmp/parallel-example1.pvl','Simple PVL program that contains several `par` blocks, thereby allowing statically-scoped parallelism.',1,28,7,40474,'2017-06-20'),
	(110,2,1,NULL,'OpenMP: Vector addition (single)','openmp/parvec.pvl','Simple verification test case with a single vectorised loop. We verify that after executing the loop every element of the array has its value increased by one.',1,14,3,25708,'2017-06-20'),
	(111,2,4,NULL,'OpenMP: Parallel sections (failing)','openmp/sections-reduced-fail.c','Demonstrates how two loops that must be fused to be race free can be specified and verified.',1,106,22,NULL,'2017-06-20'),
	(112,2,4,NULL,'OpenMP: Parallel sections (succeeding)','openmp/sections-reduced.c','Demonstrates how two loops that must be fused to be race free can be specified and verified.',1,106,22,NULL,'2017-06-20'),
	(113,2,4,NULL,'OpenMP: Sum reduction','openmp/sum-spec.c','This example shows correct openMP code, but is difficult to encode into PVL. The problem is that there are len logical thread that are mapped to an unknown number of physical threads. The local variables tmp are physical thread-local variables. They satisfy the invariant that the sum of all tmp variables is the sum of the processed array elements.',1,37,2,NULL,'2017-06-20'),
	(114,2,4,NULL,'OpenMP: Array blanking','openmp/zero-spec.c','Using a parallel for loop in OpenMP to blank an array.',1,39,8,NULL,'2017-06-20'),
	(115,2,1,NULL,'Barrier with atomics','parallel/array_par.pvl','This simple PVL program contains a parallel for-loop with a barrier to redistribute permissions and an atomic increase of an integer.',1,30,12,38027,'2017-06-20'),
	(116,2,1,NULL,'Block parallelism','parallel/block-par.pvl','Simple PVL program with parallel blocks (that is, code blocks with statically-scoped parallelism), incrementing two variables, `x` and `y`. We verify that, after the parallel blocks have executed, the result of the shared state is (observably) unchanged.',1,21,5,13157,'2017-06-20'),
	(117,2,1,NULL,'Invariants and atomics','parallel/inv-test.pvl','This is a example verification case with atomic blocks and resource invariants, in the style of CSL. This file contains several methods, some of which verify and some not.',1,55,9,23064,'2017-06-20'),
	(118,2,1,NULL,'Parallel Block: Blanking','parallel/zero-many.pvl','Simple verification example case where multiple sorts of data structures are \"blanked\" (that is, `0` is assigned to each element); first a single variable, then an array, and finally a matrix. All three sorts are connected via consecutive parallel blocks.',1,36,17,53406,'2017-06-20'),
	(119,1,2,NULL,'Permissions: Bad loop (failing case 1)','permissions/BadLoop1.java','Simple verification example case with permissions. A shared variable `val` is updated in a loop, but the order of the clauses in the loop invariant do matter here. This example is failing, since the `Perm(val,100)` invariant clause needs to be placed before the `val+tmp==\\old(val)+n && tmp>0` clause.',1,16,4,8266,'2017-06-20'),
	(120,1,2,NULL,'Permissions: Bad loop (failing case 2)','permissions/BadLoop2.java','Simple verification example case where a shared variable `val` is updated inside a while-loop. This example fails, since the update to `val` can not be done: there is no permission to write to `val`.',1,15,3,8028,'2017-06-20'),
	(121,1,2,NULL,'Single-threaded counting','permissions/Counter.java','This example shows a single-threaded Counter class with several methods (both static and dynamic) to increase the counter. We verify that the different ways to increase `val` are functionally correct and do not have races.',1,43,10,8775,'2017-06-20'),
	(122,1,2,NULL,'Single-threaded incrementing','permissions/Incr.java','Several methods to increment a shared variable `val`, some of which verify and some do not (due to wrong/incomplete specification).',1,42,10,8579,'2017-06-20'),
	(123,1,2,NULL,'Permissions: multi-increment','permissions/MultiIncrement.java','Java class with several methods (some static and some dynamic) to increase a shared integer called `shared`. ',1,93,20,12463,'2017-06-20'),
	(124,1,2,NULL,'Permissions: Roster (fixed)','permissions/RosterFixed.java','The verification example on page 42 of Clement Hurlin\'s PhD thesis. The example is a linked list representing grades (in a Roster). The roster has functionality to upgrade grades. We verify that these functions are correct.',1,61,23,8679,'2017-06-20'),
	(125,1,2,NULL,'Permissions: Integer swapping','permissions/SwapInteger.java','Method for swapping the values of two shared integers `F` and `G`. Other methods are included that use the swapping method, some of which verify and some do not.',1,37,9,6482,'2017-06-20'),
	(126,1,2,NULL,'Permissions: Long swapping','permissions/SwapLong.java','Same problem as the \"integer swapping\" example, but now the content of two shared `long`\'s are swapped. Methods are included that make use of the swapping method, some of which verify and some do not.',1,37,9,9023,'2017-06-20'),
	(127,1,2,NULL,'Permissions: Binary search tree','permissions/TreeStack.java','Verifying a binary search tree with `del_min` operation. Note that only the access permissions are verified (implying that the program is memory safe). Functional properties are not yet checked.',1,114,47,13682,'2017-06-20'),
	(128,1,1,NULL,'Permissions: Boxing','permissions/box.pvl','Very simple verification case where a `Perm` predicate is transformed into a `PointsTo` predicate, after assignment of a value to the reference protected by the predicate.',1,16,5,8522,'2017-06-20'),
	(129,1,2,NULL,'Predicates: Linked integer list','predicates/IntegerList.java','Using predicates to abstract a linked list of integers.  Several (static) methods are provided that use the linked list structure, and on the specification level its abstraction.',1,89,46,11332,'2017-06-20'),
	(130,1,2,NULL,'Predicates: Tree traversal','predicates/TreeRecursive.java','A tree data structure implemented in Java, together with a recursive method `del_min` that deletes the smallest value from the tree. The state of the tree is represented as a `state()` predicate. We verify that `del_min` is correct.',1,42,19,6864,'2017-06-20'),
	(131,1,2,NULL,'Predicates: Min-max list','predicates/minmax-list.pvl','Verifying a min/max list: a linked list of integers with all integers in a certain range (where the range is determined by some `min` and `max`). The property of being a min/max list is captured as a pure function `minmax`. We verify that a fresh list is a min/max list when inserting a variable within some range.',1,33,8,10631,'2017-06-20'),
	(132,2,2,NULL,'Refute: require false','refute/Sat.java','Very simple verification case that applies both `requires true` and `requires false` in contracts of methods.',1,15,6,19776,'2017-06-20'),
	(133,2,2,NULL,'Refute: unsatisfiable','refute/Unsat.java','Simple verification example of a method with a precondition that is unsatisfiable.',1,7,3,17828,'2017-06-20'),
	(134,2,1,NULL,'Refute: bad framing','refute/frame_error_1.pvl','This example complains about the body of the `frame_error` method being unreachable due to the fact that its contract is mal-formed.',1,6,1,17853,'2017-06-20'),
	(135,2,2,NULL,'Refute: refuting (case 1)','refute/refute1.java','Simple verification where we refute false (as a reachable specification construct).',1,8,4,16804,'2017-06-20'),
	(136,2,2,NULL,'Refute: refuting (case 2)','refute/refute2.java','The refute statement is not reachable, therefore it is invalid.',1,12,4,18487,'2017-06-20'),
	(137,1,2,NULL,'Refute: refuting (case 3)','refute/refute3.java','The refute statement is reachable, therefore it is valid. However, the post-conditions is wrong.',1,12,5,16700,'2017-06-20'),
	(138,2,2,NULL,'Refute: refuting (case 4)','refute/refute4.java','The refute statement is reachable, therefore it is valid.',1,14,5,16798,'2017-06-20'),
	(139,1,2,NULL,'Refute: refuting (case 5)','refute/refute5.java','The refute statement is not reachable, because an error occurs before it.',1,14,6,17653,'2017-06-20'),
	(140,5,2,NULL,'Boogie: Example 1','sequential/BoogieExample.java','Verification example with the Boogie back-end. Some support for Boogie is available, however Boogie is not shipped with the VerCors distribution.',1,35,7,3999,'2017-06-20'),
	(141,5,2,NULL,'Boogie: Example 2','sequential/BoogieTest.java','Example program with the Boogie back-end verifier. Several methods are included to verify, some of which actually verify and some do not (due to invalid/wrong method contracts).',1,41,13,3793,'2017-06-20'),
	(142,5,2,NULL,'Boogie: Global variables','sequential/BoogieWithGlobals.java','Example program to test verification with global variables with the Boogie back-end verifier. ',1,14,4,2585,'2017-06-20'),
	(143,5,2,NULL,'Boogie: Loop invariants','sequential/LoopInv.java','Verification example to test loop invariants with the Boogie back-end verifier.',1,31,8,2702,'2017-06-20'),
	(144,5,2,NULL,'Boogie: Simple increment','sequential/SimpleExamples.java','Very simple example problem with a method that increments the given argument by one. Boogie is used as the back-end verifier for this problem.',1,9,1,2108,'2017-06-20'),
	(145,5,1,NULL,'Boogie: Example 1 (PVL)','sequential/boogie-example.pvl','Sequential program verified correct by using the Boogie back-end verifier.',1,27,3,2306,'2017-06-20'),
	(146,5,2,NULL,'Boogie: Example 2 (PVL)','sequential/loopinv-pvl.pvl','Simple sequential program with while-loops and loop invariants, proven correct using the Boogie back-end verifier.',1,31,8,3229,'2017-06-20'),
	(147,5,2,NULL,'Boogie: Nested loops','sequential/nested-loops.pvl','Sequential verification example with nested while-loops. This example is proven correct using the Boogie back-end verifier.',1,21,4,2472,'2017-06-20'),
	(148,1,2,NULL,'Synchronisers: CountDownLatch','synchronizers/CountDownLatch.java','Verifying a Java implementation of a countdown latch. The verification uses witness encoding and handles atomic operations (CAS, axiomatised). ',1,101,60,19712,'2017-06-21'),
	(149,1,2,NULL,'Synchronisers: ReentrantLock','synchronizers/ReentrantLock.java','In this example case a re-entrant lock, implemented in Java, is verified. An atomic integer is used as the synchroniser.',1,140,81,20853,'2017-06-21'),
	(150,1,2,NULL,'Synchronisers: Semaphore','synchronizers/Semaphore.java','Verifying a semaphore. implemented in Java, that uses an atomic integer internally as synchroniser. ',1,99,50,19169,'2017-06-21'),
	(151,2,2,NULL,'Alias testing (case 1)','technical/test-value1.java','A very small test case in which we assert that two input parameters might be equal (even though their contents is separated by a separating conjunction).',1,16,5,17142,'2017-06-21'),
	(152,5,2,NULL,'Alias testing (case 2)','technical/test-value2.java','A very small test case in which we assert that two input parameters might be equal (even though their contents is separated by a separating conjunction).',1,17,6,19403,'2017-06-21'),
	(153,2,2,NULL,'Fork/join incrementing (succeeding)','threads/VerifiedMain.java','Simple fork/join program where the forked thread increments a shared counter by one. We verify that after joining the threads the shared value has indeed been increased by one.',1,14,5,NULL,'2017-06-21'),
	(154,2,2,NULL,'Fork/join incrementing (failing 1)','threads/VerifiedMain-E1.java','Simple fork/join program where the forked thread increments a shared counter by one. We intend this verification example to fail, as we inserted an incorrect assertion (that checks  whether the state has not been changed).',1,18,5,NULL,'2017-06-21'),
	(155,2,2,NULL,'Fork/join incrementing (failing 2)','threads/VerifiedMain-E2.java','Simple fork/join program where the forked thread increments a shared counter by one. We intend this verification example to fail, as we do not unfold the \"postjoin\" predicate that contains information on the shared state after the thread has been joined.',1,13,4,NULL,'2017-06-21'),
	(156,5,2,NULL,'Type casting','type-casts/CastExample.java','This example shows how a binary tree with internal <code>Node</code> and <code>Leaf</code>s can be specified if access is by means of casting rather than through a visitor pattern.',1,62,25,24206,'2017-06-21'),
	(157,2,2,NULL,'Using \\instanceof and \\typeof','type-casts/TypeExample1.java','This file show how the syntax for stating that an object is an instance of a specific class (\\typeof) works. It is future work to make sure that the knowledge that this is an instance of C is automatically added.',1,14,5,20082,'2017-06-21'),
	(158,2,1,NULL,'VerifyThis: Least common prefix','verifythis/lcp.pvl','Verification challenge from VerifyThis: finding the least-common prefix of an array starting from two given indices.',1,25,13,NULL,'2017-06-21'),
	(159,2,1,NULL,'VerifyThis: Relaxed prefix','verifythis/prefix.pvl','Verification challenge from the VerifyThis competition: checking whether some given pattern is a _relaxed prefix_ if a given array. With being a _relaxed prefix_ we mean being a prefix when removing at most one element (from the pattern).',1,43,18,NULL,'2017-06-21'),
	(160,2,1,NULL,'Verifying wait-notify patterns','waitnotify/Queue.pvl','Verifying a wait/notify concurrency pattern, in the context of two workers/threads that concurrently operate on a shared Queue. When working on the queue all other threads have to _wait_ for completion, and when the working threads has finished it _notifies_ all other waiting threads.',1,25,4,22453,'2017-06-21'),
	(161,1,2,NULL,'Witnesses: CounterState','witnesses/CounterState.java','Verification of a Counter class that contains a single shared integer as field, and several methods that increase the counter in different ways. In particular, this verification example demonstrates the use of resource predicates and witnesses to do the verification.',1,141,76,16770,'2017-06-21'),
	(162,1,2,NULL,'Witnesses: Getters','witnesses/Getters.java','This example shows how to use getters in combination with the witness encoding of predicates with arguments. When calling the tool on this file, the verification result should be a _Pass_.',1,58,32,NULL,'2017-06-21'),
	(163,2,2,NULL,'Witnesses: List appending (magic wand)','witnesses/ListAppend.java','This example shows how to use the _given_ keyword to pass verification level arguments and also how to use a magic wand to prove the iterative implementation of list append correct.',1,108,62,25570,'2017-06-21'),
	(164,2,2,NULL,'Witnesses: List appending (out-of-sync)','witnesses/ListAppendASyncDef.java','In this version, the structuring of the definitions leads to many (un)fold annotations. This is because the recursion used for state and list is one step out of sync. In the inline version this is solved by inlining list and in ListAppend it is solved by using a single list predicate.',1,50,31,13797,'2017-06-21'),
	(165,2,2,NULL,'Witnesses: List appending (inline)','witnesses/ListAppendASyncDefInline.java','This verification example shows the usefulness of the inline modifier.',1,45,25,19592,'2017-06-21'),
	(166,1,2,NULL,'Witnesses: List iterator','witnesses/ListIterator.java','Verifying a list iterator, implemented in Java, using witness encodings. Note that depending on which version of chalice is used, this spec may take a very very long time to check. Also, this example currently does not verify because it must be rewritten.',1,263,162,NULL,'2017-06-21'),
	(167,1,2,NULL,'Witnesses: Roster','witnesses/Roster.java','This verification example targets a _Roster_, implemented as linked list. For more details we refer to page 42 of Clement Hurlin\'s. ',1,90,62,11632,'2017-06-21'),
	(168,2,2,NULL,'Recursive trees: Deleting smallest element','witnesses/TreeRecursiveSilver.java','Verification example in which the smallest element of a tree is recursively removed. ',1,36,19,19860,'2017-06-21'),
	(169,1,2,NULL,'Witnesses: Recursive tree 1 (magic wand)','witnesses/TreeWand-e1.java','This file demonstrates how a magic wand can be used to prove that the deletion of a node from a binary search tree is sound. Beware that this specification can take 5-10 minutes to check. However, this example is disabled (currently does not verify) because it must be rewritten (due to refactoring of several parts of VerCors).',1,107,80,77294,'2017-06-21'),
	(170,1,2,NULL,'Witnesses: Recursive tree 2 (magic wand)','witnesses/TreeWandSilver-e2.java','This file demonstrates how a magic wand can be used to prove that the deletion of a node from a binary search tree is sound.',1,92,67,32031,'2017-06-21'),
	(171,2,2,NULL,'Witnesses: Recursive tree 3 (magic wand)','witnesses/TreeWandSilver.java','This file demonstrates how a magic wand can be used to prove that the deletion of a node from a binary search tree is sound.',1,101,67,78023,'2017-06-21'),
	(172,1,2,NULL,'Witnesses: Twice','witnesses/Twice.java','Example verification case where some abstract function is called twice.',1,25,14,9308,'2017-06-21'),
	(173,1,2,NULL,'Witnesses: Magic wand','witnesses/WandDemo.java','Demo verification example that shows how magic wands can be used in verification.',1,54,31,9605,'2017-06-21'),
	(174,2,2,NULL,'Witnesses: Magic wand (Silver)','witnesses/WandDemoSilver.java','Demo verification example that shows how magic wands can be used in verification (with the Silver backend).',1,51,27,16126,'2017-06-21'),
	(175,1,2,NULL,'Witnesses: Magic wand 2','witnesses/WitnessDemo.java','Simple verification example that shows the use of witnesses and magic wands.',1,57,35,NULL,'2017-06-21'),
	(176,1,2,NULL,'Witnesses: Predicates','witnesses/predicates.pvl','This example shows how reasoning with explicit witnesses works. It is supposed to work with Chalice, but the assertions are not proven.',1,50,25,NULL,'2017-06-21');

/*!40000 ALTER TABLE `Example` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ExampleFeature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ExampleFeature`;

CREATE TABLE `ExampleFeature` (
  `exampleid` int(11) NOT NULL,
  `featureid` int(11) NOT NULL,
  PRIMARY KEY (`exampleid`,`featureid`),
  KEY `idx-examplefeature-exampleid` (`exampleid`),
  KEY `idx-examplefeature-featureid` (`featureid`),
  CONSTRAINT `fk-examplefeature-exampleid` FOREIGN KEY (`exampleid`) REFERENCES `Example` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-examplefeature-featureid` FOREIGN KEY (`featureid`) REFERENCES `Feature` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ExampleFeature` WRITE;
/*!40000 ALTER TABLE `ExampleFeature` DISABLE KEYS */;

INSERT INTO `ExampleFeature` (`exampleid`, `featureid`)
VALUES
	(1,5),
	(1,6),
	(1,7),
	(2,5),
	(2,6),
	(2,9),
	(4,4),
	(4,6),
	(4,7),
	(4,8),
	(5,3),
	(5,6),
	(6,5),
	(6,6),
	(6,9),
	(7,5),
	(7,6),
	(7,7),
	(7,9),
	(8,5),
	(8,6),
	(8,9),
	(9,4),
	(9,6),
	(9,8),
	(10,4),
	(10,6),
	(10,8),
	(11,4),
	(11,6),
	(11,8),
	(12,4),
	(12,6),
	(12,8),
	(13,4),
	(13,6),
	(13,8),
	(14,4),
	(14,6),
	(14,8),
	(15,4),
	(15,6),
	(15,8),
	(16,5),
	(16,6),
	(17,10),
	(17,11),
	(18,10),
	(18,11),
	(18,12),
	(19,10),
	(19,11),
	(19,12),
	(20,10),
	(20,11),
	(21,10),
	(21,11),
	(22,10),
	(22,11),
	(22,12),
	(23,10),
	(23,11),
	(26,1),
	(26,2),
	(26,3),
	(32,5),
	(32,6),
	(33,7),
	(34,4),
	(34,6),
	(34,8),
	(34,9),
	(35,5),
	(35,6),
	(35,9),
	(36,5),
	(36,6),
	(36,7),
	(37,5),
	(37,6),
	(37,7),
	(38,4),
	(38,5),
	(38,6),
	(39,4),
	(39,5),
	(39,6),
	(39,8),
	(39,9),
	(39,10),
	(40,3),
	(40,5),
	(40,6),
	(40,13),
	(40,14),
	(41,4),
	(41,6),
	(42,5),
	(42,6),
	(43,5),
	(43,6),
	(43,7),
	(48,3),
	(48,14),
	(49,15),
	(50,16),
	(56,3),
	(56,6),
	(56,13),
	(57,3),
	(57,6),
	(57,13),
	(57,14),
	(58,3),
	(58,6),
	(58,13),
	(59,17),
	(60,19),
	(61,19),
	(61,20),
	(61,21),
	(62,19),
	(63,19),
	(64,19),
	(64,20),
	(64,21),
	(65,17),
	(65,19),
	(65,20),
	(66,10),
	(66,19),
	(67,17),
	(67,20),
	(67,21),
	(68,22),
	(69,22),
	(70,18),
	(71,18),
	(72,18),
	(73,18),
	(74,18),
	(75,11),
	(75,17),
	(76,11),
	(76,17),
	(78,6),
	(79,3),
	(79,6),
	(80,6),
	(80,18),
	(81,6),
	(81,10),
	(81,12),
	(82,10),
	(82,15),
	(83,3),
	(83,10),
	(83,18),
	(84,3),
	(84,15),
	(87,12),
	(87,17),
	(88,3),
	(88,6),
	(90,17),
	(91,17),
	(93,3),
	(94,3),
	(95,3),
	(95,15),
	(96,23),
	(97,16),
	(100,11),
	(101,6),
	(101,23),
	(101,24),
	(102,4),
	(102,6),
	(103,5),
	(103,6),
	(103,9),
	(103,24),
	(103,25),
	(104,5),
	(104,6),
	(104,24),
	(104,25),
	(105,6),
	(105,24),
	(105,26),
	(106,5),
	(106,6),
	(106,9),
	(106,24),
	(106,26),
	(107,5),
	(107,6),
	(107,9),
	(107,24),
	(107,25),
	(108,5),
	(108,6),
	(108,9),
	(108,24),
	(108,25),
	(109,5),
	(109,6),
	(109,21),
	(109,24),
	(110,6),
	(110,24),
	(110,26),
	(111,5),
	(111,6),
	(111,9),
	(111,24),
	(111,25),
	(112,5),
	(112,6),
	(112,9),
	(112,24),
	(112,25),
	(113,6),
	(113,13),
	(113,25),
	(114,5),
	(114,6),
	(114,24),
	(114,25),
	(115,6),
	(115,8),
	(115,9),
	(115,10),
	(115,20),
	(115,21),
	(115,24),
	(116,5),
	(116,9),
	(116,21),
	(117,10),
	(117,20),
	(118,5),
	(118,6),
	(118,7),
	(118,21),
	(118,24),
	(119,23),
	(120,23),
	(121,23),
	(122,23),
	(123,23),
	(124,15),
	(127,23),
	(127,27),
	(127,28),
	(129,15),
	(130,3),
	(130,28),
	(131,15),
	(143,23),
	(146,23),
	(147,23),
	(148,10),
	(148,11),
	(148,23),
	(149,10),
	(149,11),
	(149,12),
	(149,23),
	(150,10),
	(150,11),
	(150,23),
	(153,17),
	(154,17),
	(155,17),
	(156,28),
	(158,6),
	(158,23),
	(158,24),
	(159,23),
	(159,24),
	(160,12),
	(160,17),
	(160,23),
	(161,11),
	(161,23),
	(162,11),
	(163,3),
	(163,11),
	(163,15),
	(163,29),
	(164,3),
	(164,15),
	(165,3),
	(165,15),
	(166,11),
	(166,15),
	(166,23),
	(166,29),
	(167,11),
	(168,3),
	(168,28),
	(169,3),
	(169,11),
	(169,28),
	(169,29),
	(170,3),
	(170,11),
	(170,28),
	(170,29),
	(171,3),
	(171,11),
	(171,28),
	(171,29),
	(173,11),
	(173,23),
	(173,29),
	(174,23),
	(174,29),
	(175,11),
	(175,23),
	(175,29),
	(176,11);

/*!40000 ALTER TABLE `ExampleFeature` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Feature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Feature`;

CREATE TABLE `Feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Feature` WRITE;
/*!40000 ALTER TABLE `Feature` DISABLE KEYS */;

INSERT INTO `Feature` (`id`, `name`)
VALUES
	(1,'Bags'),
	(2,'Sets'),
	(3,'Sequences'),
	(4,'GPU Kernels'),
	(5,'Iteration contracts'),
	(6,'Arrays'),
	(7,'Matrices'),
	(8,'Barriers'),
	(9,'Loop parallelisations'),
	(10,'Atomics'),
	(11,'Witnesses'),
	(12,'Locking'),
	(13,'Summation patterns'),
	(14,'Floats'),
	(15,'Lists'),
	(16,'Option types'),
	(17,'Fork/join concurrency'),
	(18,'Histories'),
	(19,'Futures'),
	(20,'Statically-scoped locking'),
	(21,'Statically-scoped parallelism'),
	(22,'Goto'),
	(23,'Loop invariants'),
	(24,'Quantified permissions'),
	(25,'Pragmas'),
	(26,'Loop vectorisation'),
	(27,'Stacks'),
	(28,'Trees'),
	(29,'Magic wands');

/*!40000 ALTER TABLE `Feature` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Language
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Language`;

CREATE TABLE `Language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Language` WRITE;
/*!40000 ALTER TABLE `Language` DISABLE KEYS */;

INSERT INTO `Language` (`id`, `name`)
VALUES
	(1,'PVL'),
	(2,'Java'),
	(3,'OpenCL (kernels)'),
	(4,'OpenMP for C'),
	(5,'Silver');

/*!40000 ALTER TABLE `Language` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;

INSERT INTO `migration` (`version`, `apply_time`)
VALUES
	('m000000_000000_base',1496408983),
	('m170602_130251_create_author_table',1496408988),
	('m170602_131126_create_publication_table',1496409349),
	('m170602_131806_create_publicationauthor_table',1496410042),
	('m170602_133138_create_language_table',1496410465),
	('m170602_133542_create_feature_table',1496410593),
	('m170602_133905_create_backend_table',1496410796),
	('m170602_134149_create_example_table',1497276842),
	('m170602_135615_create_examplefeature_table',1497276842),
	('m170613_122941_add_example_statistics_columns',1497357432),
	('m170615_075036_add_doesverify_column_to_example',1497513483);

/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Publication
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Publication`;

CREATE TABLE `Publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `conference` varchar(255) NOT NULL,
  `year` int(4) NOT NULL,
  `url` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Publication` WRITE;
/*!40000 ALTER TABLE `Publication` DISABLE KEYS */;

INSERT INTO `Publication` (`id`, `title`, `conference`, `year`, `url`)
VALUES
	(2,'Test','NFM',2017,'http://www.google.com');

/*!40000 ALTER TABLE `Publication` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PublicationAuthor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PublicationAuthor`;

CREATE TABLE `PublicationAuthor` (
  `authorid` int(11) NOT NULL,
  `publicationid` int(11) NOT NULL,
  PRIMARY KEY (`authorid`,`publicationid`),
  KEY `idx-publicationauthor-authorid` (`authorid`),
  KEY `idx-publicationauthor-publicationid` (`publicationid`),
  CONSTRAINT `fk-publicationauthor-authorid` FOREIGN KEY (`authorid`) REFERENCES `Author` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk-publicationauthor-publicationid` FOREIGN KEY (`publicationid`) REFERENCES `Publication` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PublicationAuthor` WRITE;
/*!40000 ALTER TABLE `PublicationAuthor` DISABLE KEYS */;

INSERT INTO `PublicationAuthor` (`authorid`, `publicationid`)
VALUES
	(2,2);

/*!40000 ALTER TABLE `PublicationAuthor` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
