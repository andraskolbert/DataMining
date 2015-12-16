time_signature: Time signature of the key; how many beats per measure.
	 An estimated overall time signature of a track. The time signature (meter) is a notational
convention to specify how many beats are in each bar (or measure). 	

energy: A number that ranges from 0 to 1, representing how energetic The Echo Nest thinks this song is. 

danceability: A number that ranges from 0 to 1, representing how danceable The Echo Nest thinks this song is. 

tempo: the overall estimated tempo of a track in beats per minute (BPM).  In musical terminology, tempo is the 
speed or pace of a given piece and derives directly from the average beat duration

duration:Length of the song, in seconds. 

key:The key that The Echo Nest believes the song is in. Key signatures start at 0 (C) and ascend the chromatic scale. In this case, a key of 1 represents a song in D-flat
	 The estimated overall key of a track. The key identifies the tonic triad, the chord, major or minor, which
represents the final point of rest of a piece. 

liveness: Detects the presence of an audience in the recording. The more confident that the track is live, the closer to 1.0 the attribute value.

speechiness:Detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audio book, poetry), the closer to 1.0 the attribute value. 

instrumentalness:between 0 and 1
	"Instrumentalness" is a measure of how likely a song is to be an instrumental with no spoken words.
	instrumentalness and speechiness are not opposites. 
	They estimate different things. Speechiness indicates the likelihood the track contains spoken words. 
	Sung vocals are not speech. A track that is not instrumental is not necessarily "speech". Tracks with 
	singing have low speechiness AND low instrumentalness, whereas rap tracks could have low instrumentalness
	and MEDIUM speechiness. High speechiness tracks should PROBABLY have low instrumentalness, but we don't 
	correlate the two attributes, so you should not make this assumption.


loudness: The overall loudness of a track in decibels (dB). 

acousticness:a measure of how acoustic vs. electric a song is. A value close to 1 indicates that the song is mostly recorded with acoustic instruments and non-modified vocals, while a value close to zero indicates that the song has many electric instruments such as as electric guitars and synths. 

valence:a measure of the emotional content of a song. A value close to one indicates a positive emotion, while a value close to zero is a negative emotion. 

song_hotttnesss: (not sure), but I think it is the popularity of the song: from 0 to 1, 1 being very popular

song_name: The name of the song

artist_name: The name of the artist

genre: if it is classical, rock, pop, jazz,metal...

-------------------------------
beats: list of beat markers, in seconds. A beat is the basic time unit of a piece of music; for example, each tick of
a metronome. Beats are typically multiples of tatums.

bars: list of bar markers, in seconds. A bar (or measure) is a segment of time defined as a given number of beats.
Bar offsets also indicate downbeats, the first beat of the measure. 

sections: a set of section markers, in seconds. Sections are defined by large variations in rhythm or timbre, e.g.
chorus, verse, bridge, guitar solo, etc. Each section contains its own descriptions of tempo, key, mode,
time_signature, and loudness