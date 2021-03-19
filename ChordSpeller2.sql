Use master
GO

Drop Database If Exists ChordSpeller2

Create Database ChordSpeller2

Use ChordSpeller2

Create Table NoteIntervals(
	Root nvarchar(5) NOT NULL,
	MIN2 nvarchar(5) NOT NULL,
	MAJ2 nvarchar(5) NOT NULL,
	AUG2 nvarchar(5) NOT NULL,
	MIN3 nvarchar(5) NOT NULL,
	MAJ3 nvarchar(5) NOT NULL,
	PER4 nvarchar(5) NOT NULL,
	AUG4 nvarchar(5) NOT NULL,
	DIM5 nvarchar(5) NOT NULL,
	PER5 nvarchar(5) NOT NULL,
	AUG5 nvarchar(5) NOT NULL,
	MIN6 nvarchar(5) NOT NULL,
	MAJ6 nvarchar(5) NOT NULL,
	MIN7 nvarchar(5) NOT NULL,
	MAJ7 nvarchar(5) NOT NULL,
	Constraint PK_Root Primary Key (Root),
)

Insert Into NoteIntervals (Root, MIN2, MAJ2, AUG2, MIN3, MAJ3, PER4, AUG4, DIM5, PER5, AUG5, MIN6, MAJ6, MIN7, MAJ7)
	Values('A', 'Bb', 'B', 'B#', 'C', 'C#', 'D', 'D#', 'Eb', 'E', 'E#', 'F', 'F#', 'G', 'G#'),
	('B', 'C', 'C#', 'Cx', 'D', 'D#', 'E', 'E#', 'F', 'F#', 'Fx', 'G', 'G#', 'A', 'A#'),
	('C', 'Db', 'D', 'D#', 'Eb', 'E', 'F', 'F#', 'Gb', 'G', 'G#', 'Ab', 'A', 'Bb', 'B'),
	('D', 'Eb', 'E', 'E#', 'F', 'F#', 'G', 'G#', 'Ab', 'A', 'A#', 'Bb', 'B', 'C', 'C#'),
	('E', 'F', 'F#', 'Fx', 'G', 'G#', 'A', 'A#', 'Bb', 'B', 'B#', 'C', 'C#', 'D', 'D#'),
	('F', 'Gb', 'G', 'G#', 'Ab', 'A', 'Bb', 'B', 'Cb', 'C', 'C#', 'Db', 'D', 'Eb', 'E'),
	('G', 'Ab', 'A', 'A#', 'Bb', 'B', 'C', 'C#', 'Db', 'D', 'D#', 'Eb', 'E', 'F', 'F#'),
	--sharps
	('A#', 'B', 'B#', 'BX', 'C#', 'Cx', 'D#', 'Dx', 'E', 'E#', 'Ex', 'F#', 'Fx', 'G#', 'Gx'),
	('B#', 'C#', 'Cx', 'C#x', 'D#', 'Dx', 'E#', 'Ex', 'F#', 'Fx', 'F#x', 'G#', 'Gx', 'A#', 'Ax'),
	('C#', 'D', 'D#', 'Dx', 'E', 'E#', 'F#', 'Fx', 'G', 'G#', 'Gx', 'A', 'A#', 'B', 'B#'),
	('D#', 'E', 'E#', 'Ex', 'F#', 'Fx', 'G#', 'Gx', 'A', 'A#', 'Ax', 'B', 'B#', 'C#', 'Cx'),
	('E#', 'F#', 'Fx', 'F#x', 'G#', 'G#x', 'A#', 'Ax', 'B', 'B#', 'Bx', 'C#', 'Cx', 'D#', 'Dx'),
	('F#', 'G', 'G#', 'Gx', 'A', 'A#', 'B', 'B#', 'C', 'C#', 'Cx', 'D', 'D#', 'E', 'E#'),
	('G#', 'A', 'A#', 'Ax', 'B', 'B#', 'C#', 'Cx', 'D', 'D#', 'Dx', 'E', 'E#', 'F#', 'Fx'),
	--flats
	('Ab', 'Bbb', 'Bb', 'B', 'Cb', 'C', 'Db', 'D', 'Ebb', 'Eb', 'E', 'Fb', 'F', 'Gb', 'Gb'),
	('Bb', 'Cb', 'C', 'C#', 'Db', 'D', 'Eb', 'E', 'Fb', 'F', 'F#', 'Gb', 'G', 'Ab', 'A'),
	('Cb', 'Dbb', 'Db', 'D', 'Ebb', 'Eb', 'Fb', 'F', 'Gbb', 'Gb', 'G', 'Abb', 'Ab', 'Bbb', 'Bb'),
	('Db', 'Ebb', 'Eb', 'E', 'Fb', 'F', 'Gb', 'G', 'Abb', 'Ab', 'A', 'Bbb', 'Bb', 'Cb', 'C'),
	('Eb', 'Fb', 'F', 'F#', 'Gb', 'G', 'Ab', 'A', 'Bbb', 'Bb', 'B', 'Cb', 'C', 'Db', 'D'),
	('Fb', 'Gbb', 'Gb', 'G', 'Abb', 'Ab', 'Bbb', 'Bb', 'Cbb', 'Cb', 'C', 'Dbb', 'Db', 'Ebb', 'Eb'),
	('Gb', 'Abb', 'Ab', 'A', 'Bbb', 'Bb', 'Cb', 'C', 'Dbb', 'Db', 'D', 'Ebb', 'Eb', 'Fb', 'F')

Create Table Notes(
	Note nvarchar(5) NOT NULL,
	NumericalValue int NOT NULL,
	Constraint PK_Note Primary Key (Note),
	Constraint FK_Note_NoteIntervals Foreign Key (Note) References NoteIntervals (Root)
)

Create Table NonStandardNotes(
	NonStandardNote nvarchar(5) NOT NULL,
	--NumericalValue int NOT NULL,
	StandardNote nvarchar(5) NOT NULL,
	Constraint PK_WeirdNote Primary Key (NonStandardNote),
	Constraint FK_NonStandardNotes_StandardNote Foreign Key (StandardNote) References Notes(Note)
)

Insert Into Notes (Note, NumericalValue)
	Values('A', 1),
	('A#', 2),
	('Bb', 2),
	('B', 3),
	('Cb', 3),
	('C', 4),
	('B#', 4),
	('C#', 5),
	('Db', 5),
	('D', 6),
	('D#', 7),
	('Eb', 7),
	('E', 8),
	('Fb', 8),
	('F', 9),
	('E#', 9),
	('F#', 10),
	('Gb', 10),
	('G', 11),
	('G#', 12),
	('Ab', 12)

	Insert into NonStandardNotes(NonStandardNote, StandardNote)
	Values('Gx','A'),
	('Bbb','A'),
	('Cbb', 'Bb'),
	('G#x', 'A#'),
	('Ax', 'B'),
	('Dbb', 'C'),
	('Bx', 'C#'),
	('Cx', 'D'),
	('Ebb', 'D'),
	('C#x', 'D#'),
	('Fbb', 'Eb'), 
	('Dx', 'E'),
	('Gbb', 'F'),
	('Ex', 'F#'),
	('Fx', 'G'),
	('Abb', 'G'),
	('F#x', 'G#')


Create Table Intervals(
	IntervalName nvarchar(20) NOT NULL,
	IntervalAbbreviation nvarchar(5) NOT NULL,
	EnharmonicIntervalAbbreviation nvarchar(5),
	Constraint PK_IntervalAbbreviation Primary Key (IntervalAbbreviation),
)

Insert into Intervals(IntervalName, IntervalAbbreviation)
	Values('Minor Second', 'MIN2'),
	('Major Second', 'MAJ2'),
	('Augmented Second', 'AUG2'),
	('Minor Third', 'MIN3'),
	('Major Third', 'MAJ3'),
	('Perfect Fourth', 'PER4'),
	('Perfect Fifth', 'PER5'),
	('Minor Sixth', 'MIN6'),
	('Major Sixth', 'MAJ6'),
	('Minor Seventh', 'MIN7'),
	('Major Seventh', 'MAJ7'),
	('Augmented Fourth', 'AUG4'),
	('Augmented Fifth', 'AUG5'),
	('Diminished Fifth', 'DIM5'),
	('Diminished Seventh', 'DIM7')

Insert into Intervals(IntervalName, IntervalAbbreviation, EnharmonicIntervalAbbreviation)
	Values('Augmented Ninth', 'AUG9', 'AUG2'),
	('Major Ninth', 'MAJ9', 'MAJ2'),
	('Minor Ninth', 'MIN9', 'MIN2'),
	('Minor Tenth', 'MIN10', 'MIN3'),
	('Augmented Eleventh', 'AUG11', 'AUG4'),
	('Perfect Eleventh', 'PER11', 'PER4'),
	('Major Thirteenth', 'MAJ13', 'MAJ6'),
	('Minor Thirteenth', 'MIN13', 'MIN6')

Create Table ChordQualities(
	QualityId int IDENTITY (1,1),
	QualityName nvarchar(15) NOT NULL,
	Abbreviation nvarchar(4) NOT NULL,
	Constraint PK_QualityId Primary Key (QualityId),
)

Insert into ChordQualities(QualityName, Abbreviation)
	Values('Major', 'MAJ'), ('Minor', 'MIN'), ('Diminished', 'DIM'), ('Augmented', 'AUG'), ('Dominant', 'DOM'), ('Suspended', 'SUS')

Create Table Chords(
	ChordSymbol nvarchar(10) NOT NULL,
	ChordName nvarchar(100) NOT NULL,
	QualityId int NOT NULL,
	SecondaryQualityId int,
	NumberOfMembers int NOT NULL,
	Interval1 nvarchar(5) NOT NULL,
	Interval2 nvarchar(5) NOT NULL,
	Interval3 nvarchar(5),
	Interval4 nvarchar(5),
	Interval5 nvarchar(5),
	Interval6 nvarchar(5),
	Nickname nvarchar(100),
	Constraint PK_ChordSymbol Primary Key (ChordSymbol),
	Constraint FK_QualityId Foreign Key (QualityId) References ChordQualities(QualityId),
	Constraint FK_SecondaryQualityId Foreign Key (SecondaryQualityId) References ChordQualities(QualityId),
	Constraint FK_Interval1 Foreign Key(Interval1) References Intervals(IntervalAbbreviation),
	Constraint FK_Interval2 Foreign Key(Interval2) References Intervals(IntervalAbbreviation),
	Constraint FK_Interval3 Foreign Key(Interval3) References Intervals(IntervalAbbreviation),
	Constraint FK_Interval4 Foreign Key(Interval4) References Intervals(IntervalAbbreviation),
	Constraint FK_Interval5 Foreign Key(Interval5) References Intervals(IntervalAbbreviation),
	Constraint FK_Interval6 Foreign Key(Interval6) References Intervals(IntervalAbbreviation)
)

Insert into Chords(ChordSymbol, ChordName, Interval1, Interval2, Interval3, Interval4, Interval5, Interval6, QualityId, SecondaryQualityId, Nickname, NumberofMembers)
	Values('DIM', 'Diminished', 'MIN3', 'DIM5', NULL, NULL, NULL, NULL, 3, NULL, NULL, 3),
	('DIM7', 'Diminished Seventh', 'MIN3', 'DIM5', 'DIM7', NULL, NULL, NULL, 3, NULL, 'Fully Diminished Seventh', 4),
	('DIMx7', 'Diminished (##7)', 'MIN3', 'DIM5', 'MAJ7', NULL, NULL, NULL, 3, NULL, NULL, 4),
	('AUG', 'Augmented', 'MAJ3', 'AUG5', NULL, NULL, NULL, NULL, 4, NULL, NULL, 3),
	('AUG#7', 'Augmented (#7)', 'MAJ3', 'AUG5', 'MAJ7', NULL, NULL, NULL, 4, 1, NULL, 4),
	('AUG7', 'Augmented Seventh', 'MAJ3', 'AUG5', 'MIN7', NULL, NULL, NULL, 4, 5, NULL, 4),
	('AUG7#9', 'Augmented Seventh (#9)', 'MAJ3', 'AUG5', 'MIN7', 'AUG9', NULL, NULL, 4, 5, NULL, 5),
	('AUG7b9', 'Augmented Seventh (b9)', 'MAJ3', 'AUG5', 'MIN7', 'MIN9', NULL, NULL, 4, 5, NULL, 5),
	('AUG9', 'Augmented Ninth', 'MAJ3', 'AUG5', 'MIN7', 'MAJ9', NULL, NULL, 4, 5, NULL, 5),
	('AUG7#11', 'Augmented Seventh (#11)', 'MAJ3', 'AUG5', 'MIN7', 'MAJ9', 'AUG11', NULL, 4, 5, 'Augmented Dominant Lydian Chord', 6),
	('AUGMA9', 'Augmented Major Ninth', 'MAJ3', 'AUG5', 'MAJ7', 'MAJ9', NULL, NULL, 4, 1, NULL, 5),
	('MIN', 'Minor', 'MIN3', 'PER5', NULL, NULL, NULL, NULL, 2, NULL, NULL, 3),
	('MIN7', 'Minor Seventh', 'MIN3', 'PER5', 'MIN7', NULL, NULL, NULL, 2, NULL, NULL, 4),
	('MIN9', 'Minor Ninth', 'MIN3', 'PER5', 'MIN7', 'MAJ9', NULL, NULL, 2, NULL, NULL, 5),
	('MIN7b5', 'Minor Seventh (b5)', 'MIN3', 'DIM5', 'MIN7', NULL, NULL, NULL, 2, 3, 'Half Diminished Seventh', 4),
	('MIN911', 'Minor Ninth (11)', 'MIN3', 'PER5', 'MIN7', 'MAJ9', 'PER11', NULL, 2, NULL, NULL, 6),
	('MIN9#7', 'Minor Ninth (#7)', 'MIN3', 'PER5', 'MAJ7', 'MAJ9', NULL, NULL, 2, NULL, NULL, 5),
	('MIN#7', 'Minor (#7)', 'MIN3', 'PER5', 'MAJ7', NULL, NULL, NULL, 2, NULL, NULL, 4),
	('MIN6', 'Minor Sixth', 'MIN3', 'PER5', 'MAJ6', NULL, NULL, NULL, 2, NULL, NULL, 4),
	('MIN7#5', 'Minor Seventh (#5)', 'MIN3', 'AUG5', 'MIN7', NULL, NULL, NULL, 2, NULL, NULL, 4),
	('MIN7SUS4', 'Minor Seventh Sus4', 'PER4', 'PER5', 'MIN7', 'MIN10', NULL, NULL, 2, 6, '"So What" Chord', 5),
	('MAJ', 'Major', 'MAJ3', 'PER5', NULL, NULL, NULL, NULL, 1, NULL, NULL, 3),
	('MAJ7', 'Major Seventh', 'MAJ3', 'PER5', 'MAJ7', NULL, NULL, NULL, 1, NULL, NULL, 4),
	('MAJ6', 'Major Sixth', 'MAJ3', 'PER5', 'MAJ6', NULL, NULL, NULL, 1, NULL, NULL, 4),
	('SUS2', 'Sus2', 'MAJ2', 'PER5', NULL, NULL, NULL, NULL, 1, 6, NULL, 3),
	('SUS4', 'Sus4', 'PER4', 'PER5', NULL, NULL, NULL, NULL, 1, 6, NULL, 3),
	('MU', 'Major Mu', 'MAJ2', 'MAJ3', 'PER5', NULL, NULL, NULL, 1, 6, NULL, 3),
	('MAJ9', 'Major Ninth', 'MAJ3', 'PER5', 'MAJ7', 'MAJ9', NULL, NULL, 1, NULL, NULL, 5),
	('69', 'Major (6, 9)', 'MAJ3', 'PER5', 'MAJ6', 'MAJ9', NULL, NULL, 1, NULL, NULL, 5),
	('MAJ911', 'Major Ninth (11)', 'MAJ3', 'PER5', 'MAJ7', 'MAJ9', 'PER11', NULL, 1, NULL, NULL, 6),
	('MAJ7#11', 'Major Seventh (#11)', 'MAJ3', 'PER5', 'MAJ7', 'MAJ9', 'AUG11', NULL, 1, NULL, 'Lydian Chord', 6),
	('MAJ13#11', 'Major Thirteenth (#11)', 'MAJ3', 'PER5', 'MAJ7', 'MAJ9', 'AUG11', 'MAJ13', 1, NULL, 'Thirteenth Lydian Chord', 7),
	('MAJ9#5', 'Major Ninth (#5)', 'MAJ3', 'AUG5', 'MAJ7', 'MAJ9', NULL, NULL, 1, 4, NULL, 5),
	('MAJ7#5', 'Major Seventh (#5)', 'MAJ3', 'AUG5', 'MAJ7', NULL, NULL, NULL, 1, 4, NULL, 4),
	('7', 'Seventh', 'MAJ3', 'PER5', 'MIN7', NULL, NULL, NULL, 5, NULL, NULL, 4),
	('7#5', 'Seventh (#5)', 'MAJ3', 'AUG5', 'MIN7', NULL, NULL, NULL, 5, 4,NULL, 4),
	('7#5#9', 'Seventh (#5, #9)', 'MAJ3', 'AUG5', 'MIN7', 'AUG9', NULL, NULL, 5, 4, NULL, 5),
	('7#5b9', 'Seventh (#5, b9)', 'MAJ3', 'AUG5', 'MIN7', 'MIN9', NULL, NULL, 5, 4, NULL, 5),
	('9#5', 'Ninth (#5)', 'MAJ3', 'AUG5', 'MIN7', 'MAJ9', NULL, NULL, 5, 4, NULL, 5),
	('7#5#11', 'Seventh (#5, #11)', 'MAJ3', 'AUG5', 'MIN7', 'MAJ9', 'AUG11', NULL, 5, 4, NULL, 6),
	('7b9', 'Seventh (b9)', 'MAJ3', 'PER5', 'MIN7', 'MIN9', NULL, NULL, 5, NULL, NULL, 5),
	('7#9', 'Seventh (b9)', 'MAJ3', 'PER5', 'MIN7', 'AUG9', NULL, NULL, 5, NULL, 'Hendrix Chord', 5),
	('7#11', 'Seventh (#11)', 'MAJ3', 'PER5', 'MIN7', 'MIN9', 'AUG11', NULL, 5, NULL, 'Dominant Lydian Chord', 6),
	('7b9#11', 'Seventh (b9, #11)', 'MAJ3', 'PER5', 'MIN7', 'MIN9', 'AUG11', NULL, 5, NULL, NULL, 6),
	('7#9#11', 'Seventh (#9, #11)', 'MAJ3', 'PER5', 'MIN7', 'AUG9', 'AUG11', NULL, 5, NULL, NULL, 6),
	('7#9b13', 'Seventh (#9, b13)', 'MAJ3', 'PER5', 'MIN7', 'AUG9', 'PER11', 'MIN13', 5, NULL, NULL, 7),
	('9', 'Ninth', 'MAJ3', 'PER5', 'MIN7', 'MAJ9', NULL, NULL, 5, NULL, NULL, 5),
	('9b13', 'Ninth (b13)', 'MAJ3', 'PER5', 'MIN7', 'MAJ9', 'PER11', 'MIN13', 5, NULL, NULL, 7),
	('13', 'Thirteenth', 'MAJ3', 'PER5', 'MIN7', 'MAJ9', 'PER11', 'MAJ13', 5, NULL, NULL, 7),
	('13b9', 'Thirteenth (b9)', 'MAJ3', 'PER5', 'MIN7', 'MIN9', 'PER11', 'MAJ13', 5, NULL, NULL, 7),
	('13#11', 'Thirteenth (#11)', 'MAJ3', 'PER5', 'MIN7', 'MAJ9', 'AUG11', 'MAJ13', 5, NULL, NULL, 7),
	('13#9', 'Thirteenth (#9)', 'MAJ3', 'PER5', 'MIN7', 'AUG9', 'PER11', 'MAJ13', 5, NULL, NULL, 7),
	('13b9#11', 'Thirteenth (b9, #11)', 'MAJ3', 'PER5', 'MIN7', 'MIN9', 'AUG11', 'MAJ13', 5, NULL, NULL, 7),
	('7SUS4', 'Seventh (Sus4)', 'PER4', 'PER5', 'MIN7', NULL, NULL, NULL, 5, 6, NULL, 4),
	('7SUS49', 'Seventh (Sus4, 9)', 'PER4', 'PER5', 'MIN7', 'MAJ9', NULL, NULL, 5, 6, NULL, 5),
	('7SUS4b9', 'Seventh (Sus4, b9)', 'PER4', 'PER5', 'MIN7', 'MIN9', NULL, NULL, 5, 6, NULL, 5),
	('7SUS4913', 'Seventh (Sus4, 9, 13)', 'PER4', 'PER5', 'MIN7', 'MAJ9', 'MAJ13', NULL, 5, 6,NULL, 6)

