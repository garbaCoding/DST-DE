--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Ubuntu 17.5-0ubuntu0.25.04.1)
-- Dumped by pg_dump version 17.5 (Ubuntu 17.5-0ubuntu0.25.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: abilities; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.abilities (
    name_ability character varying(45) NOT NULL,
    ability_id integer NOT NULL
);


ALTER TABLE public.abilities OWNER TO daniel;

--
-- Name: classification; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.classification (
    classification_id integer NOT NULL,
    name_classification character varying(255) NOT NULL
);


ALTER TABLE public.classification OWNER TO daniel;

--
-- Name: pokemon; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.pokemon (
    base_egg_steps integer NOT NULL,
    base_happiness integer NOT NULL,
    base_total integer NOT NULL,
    capture_rate character varying(24) NOT NULL,
    classification_id integer NOT NULL,
    experience_growth integer NOT NULL,
    height_m numeric(4,1),
    name character varying(45) NOT NULL,
    percentage_male numeric(5,1),
    pokedex_number integer NOT NULL,
    weight_kg numeric(5,1),
    generation integer NOT NULL,
    is_legendary boolean NOT NULL
);


ALTER TABLE public.pokemon OWNER TO daniel;

--
-- Name: pokemonability; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.pokemonability (
    pokedex_number integer NOT NULL,
    ability_id integer NOT NULL
);


ALTER TABLE public.pokemonability OWNER TO daniel;

--
-- Name: pokemontype; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.pokemontype (
    pokedex_number integer NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.pokemontype OWNER TO daniel;

--
-- Name: stats; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.stats (
    pokedex_number integer NOT NULL,
    hp integer NOT NULL,
    attack integer NOT NULL,
    defense integer NOT NULL,
    speed integer NOT NULL,
    sp_attack integer NOT NULL,
    sp_defense integer NOT NULL
);


ALTER TABLE public.stats OWNER TO daniel;

--
-- Name: types; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.types (
    name_type character varying(45) NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.types OWNER TO daniel;

--
-- Data for Name: abilities; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.abilities (name_ability, ability_id) FROM stdin;
Overgrow	1
Chlorophyll	2
Blaze	3
Solar Power	4
Torrent	5
Rain Dish	6
Shield Dust	7
Run Away	8
Shed Skin	9
Compoundeyes	10
Tinted Lens	11
Swarm	12
Sniper	13
Keen Eye	14
Tangled Feet	15
Big Pecks	16
Guts	17
Hustle	18
Gluttony	19
Thick Fat	20
Intimidate	21
Unnerve	22
Static	23
Lightningrod	24
Surge Surfer	25
Sand Veil	26
Sand Rush	27
Snow Cloak	28
Slush Rush	29
Poison Point	30
Rivalry	31
Sheer Force	32
Cute Charm	33
Magic Guard	34
Friend Guard	35
Unaware	36
Flash Fire	37
Drought	38
Snow Warning	39
Competitive	40
Frisk	41
Inner Focus	42
Infiltrator	43
Stench	44
Effect Spore	45
Dry Skin	46
Damp	47
Wonder Skin	48
Arena Trap	49
Sand Force	50
Tangling Hair	51
Pickup	52
Technician	53
Rattled	54
Limber	55
Fur Coat	56
Cloud Nine	57
Swift Swim	58
Vital Spirit	59
Anger Point	60
Defiant	61
Justified	62
Water Absorb	63
Synchronize	64
No Guard	65
Steadfast	66
Clear Body	67
Liquid Ooze	68
Rock Head	69
Sturdy	70
Magnet Pull	71
Galvanize	72
Flame Body	73
Oblivious	74
Own Tempo	75
Regenerator	76
Analytic	77
Early Bird	78
Hydration	79
Ice Body	80
Sticky Hold	81
Poison Touch	82
Power of Alchemy	83
Shell Armor	84
Skill Link	85
Overcoat	86
Levitate	87
Cursed Body	88
Weak Armor	89
Insomnia	90
Forewarn	91
Hyper Cutter	92
Soundproof	93
Aftermath	94
Harvest	95
Battle Armor	96
Reckless	97
Unburden	98
Iron Fist	99
Natural Cure	100
Serene Grace	101
Healer	102
Leaf Guard	103
Scrappy	104
Water Veil	105
Illuminate	106
Filter	107
Mold Breaker	108
Moxie	109
Imposter	110
Adaptability	111
Anticipation	112
Volt Absorb	113
Quick Feet	114
Trace	115
Download	116
Pressure	117
Immunity	118
Marvel Scale	119
Multiscale	120
Super Luck	121
Magic Bounce	122
Plus	123
Huge Power	124
Sap Sipper	125
Drizzle	126
Speed Boost	127
Prankster	128
Shadow Tag	129
Telepathy	130
Light Metal	131
Contrary	132
Pickpocket	133
Honey Gather	134
Magma Armor	135
Moody	136
Suction Cups	137
Sand Stream	138
Poison Heal	139
Truant	140
Wonder Guard	141
Normalize	142
Stall	143
Heavy Metal	144
Pure Power	145
Minus	146
Rough Skin	147
Simple	148
Solid Rock	149
White Smoke	150
Toxic Boost	151
Storm Drain	152
Forecast	153
Color Change	154
Protean	155
Air Lock	156
Flower Gift	157
Flare Boost	158
Klutz	159
Heatproof	160
Motor Drive	161
Slow Start	162
Bad Dreams	163
Multitype	164
Victory Star	165
Zen Mode	166
Mummy	167
Defeatist	168
Illusion	169
Iron Barbs	170
Turboblaze	171
Teravolt	172
Bulletproof	173
Magician	174
Battle Bond	175
Cheek Pouch	176
Gale Wings	177
Flower Veil	178
Symbiosis	179
Grass Pelt	180
Stance Change	181
Aroma Veil	182
Sweet Veil	183
Tough Claws	184
Mega Launcher	185
Strong Jaw	186
Refrigerate	187
Pixilate	188
Gooey	189
Fairy Aura	190
Dark Aura	191
Aura Break	192
Power Construct	193
Long Reach	194
Liquid Voice	195
Stakeout	196
Battery	197
Dancer	198
Schooling	199
Merciless	200
Stamina	201
Water Bubble	202
Corrosion	203
Fluffy	204
Queenly Majesty	205
Triage	206
Receiver	207
Wimp Out	208
Emergency Exit	209
Water Compaction	210
Innards Out	211
RKS System	212
Shields Down	213
Comatose	214
Disguise	215
Dazzling	216
Berserk	217
Steelworker	218
Electric Surge	219
Psychic Surge	220
Grassy Surge	221
Misty Surge	222
Full Metal Body	223
Shadow Shield	224
Beast Boost	225
Prism Armor	226
Soul-Heart	227
\.


--
-- Data for Name: classification; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.classification (classification_id, name_classification) FROM stdin;
1	Abundance Pokémon
2	Acorn Pokémon
3	Alpha Pokémon
4	Angler Pokémon
5	Ant Pit Pokémon
6	Anteater Pokémon
7	Antenna Pokémon
8	Aquamouse Pokémon
9	Aquarabbit Pokémon
10	Arm Thrust Pokémon
11	Armor Bird Pokémon
12	Armor Pokémon
13	Arrow Quill Pokémon
14	Artificial Pokémon
15	Astral Body Pokémon
16	Atrocious Pokémon
17	Attaching Pokémon
18	Aura Pokémon
19	Aurora Pokémon
20	Automaton Pokémon
21	Avianoid Pokémon
22	Axe Jaw Pokémon
23	Bagworm Pokémon
24	Ball Pokémon
25	Ball Roll Pokémon
26	Ball Whale Pokémon
27	Balloon Pokémon
28	Barnacle Pokémon
29	Barrier Pokémon
30	Bash Buffalo Pokémon
31	Bat Pokémon
32	Battery Pokémon
33	Beak Pokémon
34	Beaver Pokémon
35	Beckon Pokémon
36	Bee Fly Pokémon
37	Beehive Pokémon
38	Bell Pokémon
39	Big Boss Pokémon
40	Big Eater Pokémon
41	Big Horn Pokémon
42	Big Jaw Pokémon
43	Big Voice Pokémon
44	Big-Hearted Pokémon
45	Bird Pokémon
46	Bite Pokémon
47	Bivalve Pokémon
48	Blade Pokémon
49	Blade Quill Pokémon
50	Blast Pokémon
51	Blast Turtle Pokémon
52	Blaze Pokémon
53	Blazing Pokémon
54	Blimp Pokémon
55	Bloom Sickle Pokémon
56	Blossom Pokémon
57	Bolt Strike Pokémon
58	Bone Keeper Pokémon
59	Bone Vulture Pokémon
60	Bonsai Pokémon
61	Bounce Pokémon
62	Boundary Pokémon
63	Bouquet Pokémon
64	Boxing Pokémon
65	Bright Pokémon
66	Bronze Bell Pokémon
67	Bronze Pokémon
68	Brutal Pokémon
69	Brutal Star Pokémon
70	Bubble Frog Pokémon
71	Bubble Jet Pokémon
72	Bud Pokémon
73	Bug Catcher Pokémon
74	Bugle Beak Pokémon
75	Bulb Pokémon
76	Butterfly Pokémon
77	Cactus Pokémon
78	Candle Pokémon
79	Cannon Pokémon
80	Carefree Pokémon
81	Caring Pokémon
82	Cat Ferret Pokémon
83	Catty Pokémon
84	Cavalry Pokémon
85	Cave Pokémon
86	Cavern Pokémon
87	Cell Pokémon
88	Centipede Pokémon
89	Cerebral Pokémon
90	Cheering Pokémon
91	Cherry Pokémon
92	Chick Pokémon
93	Chill Pokémon
94	Chimp Pokémon
95	Chinchilla Pokémon
96	Clamping Pokémon
97	Clap Pokémon
98	Classy Cat Pokémon
99	Clay Doll Pokémon
100	Clear Wing Pokémon
101	Coal Pokémon
102	Cobra Pokémon
103	Coconut Pokémon
104	Cocoon Pokémon
105	Coffin Pokémon
106	Collective Pokémon
107	Color Swap Pokémon
108	Colossal Pokémon
109	Colt Pokémon
110	Compass Pokémon
111	Compressed Pokémon
112	Constraint Pokémon
113	Continent Pokémon
114	Coral Pokémon
115	Cotton Bird Pokémon
116	Cotton Candy Pokémon
117	Cotton Puff Pokémon
118	Cottonweed Pokémon
119	Courting Pokémon
120	Cricket Pokémon
121	Cruel Pokémon
122	Crystallizing Pokémon
123	Curlipede Pokémon
124	Cyclone Pokémon
125	DNA Pokémon
126	Dancing Pokémon
127	Dark Pokémon
128	Darkness Pokémon
129	Daunting Pokémon
130	Deceiver Pokémon
131	Deep Black Pokémon
132	Deep Sea Pokémon
133	Delivery Pokémon
134	Desert Croc Pokémon
135	Despot Pokémon
136	Destruction Pokémon
137	Devious Pokémon
138	Diapered Pokémon
139	Digging Pokémon
140	Disaster Pokémon
141	Discharge Pokémon
142	Discipline Pokémon
143	Disguise Pokémon
144	Diving Pokémon
145	Donkey Pokémon
146	Dopey Pokémon
147	Draft Horse Pokémon
148	Dragon Pokémon
149	Drawn Sword Pokémon
150	Dream Eater Pokémon
151	Drill Pokémon
152	Drowsing Pokémon
153	Duck Pokémon
154	Eaglet Pokémon
155	Egg Pokémon
156	Elder Tree Pokémon
157	EleFish Pokémon
158	EleSpider Pokémon
159	EleSquirrel Pokémon
160	Electric Pokémon
161	Electrified Pokémon
162	Emanation Pokémon
163	Ember Pokémon
164	Embrace Pokémon
165	Emotion Pokémon
166	Emperor Pokémon
167	Endurance Pokémon
168	Eon Pokémon
169	Eruption Pokémon
170	Evolution Pokémon
171	Eyeball Pokémon
172	Face Pokémon
173	Fairy Pokémon
174	Fang Scorp Pokémon
175	Fang Snake Pokémon
176	Feeling Pokémon
177	Fire Cat Pokémon
178	Fire Horse Pokémon
179	Fire Mouse Pokémon
180	Fire Pig Pokémon
181	Firefly Pokémon
182	First Bird Pokémon
183	Fish Pokémon
184	Five Star Pokémon
185	Fixation Pokémon
186	Flailing Pokémon
187	Flame Pokémon
188	Flash Pokémon
189	Float Whale Pokémon
190	Floating Pokémon
191	Flower Pokémon
192	Flowering Pokémon
193	Flycatcher Pokémon
194	Flyscorpion Pokémon
195	Forbidden Pokémon
196	Forest Pokémon
197	Formidable Pokémon
198	Fossil Pokémon
199	Fox Pokémon
200	Fragrance Pokémon
201	Freeze Pokémon
202	Freezing Pokémon
203	Fresh Snow Pokémon
204	Frog Pokémon
205	Frosted Tree Pokémon
206	Fruit Pokémon
207	Garden Pokémon
208	Gas Pokémon
209	Gear Pokémon
210	Generator Pokémon
211	Genetic Pokémon
212	Geyser Pokémon
213	Gleam Eyes Pokémon
214	Glowing Pokémon
215	Gnash Teeth Pokémon
216	Goldfish Pokémon
217	Grass Monkey Pokémon
218	Grass Quill Pokémon
219	Grass Snake Pokémon
220	Grassland Pokémon
221	Gratitude Pokémon
222	Gripper Pokémon
223	Grove Pokémon
224	Guts Pokémon
225	Hairy Pokémon
226	Handstand Pokémon
227	Happiness Pokémon
228	Hard Scale Pokémon
229	Hard Shell Pokémon
230	Head Butt Pokémon
231	Hearing Pokémon
232	Heavyweight Pokémon
233	Heel Pokémon
234	Herb Pokémon
235	Hermit Crab Pokémon
236	Hibernator Pokémon
237	High Temp Pokémon
238	Hippo Pokémon
239	Hoodlum Pokémon
240	Hostile Pokémon
241	Howitzer Pokémon
242	Humanshape Pokémon
243	Humming Pokémon
244	Hypnosis Pokémon
245	Ice Break Pokémon
246	Ice Chunk Pokémon
247	Iceberg Pokémon
248	Icy Snow Pokémon
249	Illuminating Pokémon
250	Illusion Fox Pokémon
251	Imitation Pokémon
252	Insect Pokémon
253	Intertwining Pokémon
254	Intimidation Pokémon
255	Irate Pokémon
256	Iron Ant Pokémon
257	Iron Armor Pokémon
258	Iron Ball Pokémon
259	Iron Claw Pokémon
260	Iron Leg Pokémon
261	Iron Pokémon
262	Iron Snake Pokémon
263	Iron Will Pokémon
264	Jellyfish Pokémon
265	Jet Pokémon
266	Jewel Pokémon
267	Jolly Pokémon
268	Jubilee Pokémon
269	Judo Pokémon
270	Junkivore Pokémon
271	Karate Pokémon
272	Key Ring Pokémon
273	Kicking Pokémon
274	Kiss Pokémon
275	Kite Pokémon
276	Kitten Pokémon
277	Knowledge Pokémon
278	Lamp Pokémon
279	Land Shark Pokémon
280	Land Snake Pokémon
281	Land Spirit Pokémon
282	Larva Pokémon
283	Launch Pokémon
284	Lava Dome Pokémon
285	Lava Pokémon
286	Lazy Pokémon
287	Leaf Pokémon
288	Leaf-Wrapped Pokémon
289	Legendary Pokémon
290	Licking Pokémon
291	Life Pokémon
292	Light Pokémon
293	Lightning Pokémon
294	Lion Cub Pokémon
295	Lissome Pokémon
296	Little Bear Pokémon
297	Little Bird Pokémon
298	Live Coal Pokémon
299	Lizard Pokémon
300	Loitering Pokémon
301	Lonely Pokémon
302	Long Body Pokémon
303	Long Leg Pokémon
304	Long Neck Pokémon
305	Long Nose Pokémon
306	Long Tail Pokémon
307	Longevity Pokémon
308	Lookout Pokémon
309	Loud Noise Pokémon
310	Loyal Dog Pokémon
311	Lunar Pokémon
312	Luring Pokémon
313	Mach Pokémon
314	Magical Pokémon
315	Magnet Area Pokémon
316	Magnet Pokémon
317	Manipulate Pokémon
318	Mantis Pokémon
319	Mantle Pokémon
320	Marionette Pokémon
321	Martial Arts Pokémon
322	Meditate Pokémon
323	Mega Fire Pig Pokémon
324	Megapede Pokémon
325	Megaton Pokémon
326	Melody Pokémon
327	Meringue Pokémon
328	Meteor Pokémon
329	Meteorite Pokémon
330	Milk Cow Pokémon
331	Mime Pokémon
332	Mischief Pokémon (Confined)Djinn Pokémonn (Unbound)
333	Mitosis Pokémon
334	Mock Kelp Pokémon
335	Mold Pokémon
336	Mole Pokémon
337	Moone Pokémon
338	Moonlight Pokémon
339	Moth Pokémon
340	Mount Pokémon
341	Mouse Pokémon
342	Mud Fish Pokémon
343	Multiplying Pokémon
344	Muscular Pokémon
345	Mushroom Pokémon
346	Music Note Pokémon
347	Mysterious Pokémon
348	Mystic Pokémon
349	Nebula Pokémon
350	Neon Pokémon
351	New Species Pokémon
352	Ninja Pokémon
353	Numb Pokémon
354	Nurturing Pokémon
355	Ogre Darner Pokémon
356	Ogre Scorp Pokémon
357	Old Shrimp Pokémon
358	Order Pokémon
359	Ore Pokémon
360	Overturning Pokémon
361	Owl Pokémon
362	Painter Pokémon
363	Paleozoic Pokémon
364	Parasite Pokémon
365	Parent Pokémon
366	Patient Pokémon
367	Penguin Pokémon
368	Perfume Pokémon
369	Pig Monkey Pokémon
370	Pig Pokémon
371	Pincer Pokémon
372	Pitch-Black Pokémon
373	Placid Pokémon
374	Plasma Pokémon
375	Plate Pokémon
376	Playful Pokémon
377	Playhouse Pokémon
378	Plump Mouse Pokémon
379	Poison Bag Pokémon
380	Poison Bee Pokémon
381	Poison Gas Pokémon
382	Poison Moth Pokémon
383	Poison Pin Pokémon
384	Polka Dot Pokémon
385	Pond Skater Pokémon
386	Poodle Pokémon
387	Pop Star Pokémon
388	Posy Picker Pokémon
389	Predator Pokémon
390	Prim Pokémon
391	Prism Pokémon
392	Protostar Pokémon
393	Prototurtle Pokémon
394	Proud Pokémon
395	Psi Pokémon
396	Pumpkin Pokémon
397	Punching Pokémon
398	Puppet Pokémon
399	Puppy Pokémon
400	Rabbit Pokémon
401	Rainbow Pokémon
402	Regal Pokémon
403	Rendezvous Pokémon
404	Renegade Pokémon
405	Requiem Pokémon
406	Restraint Pokémon
407	Revolving Pokémon
408	River Crab Pokémon
409	Rock Head Pokémon
410	Rock Inn Pokémon
411	Rock Peak Pokémon
412	Rock Pokémon
413	Rock Skin Pokémon
414	Rock Snake Pokémon
415	Rogue Pokémon
416	Roly-Poly Pokémon
417	Royal Heir Pokémon
418	Royal Pokémon
419	Royal Sword Pokémon
420	Ruffian Pokémon
421	Rush Pokémon
422	Sage Pokémon
423	Sand Castle Pokémon
424	Sand Heap Pokémon
425	Savage Pokémon
426	Scale Pokémon
427	Scaly Pokémon
428	Scarecrow Pokémon
429	Scarf Pokémon
430	Scatterdust Pokémon
431	Scorching Pokémon
432	Scorpion Pokémon
433	Scout Pokémon
434	Scratch Cat Pokémon
435	Screech Pokémon
436	Scuffle Pokémon
437	Sea Basin Pokémon
438	Sea Creeper Pokémon
439	Sea Cucumber Pokémon
440	Sea Drifter Pokémon
441	Sea Lily Pokémon
442	Sea Lion Pokémon
443	Sea Otter Pokémon
444	Sea Slug Pokémon
445	Sea Weasel Pokémon
446	Seafaring Pokémon
447	Seagull Pokémon
448	Season Pokémon
449	Seed Pokémon
450	Sewing Pokémon
451	Shadow Pokémon
452	Sharp Blade Pokémon
453	Sharp Claw Pokémon
454	Shed Pokémon
455	Shedding Pokémon
456	Shell Out Pokémon
457	Shellfish Pokémon
458	Shield Pokémon
459	Sickle Grass Pokémon
460	Single Bloom Pokémon
461	Singlehorn Pokémon
462	Skunk Pokémon
463	Sky High Pokémon
464	Sky Squirrel Pokémon
465	Slacker Pokémon
466	Sleeping Pokémon
467	Sludge Pokémon
468	Small Fry Pokémon
469	Snail Pokémon
470	Snake Pokémon
471	Snow Hat Pokémon
472	Snow Land Pokémon
473	Snowstorm Pokémon
474	Soft Tissue Pokémon
475	Soloist Pokémon
476	Sound Wave Pokémon
477	South Sea Pokémon
478	Spark Pokémon
479	Spatial Pokémon
480	Spike Ball Pokémon
481	Spikes Pokémon
482	Spiky Nut Pokémon
483	Spiny Armor Pokémon
484	Spiral Pokémon
485	Spirit Pokémon
486	Spitfire Pokémon
487	Spot Panda Pokémon
488	Spray Pokémon
489	Stag Beetle Pokémon
490	Stagbeetle Pokémon
491	Stakeout Pokémon
492	Star Shape Pokémon
493	Starling Pokémon
494	Starshape Pokémon
495	Steam Pokémon
496	Stomach Pokémon
497	Stone Home Pokémon
498	String Spit Pokémon
499	Strong Arm Pokémon
500	Stump Pokémon
501	Subterrene Pokémon
502	Sun Pokémon
503	Sunne Pokémon
504	Superpower Pokémon
505	Swallow Pokémon
506	Swine Pokémon
507	Swollen Pokémon
508	Sword Blade Pokémon
509	Sword Pokémon
510	Symbol Pokémon
511	Synthetic Pokémon
512	Tadpole Pokémon
513	Teamwork Pokémon
514	Temporal Pokémon
515	Tender Pokémon
516	Thorn Monkey Pokémon
517	Thorn Pod Pokémon
518	Thorn Pokémon
519	Thorn Seed Pokémon
520	Thunder Pokémon
521	Thunderbolt Pokémon
522	Tiger Cat Pokémon
523	Time Travel Pokémon
524	Tiny Bee Pokémon
525	Tiny Bird Pokémon
526	Tiny Leaf Pokémon
527	Tiny Mouse Pokémon
528	Tiny Pigeon Pokémon
529	Tiny Racoon Pokémon
530	Tiny Robin Pokémon
531	Tiny Turtle Pokémon
532	TinySwallow Pokémon
533	Torch Pokémon
534	Toxic Lizard Pokémon
535	Toxic Mouth Pokémon
536	Trainee Pokémon
537	Transform Pokémon
538	Transport Pokémon
539	Trap Pokémon
540	Trash Bag Pokémon
541	Trash Heap Pokémon
542	Tricky Fox Pokémon
543	Triple Bird Pokémon
544	Tundra Pokémon
545	Turn Tail Pokémon
546	Turtle Pokémon
547	Tusk Pokémon
548	Twin Bird Pokémon
549	Twin Tusk Pokémon
550	Two-Handed Pokémon
551	Valiant Pokémon
552	Vast White Pokémon
553	Verdant Pokémon
554	Vibration Pokémon
555	Victory Pokémon
556	Vine Pokémon
557	Virtual Pokémon
558	Volcano Pokémon
559	Water Bird Pokémon
560	Water Bubble Pokémon
561	Water Fish Pokémon
562	Water Gun Pokémon
563	Water Weed Pokémon
564	Weather Pokémon
565	Weed Pokémon
566	Whiskers Pokémon
567	Whisper Pokémon
568	White Bird Pokémon
569	Wickid Pokémon
570	Wild Bull Pokémon
571	Wild Duck Pokémon
572	Wild Monkey Pokémon
573	Wild Pigeon Pokémon
574	Willpower Pokémon
575	Wily Pokémon
576	Wind Chime Pokémon
577	Windveiled Pokémon
578	Wing Fish Pokémon
579	Wish Pokémon
580	Wolf Pokémon
581	Wood Gecko Pokémon
582	Woodpecker Pokémon
583	Wool Pokémon
584	Woolly Crab Pokémon
585	Worm Pokémon
586	Wrestling Pokémon
587	Young Fowl Pokémon
588	Zen Charm Pokémon
\.


--
-- Data for Name: pokemon; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.pokemon (base_egg_steps, base_happiness, base_total, capture_rate, classification_id, experience_growth, height_m, name, percentage_male, pokedex_number, weight_kg, generation, is_legendary) FROM stdin;
5120	70	318	45	449	1059860	0.7	Bulbasaur	88.1	1	6.9	1	f
5120	70	405	45	449	1059860	1.0	Ivysaur	88.1	2	13.0	1	f
5120	70	625	45	449	1059860	2.0	Venusaur	88.1	3	100.0	1	f
5120	70	309	45	299	1059860	0.6	Charmander	88.1	4	8.5	1	f
5120	70	405	45	187	1059860	1.1	Charmeleon	88.1	5	19.0	1	f
5120	70	634	45	187	1059860	1.7	Charizard	88.1	6	90.5	1	f
5120	70	314	45	531	1059860	0.5	Squirtle	88.1	7	9.0	1	f
5120	70	405	45	546	1059860	1.0	Wartortle	88.1	8	22.5	1	f
5120	70	630	45	457	1059860	1.6	Blastoise	88.1	9	85.5	1	f
3840	70	195	255	585	1000000	0.3	Caterpie	50.0	10	2.9	1	f
3840	70	205	120	104	1000000	0.7	Metapod	50.0	11	9.9	1	f
3840	70	395	45	76	1000000	1.1	Butterfree	50.0	12	32.0	1	f
3840	70	195	255	225	1000000	0.3	Weedle	50.0	13	3.2	1	f
3840	70	205	120	104	1000000	0.6	Kakuna	50.0	14	10.0	1	f
3840	70	495	45	380	1000000	1.0	Beedrill	50.0	15	29.5	1	f
3840	70	251	255	525	1059860	0.3	Pidgey	50.0	16	1.8	1	f
3840	70	349	120	45	1059860	1.1	Pidgeotto	50.0	17	30.0	1	f
3840	70	579	45	45	1059860	1.5	Pidgeot	50.0	18	39.5	1	f
3840	70	253	255	341	1000000	\N	Rattata	50.0	19	\N	1	f
3840	70	413	127	341	1000000	\N	Raticate	50.0	20	\N	1	f
3840	70	262	255	525	1000000	0.3	Spearow	50.0	21	2.0	1	f
3840	70	442	90	33	1000000	1.2	Fearow	50.0	22	38.0	1	f
5120	70	288	255	470	1000000	2.0	Ekans	50.0	23	6.9	1	f
5120	70	448	90	102	1000000	3.5	Arbok	50.0	24	65.0	1	f
2560	70	320	190	341	1000000	0.4	Pikachu	50.0	25	6.0	1	f
2560	70	485	75	341	1000000	\N	Raichu	50.0	26	\N	1	f
5120	70	300	255	341	1000000	\N	Sandshrew	50.0	27	\N	1	f
5120	70	450	90	341	1000000	\N	Sandslash	50.0	28	\N	1	f
5120	70	275	235	383	1059860	0.4	Nidoran♀	0.0	29	7.0	1	f
5120	70	365	120	383	1059860	0.8	Nidorina	0.0	30	20.0	1	f
5120	70	505	45	151	1059860	1.3	Nidoqueen	0.0	31	60.0	1	f
5120	70	273	235	383	1059860	0.5	Nidoran♂	100.0	32	9.0	1	f
5120	70	365	120	383	1059860	0.9	Nidorino	100.0	33	19.5	1	f
5120	70	505	45	151	1059860	1.4	Nidoking	100.0	34	62.0	1	f
2560	140	323	150	173	800000	0.6	Clefairy	24.6	35	7.5	1	f
2560	140	483	25	173	800000	1.3	Clefable	24.6	36	40.0	1	f
5120	70	299	190	199	1000000	\N	Vulpix	24.6	37	\N	1	f
5120	70	505	75	199	1000000	\N	Ninetales	24.6	38	\N	1	f
2560	70	270	170	27	800000	0.5	Jigglypuff	24.6	39	5.5	1	f
2560	70	435	50	27	800000	1.0	Wigglytuff	24.6	40	12.0	1	f
3840	70	245	255	31	1000000	0.8	Zubat	50.0	41	7.5	1	f
3840	70	455	90	31	1000000	1.6	Golbat	50.0	42	55.0	1	f
5120	70	320	255	565	1059860	0.5	Oddish	50.0	43	5.4	1	f
5120	70	395	120	565	1059860	0.8	Gloom	50.0	44	8.6	1	f
5120	70	490	45	191	1059860	1.2	Vileplume	50.0	45	18.6	1	f
5120	70	285	190	345	1000000	0.3	Paras	50.0	46	5.4	1	f
5120	70	405	75	345	1000000	1.0	Parasect	50.0	47	29.5	1	f
5120	70	305	190	252	1000000	1.0	Venonat	50.0	48	30.0	1	f
5120	70	450	75	382	1000000	1.5	Venomoth	50.0	49	12.5	1	f
5120	70	265	255	336	1000000	\N	Diglett	50.0	50	\N	1	f
5120	70	425	50	336	1000000	\N	Dugtrio	50.0	51	\N	1	f
5120	70	290	255	434	1000000	\N	Meowth	50.0	52	\N	1	f
5120	70	440	90	98	1000000	\N	Persian	50.0	53	\N	1	f
5120	70	320	190	153	1000000	0.8	Psyduck	50.0	54	19.6	1	f
5120	70	500	75	153	1000000	1.7	Golduck	50.0	55	76.6	1	f
5120	70	305	190	369	1000000	0.5	Mankey	50.0	56	28.0	1	f
5120	70	455	75	369	1000000	1.0	Primeape	50.0	57	32.0	1	f
5120	70	350	190	399	1250000	0.7	Growlithe	75.4	58	19.0	1	f
5120	70	555	75	289	1250000	1.9	Arcanine	75.4	59	155.0	1	f
5120	70	300	255	512	1059860	0.6	Poliwag	50.0	60	12.4	1	f
5120	70	385	120	512	1059860	1.0	Poliwhirl	50.0	61	20.0	1	f
5120	70	510	45	512	1059860	1.3	Poliwrath	50.0	62	54.0	1	f
5120	70	310	200	395	1059860	0.9	Abra	75.4	63	19.5	1	f
5120	70	400	100	395	1059860	1.3	Kadabra	75.4	64	56.5	1	f
5120	70	600	50	395	1059860	1.5	Alakazam	75.4	65	48.0	1	f
5120	70	305	180	504	1059860	0.8	Machop	75.4	66	19.5	1	f
5120	70	405	90	504	1059860	1.5	Machoke	75.4	67	70.5	1	f
5120	70	505	45	504	1059860	1.6	Machamp	75.4	68	130.0	1	f
5120	70	300	255	191	1059860	0.7	Bellsprout	50.0	69	4.0	1	f
5120	70	390	120	193	1059860	1.0	Weepinbell	50.0	70	6.4	1	f
5120	70	490	45	193	1059860	1.7	Victreebel	50.0	71	15.5	1	f
5120	70	335	190	264	1250000	0.9	Tentacool	50.0	72	45.5	1	f
5120	70	515	60	264	1250000	1.6	Tentacruel	50.0	73	55.0	1	f
3840	70	300	255	412	1059860	\N	Geodude	50.0	74	\N	1	f
3840	70	390	120	412	1059860	\N	Graveler	50.0	75	\N	1	f
3840	70	495	45	325	1059860	\N	Golem	50.0	76	\N	1	f
5120	70	410	190	178	1000000	1.0	Ponyta	50.0	77	30.0	1	f
5120	70	500	60	178	1000000	1.7	Rapidash	50.0	78	95.0	1	f
5120	70	315	190	146	1000000	1.2	Slowpoke	50.0	79	36.0	1	f
5120	70	590	75	235	1000000	1.6	Slowbro	50.0	80	78.5	1	f
5120	70	325	190	316	1000000	0.3	Magnemite	\N	81	6.0	1	f
5120	70	465	60	316	1000000	1.0	Magneton	\N	82	60.0	1	f
5120	70	377	45	571	1000000	0.8	Farfetch'd	50.0	83	15.0	1	f
5120	70	310	190	548	1000000	1.4	Doduo	50.0	84	39.2	1	f
5120	70	470	45	543	1000000	1.8	Dodrio	50.0	85	85.2	1	f
5120	70	325	190	442	1000000	1.1	Seel	50.0	86	90.0	1	f
5120	70	475	75	442	1000000	1.7	Dewgong	50.0	87	120.0	1	f
5120	70	325	190	467	1000000	\N	Grimer	50.0	88	\N	1	f
5120	70	500	75	467	1000000	\N	Muk	50.0	89	\N	1	f
5120	70	305	190	47	1250000	0.3	Shellder	50.0	90	4.0	1	f
5120	70	525	60	47	1250000	1.5	Cloyster	50.0	91	132.5	1	f
5120	70	310	190	208	1059860	1.3	Gastly	50.0	92	0.1	1	f
5120	70	405	90	208	1059860	1.6	Haunter	50.0	93	0.1	1	f
5120	70	600	45	451	1059860	1.5	Gengar	50.0	94	40.5	1	f
6400	70	385	45	414	1000000	8.8	Onix	50.0	95	210.0	1	f
5120	70	328	190	244	1000000	1.0	Drowzee	50.0	96	32.4	1	f
5120	70	483	75	244	1000000	1.6	Hypno	50.0	97	75.6	1	f
5120	70	325	225	408	1000000	0.4	Krabby	50.0	98	6.5	1	f
5120	70	475	60	371	1000000	1.3	Kingler	50.0	99	60.0	1	f
5120	70	330	190	24	1000000	0.5	Voltorb	\N	100	10.4	1	f
5120	70	490	60	24	1000000	1.2	Electrode	\N	101	66.6	1	f
5120	70	325	90	155	1250000	0.4	Exeggcute	50.0	102	2.5	1	f
5120	70	530	45	103	1250000	\N	Exeggutor	50.0	103	\N	1	f
5120	70	320	190	301	1000000	0.4	Cubone	50.0	104	6.5	1	f
5120	70	425	75	58	1000000	\N	Marowak	50.0	105	\N	1	f
6400	70	455	45	273	1000000	1.5	Hitmonlee	100.0	106	49.8	1	f
6400	70	455	45	397	1000000	1.4	Hitmonchan	100.0	107	50.2	1	f
5120	70	385	45	290	1000000	1.2	Lickitung	50.0	108	65.5	1	f
5120	70	340	190	381	1000000	0.6	Koffing	50.0	109	1.0	1	f
5120	70	490	60	381	1000000	1.2	Weezing	50.0	110	9.5	1	f
5120	70	345	120	481	1250000	1.0	Rhyhorn	50.0	111	115.0	1	f
5120	70	485	60	151	1250000	1.9	Rhydon	50.0	112	120.0	1	f
10240	140	450	30	155	800000	1.1	Chansey	0.0	113	34.6	1	f
5120	70	435	45	556	1000000	1.0	Tangela	50.0	114	35.0	1	f
5120	70	590	45	365	1000000	2.2	Kangaskhan	0.0	115	80.0	1	f
5120	70	295	225	148	1000000	0.4	Horsea	50.0	116	8.0	1	f
5120	70	440	75	148	1000000	1.2	Seadra	50.0	117	25.0	1	f
5120	70	320	225	216	1000000	0.6	Goldeen	50.0	118	15.0	1	f
5120	70	450	60	216	1000000	1.3	Seaking	50.0	119	39.0	1	f
5120	70	340	225	494	1250000	0.8	Staryu	\N	120	34.5	1	f
5120	70	520	60	347	1250000	1.1	Starmie	\N	121	80.0	1	f
6400	70	460	45	29	1000000	1.3	Mr. Mime	50.0	122	54.5	1	f
6400	70	500	45	318	1000000	1.5	Scyther	50.0	123	56.0	1	f
6400	70	455	45	242	1000000	1.4	Jynx	0.0	124	40.6	1	f
6400	70	490	45	160	1000000	1.1	Electabuzz	75.4	125	30.0	1	f
6400	70	495	45	486	1000000	1.3	Magmar	75.4	126	44.5	1	f
6400	70	600	45	490	1250000	1.5	Pinsir	50.0	127	55.0	1	f
5120	70	490	45	570	1250000	1.4	Tauros	100.0	128	88.4	1	f
1280	70	200	255	183	1250000	0.9	Magikarp	50.0	129	10.0	1	f
1280	70	640	45	16	1250000	6.5	Gyarados	50.0	130	235.0	1	f
10240	70	535	45	538	1250000	2.5	Lapras	50.0	131	220.0	1	f
5120	70	288	35	537	1000000	0.3	Ditto	\N	132	4.0	1	f
8960	70	325	45	170	1000000	0.3	Eevee	88.1	133	6.5	1	f
8960	70	525	45	71	1000000	1.0	Vaporeon	88.1	134	29.0	1	f
8960	70	525	45	293	1000000	0.8	Jolteon	88.1	135	24.5	1	f
8960	70	525	45	187	1000000	0.9	Flareon	88.1	136	25.0	1	f
5120	70	395	45	557	1000000	0.8	Porygon	\N	137	36.5	1	f
7680	70	355	45	484	1000000	0.4	Omanyte	88.1	138	7.5	1	f
7680	70	495	45	484	1000000	1.0	Omastar	88.1	139	35.0	1	f
7680	70	355	45	457	1000000	0.5	Kabuto	88.1	140	11.5	1	f
7680	70	495	45	457	1000000	1.3	Kabutops	88.1	141	40.5	1	f
8960	70	615	45	198	1250000	1.8	Aerodactyl	88.1	142	59.0	1	f
10240	70	540	25	466	1250000	2.1	Snorlax	88.1	143	460.0	1	f
20480	35	580	3	201	1250000	1.7	Articuno	\N	144	55.4	1	t
20480	35	580	3	160	1250000	1.6	Zapdos	\N	145	52.6	1	t
20480	35	580	3	187	1250000	2.0	Moltres	\N	146	60.0	1	t
10240	35	300	45	148	1250000	1.8	Dratini	50.0	147	3.3	1	f
10240	35	420	45	148	1250000	4.0	Dragonair	50.0	148	16.5	1	f
10240	35	600	45	148	1250000	2.2	Dragonite	50.0	149	210.0	1	f
30720	0	780	3	211	1250000	2.0	Mewtwo	\N	150	122.0	1	t
30720	100	600	45	351	1059860	0.4	Mew	\N	151	4.0	1	t
5120	70	318	45	287	1059860	0.9	Chikorita	88.1	152	6.4	2	f
5120	70	405	45	287	1059860	1.2	Bayleef	88.1	153	15.8	2	f
5120	70	525	45	234	1059860	1.8	Meganium	88.1	154	100.5	2	f
5120	70	309	45	179	1059860	0.5	Cyndaquil	88.1	155	7.9	2	f
5120	70	405	45	558	1059860	0.9	Quilava	88.1	156	19.0	2	f
5120	70	534	45	558	1059860	1.7	Typhlosion	88.1	157	79.5	2	f
5120	70	314	45	42	1059860	0.6	Totodile	88.1	158	9.5	2	f
5120	70	405	45	42	1059860	1.1	Croconaw	88.1	159	25.0	2	f
5120	70	530	45	42	1059860	2.3	Feraligatr	88.1	160	88.8	2	f
3840	70	215	255	433	1000000	0.8	Sentret	50.0	161	6.0	2	f
3840	70	415	90	302	1000000	1.8	Furret	50.0	162	32.5	2	f
3840	70	262	255	361	1000000	0.7	Hoothoot	50.0	163	21.2	2	f
3840	70	452	90	361	1000000	1.6	Noctowl	50.0	164	40.8	2	f
3840	70	265	255	184	800000	1.0	Ledyba	50.0	165	10.8	2	f
3840	70	390	90	184	800000	1.4	Ledian	50.0	166	35.6	2	f
3840	70	250	255	498	800000	0.5	Spinarak	50.0	167	8.5	2	f
3840	70	400	90	303	800000	1.1	Ariados	50.0	168	33.5	2	f
3840	70	535	90	31	1000000	1.8	Crobat	50.0	169	75.0	2	f
5120	70	330	190	4	1250000	0.5	Chinchou	50.0	170	12.0	2	f
5120	70	460	75	292	1250000	1.2	Lanturn	50.0	171	22.5	2	f
2560	70	205	190	527	1000000	0.3	Pichu	50.0	172	2.0	2	f
2560	140	218	150	492	800000	0.3	Cleffa	24.6	173	3.0	2	f
2560	70	210	170	27	800000	0.3	Igglybuff	24.6	174	1.0	2	f
2560	70	245	190	480	800000	0.3	Togepi	88.1	175	1.5	2	f
2560	70	405	75	227	800000	0.6	Togetic	88.1	176	3.2	2	f
5120	70	320	190	297	1000000	0.2	Natu	50.0	177	2.0	2	f
5120	70	470	75	348	1000000	1.5	Xatu	50.0	178	15.0	2	f
5120	70	280	235	583	1059860	0.6	Mareep	50.0	179	7.8	2	f
5120	70	365	120	583	1059860	0.8	Flaaffy	50.0	180	13.3	2	f
5120	70	610	45	292	1059860	1.4	Ampharos	50.0	181	61.5	2	f
5120	70	490	45	191	1059860	0.4	Bellossom	50.0	182	5.8	2	f
2560	70	250	190	8	800000	0.4	Marill	50.0	183	8.5	2	f
2560	70	420	75	9	800000	0.8	Azumarill	50.0	184	28.5	2	f
5120	70	410	65	251	1000000	1.2	Sudowoodo	50.0	185	38.0	2	f
5120	70	500	45	204	1059860	1.1	Politoed	50.0	186	33.9	2	f
5120	70	250	255	118	1059860	0.4	Hoppip	50.0	187	0.5	2	f
5120	70	340	120	118	1059860	0.6	Skiploom	50.0	188	1.0	2	f
5120	70	460	45	118	1059860	0.8	Jumpluff	50.0	189	3.0	2	f
5120	70	360	45	306	800000	0.8	Aipom	50.0	190	11.5	2	f
5120	70	180	235	449	1059860	0.3	Sunkern	50.0	191	1.8	2	f
5120	70	425	120	502	1059860	0.8	Sunflora	50.0	192	8.5	2	f
5120	70	390	75	100	1000000	1.2	Yanma	50.0	193	38.0	2	f
5120	70	210	255	561	1000000	0.4	Wooper	50.0	194	8.5	2	f
5120	70	430	90	561	1000000	1.4	Quagsire	50.0	195	75.0	2	f
8960	70	525	45	502	1000000	0.9	Espeon	88.1	196	26.5	2	f
8960	35	525	45	338	1000000	1.0	Umbreon	88.1	197	27.0	2	f
5120	35	405	30	128	1059860	0.5	Murkrow	50.0	198	2.1	2	f
5120	70	490	70	418	1000000	2.0	Slowking	50.0	199	79.5	2	f
6400	35	435	45	435	800000	0.7	Misdreavus	50.0	200	1.0	2	f
10240	70	336	225	510	1000000	0.5	Unown	\N	201	5.0	2	f
5120	70	405	45	366	1000000	1.3	Wobbuffet	50.0	202	28.5	2	f
5120	70	455	60	304	1000000	1.5	Girafarig	50.0	203	41.5	2	f
5120	70	290	190	23	1000000	0.6	Pineco	50.0	204	7.2	2	f
5120	70	465	75	23	1000000	1.2	Forretress	50.0	205	125.8	2	f
5120	70	415	190	280	1000000	1.5	Dunsparce	50.0	206	14.0	2	f
5120	70	430	60	194	1059860	1.1	Gligar	50.0	207	64.8	2	f
6400	70	610	25	262	1000000	9.2	Steelix	50.0	208	400.0	2	f
5120	70	300	190	173	800000	0.6	Snubbull	24.6	209	7.8	2	f
5120	70	450	75	173	800000	1.4	Granbull	24.6	210	48.7	2	f
5120	70	440	45	27	1000000	0.5	Qwilfish	50.0	211	3.9	2	f
6400	70	600	25	371	1000000	1.8	Scizor	50.0	212	118.0	2	f
5120	70	505	190	335	1059860	0.6	Shuckle	50.0	213	20.5	2	f
6400	70	600	45	461	1250000	1.5	Heracross	50.0	214	54.0	2	f
5120	35	430	60	453	1059860	0.9	Sneasel	50.0	215	28.0	2	f
5120	70	330	120	296	1000000	0.6	Teddiursa	50.0	216	8.8	2	f
5120	70	500	60	236	1000000	1.8	Ursaring	50.0	217	125.8	2	f
5120	70	250	190	285	1000000	0.7	Slugma	50.0	218	35.0	2	f
5120	70	430	75	285	1000000	0.8	Magcargo	50.0	219	55.0	2	f
5120	70	250	225	370	1250000	0.4	Swinub	50.0	220	6.5	2	f
5120	70	450	75	506	1250000	1.1	Piloswine	50.0	221	55.8	2	f
5120	70	410	60	114	800000	0.6	Corsola	24.6	222	5.0	2	f
5120	70	300	190	265	1000000	0.6	Remoraid	50.0	223	12.0	2	f
5120	70	480	75	265	1000000	0.9	Octillery	50.0	224	28.5	2	f
5120	70	330	45	133	800000	0.9	Delibird	50.0	225	16.0	2	f
6400	70	485	25	275	1250000	2.1	Mantine	50.0	226	220.0	2	f
6400	70	465	25	11	1250000	1.7	Skarmory	50.0	227	50.5	2	f
5120	35	330	120	127	1250000	0.6	Houndour	50.0	228	10.8	2	f
5120	35	600	45	127	1250000	1.4	Houndoom	50.0	229	35.0	2	f
5120	70	540	45	148	1000000	1.8	Kingdra	50.0	230	152.0	2	f
5120	70	330	120	305	1000000	0.5	Phanpy	50.0	231	33.5	2	f
5120	70	500	60	12	1000000	1.1	Donphan	50.0	232	120.0	2	f
5120	70	515	45	557	1000000	0.6	Porygon2	\N	233	32.5	2	f
5120	70	465	45	41	1250000	1.4	Stantler	50.0	234	71.2	2	f
5120	70	250	45	362	800000	1.2	Smeargle	50.0	235	58.0	2	f
6400	70	210	75	436	1000000	0.7	Tyrogue	100.0	236	21.0	2	f
6400	70	455	45	226	1000000	1.4	Hitmontop	100.0	237	48.0	2	f
6400	70	305	45	274	1000000	0.4	Smoochum	0.0	238	6.0	2	f
6400	70	360	45	160	1000000	0.6	Elekid	75.4	239	23.5	2	f
6400	70	365	45	298	1000000	0.7	Magby	75.4	240	21.4	2	f
5120	70	490	45	330	1250000	1.2	Miltank	0.0	241	75.5	2	f
10240	140	540	30	227	800000	1.5	Blissey	0.0	242	46.8	2	f
20480	35	580	3	520	1250000	1.9	Raikou	\N	243	178.0	2	t
20480	35	580	3	558	1250000	2.1	Entei	\N	244	198.0	2	t
20480	35	580	3	19	1250000	2.0	Suicune	\N	245	187.0	2	t
10240	35	300	45	413	1250000	0.6	Larvitar	50.0	246	72.0	2	f
10240	35	410	45	229	1250000	1.2	Pupitar	50.0	247	152.0	2	f
10240	35	700	45	12	1250000	2.0	Tyranitar	50.0	248	202.0	2	f
30720	0	680	3	144	1250000	5.2	Lugia	\N	249	216.0	2	t
30720	0	680	3	401	1250000	3.8	Ho-Oh	\N	250	199.0	2	t
30720	100	600	45	523	1059860	0.6	Celebi	\N	251	5.0	2	t
5120	70	310	45	581	1059860	0.5	Treecko	88.1	252	5.0	3	f
5120	70	405	45	581	1059860	0.9	Grovyle	88.1	253	21.6	3	f
5120	70	630	45	196	1059860	1.7	Sceptile	88.1	254	52.2	3	f
5120	70	310	45	92	1059860	0.4	Torchic	88.1	255	2.5	3	f
5120	70	405	45	587	1059860	0.9	Combusken	88.1	256	19.5	3	f
5120	70	630	45	52	1059860	1.9	Blaziken	88.1	257	52.0	3	f
5120	70	310	45	342	1059860	0.4	Mudkip	88.1	258	7.6	3	f
5120	70	405	45	342	1059860	0.7	Marshtomp	88.1	259	28.0	3	f
5120	70	635	45	342	1059860	1.5	Swampert	88.1	260	81.9	3	f
3840	70	220	255	46	1000000	0.5	Poochyena	50.0	261	13.6	3	f
3840	70	420	127	46	1000000	1.0	Mightyena	50.0	262	37.0	3	f
3840	70	240	255	529	1000000	0.4	Zigzagoon	50.0	263	17.5	3	f
3840	70	420	90	421	1000000	0.5	Linoone	50.0	264	32.5	3	f
3840	70	195	255	585	1000000	0.3	Wurmple	50.0	265	3.6	3	f
3840	70	205	120	104	1000000	0.6	Silcoon	50.0	266	10.0	3	f
3840	70	395	45	76	1000000	1.0	Beautifly	50.0	267	28.4	3	f
3840	70	205	120	104	1000000	0.7	Cascoon	50.0	268	11.5	3	f
3840	70	385	45	382	1000000	1.2	Dustox	50.0	269	31.6	3	f
3840	70	220	255	563	1059860	0.5	Lotad	50.0	270	2.6	3	f
3840	70	340	120	267	1059860	1.2	Lombre	50.0	271	32.5	3	f
3840	70	480	45	80	1059860	1.5	Ludicolo	50.0	272	55.0	3	f
3840	70	220	255	2	1059860	0.5	Seedot	50.0	273	4.0	3	f
3840	70	340	120	575	1059860	1.0	Nuzleaf	50.0	274	28.0	3	f
3840	70	480	45	569	1059860	1.3	Shiftry	50.0	275	59.6	3	f
3840	70	270	200	532	1059860	0.3	Taillow	50.0	276	2.3	3	f
3840	70	455	45	505	1059860	0.7	Swellow	50.0	277	19.8	3	f
5120	70	270	190	447	1000000	0.6	Wingull	50.0	278	9.5	3	f
5120	70	440	45	559	1000000	1.2	Pelipper	50.0	279	28.0	3	f
5120	35	198	235	176	1250000	0.4	Ralts	50.0	280	6.6	3	f
5120	35	278	120	165	1250000	0.8	Kirlia	50.0	281	20.2	3	f
5120	35	618	45	164	1250000	1.6	Gardevoir	50.0	282	48.4	3	f
3840	70	269	200	385	1000000	0.5	Surskit	50.0	283	1.7	3	f
3840	70	454	75	171	1000000	0.8	Masquerain	50.0	284	3.6	3	f
3840	70	295	255	345	1640000	0.4	Shroomish	50.0	285	4.5	3	f
3840	70	460	90	345	1640000	1.2	Breloom	50.0	286	39.2	3	f
3840	70	280	255	465	1250000	0.8	Slakoth	50.0	287	24.0	3	f
3840	70	440	120	572	1250000	1.4	Vigoroth	50.0	288	46.5	3	f
3840	70	670	45	286	1250000	2.0	Slaking	50.0	289	130.5	3	f
3840	70	266	255	536	600000	0.5	Nincada	50.0	290	5.5	3	f
3840	70	456	120	352	600000	0.8	Ninjask	50.0	291	12.0	3	f
3840	70	236	45	454	600000	0.8	Shedinja	\N	292	1.2	3	f
5120	70	240	190	567	1059860	0.6	Whismur	50.0	293	16.3	3	f
5120	70	360	120	43	1059860	1.0	Loudred	50.0	294	40.5	3	f
5120	70	490	45	309	1059860	1.5	Exploud	50.0	295	84.0	3	f
5120	70	237	180	224	1640000	1.0	Makuhita	75.4	296	86.4	3	f
5120	70	474	200	10	1640000	2.3	Hariyama	75.4	297	253.8	3	f
2560	70	190	150	384	800000	0.2	Azurill	24.6	298	2.0	3	f
5120	70	375	255	110	1000000	1.0	Nosepass	50.0	299	97.0	3	f
3840	70	260	255	276	800000	0.6	Skitty	24.6	300	11.0	3	f
3840	70	400	60	390	800000	1.1	Delcatty	24.6	301	32.6	3	f
6400	35	480	45	128	1059860	0.5	Sableye	50.0	302	11.0	3	f
5120	70	480	45	130	800000	0.6	Mawile	50.0	303	11.5	3	f
8960	35	330	180	257	1250000	0.4	Aron	50.0	304	60.0	3	f
8960	35	430	90	257	1250000	0.9	Lairon	50.0	305	120.0	3	f
8960	35	630	45	257	1250000	2.1	Aggron	50.0	306	360.0	3	f
5120	70	280	180	322	1000000	0.6	Meditite	50.0	307	11.2	3	f
5120	70	510	90	322	1000000	1.3	Medicham	50.0	308	31.5	3	f
5120	70	295	120	293	1250000	0.6	Electrike	50.0	309	15.2	3	f
5120	70	575	45	141	1250000	1.5	Manectric	50.0	310	40.2	3	f
5120	70	405	200	90	1000000	0.4	Plusle	50.0	311	4.2	3	f
5120	70	405	200	90	1000000	0.4	Minun	50.0	312	4.2	3	f
3840	70	430	150	181	600000	0.7	Volbeat	100.0	313	17.7	3	f
3840	70	430	150	181	1640000	0.6	Illumise	0.0	314	17.7	3	f
5120	70	400	150	518	1059860	0.3	Roselia	50.0	315	2.0	3	f
5120	70	302	225	496	1640000	0.4	Gulpin	50.0	316	10.3	3	f
5120	70	467	75	379	1640000	1.7	Swalot	50.0	317	80.0	3	f
5120	35	305	225	425	1250000	0.8	Carvanha	50.0	318	20.8	3	f
5120	35	560	60	68	1250000	1.8	Sharpedo	50.0	319	88.8	3	f
10240	70	400	125	26	1640000	2.0	Wailmer	50.0	320	130.0	3	f
10240	70	500	60	189	1640000	14.5	Wailord	50.0	321	398.0	3	f
5120	70	305	255	353	1000000	0.7	Numel	50.0	322	24.0	3	f
5120	70	560	150	169	1000000	1.9	Camerupt	50.0	323	220.0	3	f
5120	70	470	90	101	1000000	0.5	Torkoal	50.0	324	80.4	3	f
5120	70	330	255	61	800000	0.7	Spoink	50.0	325	30.6	3	f
5120	70	470	60	317	800000	0.9	Grumpig	50.0	326	71.5	3	f
3840	70	360	255	487	800000	1.1	Spinda	50.0	327	5.0	3	f
5120	70	290	255	5	1059860	0.7	Trapinch	50.0	328	15.0	3	f
5120	70	340	120	554	1059860	1.1	Vibrava	50.0	329	15.3	3	f
5120	70	520	45	348	1059860	2.0	Flygon	50.0	330	82.0	3	f
5120	35	335	190	77	1059860	0.4	Cacnea	50.0	331	51.3	3	f
5120	35	475	60	428	1059860	1.3	Cacturne	50.0	332	77.4	3	f
5120	70	310	255	115	600000	0.4	Swablu	50.0	333	1.2	3	f
5120	70	590	45	243	600000	1.1	Altaria	50.0	334	20.6	3	f
5120	70	458	90	82	600000	1.3	Zangoose	50.0	335	40.3	3	f
5120	70	458	90	175	1640000	2.7	Seviper	50.0	336	52.5	3	f
6400	70	460	45	329	800000	1.0	Lunatone	\N	337	168.0	3	f
6400	70	460	45	329	800000	1.2	Solrock	\N	338	154.0	3	f
5120	70	288	190	566	1000000	0.4	Barboach	50.0	339	1.9	3	f
5120	70	468	75	566	1000000	0.9	Whiscash	50.0	340	23.6	3	f
3840	70	308	205	420	1640000	0.6	Corphish	50.0	341	11.5	3	f
3840	70	468	155	415	1640000	1.1	Crawdaunt	50.0	342	32.8	3	f
5120	70	300	255	99	1000000	0.5	Baltoy	\N	343	21.5	3	f
5120	70	500	90	99	1000000	1.5	Claydol	\N	344	108.0	3	f
7680	70	355	45	441	600000	1.0	Lileep	88.1	345	23.8	3	f
7680	70	495	45	28	600000	1.5	Cradily	88.1	346	60.4	3	f
7680	70	355	45	357	600000	0.7	Anorith	88.1	347	12.5	3	f
7680	70	495	45	375	600000	1.5	Armaldo	88.1	348	68.2	3	f
5120	70	200	255	183	600000	0.6	Feebas	50.0	349	7.4	3	f
5120	70	540	60	515	600000	6.2	Milotic	50.0	350	162.0	3	f
6400	70	420	45	564	1000000	0.3	Castform	50.0	351	0.8	3	f
5120	70	440	200	107	1059860	1.0	Kecleon	50.0	352	22.0	3	f
6400	35	295	225	398	800000	0.6	Shuppet	50.0	353	2.3	3	f
6400	35	555	45	320	800000	1.1	Banette	50.0	354	12.5	3	f
6400	35	295	190	405	800000	0.8	Duskull	50.0	355	15.0	3	f
6400	35	455	90	35	800000	1.6	Dusclops	50.0	356	30.6	3	f
6400	70	460	200	206	1250000	2.0	Tropius	50.0	357	100.0	3	f
6400	70	455	45	576	800000	0.6	Chimecho	50.0	358	1.0	3	f
6400	35	565	30	140	1059860	1.2	Absol	50.0	359	47.0	3	f
5120	70	260	125	65	1000000	0.6	Wynaut	50.0	360	14.0	3	f
5120	70	300	190	471	1000000	0.7	Snorunt	50.0	361	16.8	3	f
5120	70	580	75	172	1000000	1.5	Glalie	50.0	362	256.5	3	f
5120	70	290	255	97	1059860	0.8	Spheal	50.0	363	39.5	3	f
5120	70	410	120	25	1059860	1.1	Sealeo	50.0	364	87.6	3	f
5120	70	530	45	245	1059860	1.4	Walrein	50.0	365	150.6	3	f
5120	70	345	255	47	600000	0.4	Clamperl	50.0	366	52.5	3	f
5120	70	485	60	132	600000	1.7	Huntail	50.0	367	27.0	3	f
5120	70	485	60	477	600000	1.8	Gorebyss	50.0	368	22.6	3	f
10240	70	485	25	307	1250000	1.0	Relicanth	88.1	369	23.4	3	f
5120	70	330	225	403	800000	0.6	Luvdisc	24.6	370	8.7	3	f
10240	35	300	45	409	1250000	0.6	Bagon	50.0	371	42.1	3	f
10240	35	420	45	167	1250000	1.1	Shelgon	50.0	372	110.5	3	f
10240	35	700	45	148	1250000	1.5	Salamence	50.0	373	102.6	3	f
10240	35	300	3	258	1250000	0.6	Beldum	\N	374	95.2	3	f
10240	35	420	3	259	1250000	1.2	Metang	\N	375	202.5	3	f
10240	35	700	3	260	1250000	1.6	Metagross	\N	376	550.0	3	f
20480	35	580	3	411	1250000	1.7	Regirock	\N	377	230.0	3	t
20480	35	580	3	247	1250000	1.8	Regice	\N	378	175.0	3	t
20480	35	580	3	261	1250000	1.9	Registeel	\N	379	205.0	3	t
30720	90	700	3	168	1250000	1.4	Latias	0.0	380	40.0	3	t
30720	90	700	3	168	1250000	2.0	Latios	100.0	381	60.0	3	t
30720	0	770	3	437	1250000	4.5	Kyogre	\N	382	352.0	3	t
30720	0	770	3	113	1250000	3.5	Groudon	\N	383	950.0	3	t
30720	0	780	45	463	1250000	7.0	Rayquaza	\N	384	206.5	3	t
30720	100	600	3	579	1250000	0.3	Jirachi	\N	385	1.1	3	t
30720	0	600	3	125	1250000	1.7	Deoxys	\N	386	60.8	3	t
5120	70	318	45	526	1059860	0.4	Turtwig	88.1	387	10.2	4	f
5120	70	405	45	223	1059860	1.1	Grotle	88.1	388	97.0	4	f
5120	70	525	45	113	1059860	2.2	Torterra	88.1	389	310.0	4	f
5120	70	309	45	94	1059860	0.5	Chimchar	88.1	390	6.2	4	f
5120	70	405	45	376	1059860	0.9	Monferno	88.1	391	22.0	4	f
5120	70	534	45	187	1059860	1.2	Infernape	88.1	392	55.0	4	f
5120	70	314	45	367	1059860	0.4	Piplup	88.1	393	5.2	4	f
5120	70	405	45	367	1059860	0.8	Prinplup	88.1	394	23.0	4	f
5120	70	530	45	166	1059860	1.7	Empoleon	88.1	395	84.5	4	f
3840	70	245	255	493	1059860	0.3	Starly	50.0	396	2.0	4	f
3840	70	340	120	493	1059860	0.6	Staravia	50.0	397	15.5	4	f
3840	70	485	45	389	1059860	1.2	Staraptor	50.0	398	24.9	4	f
3840	70	250	255	378	1000000	0.5	Bidoof	50.0	399	20.0	4	f
3840	70	410	127	34	1000000	1.0	Bibarel	50.0	400	31.5	4	f
3840	70	194	255	120	1059860	0.3	Kricketot	50.0	401	2.2	4	f
3840	70	384	45	120	1059860	1.0	Kricketune	50.0	402	25.5	4	f
5120	70	263	235	188	1059860	0.5	Shinx	50.0	403	9.5	4	f
5120	100	363	120	478	1059860	0.9	Luxio	50.0	404	30.5	4	f
5120	70	523	45	213	1059860	1.4	Luxray	50.0	405	42.0	4	f
5120	70	280	255	72	1059860	0.2	Budew	50.0	406	1.2	4	f
5120	70	515	75	63	1059860	0.9	Roserade	50.0	407	14.5	4	f
7680	70	350	45	230	600000	0.9	Cranidos	88.1	408	31.5	4	f
7680	70	495	45	230	600000	1.6	Rampardos	88.1	409	102.5	4	f
7680	70	350	45	458	600000	0.5	Shieldon	88.1	410	57.0	4	f
7680	70	495	45	458	600000	1.3	Bastiodon	88.1	411	149.5	4	f
3840	70	224	120	23	1000000	0.2	Burmy	50.0	412	3.4	4	f
3840	70	424	45	23	1000000	0.5	Wormadam	0.0	413	6.5	4	f
3840	70	424	45	339	1000000	0.9	Mothim	100.0	414	23.3	4	f
3840	70	244	120	524	1059860	0.3	Combee	88.1	415	5.5	4	f
3840	70	474	45	37	1059860	1.2	Vespiquen	0.0	416	38.5	4	f
2560	100	405	200	159	1000000	0.4	Pachirisu	50.0	417	3.9	4	f
5120	70	330	190	445	1000000	0.7	Buizel	50.0	418	29.5	4	f
5120	70	495	75	445	1000000	1.1	Floatzel	50.0	419	33.5	4	f
5120	70	275	190	91	1000000	0.4	Cherubi	50.0	420	3.3	4	f
5120	70	450	75	56	1000000	0.5	Cherrim	50.0	421	9.3	4	f
5120	70	325	190	444	1000000	0.3	Shellos	50.0	422	6.3	4	f
5120	70	475	75	444	1000000	0.9	Gastrodon	50.0	423	29.9	4	f
5120	100	482	45	306	800000	1.2	Ambipom	50.0	424	20.3	4	f
7680	70	348	125	27	1640000	0.4	Drifloon	50.0	425	1.2	4	f
7680	70	498	60	54	1640000	1.2	Drifblim	50.0	426	15.0	4	f
5120	0	350	190	400	1000000	0.4	Buneary	50.0	427	5.5	4	f
5120	140	580	60	400	1000000	1.2	Lopunny	50.0	428	33.3	4	f
6400	35	495	45	314	800000	0.9	Mismagius	50.0	429	4.4	4	f
5120	35	505	30	39	1059860	0.9	Honchkrow	50.0	430	27.3	4	f
5120	70	310	190	83	800000	0.5	Glameow	24.6	431	3.9	4	f
5120	70	452	75	522	800000	1.0	Purugly	24.6	432	43.8	4	f
6400	70	285	120	38	800000	0.2	Chingling	50.0	433	0.6	4	f
5120	70	329	225	462	1000000	0.4	Stunky	50.0	434	19.2	4	f
5120	70	479	60	462	1000000	1.0	Skuntank	50.0	435	38.0	4	f
5120	70	300	255	67	1000000	0.5	Bronzor	\N	436	60.5	4	f
5120	70	500	90	66	1000000	1.3	Bronzong	\N	437	187.0	4	f
5120	70	290	255	60	1000000	0.5	Bonsly	50.0	438	15.0	4	f
6400	70	310	145	331	1000000	0.6	Mime Jr.	50.0	439	13.0	4	f
10240	140	220	130	377	800000	0.6	Happiny	0.0	440	24.4	4	f
5120	35	411	30	346	1059860	0.5	Chatot	50.0	441	1.9	4	f
7680	70	485	100	195	1000000	1.0	Spiritomb	50.0	442	108.0	4	f
10240	70	300	45	279	1250000	0.7	Gible	50.0	443	20.5	4	f
10240	70	410	45	85	1250000	1.4	Gabite	50.0	444	56.0	4	f
10240	70	700	45	313	1250000	1.9	Garchomp	50.0	445	95.0	4	f
10240	70	390	50	40	1250000	0.6	Munchlax	88.1	446	105.0	4	f
6400	70	285	75	162	1059860	0.7	Riolu	88.1	447	20.2	4	f
6400	70	625	45	18	1059860	1.2	Lucario	88.1	448	54.0	4	f
7680	70	330	140	238	1250000	0.8	Hippopotas	50.0	449	49.5	4	f
7680	70	525	60	232	1250000	2.0	Hippowdon	50.0	450	300.0	4	f
5120	70	330	120	432	1250000	0.8	Skorupi	50.0	451	12.0	4	f
5120	70	500	45	356	1250000	1.3	Drapion	50.0	452	61.5	4	f
2560	100	300	140	535	1000000	0.7	Croagunk	50.0	453	23.0	4	f
5120	70	490	75	535	1000000	1.3	Toxicroak	50.0	454	44.4	4	f
6400	70	454	200	73	1250000	1.4	Carnivine	50.0	455	27.0	4	f
5120	70	330	190	578	600000	0.4	Finneon	50.0	456	7.0	4	f
5120	70	460	75	350	600000	1.2	Lumineon	50.0	457	24.0	4	f
6400	70	345	25	275	1250000	1.0	Mantyke	50.0	458	65.0	4	f
5120	70	334	120	205	1250000	1.0	Snover	50.0	459	50.5	4	f
5120	70	594	60	205	1250000	2.2	Abomasnow	50.0	460	135.5	4	f
5120	35	510	45	453	1059860	1.1	Weavile	50.0	461	34.0	4	f
5120	70	535	30	315	1000000	1.2	Magnezone	\N	462	180.0	4	f
5120	70	515	30	290	1000000	1.7	Lickilicky	50.0	463	140.0	4	f
5120	70	535	30	151	1250000	2.4	Rhyperior	50.0	464	282.8	4	f
5120	70	535	30	556	1000000	2.0	Tangrowth	50.0	465	128.6	4	f
6400	70	540	30	521	1000000	1.8	Electivire	75.4	466	138.6	4	f
6400	70	540	30	50	1000000	1.6	Magmortar	75.4	467	68.0	4	f
2560	70	545	30	268	800000	1.5	Togekiss	88.1	468	38.0	4	f
5120	70	515	30	355	1000000	1.9	Yanmega	50.0	469	51.5	4	f
8960	35	525	45	553	1000000	1.0	Leafeon	88.1	470	25.5	4	f
8960	35	525	45	203	1000000	0.8	Glaceon	88.1	471	25.9	4	f
5120	70	510	30	174	1059860	2.0	Gliscor	50.0	472	42.5	4	f
5120	70	530	50	549	1250000	2.5	Mamoswine	50.0	473	291.0	4	f
5120	70	535	30	557	1000000	0.9	Porygon-Z	\N	474	34.0	4	f
5120	35	618	45	48	1250000	1.6	Gallade	100.0	475	52.0	4	f
5120	70	525	60	110	1000000	1.4	Probopass	50.0	476	340.0	4	f
6400	35	525	45	222	800000	2.2	Dusknoir	50.0	477	106.6	4	f
5120	70	480	75	472	1000000	1.3	Froslass	0.0	478	26.6	4	f
5120	70	520	45	374	1000000	0.3	Rotom	\N	479	0.3	4	f
20480	140	580	3	277	1250000	0.3	Uxie	\N	480	0.3	4	t
20480	140	580	3	165	1250000	0.3	Mesprit	\N	481	0.3	4	t
20480	140	580	3	574	1250000	0.3	Azelf	\N	482	0.3	4	t
30720	0	680	3	514	1250000	5.4	Dialga	\N	483	683.0	4	t
30720	0	680	3	479	1250000	4.2	Palkia	\N	484	336.0	4	t
2560	100	600	3	284	1250000	1.7	Heatran	50.0	485	430.0	4	t
30720	0	670	3	108	1250000	3.7	Regigigas	\N	486	420.0	4	t
30720	0	680	3	404	1250000	4.5	Giratina	\N	487	750.0	4	t
30720	100	600	3	311	1250000	1.5	Cresselia	0.0	488	85.6	4	t
10240	70	480	30	440	1250000	0.4	Phione	\N	489	3.1	4	f
2560	70	600	3	446	1250000	0.3	Manaphy	\N	490	1.4	4	t
30720	0	600	3	372	1250000	1.5	Darkrai	\N	491	50.5	4	t
30720	100	600	45	221	1059860	0.2	Shaymin	\N	492	2.1	4	t
30720	0	720	3	3	1250000	3.2	Arceus	\N	493	320.0	4	t
30720	100	600	3	555	1250000	0.4	Victini	\N	494	4.0	5	t
5120	70	308	45	219	1059860	0.6	Snivy	88.1	495	8.1	5	f
5120	70	413	45	219	1059860	0.8	Servine	88.1	496	16.0	5	f
5120	70	528	45	402	1059860	3.3	Serperior	88.1	497	63.0	5	f
5120	70	308	45	180	1059860	0.5	Tepig	88.1	498	9.9	5	f
5120	70	418	45	180	1059860	1.0	Pignite	88.1	499	55.5	5	f
5120	70	528	45	323	1059860	1.6	Emboar	88.1	500	150.0	5	f
5120	70	308	45	443	1059860	0.5	Oshawott	88.1	501	5.9	5	f
5120	70	413	45	142	1059860	0.8	Dewott	88.1	502	24.5	5	f
5120	70	528	45	197	1059860	1.5	Samurott	88.1	503	94.6	5	f
3840	70	255	255	433	1000000	0.5	Patrat	50.0	504	11.6	5	f
5120	70	420	255	308	1000000	1.1	Watchog	50.0	505	27.0	5	f
3840	70	275	255	399	1059860	0.4	Lillipup	50.0	506	4.1	5	f
3840	70	370	120	310	1059860	0.9	Herdier	50.0	507	14.7	5	f
3840	70	500	45	44	1059860	1.2	Stoutland	50.0	508	61.0	5	f
5120	70	281	255	137	1000000	0.4	Purrloin	50.0	509	10.1	5	f
5120	70	446	90	121	1000000	1.1	Liepard	50.0	510	37.5	5	f
5120	70	316	190	217	1000000	0.6	Pansage	88.1	511	10.5	5	f
5120	70	498	75	516	1000000	1.1	Simisage	88.1	512	30.5	5	f
5120	70	316	190	237	1000000	0.6	Pansear	88.1	513	11.0	5	f
5120	70	498	75	163	1000000	1.0	Simisear	88.1	514	28.0	5	f
5120	70	316	190	488	1000000	0.6	Panpour	88.1	515	13.5	5	f
5120	70	498	75	212	1000000	1.0	Simipour	88.1	516	29.0	5	f
2560	70	292	190	150	800000	0.6	Munna	50.0	517	23.3	5	f
2560	70	487	75	152	800000	1.1	Musharna	50.0	518	60.5	5	f
3840	70	264	255	528	1059860	0.3	Pidove	50.0	519	2.1	5	f
3840	70	358	120	573	1059860	0.6	Tranquill	50.0	520	15.0	5	f
3840	70	488	45	394	1059860	1.2	Unfezant	50.0	521	29.0	5	f
5120	70	295	190	161	1000000	0.8	Blitzle	50.0	522	29.8	5	f
5120	70	497	75	521	1000000	1.6	Zebstrika	50.0	523	79.5	5	f
3840	70	280	255	319	1059860	0.4	Roggenrola	50.0	524	18.0	5	f
3840	70	390	120	359	1059860	0.9	Boldore	50.0	525	102.0	5	f
3840	70	515	45	111	1059860	1.7	Gigalith	50.0	526	260.0	5	f
3840	70	323	190	31	1000000	0.4	Woobat	50.0	527	2.1	5	f
3840	70	425	45	119	1000000	0.9	Swoobat	50.0	528	10.5	5	f
5120	70	328	120	336	1000000	0.3	Drilbur	50.0	529	8.5	5	f
5120	70	508	60	501	1000000	0.7	Excadrill	50.0	530	40.4	5	f
5120	70	545	255	231	800000	1.1	Audino	50.0	531	31.0	5	f
5120	70	305	180	344	1059860	0.6	Timburr	75.4	532	12.5	5	f
5120	70	405	90	344	1059860	1.2	Gurdurr	75.4	533	40.0	5	f
5120	70	505	45	344	1059860	1.4	Conkeldurr	75.4	534	87.0	5	f
5120	70	294	255	512	1059860	0.5	Tympole	50.0	535	4.5	5	f
5120	70	384	120	554	1059860	0.8	Palpitoad	50.0	536	17.0	5	f
5120	70	509	45	554	1059860	1.5	Seismitoad	50.0	537	62.0	5	f
5120	70	465	45	269	1000000	1.3	Throh	100.0	538	55.5	5	f
5120	70	465	45	271	1000000	1.4	Sawk	100.0	539	51.0	5	f
3840	70	310	255	450	1059860	0.3	Sewaddle	50.0	540	2.5	5	f
3840	70	380	120	288	1059860	0.5	Swadloon	50.0	541	7.3	5	f
3840	70	500	45	354	1059860	1.2	Leavanny	50.0	542	20.5	5	f
3840	70	260	255	88	1059860	0.4	Venipede	50.0	543	5.3	5	f
3840	70	360	120	123	1059860	1.2	Whirlipede	50.0	544	58.5	5	f
5120	70	485	45	324	1059860	2.5	Scolipede	50.0	545	200.5	5	f
5120	70	280	190	117	1000000	0.3	Cottonee	50.0	546	0.6	5	f
5120	70	480	75	577	1000000	0.7	Whimsicott	50.0	547	6.6	5	f
5120	70	280	190	75	1000000	0.5	Petilil	0.0	548	6.6	5	f
5120	70	480	75	192	1000000	1.1	Lilligant	0.0	549	16.3	5	f
10240	70	460	25	240	1000000	1.0	Basculin	50.0	550	18.0	5	f
5120	70	292	180	134	1059860	0.7	Sandile	50.0	551	15.2	5	f
5120	70	351	90	134	1059860	1.0	Krokorok	50.0	552	33.4	5	f
5120	70	519	45	254	1059860	1.5	Krookodile	50.0	553	96.3	5	f
5120	70	315	120	588	1059860	0.6	Darumaka	50.0	554	37.5	5	f
5120	70	540	60	53	1059860	1.3	Darmanitan	50.0	555	92.9	5	f
5120	70	461	255	77	1000000	1.0	Maractus	50.0	556	28.0	5	f
5120	70	325	190	410	1000000	0.3	Dwebble	50.0	557	14.5	5	f
5120	70	485	75	497	1000000	1.4	Crustle	50.0	558	200.0	5	f
3840	35	348	180	455	1000000	0.6	Scraggy	50.0	559	11.8	5	f
3840	70	488	90	239	1000000	1.1	Scrafty	50.0	560	30.0	5	f
5120	70	490	45	21	1000000	1.4	Sigilyph	50.0	561	14.0	5	f
6400	70	303	190	485	1000000	0.5	Yamask	50.0	562	1.5	5	f
6400	70	483	90	105	1000000	1.7	Cofagrigus	50.0	563	76.5	5	f
7680	70	355	45	393	1000000	0.7	Tirtouga	88.1	564	16.5	5	f
7680	70	495	45	393	1000000	1.2	Carracosta	88.1	565	81.0	5	f
7680	70	401	45	182	1000000	0.5	Archen	88.1	566	9.5	5	f
7680	70	567	45	182	1000000	1.4	Archeops	88.1	567	32.0	5	f
5120	70	329	190	540	1000000	0.6	Trubbish	50.0	568	31.0	5	f
5120	70	474	60	541	1000000	1.9	Garbodor	50.0	569	107.3	5	f
6400	70	330	75	542	1059860	0.7	Zorua	88.1	570	12.5	5	f
5120	70	510	45	250	1059860	1.6	Zoroark	88.1	571	81.1	5	f
3840	70	300	255	95	800000	0.4	Minccino	24.6	572	5.8	5	f
3840	70	470	60	429	800000	0.5	Cinccino	24.6	573	7.5	5	f
5120	70	290	200	185	1059860	0.4	Gothita	24.6	574	5.8	5	f
5120	70	390	100	317	1059860	0.7	Gothorita	24.6	575	18.0	5	f
5120	70	490	50	15	1059860	1.5	Gothitelle	24.6	576	44.0	5	f
5120	70	290	200	87	1059860	0.3	Solosis	50.0	577	1.0	5	f
5120	70	370	100	333	1059860	0.6	Duosion	50.0	578	8.0	5	f
5120	70	490	50	343	1059860	1.0	Reuniclus	50.0	579	20.1	5	f
5120	70	305	190	559	1000000	0.5	Ducklett	50.0	580	5.5	5	f
5120	70	473	45	568	1000000	1.3	Swanna	50.0	581	24.2	5	f
5120	70	305	255	203	1250000	0.4	Vanillite	50.0	582	5.7	5	f
5120	70	395	120	248	1250000	1.1	Vanillish	50.0	583	41.0	5	f
5120	70	535	45	473	1250000	1.3	Vanilluxe	50.0	584	57.5	5	f
5120	70	335	190	448	1000000	0.6	Deerling	50.0	585	19.5	5	f
5120	70	475	75	448	1000000	1.9	Sawsbuck	50.0	586	92.5	5	f
5120	70	428	200	464	1000000	0.4	Emolga	50.0	587	5.0	5	f
3840	70	315	200	96	1000000	0.5	Karrablast	50.0	588	5.9	5	f
3840	70	495	75	84	1000000	1.0	Escavalier	50.0	589	33.0	5	f
5120	70	294	190	345	1000000	0.2	Foongus	50.0	590	1.0	5	f
5120	70	464	75	345	1000000	0.6	Amoonguss	50.0	591	10.5	5	f
5120	70	335	190	190	1000000	1.2	Frillish	50.0	592	33.0	5	f
5120	70	480	60	190	1000000	2.2	Jellicent	50.0	593	135.0	5	f
10240	70	470	75	81	800000	1.2	Alomomola	50.0	594	31.6	5	f
5120	70	319	190	17	1000000	0.1	Joltik	50.0	595	0.6	5	f
5120	70	472	75	158	1000000	0.8	Galvantula	50.0	596	14.3	5	f
5120	70	305	255	519	1000000	0.6	Ferroseed	50.0	597	18.8	5	f
5120	70	489	90	517	1000000	1.0	Ferrothorn	50.0	598	110.0	5	f
5120	70	300	130	209	1059860	0.3	Klink	\N	599	21.0	5	f
5120	70	440	60	209	1059860	0.6	Klang	\N	600	51.0	5	f
5120	70	520	30	209	1059860	0.6	Klinklang	\N	601	81.0	5	f
5120	70	275	190	157	1250000	0.2	Tynamo	50.0	602	0.3	5	f
5120	70	405	60	157	1250000	1.2	Eelektrik	50.0	603	22.0	5	f
5120	70	515	30	157	1250000	2.1	Eelektross	50.0	604	80.5	5	f
5120	70	335	255	89	1000000	0.5	Elgyem	50.0	605	9.0	5	f
5120	70	485	90	89	1000000	1.0	Beheeyem	50.0	606	34.5	5	f
5120	70	275	190	78	1059860	0.3	Litwick	50.0	607	3.1	5	f
5120	70	370	90	278	1059860	0.6	Lampent	50.0	608	13.0	5	f
5120	70	520	45	312	1059860	1.0	Chandelure	50.0	609	34.3	5	f
10240	35	320	75	547	1250000	0.6	Axew	50.0	610	18.0	5	f
10240	35	410	60	22	1250000	1.0	Fraxure	50.0	611	36.0	5	f
10240	35	540	45	22	1250000	1.8	Haxorus	50.0	612	105.5	5	f
5120	70	305	120	93	1000000	0.5	Cubchoo	50.0	613	8.5	5	f
5120	70	505	60	202	1000000	2.6	Beartic	50.0	614	260.0	5	f
6400	70	515	25	122	1000000	1.1	Cryogonal	\N	615	148.0	5	f
3840	70	305	200	469	1000000	0.4	Shelmet	50.0	616	7.7	5	f
3840	70	495	75	456	1000000	0.8	Accelgor	50.0	617	25.3	5	f
5120	70	471	75	539	1000000	0.7	Stunfisk	50.0	618	11.0	5	f
6400	70	350	180	321	1059860	0.9	Mienfoo	50.0	619	20.0	5	f
6400	70	510	45	321	1059860	1.4	Mienshao	50.0	620	35.5	5	f
7680	70	485	45	85	1000000	1.6	Druddigon	50.0	621	139.0	5	f
6400	70	303	190	20	1000000	1.0	Golett	\N	622	92.0	5	f
6400	70	483	90	20	1000000	2.8	Golurk	\N	623	330.0	5	f
5120	35	340	120	452	1000000	0.5	Pawniard	50.0	624	10.2	5	f
5120	35	490	45	508	1000000	1.6	Bisharp	50.0	625	70.0	5	f
5120	70	490	45	30	1000000	1.6	Bouffalant	50.0	626	94.6	5	f
5120	70	350	190	154	1250000	0.5	Rufflet	100.0	627	10.5	5	f
5120	70	510	60	551	1250000	1.5	Braviary	100.0	628	41.0	5	f
5120	35	370	190	138	1250000	0.5	Vullaby	0.0	629	9.0	5	f
5120	35	510	60	59	1250000	1.2	Mandibuzz	0.0	630	39.5	5	f
5120	70	484	90	6	1000000	1.4	Heatmor	50.0	631	58.0	5	f
5120	70	484	90	256	1000000	0.3	Durant	50.0	632	33.0	5	f
10240	35	300	45	255	1250000	0.8	Deino	50.0	633	17.3	5	f
10240	35	420	45	240	1250000	1.4	Zweilous	50.0	634	50.0	5	f
10240	35	600	45	68	1250000	1.8	Hydreigon	50.0	635	160.0	5	f
10240	70	360	45	533	1250000	1.1	Larvesta	50.0	636	28.8	5	f
10240	70	550	15	502	1250000	1.6	Volcarona	50.0	637	46.0	5	f
20480	35	580	3	263	1250000	2.1	Cobalion	\N	638	250.0	5	t
20480	35	580	3	86	1250000	1.9	Terrakion	\N	639	260.0	5	t
20480	35	580	3	220	1250000	2.0	Virizion	\N	640	200.0	5	t
30720	90	580	3	124	1250000	1.5	Tornadus	100.0	641	63.0	5	t
30720	90	580	3	57	1250000	1.5	Thundurus	100.0	642	61.0	5	t
30720	0	680	3	552	1250000	3.2	Reshiram	\N	643	330.0	5	t
30720	0	680	3	131	1250000	2.9	Zekrom	\N	644	345.0	5	t
30720	90	600	3	1	1250000	1.5	Landorus	100.0	645	68.0	5	t
30720	0	700	3	62	1250000	3.0	Kyurem	\N	646	325.0	5	t
20480	35	580	3	109	1250000	1.4	Keldeo	\N	647	48.5	5	t
30720	100	600	3	326	1250000	0.6	Meloetta	\N	648	6.5	5	t
30720	0	600	3	363	1250000	1.5	Genesect	\N	649	82.5	5	t
5120	70	313	45	482	1059860	0.4	Chespin	88.1	650	9.0	6	f
5120	70	405	45	483	1059860	0.7	Quilladin	88.1	651	29.0	6	f
5120	70	530	45	483	1059860	1.6	Chesnaught	88.1	652	90.0	6	f
5120	70	307	45	199	1059860	0.4	Fennekin	88.1	653	9.4	6	f
5120	70	409	45	199	1059860	1.0	Braixen	88.1	654	14.5	6	f
5120	70	534	45	199	1059860	1.5	Delphox	88.1	655	39.0	6	f
5120	70	314	45	70	1059860	0.3	Froakie	88.1	656	7.0	6	f
5120	70	405	45	70	1059860	0.6	Frogadier	88.1	657	10.9	6	f
5120	70	640	45	352	1059860	1.5	Greninja	88.1	658	40.0	6	f
3840	70	237	255	139	1000000	0.4	Bunnelby	50.0	659	5.0	6	f
3840	70	423	127	139	1000000	1.0	Diggersby	50.0	660	42.4	6	f
3840	70	278	255	530	1059860	0.3	Fletchling	50.0	661	1.7	6	f
3840	70	382	120	163	1059860	0.7	Fletchinder	50.0	662	16.0	6	f
3840	70	499	45	431	1059860	1.2	Talonflame	50.0	663	24.5	6	f
3840	70	200	255	430	1000000	0.3	Scatterbug	50.0	664	2.5	6	f
3840	70	213	120	430	1000000	0.3	Spewpa	50.0	665	8.4	6	f
3840	70	411	45	426	1000000	1.2	Vivillon	50.0	666	17.0	6	f
5120	70	369	220	294	1059860	0.6	Litleo	11.2	667	13.5	6	f
5120	70	507	65	418	1059860	1.5	Pyroar	11.2	668	81.5	6	f
5120	70	303	225	460	1000000	0.1	Flabébé	0.0	669	0.1	6	f
5120	70	551	120	173	1000000	0.2	Floette	0.0	670	0.9	6	f
5120	70	552	45	207	1000000	1.1	Florges	0.0	671	10.0	6	f
5120	70	350	200	340	1000000	0.9	Skiddo	50.0	672	31.0	6	f
5120	70	531	45	340	1000000	1.7	Gogoat	50.0	673	91.0	6	f
6400	70	348	220	376	1000000	0.6	Pancham	50.0	674	8.0	6	f
6400	70	495	65	129	1000000	2.1	Pangoro	50.0	675	136.0	6	f
5120	70	472	160	386	1000000	1.2	Furfrou	50.0	676	28.0	6	f
5120	70	355	190	406	1000000	0.3	Espurr	50.0	677	3.5	6	f
5120	70	466	75	112	1000000	0.6	Meowstic	50.0	678	8.5	6	f
5120	70	325	180	509	1000000	0.8	Honedge	50.0	679	2.0	6	f
5120	70	448	90	509	1000000	0.8	Doublade	50.0	680	4.5	6	f
5120	70	520	45	419	1000000	1.7	Aegislash	50.0	681	53.0	6	f
5120	70	341	200	368	1000000	0.2	Spritzee	50.0	682	0.5	6	f
5120	70	462	140	200	1000000	0.8	Aromatisse	50.0	683	15.5	6	f
5120	70	341	200	116	1000000	0.4	Swirlix	50.0	684	3.5	6	f
5120	70	480	140	327	1000000	0.8	Slurpuff	50.0	685	5.0	6	f
5120	70	288	190	407	1000000	0.4	Inkay	50.0	686	3.5	6	f
5120	70	482	80	360	1000000	1.5	Malamar	50.0	687	47.0	6	f
5120	70	306	120	550	1000000	0.5	Binacle	50.0	688	31.0	6	f
5120	70	500	45	106	1000000	1.3	Barbaracle	50.0	689	96.0	6	f
5120	70	320	225	334	1000000	0.5	Skrelp	50.0	690	7.3	6	f
5120	70	494	55	334	1000000	1.8	Dragalge	50.0	691	81.5	6	f
3840	70	330	225	562	1250000	0.5	Clauncher	50.0	692	8.3	6	f
3840	70	500	55	241	1250000	1.3	Clawitzer	50.0	693	35.3	6	f
5120	70	289	190	210	1000000	0.5	Helioptile	50.0	694	6.0	6	f
5120	70	481	75	210	1000000	1.0	Heliolisk	50.0	695	21.0	6	f
7680	70	362	45	417	1000000	0.8	Tyrunt	88.1	696	26.0	6	f
7680	70	521	45	135	1000000	2.5	Tyrantrum	88.1	697	270.0	6	f
7680	70	362	45	544	1000000	1.3	Amaura	88.1	698	25.2	6	f
7680	70	521	45	544	1000000	2.7	Aurorus	88.1	699	225.0	6	f
8960	70	525	45	253	1000000	1.0	Sylveon	88.1	700	23.5	6	f
5120	70	500	100	586	1000000	0.8	Hawlucha	50.0	701	21.5	6	f
5120	70	431	180	7	1000000	0.2	Dedenne	50.0	702	2.2	6	f
6400	70	500	60	266	1250000	0.3	Carbink	\N	703	5.7	6	f
10240	35	300	45	474	1250000	0.3	Goomy	50.0	704	2.8	6	f
10240	35	452	45	474	1250000	0.8	Sliggoo	50.0	705	17.5	6	f
10240	35	600	45	148	1250000	2.0	Goodra	50.0	706	150.5	6	f
5120	70	470	75	272	800000	0.2	Klefki	50.0	707	3.0	6	f
5120	70	309	120	500	1000000	0.4	Phantump	50.0	708	7.0	6	f
5120	70	474	60	156	1000000	1.5	Trevenant	50.0	709	71.0	6	f
5120	70	335	120	396	1000000	0.8	Pumpkaboo	50.0	710	15.0	6	f
5120	70	494	60	396	1000000	1.7	Gourgeist	50.0	711	39.0	6	f
5120	70	304	190	246	1000000	1.0	Bergmite	50.0	712	99.5	6	f
5120	70	514	55	247	1000000	2.0	Avalugg	50.0	713	505.0	6	f
5120	70	245	190	476	1000000	0.5	Noibat	50.0	714	8.0	6	f
5120	70	535	45	476	1000000	1.5	Noivern	50.0	715	85.0	6	f
30720	0	680	45	291	1250000	3.0	Xerneas	\N	716	215.0	6	t
30720	0	680	45	136	1250000	5.8	Yveltal	\N	717	203.0	6	t
30720	0	708	3	358	1250000	5.0	Zygarde	\N	718	284.6	6	t
6400	70	700	3	266	1250000	0.7	Diancie	\N	719	8.8	6	t
30720	100	680	3	332	1250000	\N	Hoopa	\N	720	\N	6	t
30720	100	600	3	495	1250000	1.7	Volcanion	\N	721	195.0	6	t
3840	70	320	45	218	1059860	0.3	Rowlet	88.1	722	1.5	7	f
3840	70	420	45	49	1059860	0.7	Dartrix	88.1	723	16.0	7	f
3840	70	530	45	13	1059860	1.6	Decidueye	88.1	724	36.6	7	f
3840	70	320	45	177	1059860	0.4	Litten	88.1	725	4.3	7	f
3840	70	420	45	177	1059860	0.7	Torracat	88.1	726	25.0	7	f
3840	70	530	45	233	1059860	1.8	Incineroar	88.1	727	83.0	7	f
3840	70	320	45	442	1059860	0.4	Popplio	88.1	728	7.5	7	f
3840	70	420	45	387	1059860	0.6	Brionne	88.1	729	17.5	7	f
3840	70	530	45	475	1059860	1.8	Primarina	88.1	730	44.0	7	f
3840	70	265	255	582	1000000	0.3	Pikipek	50.0	731	1.2	7	f
3840	70	355	120	74	1000000	0.6	Trumbeak	50.0	732	14.8	7	f
3840	70	485	45	79	1000000	1.1	Toucannon	50.0	733	26.0	7	f
3840	70	253	255	300	1000000	0.4	Yungoos	50.0	734	6.0	7	f
3840	70	418	127	491	1000000	0.7	Gumshoos	50.0	735	14.2	7	f
3840	70	300	255	282	1000000	0.4	Grubbin	50.0	736	4.4	7	f
3840	70	400	120	32	1000000	0.5	Charjabug	50.0	737	10.5	7	f
3840	70	500	45	489	1000000	1.5	Vikavolt	50.0	738	45.0	7	f
5120	70	338	225	64	1000000	0.6	Crabrawler	50.0	739	7.0	7	f
5120	70	478	60	584	1000000	1.7	Crabominable	50.0	740	180.0	7	f
5120	70	476	45	126	1000000	0.6	Oricorio	24.6	741	3.4	7	f
5120	70	304	190	36	1000000	0.1	Cutiefly	50.0	742	0.2	7	f
5120	70	464	75	36	1000000	0.2	Ribombee	50.0	743	0.5	7	f
3840	70	280	190	399	1000000	0.5	Rockruff	50.0	744	9.2	7	f
3840	70	487	90	580	1000000	\N	Lycanroc	50.0	745	\N	7	f
3840	70	620	60	468	800000	0.2	Wishiwashi	50.0	746	0.3	7	f
5120	70	305	190	69	1000000	0.4	Mareanie	50.0	747	8.0	7	f
5120	70	495	75	69	1000000	0.7	Toxapex	50.0	748	14.5	7	f
5120	70	385	190	145	1000000	1.0	Mudbray	50.0	749	110.0	7	f
5120	70	500	60	147	1000000	2.5	Mudsdale	50.0	750	920.0	7	f
3840	70	269	200	560	1000000	0.3	Dewpider	50.0	751	4.0	7	f
3840	70	454	100	560	1000000	1.8	Araquanid	50.0	752	82.0	7	f
5120	70	250	190	459	1000000	0.3	Fomantis	50.0	753	1.5	7	f
5120	70	480	75	55	1000000	0.9	Lurantis	50.0	754	18.5	7	f
5120	70	285	190	249	1000000	0.2	Morelull	50.0	755	1.5	7	f
5120	70	405	75	249	1000000	1.0	Shiinotic	50.0	756	11.5	7	f
5120	70	320	120	534	1000000	0.6	Salandit	88.1	757	4.8	7	f
5120	70	480	45	534	1000000	1.2	Salazzle	0.0	758	22.2	7	f
3840	70	340	140	186	1000000	0.5	Stufful	50.0	759	6.8	7	f
3840	70	500	70	499	1000000	2.1	Bewear	50.0	760	135.0	7	f
5120	70	210	235	206	1059860	0.3	Bounsweet	0.0	761	3.2	7	f
5120	70	290	120	206	1059860	0.7	Steenee	0.0	762	8.2	7	f
5120	70	510	45	206	1059860	1.2	Tsareena	0.0	763	21.4	7	f
5120	70	485	60	388	800000	0.1	Comfey	24.6	764	0.3	7	f
5120	70	490	45	422	1250000	1.5	Oranguru	50.0	765	76.0	7	f
5120	70	490	45	513	1250000	2.0	Passimian	50.0	766	82.8	7	f
5120	70	230	90	545	1000000	0.5	Wimpod	50.0	767	12.0	7	f
5120	70	530	45	228	1000000	2.0	Golisopod	50.0	768	108.0	7	f
3840	70	320	140	424	1000000	0.5	Sandygast	50.0	769	70.0	7	f
3840	70	480	60	423	1000000	1.3	Palossand	50.0	770	250.0	7	f
3840	70	410	60	439	800000	0.3	Pyukumuku	50.0	771	1.2	7	f
30720	0	534	3	511	1250000	1.9	Type: Null	\N	772	120.5	7	f
30720	0	570	3	511	1250000	2.3	Silvally	\N	773	100.5	7	f
6400	70	500	30 (Meteorite)255 (Core)	328	1059860	0.3	Minior	\N	774	40.0	7	f
5120	70	480	45	152	1250000	0.4	Komala	50.0	775	19.9	7	f
5120	70	485	70	51	1000000	2.0	Turtonator	50.0	776	212.0	7	f
2560	70	435	180	416	1000000	0.3	Togedemaru	50.0	777	3.3	7	f
5120	70	476	45	143	1000000	0.2	Mimikyu	50.0	778	0.7	7	f
3840	70	475	80	215	1000000	0.9	Bruxish	50.0	779	19.0	7	f
5120	70	485	70	373	1000000	3.0	Drampa	50.0	780	185.0	7	f
6400	70	517	25	438	1000000	3.9	Dhelmise	\N	781	210.0	7	f
10240	70	300	45	427	1250000	0.6	Jangmo-o	50.0	782	29.7	7	f
10240	70	420	45	427	1250000	1.2	Hakamo-o	50.0	783	47.0	7	f
10240	70	600	45	427	1250000	1.6	Kommo-o	50.0	784	78.2	7	f
3840	70	570	3	281	1250000	1.8	Tapu Koko	\N	785	20.5	7	t
3840	70	570	3	281	1250000	1.2	Tapu Lele	\N	786	18.6	7	t
3840	70	570	3	281	1250000	1.9	Tapu Bulu	\N	787	45.5	7	t
3840	70	570	3	281	1250000	1.3	Tapu Fini	\N	788	21.2	7	t
30720	0	200	45	349	1250000	0.2	Cosmog	\N	789	0.1	7	t
30720	0	400	45	392	1250000	0.1	Cosmoem	\N	790	999.9	7	t
30720	0	680	45	503	1250000	3.4	Solgaleo	\N	791	230.0	7	t
30720	0	680	45	337	1250000	4.0	Lunala	\N	792	120.0	7	t
30720	0	570	45	364	1250000	1.2	Nihilego	\N	793	55.5	7	t
30720	0	570	25	507	1250000	2.4	Buzzwole	\N	794	333.6	7	t
30720	0	570	255	295	1250000	1.8	Pheromosa	\N	795	25.0	7	t
30720	0	570	30	214	1250000	3.8	Xurkitree	\N	796	100.0	7	t
30720	0	570	25	283	1250000	9.2	Celesteela	\N	797	999.9	7	t
30720	0	570	255	149	1250000	0.3	Kartana	\N	798	0.1	7	t
30720	0	570	15	270	1250000	5.5	Guzzlord	\N	799	888.0	7	t
30720	0	600	3	391	1250000	2.4	Necrozma	\N	800	230.0	7	t
30720	0	600	3	14	1250000	1.0	Magearna	\N	801	80.5	7	t
\.


--
-- Data for Name: pokemonability; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.pokemonability (pokedex_number, ability_id) FROM stdin;
1	1
1	2
2	1
2	2
3	1
3	2
4	3
4	4
5	3
5	4
6	3
6	4
7	5
7	6
8	5
8	6
9	5
9	6
10	7
10	8
11	9
12	10
12	11
13	7
13	8
14	9
15	12
15	13
16	14
16	15
16	16
17	14
17	15
17	16
18	14
18	15
18	16
19	8
19	17
19	18
19	19
19	18
19	20
20	8
20	17
20	18
20	19
20	18
20	20
21	14
21	13
22	14
22	13
23	21
23	9
23	22
24	21
24	9
24	22
25	23
25	24
26	23
26	24
26	25
27	26
27	27
27	28
27	29
28	26
28	27
28	28
28	29
29	30
29	31
29	18
30	30
30	31
30	18
31	30
31	31
31	32
32	30
32	31
32	18
33	30
33	31
33	18
34	30
34	31
34	32
35	33
35	34
35	35
36	33
36	34
36	36
37	37
37	38
37	28
37	39
38	37
38	38
38	28
38	39
39	33
39	40
39	35
40	33
40	40
40	41
41	42
41	43
42	42
42	43
43	2
43	8
44	2
44	44
45	2
45	45
46	45
46	46
46	47
47	45
47	46
47	47
48	10
48	11
48	8
49	7
49	11
49	48
50	26
50	49
50	50
50	26
50	51
50	50
51	26
51	49
51	50
51	26
51	51
51	50
52	52
52	53
52	22
52	52
52	53
52	54
53	55
53	53
53	22
53	56
53	53
53	54
54	47
54	57
54	58
55	47
55	57
55	58
56	59
56	60
56	61
57	59
57	60
57	61
58	21
58	37
58	62
59	21
59	37
59	62
60	63
60	47
60	58
61	63
61	47
61	58
62	63
62	47
62	58
63	64
63	42
63	34
64	64
64	42
64	34
65	64
65	42
65	34
66	17
66	65
66	66
67	17
67	65
67	66
68	17
68	65
68	66
69	2
69	19
70	2
70	19
71	2
71	19
72	67
72	68
72	6
73	67
73	68
73	6
74	69
74	70
74	26
74	71
74	70
74	72
75	69
75	70
75	26
75	71
75	70
75	72
76	69
76	70
76	26
76	71
76	70
76	72
77	8
77	37
77	73
78	8
78	37
78	73
79	74
79	75
79	76
80	74
80	75
80	76
81	71
81	70
81	77
82	71
82	70
82	77
83	14
83	42
83	61
84	8
84	78
84	15
85	8
85	78
85	15
86	20
86	79
86	80
87	20
87	79
87	80
88	44
88	81
88	82
88	82
88	19
88	83
89	44
89	81
89	82
89	82
89	19
89	83
90	84
90	85
90	86
91	84
91	85
91	86
92	87
93	87
94	88
95	69
95	70
95	89
96	90
96	91
96	42
97	90
97	91
97	42
98	92
98	84
98	32
99	92
99	84
99	32
100	93
100	23
100	94
101	93
101	23
101	94
102	2
102	95
103	2
103	95
103	41
103	95
104	69
104	24
104	96
105	69
105	24
105	96
105	88
105	24
105	69
106	55
106	97
106	98
107	14
107	99
107	42
108	75
108	74
108	57
109	87
110	87
111	24
111	69
111	97
112	24
112	69
112	97
113	100
113	101
113	102
114	2
114	103
114	76
115	78
115	104
115	42
116	58
116	13
116	47
117	30
117	13
117	47
118	58
118	105
118	24
119	58
119	105
119	24
120	106
120	100
120	77
121	106
121	100
121	77
122	93
122	107
122	53
123	12
123	53
123	66
124	74
124	91
124	46
125	23
125	59
126	73
126	59
127	92
127	108
127	109
128	21
128	60
128	32
129	58
129	54
130	21
130	109
131	63
131	84
131	79
132	55
132	110
133	8
133	111
133	112
134	63
134	79
135	113
135	114
136	37
136	17
137	115
137	116
137	77
138	58
138	84
138	89
139	58
139	84
139	89
140	58
140	96
140	89
141	58
141	96
141	89
142	69
142	117
142	22
143	118
143	20
143	19
144	117
144	28
145	117
145	23
146	117
146	73
147	9
147	119
148	9
148	119
149	42
149	120
150	117
150	22
151	64
152	1
152	103
153	1
153	103
154	1
154	103
155	3
155	37
156	3
156	37
157	3
157	37
158	5
158	32
159	5
159	32
160	5
160	32
161	8
161	14
161	41
162	8
162	14
162	41
163	90
163	14
163	11
164	90
164	14
164	11
165	12
165	78
165	54
166	12
166	78
166	99
167	12
167	90
167	13
168	12
168	90
168	13
169	42
169	43
170	113
170	106
170	63
171	113
171	106
171	63
172	23
172	24
173	33
173	34
173	35
174	33
174	40
174	35
175	18
175	101
175	121
176	18
176	101
176	121
177	64
177	78
177	122
178	64
178	78
178	122
179	23
179	123
180	23
180	123
181	23
181	123
182	2
182	102
183	20
183	124
183	125
184	20
184	124
184	125
185	70
185	69
185	54
186	63
186	47
186	126
187	2
187	103
187	43
188	2
188	103
188	43
189	2
189	103
189	43
190	8
190	52
190	85
191	2
191	4
191	78
192	2
192	4
192	78
193	127
193	10
193	41
194	47
194	63
194	36
195	47
195	63
195	36
196	64
196	122
197	64
197	42
198	90
198	121
198	128
199	74
199	75
199	76
200	87
201	87
202	129
202	130
203	42
203	78
203	125
204	70
204	86
205	70
205	86
206	101
206	8
206	54
207	92
207	26
207	118
208	69
208	70
208	32
209	21
209	8
209	54
210	21
210	114
210	54
211	30
211	58
211	21
212	12
212	53
212	131
213	70
213	19
213	132
214	12
214	17
214	109
215	42
215	14
215	133
216	52
216	114
216	134
217	17
217	114
217	22
218	135
218	73
218	89
219	135
219	73
219	89
220	74
220	28
220	20
221	74
221	28
221	20
222	18
222	100
222	76
223	18
223	13
223	136
224	137
224	13
224	136
225	59
225	18
225	90
226	58
226	63
226	105
227	14
227	70
227	89
228	78
228	37
228	22
229	78
229	37
229	22
230	58
230	13
230	47
231	52
231	26
232	70
232	26
233	115
233	116
233	77
234	21
234	41
234	125
235	75
235	53
235	136
236	17
236	66
236	59
237	21
237	53
237	66
238	74
238	91
238	79
239	23
239	59
240	73
240	59
241	20
241	104
241	125
242	100
242	101
242	102
243	117
243	42
244	117
244	42
245	117
245	42
246	17
246	26
247	9
248	138
248	22
249	117
249	120
250	117
250	76
251	100
252	1
252	98
253	1
253	98
254	1
254	98
255	3
255	127
256	3
256	127
257	3
257	127
258	5
258	47
259	5
259	47
260	5
260	47
261	8
261	114
261	54
262	21
262	114
262	109
263	52
263	19
263	114
264	52
264	19
264	114
265	7
265	8
266	9
267	12
267	31
268	9
269	7
269	10
270	58
270	6
270	75
271	58
271	6
271	75
272	58
272	6
272	75
273	2
273	78
273	133
274	2
274	78
274	133
275	2
275	78
275	133
276	17
276	104
277	17
277	104
278	14
278	79
278	6
279	14
279	126
279	6
280	64
280	115
280	130
281	64
281	115
281	130
282	64
282	115
282	130
283	58
283	6
284	21
284	22
285	45
285	139
285	114
286	45
286	139
286	53
287	140
288	59
289	140
290	10
290	8
291	127
291	43
292	141
293	93
293	54
294	93
294	104
295	93
295	104
296	20
296	17
296	32
297	20
297	17
297	32
298	20
298	124
298	125
299	70
299	71
299	50
300	33
300	142
300	48
301	33
301	142
301	48
302	14
302	143
302	128
303	92
303	21
303	32
304	70
304	69
304	144
305	70
305	69
305	144
306	70
306	69
306	144
307	145
307	130
308	145
308	130
309	23
309	24
309	146
310	23
310	24
310	146
311	123
311	24
312	146
312	113
313	106
313	12
313	128
314	74
314	11
314	128
315	100
315	30
315	103
316	68
316	81
316	19
317	68
317	81
317	19
318	147
318	127
319	147
319	127
320	105
320	74
320	117
321	105
321	74
321	117
322	74
322	148
322	75
323	135
323	149
323	60
324	150
324	38
324	84
325	20
325	75
325	19
326	20
326	75
326	19
327	75
327	15
327	132
328	92
328	49
328	32
329	87
330	87
331	26
331	63
332	26
332	63
333	100
333	57
334	100
334	57
335	118
335	151
336	9
336	43
337	87
338	87
339	74
339	112
339	79
340	74
340	112
340	79
341	92
341	84
341	111
342	92
342	84
342	111
343	87
344	87
345	137
345	152
346	137
346	152
347	96
347	58
348	96
348	58
349	58
349	74
349	111
350	119
350	40
350	33
351	153
352	154
352	155
353	90
353	41
353	88
354	90
354	41
354	88
355	87
355	41
356	117
356	41
357	2
357	4
357	95
358	87
359	117
359	121
359	62
360	129
360	130
361	42
361	80
361	136
362	42
362	80
362	136
363	20
363	80
363	74
364	20
364	80
364	74
365	20
365	80
365	74
366	84
366	54
367	58
367	105
368	58
368	79
369	58
369	69
369	70
370	58
370	79
371	69
371	32
372	69
372	86
373	21
373	109
374	67
374	131
375	67
375	131
376	67
376	131
377	67
377	70
378	67
378	80
379	67
379	131
380	87
381	87
382	126
383	38
384	156
385	101
386	117
387	1
387	84
388	1
388	84
389	1
389	84
390	3
390	99
391	3
391	99
392	3
392	99
393	5
393	61
394	5
394	61
395	5
395	61
396	14
396	97
397	21
397	97
398	21
398	97
399	148
399	36
399	136
400	148
400	36
400	136
401	9
401	8
402	12
402	53
403	31
403	21
403	17
404	31
404	21
404	17
405	31
405	21
405	17
406	100
406	30
406	103
407	100
407	30
407	53
408	108
408	32
409	108
409	32
410	70
410	93
411	70
411	93
412	9
412	86
413	112
413	86
414	12
414	11
415	134
415	18
416	117
416	22
417	8
417	52
417	113
418	58
418	105
419	58
419	105
420	2
421	157
422	81
422	152
422	50
423	81
423	152
423	50
424	53
424	52
424	85
425	94
425	98
425	158
426	94
426	98
426	158
427	8
427	159
427	55
428	33
428	159
428	55
429	87
430	90
430	121
430	109
431	55
431	75
431	14
432	20
432	75
432	61
433	87
434	44
434	94
434	14
435	44
435	94
435	14
436	87
436	160
436	144
437	87
437	160
437	144
438	70
438	69
438	54
439	93
439	107
439	53
440	100
440	101
440	35
441	14
441	15
441	16
442	117
442	43
443	26
443	147
444	26
444	147
445	26
445	147
446	52
446	20
446	19
447	66
447	42
447	128
448	66
448	42
448	62
449	138
449	50
450	138
450	50
451	96
451	13
451	14
452	96
452	13
452	14
453	112
453	46
453	82
454	112
454	46
454	82
455	87
456	58
456	152
456	105
457	58
457	152
457	105
458	58
458	63
458	105
459	39
459	93
460	39
460	93
461	117
461	133
462	71
462	70
462	77
463	75
463	74
463	57
464	24
464	149
464	97
465	2
465	103
465	76
466	161
466	59
467	73
467	59
468	18
468	101
468	121
469	127
469	11
469	41
470	103
470	2
471	28
471	80
472	92
472	26
472	139
473	74
473	28
473	20
474	111
474	116
474	77
475	66
475	62
476	70
476	71
476	50
477	117
477	41
478	28
478	88
479	87
480	87
481	87
482	87
483	117
483	130
484	117
484	130
485	37
485	73
486	162
487	117
487	130
487	87
488	87
489	79
490	79
491	163
492	100
492	101
493	164
494	165
495	1
495	132
496	1
496	132
497	1
497	132
498	3
498	20
499	3
499	20
500	3
500	97
501	5
501	84
502	5
502	84
503	5
503	84
504	8
504	14
504	77
505	106
505	14
505	77
506	59
506	52
506	8
507	21
507	27
507	104
508	21
508	27
508	104
509	55
509	98
509	128
510	55
510	98
510	128
511	19
511	1
512	19
512	1
513	19
513	3
514	19
514	3
515	19
515	5
516	19
516	5
517	91
517	64
517	130
518	91
518	64
518	130
519	16
519	121
519	31
520	16
520	121
520	31
521	16
521	121
521	31
522	24
522	161
522	125
523	24
523	161
523	125
524	70
524	89
524	50
525	70
525	89
525	50
526	70
526	138
526	50
527	36
527	159
527	148
528	36
528	159
528	148
529	27
529	50
529	108
530	27
530	50
530	108
531	102
531	76
531	159
532	17
532	32
532	99
533	17
533	32
533	99
534	17
534	32
534	99
535	58
535	79
535	63
536	58
536	79
536	63
537	58
537	82
537	63
538	17
538	42
538	108
539	70
539	42
539	108
540	12
540	2
540	86
541	103
541	2
541	86
542	12
542	2
542	86
543	30
543	12
543	127
544	30
544	12
544	127
545	30
545	12
545	127
546	128
546	43
546	2
547	128
547	43
547	2
548	2
548	75
548	103
549	2
549	75
549	103
550	97
550	69
550	111
550	108
551	21
551	109
551	60
552	21
552	109
552	60
553	21
553	109
553	60
554	18
554	42
555	32
555	166
556	63
556	2
556	152
557	70
557	84
557	89
558	70
558	84
558	89
559	9
559	109
559	21
560	9
560	109
560	21
561	48
561	34
561	11
562	167
563	167
564	149
564	70
564	58
565	149
565	70
565	58
566	168
567	168
568	44
568	81
568	94
569	44
569	89
569	94
570	169
571	169
572	33
572	53
572	85
573	33
573	53
573	85
574	41
574	40
574	129
575	41
575	40
575	129
576	41
576	40
576	129
577	86
577	34
577	76
578	86
578	34
578	76
579	86
579	34
579	76
580	14
580	16
580	79
581	14
581	16
581	79
582	80
582	28
582	89
583	80
583	28
583	89
584	80
584	39
584	89
585	2
585	125
585	101
586	2
586	125
586	101
587	23
587	161
588	12
588	9
588	65
589	12
589	84
589	86
590	45
590	76
591	45
591	76
592	63
592	88
592	47
593	63
593	88
593	47
594	102
594	79
594	76
595	10
595	22
595	12
596	10
596	22
596	12
597	170
598	170
598	112
599	123
599	146
599	67
600	123
600	146
600	67
601	123
601	146
601	67
602	87
603	87
604	87
605	130
605	64
605	77
606	130
606	64
606	77
607	37
607	73
607	43
608	37
608	73
608	43
609	37
609	73
609	43
610	31
610	108
610	22
611	31
611	108
611	22
612	31
612	108
612	22
613	28
613	29
613	54
614	28
614	29
614	58
615	87
616	79
616	84
616	86
617	79
617	81
617	98
618	23
618	55
618	26
619	42
619	76
619	97
620	42
620	76
620	97
621	147
621	32
621	108
622	99
622	159
622	65
623	99
623	159
623	65
624	61
624	42
624	117
625	61
625	42
625	117
626	97
626	125
626	93
627	14
627	32
627	18
628	14
628	32
628	61
629	16
629	86
629	89
630	16
630	86
630	89
631	19
631	37
631	150
632	12
632	18
632	140
633	18
634	18
635	87
636	73
636	12
637	73
637	12
638	62
639	62
640	62
641	128
641	61
641	76
642	128
642	61
642	113
643	171
644	172
645	50
645	32
645	21
646	117
646	172
646	171
647	62
648	101
649	116
650	1
650	173
651	1
651	173
652	1
652	173
653	3
653	174
654	3
654	174
655	3
655	174
656	5
656	155
657	5
657	155
658	5
658	155
658	175
659	52
659	176
659	124
660	52
660	176
660	124
661	16
661	177
662	73
662	177
663	73
663	177
664	7
664	10
664	35
665	9
665	35
666	7
666	10
666	35
667	31
667	22
667	109
668	31
668	22
668	109
669	178
669	179
670	178
670	179
671	178
671	179
672	125
672	180
673	125
673	180
674	99
674	108
674	104
675	99
675	108
675	104
676	56
677	14
677	43
677	75
678	14
678	43
678	128
678	40
679	65
680	65
681	181
682	102
682	182
683	102
683	182
684	183
684	98
685	183
685	98
686	132
686	137
686	43
687	132
687	137
687	43
688	184
688	13
688	133
689	184
689	13
689	133
690	30
690	82
690	111
691	30
691	82
691	111
692	185
693	185
694	46
694	26
694	4
695	46
695	26
695	4
696	186
696	70
697	186
697	69
698	187
698	39
699	187
699	39
700	33
700	188
701	55
701	98
701	108
702	176
702	52
702	123
703	67
703	70
704	125
704	79
704	189
705	125
705	79
705	189
706	125
706	79
706	189
707	128
707	174
708	100
708	41
708	95
709	100
709	41
709	95
710	52
710	41
710	90
711	52
711	41
711	90
712	75
712	80
712	70
713	75
713	80
713	70
714	41
714	43
714	130
715	41
715	43
715	130
716	190
717	191
718	192
718	193
719	67
720	174
721	63
722	1
722	194
723	1
723	194
724	1
724	194
725	3
725	21
726	3
726	21
727	3
727	21
728	5
728	195
729	5
729	195
730	5
730	195
731	14
731	85
731	52
732	14
732	85
732	52
733	14
733	85
733	32
734	196
734	186
734	111
735	196
735	186
735	111
736	12
737	197
738	87
739	92
739	99
739	60
740	92
740	99
740	60
741	198
742	134
742	7
742	183
743	134
743	7
743	183
744	14
744	59
744	66
745	14
745	27
745	66
745	14
745	59
745	65
746	199
747	200
747	55
747	76
748	200
748	55
748	76
749	75
749	201
749	42
750	75
750	201
750	42
751	202
751	63
752	202
752	63
753	103
753	132
754	103
754	132
755	106
755	45
755	6
756	106
756	45
756	6
757	203
757	74
758	203
758	74
759	204
759	159
759	33
760	204
760	159
760	22
761	103
761	74
761	183
762	103
762	74
762	183
763	103
763	205
763	183
764	178
764	206
764	100
765	42
765	130
765	179
766	207
766	61
767	208
768	209
769	210
769	26
770	210
770	26
771	211
771	36
772	96
773	212
774	213
775	214
776	84
777	170
777	24
777	70
778	215
779	216
779	186
779	48
780	217
780	125
780	57
781	218
782	173
782	93
782	86
783	173
783	93
783	86
784	173
784	93
784	86
785	219
785	130
786	220
786	130
787	221
787	130
788	222
788	130
789	36
790	70
791	223
792	224
793	225
794	225
795	225
796	225
797	225
798	225
799	225
800	226
801	227
\.


--
-- Data for Name: pokemontype; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.pokemontype (pokedex_number, type_id) FROM stdin;
1	1
1	2
2	1
2	2
3	1
3	2
4	3
5	3
6	3
6	4
7	5
8	5
9	5
10	6
11	6
12	6
12	4
13	6
13	2
14	6
14	2
15	6
15	2
16	7
16	4
17	7
17	4
18	7
18	4
19	7
19	8
20	7
20	8
21	7
21	4
22	7
22	4
23	2
24	2
25	9
26	9
26	9
27	10
27	11
28	10
28	11
29	2
30	2
31	2
31	10
32	2
33	2
34	2
34	10
35	12
36	12
37	3
37	11
38	3
38	11
39	7
39	12
40	7
40	12
41	2
41	4
42	2
42	4
43	1
43	2
44	1
44	2
45	1
45	2
46	6
46	1
47	6
47	1
48	6
48	2
49	6
49	2
50	10
50	10
51	10
51	10
52	7
52	8
53	7
53	8
54	5
55	5
56	13
57	13
58	3
59	3
60	5
61	5
62	5
62	13
63	14
64	14
65	14
66	13
67	13
68	13
69	1
69	2
70	1
70	2
71	1
71	2
72	5
72	2
73	5
73	2
74	15
74	10
75	15
75	10
76	15
76	10
77	3
78	3
79	5
79	14
80	5
80	14
81	9
81	16
82	9
82	16
83	7
83	4
84	7
84	4
85	7
85	4
86	5
87	5
87	11
88	2
88	2
89	2
89	2
90	5
91	5
91	11
92	17
92	2
93	17
93	2
94	17
94	2
95	15
95	10
96	14
97	14
98	5
99	5
100	9
101	9
102	1
102	14
103	1
103	14
104	10
105	10
105	3
106	13
107	13
108	7
109	2
110	2
111	10
111	15
112	10
112	15
113	7
114	1
115	7
116	5
117	5
118	5
119	5
120	5
121	5
121	14
122	14
122	12
123	6
123	4
124	11
124	14
125	9
126	3
127	6
128	7
129	5
130	5
130	4
131	5
131	11
132	7
133	7
134	5
135	9
136	3
137	7
138	15
138	5
139	15
139	5
140	15
140	5
141	15
141	5
142	15
142	4
143	7
144	11
144	4
145	9
145	4
146	3
146	4
147	18
148	18
149	18
149	4
150	14
151	14
152	1
153	1
154	1
155	3
156	3
157	3
158	5
159	5
160	5
161	7
162	7
163	7
163	4
164	7
164	4
165	6
165	4
166	6
166	4
167	6
167	2
168	6
168	2
169	2
169	4
170	5
170	9
171	5
171	9
172	9
173	12
174	7
174	12
175	12
176	12
176	4
177	14
177	4
178	14
178	4
179	9
180	9
181	9
182	1
183	5
183	12
184	5
184	12
185	15
186	5
187	1
187	4
188	1
188	4
189	1
189	4
190	7
191	1
192	1
193	6
193	4
194	5
194	10
195	5
195	10
196	14
197	8
198	8
198	4
199	5
199	14
200	17
201	14
202	14
203	7
203	14
204	6
205	6
205	16
206	7
207	10
207	4
208	16
208	10
209	12
210	12
211	5
211	2
212	6
212	16
213	6
213	15
214	6
214	13
215	8
215	11
216	7
217	7
218	3
219	3
219	15
220	11
220	10
221	11
221	10
222	5
222	15
223	5
224	5
225	11
225	4
226	5
226	4
227	16
227	4
228	8
228	3
229	8
229	3
230	5
230	18
231	10
232	10
233	7
234	7
235	7
236	13
237	13
238	11
238	14
239	9
240	3
241	7
242	7
243	9
244	3
245	5
246	15
246	10
247	15
247	10
248	15
248	8
249	14
249	4
250	3
250	4
251	14
251	1
252	1
253	1
254	1
255	3
256	3
256	13
257	3
257	13
258	5
259	5
259	10
260	5
260	10
261	8
262	8
263	7
264	7
265	6
266	6
267	6
267	4
268	6
269	6
269	2
270	5
270	1
271	5
271	1
272	5
272	1
273	1
274	1
274	8
275	1
275	8
276	7
276	4
277	7
277	4
278	5
278	4
279	5
279	4
280	14
280	12
281	14
281	12
282	14
282	12
283	6
283	5
284	6
284	4
285	1
286	1
286	13
287	7
288	7
289	7
290	6
290	10
291	6
291	4
292	6
292	17
293	7
294	7
295	7
296	13
297	13
298	7
298	12
299	15
300	7
301	7
302	8
302	17
303	16
303	12
304	16
304	15
305	16
305	15
306	16
306	15
307	13
307	14
308	13
308	14
309	9
310	9
311	9
312	9
313	6
314	6
315	1
315	2
316	2
317	2
318	5
318	8
319	5
319	8
320	5
321	5
322	3
322	10
323	3
323	10
324	3
325	14
326	14
327	7
328	10
329	10
329	18
330	10
330	18
331	1
332	1
332	8
333	7
333	4
334	18
334	4
335	7
336	2
337	15
337	14
338	15
338	14
339	5
339	10
340	5
340	10
341	5
342	5
342	8
343	10
343	14
344	10
344	14
345	15
345	1
346	15
346	1
347	15
347	6
348	15
348	6
349	5
350	5
351	7
352	7
353	17
354	17
355	17
356	17
357	1
357	4
358	14
359	8
360	14
361	11
362	11
363	11
363	5
364	11
364	5
365	11
365	5
366	5
367	5
368	5
369	5
369	15
370	5
371	18
372	18
373	18
373	4
374	16
374	14
375	16
375	14
376	16
376	14
377	15
378	11
379	16
380	18
380	14
381	18
381	14
382	5
383	10
384	18
384	4
385	16
385	14
386	14
387	1
388	1
389	1
389	10
390	3
391	3
391	13
392	3
392	13
393	5
394	5
395	5
395	16
396	7
396	4
397	7
397	4
398	7
398	4
399	7
400	7
400	5
401	6
402	6
403	9
404	9
405	9
406	1
406	2
407	1
407	2
408	15
409	15
410	15
410	16
411	15
411	16
412	6
413	6
413	1
414	6
414	4
415	6
415	4
416	6
416	4
417	9
418	5
419	5
420	1
421	1
422	5
423	5
423	10
424	7
425	17
425	4
426	17
426	4
427	7
428	7
429	17
430	8
430	4
431	7
432	7
433	14
434	2
434	8
435	2
435	8
436	16
436	14
437	16
437	14
438	15
439	14
439	12
440	7
441	7
441	4
442	17
442	8
443	18
443	10
444	18
444	10
445	18
445	10
446	7
447	13
448	13
448	16
449	10
450	10
451	2
451	6
452	2
452	8
453	2
453	13
454	2
454	13
455	1
456	5
457	5
458	5
458	4
459	1
459	11
460	1
460	11
461	8
461	11
462	9
462	16
463	7
464	10
464	15
465	1
466	9
467	3
468	12
468	4
469	6
469	4
470	1
471	11
472	10
472	4
473	11
473	10
474	7
475	14
475	13
476	15
476	16
477	17
478	11
478	17
479	9
479	17
480	14
481	14
482	14
483	16
483	18
484	5
484	18
485	3
485	16
486	7
487	17
487	18
488	14
489	5
490	5
491	8
492	1
492	1
493	7
494	14
494	3
495	1
496	1
497	1
498	3
499	3
499	13
500	3
500	13
501	5
502	5
503	5
504	7
505	7
506	7
507	7
508	7
509	8
510	8
511	1
512	1
513	3
514	3
515	5
516	5
517	14
518	14
519	7
519	4
520	7
520	4
521	7
521	4
522	9
523	9
524	15
525	15
526	15
527	14
527	4
528	14
528	4
529	10
530	10
530	16
531	7
532	13
533	13
534	13
535	5
536	5
536	10
537	5
537	10
538	13
539	13
540	6
540	1
541	6
541	1
542	6
542	1
543	6
543	2
544	6
544	2
545	6
545	2
546	1
546	12
547	1
547	12
548	1
549	1
550	5
551	10
551	8
552	10
552	8
553	10
553	8
554	3
555	3
555	3
556	1
557	6
557	15
558	6
558	15
559	8
559	13
560	8
560	13
561	14
561	4
562	17
563	17
564	5
564	15
565	5
565	15
566	15
566	4
567	15
567	4
568	2
569	2
570	8
571	8
572	7
573	7
574	14
575	14
576	14
577	14
578	14
579	14
580	5
580	4
581	5
581	4
582	11
583	11
584	11
585	7
585	1
586	7
586	1
587	9
587	4
588	6
589	6
589	16
590	1
590	2
591	1
591	2
592	5
592	17
593	5
593	17
594	5
595	6
595	9
596	6
596	9
597	1
597	16
598	1
598	16
599	16
600	16
601	16
602	9
603	9
604	9
605	14
606	14
607	17
607	3
608	17
608	3
609	17
609	3
610	18
611	18
612	18
613	11
614	11
615	11
616	6
617	6
618	10
618	9
619	13
620	13
621	18
622	10
622	17
623	10
623	17
624	8
624	16
625	8
625	16
626	7
627	7
627	4
628	7
628	4
629	8
629	4
630	8
630	4
631	3
632	6
632	16
633	8
633	18
634	8
634	18
635	8
635	18
636	6
636	3
637	6
637	3
638	16
638	13
639	15
639	13
640	1
640	13
641	4
642	9
642	4
643	18
643	3
644	18
644	9
645	10
645	4
646	18
646	11
647	5
647	13
648	7
648	14
649	6
649	16
650	1
651	1
652	1
652	13
653	3
654	3
655	3
655	14
656	5
657	5
658	5
658	8
659	7
660	7
660	10
661	7
661	4
662	3
662	4
663	3
663	4
664	6
665	6
666	6
666	4
667	3
667	7
668	3
668	7
669	12
670	12
671	12
672	1
673	1
674	13
675	13
675	8
676	7
677	14
678	14
679	16
679	17
680	16
680	17
681	16
681	17
682	12
683	12
684	12
685	12
686	8
686	14
687	8
687	14
688	15
688	5
689	15
689	5
690	2
690	5
691	2
691	18
692	5
693	5
694	9
694	7
695	9
695	7
696	15
696	18
697	15
697	18
698	15
698	11
699	15
699	11
700	12
701	13
701	4
702	9
702	12
703	15
703	12
704	18
705	18
706	18
707	16
707	12
708	17
708	1
709	17
709	1
710	17
710	1
711	17
711	1
712	11
713	11
714	4
714	18
715	4
715	18
716	12
717	8
717	4
718	18
718	10
719	15
719	12
720	14
720	17
721	3
721	5
722	1
722	4
723	1
723	4
724	1
724	17
725	3
726	3
727	3
727	8
728	5
729	5
730	5
730	12
731	7
731	4
732	7
732	4
733	7
733	4
734	7
735	7
736	6
737	6
737	9
738	6
738	9
739	13
740	13
740	11
741	3
741	4
742	6
742	12
743	6
743	12
744	15
745	15
746	5
747	2
747	5
748	2
748	5
749	10
750	10
751	5
751	6
752	5
752	6
753	1
754	1
755	1
755	12
756	1
756	12
757	2
757	3
758	2
758	3
759	7
759	13
760	7
760	13
761	1
762	1
763	1
764	12
765	7
765	14
766	13
767	6
767	5
768	6
768	5
769	17
769	10
770	17
770	10
771	5
772	7
773	7
774	15
774	4
775	7
776	3
776	18
777	9
777	16
778	17
778	12
779	5
779	14
780	7
780	18
781	17
781	1
782	18
783	18
783	13
784	18
784	13
785	9
785	12
786	14
786	12
787	1
787	12
788	5
788	12
789	14
790	14
791	14
791	16
792	14
792	17
793	15
793	2
794	6
794	13
795	6
795	13
796	9
797	16
797	4
798	1
798	16
799	8
799	18
800	14
801	16
801	12
\.


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.stats (pokedex_number, hp, attack, defense, speed, sp_attack, sp_defense) FROM stdin;
1	45	49	49	45	65	65
2	60	62	63	60	80	80
3	80	100	123	80	122	120
4	39	52	43	65	60	50
5	58	64	58	80	80	65
6	78	104	78	100	159	115
7	44	48	65	43	50	64
8	59	63	80	58	65	80
9	79	103	120	78	135	115
10	45	30	35	45	20	20
11	50	20	55	30	25	25
12	60	45	50	70	90	80
13	40	35	30	50	20	20
14	45	25	50	35	25	25
15	65	150	40	145	15	80
16	40	45	40	56	35	35
17	63	60	55	71	50	50
18	83	80	80	121	135	80
19	30	56	35	72	25	35
20	75	71	70	77	40	80
21	40	60	30	70	31	31
22	65	90	65	100	61	61
23	35	60	44	55	40	54
24	60	95	69	80	65	79
25	35	55	40	90	50	50
26	60	85	50	110	95	85
27	50	75	90	40	10	35
28	75	100	120	65	25	65
29	55	47	52	41	40	40
30	70	62	67	56	55	55
31	90	92	87	76	75	85
32	46	57	40	50	40	40
33	61	72	57	65	55	55
34	81	102	77	85	85	75
35	70	45	48	35	60	65
36	95	70	73	60	95	90
37	38	41	40	65	50	65
38	73	67	75	109	81	100
39	115	45	20	20	45	25
40	140	70	45	45	85	50
41	40	45	35	55	30	40
42	75	80	70	90	65	75
43	45	50	55	30	75	65
44	60	65	70	40	85	75
45	75	80	85	50	110	90
46	35	70	55	25	45	55
47	60	95	80	30	60	80
48	60	55	50	45	40	55
49	70	65	60	90	90	75
50	10	55	30	90	35	45
51	35	100	60	110	50	70
52	40	35	35	90	50	40
53	65	60	60	115	75	65
54	50	52	48	55	65	50
55	80	82	78	85	95	80
56	40	80	35	70	35	45
57	65	105	60	95	60	70
58	55	70	45	60	70	50
59	90	110	80	95	100	80
60	40	50	40	90	40	40
61	65	65	65	90	50	50
62	90	95	95	70	70	90
63	25	20	15	90	105	55
64	40	35	30	105	120	70
65	55	50	65	150	175	105
66	70	80	50	35	35	35
67	80	100	70	45	50	60
68	90	130	80	55	65	85
69	50	75	35	40	70	30
70	65	90	50	55	85	45
71	80	105	65	70	100	70
72	40	40	35	70	50	100
73	80	70	65	100	80	120
74	40	80	100	20	30	30
75	55	95	115	35	45	45
76	80	120	130	45	55	65
77	50	85	55	90	65	65
78	65	100	70	105	80	80
79	90	65	65	15	40	40
80	95	75	180	30	130	80
81	25	35	70	45	95	55
82	50	60	95	70	120	70
83	52	90	55	60	58	62
84	35	85	45	75	35	35
85	60	110	70	110	60	60
86	65	45	55	45	45	70
87	90	70	80	70	70	95
88	80	80	50	25	40	50
89	105	105	75	50	65	100
90	30	65	100	40	45	25
91	50	95	180	70	85	45
92	30	35	30	80	100	35
93	45	50	45	95	115	55
94	60	65	80	130	170	95
95	35	45	160	70	30	45
96	60	48	45	42	43	90
97	85	73	70	67	73	115
98	30	105	90	50	25	25
99	55	130	115	75	50	50
100	40	30	50	100	55	55
101	60	50	70	150	80	80
102	60	40	80	40	60	45
103	95	105	85	45	125	75
104	50	50	95	35	40	50
105	60	80	110	45	50	80
106	50	120	53	87	35	110
107	50	105	79	76	35	110
108	90	55	75	30	60	75
109	40	65	95	35	60	45
110	65	90	120	60	85	70
111	80	85	95	25	30	30
112	105	130	120	40	45	45
113	250	5	5	50	35	105
114	65	55	115	60	100	40
115	105	125	100	100	60	100
116	30	40	70	60	70	25
117	55	65	95	85	95	45
118	45	67	60	63	35	50
119	80	92	65	68	65	80
120	30	45	55	85	70	55
121	60	75	85	115	100	85
122	40	45	65	90	100	120
123	70	110	80	105	55	80
124	65	50	35	95	115	95
125	65	83	57	105	95	85
126	65	95	57	93	100	85
127	65	155	120	105	65	90
128	75	100	95	110	40	70
129	20	10	55	80	15	20
130	95	155	109	81	70	130
131	130	85	80	60	85	95
132	48	48	48	48	48	48
133	55	55	50	55	45	65
134	130	65	60	65	110	95
135	65	65	60	130	110	95
136	65	130	60	65	95	110
137	65	60	70	40	85	75
138	35	40	100	35	90	55
139	70	60	125	55	115	70
140	30	80	90	55	55	45
141	60	115	105	80	65	70
142	80	135	85	150	70	95
143	160	110	65	30	65	110
144	90	85	100	85	95	125
145	90	90	85	100	125	90
146	90	100	90	90	125	85
147	41	64	45	50	50	50
148	61	84	65	70	70	70
149	91	134	95	80	100	100
150	106	150	70	140	194	120
151	100	100	100	100	100	100
152	45	49	65	45	49	65
153	60	62	80	60	63	80
154	80	82	100	80	83	100
155	39	52	43	65	60	50
156	58	64	58	80	80	65
157	78	84	78	100	109	85
158	50	65	64	43	44	48
159	65	80	80	58	59	63
160	85	105	100	78	79	83
161	35	46	34	20	35	45
162	85	76	64	90	45	55
163	60	30	30	50	36	56
164	100	50	50	70	86	96
165	40	20	30	55	40	80
166	55	35	50	85	55	110
167	40	60	40	30	40	40
168	70	90	70	40	60	70
169	85	90	80	130	70	80
170	75	38	38	67	56	56
171	125	58	58	67	76	76
172	20	40	15	60	35	35
173	50	25	28	15	45	55
174	90	30	15	15	40	20
175	35	20	65	20	40	65
176	55	40	85	40	80	105
177	40	50	45	70	70	45
178	65	75	70	95	95	70
179	55	40	40	35	65	45
180	70	55	55	45	80	60
181	90	95	105	45	165	110
182	75	80	95	50	90	100
183	70	20	50	40	20	50
184	100	50	80	50	60	80
185	70	100	115	30	30	65
186	90	75	75	70	90	100
187	35	35	40	50	35	55
188	55	45	50	80	45	65
189	75	55	70	110	55	95
190	55	70	55	85	40	55
191	30	30	30	30	30	30
192	75	75	55	30	105	85
193	65	65	45	95	75	45
194	55	45	45	15	25	25
195	95	85	85	35	65	65
196	65	65	60	110	130	95
197	95	65	110	65	60	130
198	60	85	42	91	85	42
199	95	75	80	30	100	110
200	60	60	60	85	85	85
201	48	72	48	48	72	48
202	190	33	58	33	33	58
203	70	80	65	85	90	65
204	50	65	90	15	35	35
205	75	90	140	40	60	60
206	100	70	70	45	65	65
207	65	75	105	85	35	65
208	75	125	230	30	55	95
209	60	80	50	30	40	40
210	90	120	75	45	60	60
211	65	95	85	85	55	55
212	70	150	140	75	65	100
213	20	10	230	5	10	230
214	80	185	115	75	40	105
215	55	95	55	115	35	75
216	60	80	50	40	50	50
217	90	130	75	55	75	75
218	40	40	40	20	70	40
219	60	50	120	30	90	80
220	50	50	40	50	30	30
221	100	100	80	50	60	60
222	65	55	95	35	65	95
223	35	65	35	65	65	35
224	75	105	75	45	105	75
225	45	55	45	75	65	45
226	85	40	70	70	80	140
227	65	80	140	70	40	70
228	45	60	30	65	80	50
229	75	90	90	115	140	90
230	75	95	95	85	95	95
231	90	60	60	40	40	40
232	90	120	120	50	60	60
233	85	80	90	60	105	95
234	73	95	62	85	85	65
235	55	20	35	75	20	45
236	35	35	35	35	35	35
237	50	95	95	70	35	110
238	45	30	15	65	85	65
239	45	63	37	95	65	55
240	45	75	37	83	70	55
241	95	80	105	100	40	70
242	255	10	10	55	75	135
243	90	85	75	115	115	100
244	115	115	85	100	90	75
245	100	75	115	85	90	115
246	50	64	50	41	45	50
247	70	84	70	51	65	70
248	100	164	150	71	95	120
249	106	90	130	110	90	154
250	106	130	90	90	110	154
251	100	100	100	100	100	100
252	40	45	35	70	65	55
253	50	65	45	95	85	65
254	70	110	75	145	145	85
255	45	60	40	45	70	50
256	60	85	60	55	85	60
257	80	160	80	100	130	80
258	50	70	50	40	50	50
259	70	85	70	50	60	70
260	100	150	110	70	95	110
261	35	55	35	35	30	30
262	70	90	70	70	60	60
263	38	30	41	60	30	41
264	78	70	61	100	50	61
265	45	45	35	20	20	30
266	50	35	55	15	25	25
267	60	70	50	65	100	50
268	50	35	55	15	25	25
269	60	50	70	65	50	90
270	40	30	30	30	40	50
271	60	50	50	50	60	70
272	80	70	70	70	90	100
273	40	40	50	30	30	30
274	70	70	40	60	60	40
275	90	100	60	80	90	60
276	40	55	30	85	30	30
277	60	85	60	125	75	50
278	40	30	30	85	55	30
279	60	50	100	65	95	70
280	28	25	25	40	45	35
281	38	35	35	50	65	55
282	68	85	65	100	165	135
283	40	30	32	65	50	52
284	70	60	62	80	100	82
285	60	40	60	35	40	60
286	60	130	80	70	60	60
287	60	60	60	30	35	35
288	80	80	80	90	55	55
289	150	160	100	100	95	65
290	31	45	90	40	30	30
291	61	90	45	160	50	50
292	1	90	45	40	30	30
293	64	51	23	28	51	23
294	84	71	43	48	71	43
295	104	91	63	68	91	73
296	72	60	30	25	20	30
297	144	120	60	50	40	60
298	50	20	40	20	20	40
299	30	45	135	30	45	90
300	50	45	45	50	35	35
301	70	65	65	90	55	55
302	50	85	125	20	85	115
303	50	105	125	50	55	95
304	50	70	100	30	40	40
305	60	90	140	40	50	50
306	70	140	230	50	60	80
307	30	40	55	60	40	55
308	60	100	85	100	80	85
309	40	45	40	65	65	40
310	70	75	80	135	135	80
311	60	50	40	95	85	75
312	60	40	50	95	75	85
313	65	73	75	85	47	85
314	65	47	75	85	73	85
315	50	60	45	65	100	80
316	70	43	53	40	43	53
317	100	73	83	55	73	83
318	45	90	20	65	65	20
319	70	140	70	105	110	65
320	130	70	35	60	70	35
321	170	90	45	60	90	45
322	60	60	40	35	65	45
323	70	120	100	20	145	105
324	70	85	140	20	85	70
325	60	25	35	60	70	80
326	80	45	65	80	90	110
327	60	60	60	60	60	60
328	45	100	45	10	45	45
329	50	70	50	70	50	50
330	80	100	80	100	80	80
331	50	85	40	35	85	40
332	70	115	60	55	115	60
333	45	40	60	50	40	75
334	75	110	110	80	110	105
335	73	115	60	90	60	60
336	73	100	60	65	100	60
337	90	55	65	70	95	85
338	90	95	85	70	55	65
339	50	48	43	60	46	41
340	110	78	73	60	76	71
341	43	80	65	35	50	35
342	63	120	85	55	90	55
343	40	40	55	55	40	70
344	60	70	105	75	70	120
345	66	41	77	23	61	87
346	86	81	97	43	81	107
347	45	95	50	75	40	50
348	75	125	100	45	70	80
349	20	15	20	80	10	55
350	95	60	79	81	100	125
351	70	70	70	70	70	70
352	60	90	70	40	60	120
353	44	75	35	45	63	33
354	64	165	75	75	93	83
355	20	40	90	25	30	90
356	40	70	130	25	60	130
357	99	68	83	51	72	87
358	75	50	80	65	95	90
359	65	150	60	115	115	60
360	95	23	48	23	23	48
361	50	50	50	50	50	50
362	80	120	80	100	120	80
363	70	40	50	25	55	50
364	90	60	70	45	75	70
365	110	80	90	65	95	90
366	35	64	85	32	74	55
367	55	104	105	52	94	75
368	55	84	105	52	114	75
369	100	90	130	55	45	65
370	43	30	55	97	40	65
371	45	75	60	50	40	30
372	65	95	100	50	60	50
373	95	145	130	120	120	90
374	40	55	80	30	35	60
375	60	75	100	50	55	80
376	80	145	150	110	105	110
377	80	100	200	50	50	100
378	80	50	100	50	100	200
379	80	75	150	50	75	150
380	80	100	120	110	140	150
381	80	130	100	110	160	120
382	100	150	90	90	180	160
383	100	180	160	90	150	90
384	105	180	100	115	180	100
385	100	100	100	100	100	100
386	50	95	90	180	95	90
387	55	68	64	31	45	55
388	75	89	85	36	55	65
389	95	109	105	56	75	85
390	44	58	44	61	58	44
391	64	78	52	81	78	52
392	76	104	71	108	104	71
393	53	51	53	40	61	56
394	64	66	68	50	81	76
395	84	86	88	60	111	101
396	40	55	30	60	30	30
397	55	75	50	80	40	40
398	85	120	70	100	50	60
399	59	45	40	31	35	40
400	79	85	60	71	55	60
401	37	25	41	25	25	41
402	77	85	51	65	55	51
403	45	65	34	45	40	34
404	60	85	49	60	60	49
405	80	120	79	70	95	79
406	40	30	35	55	50	70
407	60	70	65	90	125	105
408	67	125	40	58	30	30
409	97	165	60	58	65	50
410	30	42	118	30	42	88
411	60	52	168	30	47	138
412	40	29	45	36	29	45
413	60	69	95	36	69	95
414	70	94	50	66	94	50
415	30	30	42	70	30	42
416	70	80	102	40	80	102
417	60	45	70	95	45	90
418	55	65	35	85	60	30
419	85	105	55	115	85	50
420	45	35	45	35	62	53
421	70	60	70	85	87	78
422	76	48	48	34	57	62
423	111	83	68	39	92	82
424	75	100	66	115	60	66
425	90	50	34	70	60	44
426	150	80	44	80	90	54
427	55	66	44	85	44	56
428	65	136	94	135	54	96
429	60	60	60	105	105	105
430	100	125	52	71	105	52
431	49	55	42	85	42	37
432	71	82	64	112	64	59
433	45	30	50	45	65	50
434	63	63	47	74	41	41
435	103	93	67	84	71	61
436	57	24	86	23	24	86
437	67	89	116	33	79	116
438	50	80	95	10	10	45
439	20	25	45	60	70	90
440	100	5	5	30	15	65
441	76	65	45	91	92	42
442	50	92	108	35	92	108
443	58	70	45	42	40	45
444	68	90	65	82	50	55
445	108	170	115	92	120	95
446	135	85	40	5	40	85
447	40	70	40	60	35	40
448	70	145	88	112	140	70
449	68	72	78	32	38	42
450	108	112	118	47	68	72
451	40	50	90	65	30	55
452	70	90	110	95	60	75
453	48	61	40	50	61	40
454	83	106	65	85	86	65
455	74	100	72	46	90	72
456	49	49	56	66	49	61
457	69	69	76	91	69	86
458	45	20	50	50	60	120
459	60	62	50	40	62	60
460	90	132	105	30	132	105
461	70	120	65	125	45	85
462	70	70	115	60	130	90
463	110	85	95	50	80	95
464	115	140	130	40	55	55
465	100	100	125	50	110	50
466	75	123	67	95	95	85
467	75	95	67	83	125	95
468	85	50	95	80	120	115
469	86	76	86	95	116	56
470	65	110	130	95	60	65
471	65	60	110	65	130	95
472	75	95	125	95	45	75
473	110	130	80	80	70	60
474	85	80	70	90	135	75
475	68	165	95	110	65	115
476	60	55	145	40	75	150
477	45	100	135	45	65	135
478	70	80	70	110	80	70
479	50	65	107	86	105	107
480	75	75	130	95	75	130
481	80	105	105	80	105	105
482	75	125	70	115	125	70
483	100	120	120	90	150	100
484	90	120	100	100	150	120
485	91	90	106	77	130	106
486	110	160	110	100	80	110
487	150	120	100	90	120	100
488	120	70	120	85	75	130
489	80	80	80	80	80	80
490	100	100	100	100	100	100
491	70	90	90	125	135	90
492	100	103	75	127	120	75
493	120	120	120	120	120	120
494	100	100	100	100	100	100
495	45	45	55	63	45	55
496	60	60	75	83	60	75
497	75	75	95	113	75	95
498	65	63	45	45	45	45
499	90	93	55	55	70	55
500	110	123	65	65	100	65
501	55	55	45	45	63	45
502	75	75	60	60	83	60
503	95	100	85	70	108	70
504	45	55	39	42	35	39
505	60	85	69	77	60	69
506	45	60	45	55	25	45
507	65	80	65	60	35	65
508	85	110	90	80	45	90
509	41	50	37	66	50	37
510	64	88	50	106	88	50
511	50	53	48	64	53	48
512	75	98	63	101	98	63
513	50	53	48	64	53	48
514	75	98	63	101	98	63
515	50	53	48	64	53	48
516	75	98	63	101	98	63
517	76	25	45	24	67	55
518	116	55	85	29	107	95
519	50	55	50	43	36	30
520	62	77	62	65	50	42
521	80	115	80	93	65	55
522	45	60	32	76	50	32
523	75	100	63	116	80	63
524	55	75	85	15	25	25
525	70	105	105	20	50	40
526	85	135	130	25	60	80
527	65	45	43	72	55	43
528	67	57	55	114	77	55
529	60	85	40	68	30	45
530	110	135	60	88	50	65
531	103	60	126	50	80	126
532	75	80	55	35	25	35
533	85	105	85	40	40	50
534	105	140	95	45	55	65
535	50	50	40	64	50	40
536	75	65	55	69	65	55
537	105	95	75	74	85	75
538	120	100	85	45	30	85
539	75	125	75	85	30	75
540	45	53	70	42	40	60
541	55	63	90	42	50	80
542	75	103	80	92	70	80
543	30	45	59	57	30	39
544	40	55	99	47	40	79
545	60	100	89	112	55	69
546	40	27	60	66	37	50
547	60	67	85	116	77	75
548	45	35	50	30	70	50
549	70	60	75	90	110	75
550	70	92	65	98	80	55
551	50	72	35	65	35	35
552	60	82	45	74	45	45
553	95	117	80	92	65	70
554	70	90	45	50	15	45
555	105	30	105	55	140	105
556	75	86	67	60	106	67
557	50	65	85	55	35	35
558	70	105	125	45	65	75
559	50	75	70	48	35	70
560	65	90	115	58	45	115
561	72	58	80	97	103	80
562	38	30	85	30	55	65
563	58	50	145	30	95	105
564	54	78	103	22	53	45
565	74	108	133	32	83	65
566	55	112	45	70	74	45
567	75	140	65	110	112	65
568	50	50	62	65	40	62
569	80	95	82	75	60	82
570	40	65	40	65	80	40
571	60	105	60	105	120	60
572	55	50	40	75	40	40
573	75	95	60	115	65	60
574	45	30	50	45	55	65
575	60	45	70	55	75	85
576	70	55	95	65	95	110
577	45	30	40	20	105	50
578	65	40	50	30	125	60
579	110	65	75	30	125	85
580	62	44	50	55	44	50
581	75	87	63	98	87	63
582	36	50	50	44	65	60
583	51	65	65	59	80	75
584	71	95	85	79	110	95
585	60	60	50	75	40	50
586	80	100	70	95	60	70
587	55	75	60	103	75	60
588	50	75	45	60	40	45
589	70	135	105	20	60	105
590	69	55	45	15	55	55
591	114	85	70	30	85	80
592	55	40	50	40	65	85
593	100	60	70	60	85	105
594	165	75	80	65	40	45
595	50	47	50	65	57	50
596	70	77	60	108	97	60
597	44	50	91	10	24	86
598	74	94	131	20	54	116
599	40	55	70	30	45	60
600	60	80	95	50	70	85
601	60	100	115	90	70	85
602	35	55	40	60	45	40
603	65	85	70	40	75	70
604	85	115	80	50	105	80
605	55	55	55	30	85	55
606	75	75	75	40	125	95
607	50	30	55	20	65	55
608	60	40	60	55	95	60
609	60	55	90	80	145	90
610	46	87	60	57	30	40
611	66	117	70	67	40	50
612	76	147	90	97	60	70
613	55	70	40	40	60	40
614	95	130	80	50	70	80
615	80	50	50	105	95	135
616	50	40	85	25	40	65
617	80	70	40	145	100	60
618	109	66	84	32	81	99
619	45	85	50	65	55	50
620	65	125	60	105	95	60
621	77	120	90	48	60	90
622	59	74	50	35	35	50
623	89	124	80	55	55	80
624	45	85	70	60	40	40
625	65	125	100	70	60	70
626	95	110	95	55	40	95
627	70	83	50	60	37	50
628	100	123	75	80	57	75
629	70	55	75	60	45	65
630	110	65	105	80	55	95
631	85	97	66	65	105	66
632	58	109	112	109	48	48
633	52	65	50	38	45	50
634	72	85	70	58	65	70
635	92	105	90	98	125	90
636	55	85	55	60	50	55
637	85	60	65	100	135	105
638	91	90	129	108	90	72
639	91	129	90	108	72	90
640	91	90	72	108	90	129
641	79	100	80	121	110	90
642	79	105	70	101	145	80
643	100	120	100	90	150	120
644	100	150	120	90	120	100
645	89	145	90	91	105	80
646	125	120	90	95	170	100
647	91	72	90	108	129	90
648	100	128	90	128	77	77
649	71	120	95	99	120	95
650	56	61	65	38	48	45
651	61	78	95	57	56	58
652	88	107	122	64	74	75
653	40	45	40	60	62	60
654	59	59	58	73	90	70
655	75	69	72	104	114	100
656	41	56	40	71	62	44
657	54	63	52	97	83	56
658	72	145	67	132	153	71
659	38	36	38	57	32	36
660	85	56	77	78	50	77
661	45	50	43	62	40	38
662	62	73	55	84	56	52
663	78	81	71	126	74	69
664	38	35	40	35	27	25
665	45	22	60	29	27	30
666	80	52	50	89	90	50
667	62	50	58	72	73	54
668	86	68	72	106	109	66
669	44	38	39	42	61	79
670	74	65	67	92	125	128
671	78	65	68	75	112	154
672	66	65	48	52	62	57
673	123	100	62	68	97	81
674	67	82	62	43	46	48
675	95	124	78	58	69	71
676	75	80	60	102	65	90
677	62	48	54	68	63	60
678	74	48	76	104	83	81
679	45	80	100	28	35	37
680	59	110	150	35	45	49
681	60	150	50	60	150	50
682	78	52	60	23	63	65
683	101	72	72	29	99	89
684	62	48	66	49	59	57
685	82	80	86	72	85	75
686	53	54	53	45	37	46
687	86	92	88	73	68	75
688	42	52	67	50	39	56
689	72	105	115	68	54	86
690	50	60	60	30	60	60
691	65	75	90	44	97	123
692	50	53	62	44	58	63
693	71	73	88	59	120	89
694	44	38	33	70	61	43
695	62	55	52	109	109	94
696	58	89	77	48	45	45
697	82	121	119	71	69	59
698	77	59	50	46	67	63
699	123	77	72	58	99	92
700	95	65	65	60	110	130
701	78	92	75	118	74	63
702	67	58	57	101	81	67
703	50	50	150	50	50	150
704	45	50	35	40	55	75
705	68	75	53	60	83	113
706	90	100	70	80	110	150
707	57	80	91	75	80	87
708	43	70	48	38	50	60
709	85	110	76	56	65	82
710	59	66	70	41	44	55
711	85	100	122	54	58	75
712	55	69	85	28	32	35
713	95	117	184	28	44	46
714	40	30	35	55	45	40
715	85	70	80	123	97	80
716	126	131	95	99	131	98
717	126	131	95	99	131	98
718	216	100	121	85	91	95
719	50	160	110	110	160	110
720	80	160	60	80	170	130
721	80	110	120	70	130	90
722	68	55	55	42	50	50
723	78	75	75	52	70	70
724	78	107	75	70	100	100
725	45	65	40	70	60	40
726	65	85	50	90	80	50
727	95	115	90	60	80	90
728	50	54	54	40	66	56
729	60	69	69	50	91	81
730	80	74	74	60	126	116
731	35	75	30	65	30	30
732	55	85	50	75	40	50
733	80	120	75	60	75	75
734	48	70	30	45	30	30
735	88	110	60	45	55	60
736	47	62	45	46	55	45
737	57	82	95	36	55	75
738	77	70	90	43	145	75
739	47	82	57	63	42	47
740	97	132	77	43	62	67
741	75	70	70	93	98	70
742	40	45	40	84	55	40
743	60	55	60	124	95	70
744	45	65	40	60	30	40
745	85	115	75	82	55	75
746	45	140	130	30	140	135
747	50	53	62	45	43	52
748	50	63	152	35	53	142
749	70	100	70	45	45	55
750	100	125	100	35	55	85
751	38	40	52	27	40	72
752	68	70	92	42	50	132
753	40	55	35	35	50	35
754	70	105	90	45	80	90
755	40	35	55	15	65	75
756	60	45	80	30	90	100
757	48	44	40	77	71	40
758	68	64	60	117	111	60
759	70	75	50	50	45	50
760	120	125	80	60	55	60
761	42	30	38	32	30	38
762	52	40	48	62	40	48
763	72	120	98	72	50	98
764	51	52	90	100	82	110
765	90	60	80	60	90	110
766	100	120	90	80	40	60
767	25	35	40	80	20	30
768	75	125	140	40	60	90
769	55	55	80	15	70	45
770	85	75	110	35	100	75
771	55	60	130	5	30	130
772	95	95	95	59	95	95
773	95	95	95	95	95	95
774	60	100	60	120	100	60
775	65	115	65	65	75	95
776	60	78	135	36	91	85
777	65	98	63	96	40	73
778	55	90	80	96	50	105
779	68	105	70	92	70	70
780	78	60	85	36	135	91
781	70	131	100	40	86	90
782	45	55	65	45	45	45
783	55	75	90	65	65	70
784	75	110	125	85	100	105
785	70	115	85	130	95	75
786	70	85	75	95	130	115
787	70	130	115	75	85	95
788	70	75	115	85	95	130
789	43	29	31	37	29	31
790	43	29	131	37	29	131
791	137	137	107	97	113	89
792	137	113	89	97	137	107
793	109	53	47	103	127	131
794	107	139	139	79	53	53
795	71	137	37	151	137	37
796	83	89	71	83	173	71
797	97	101	103	61	107	101
798	59	181	131	109	59	31
799	223	101	53	43	97	53
800	97	107	101	79	127	89
801	80	95	115	65	130	115
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.types (name_type, type_id) FROM stdin;
grass	1
poison	2
fire	3
flying	4
water	5
bug	6
normal	7
dark	8
electric	9
ground	10
ice	11
fairy	12
fighting	13
psychic	14
rock	15
steel	16
ghost	17
dragon	18
\.


--
-- Name: abilities abilities_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.abilities
    ADD CONSTRAINT abilities_pkey PRIMARY KEY (ability_id);


--
-- Name: classification classification_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (classification_id);


--
-- Name: pokemon pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (pokedex_number);


--
-- Name: stats stats_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (pokedex_number);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- PostgreSQL database dump complete
--

