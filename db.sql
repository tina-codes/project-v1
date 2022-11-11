--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Ubuntu 13.8-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.8 (Ubuntu 13.8-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: albums; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.albums (
    album_id character varying(22) NOT NULL,
    artist_id character varying(22) NOT NULL,
    name character varying(100) NOT NULL,
    release_year integer,
    img_url character varying
);


ALTER TABLE public.albums OWNER TO cnicosia;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.artists (
    artist_id character varying(22) NOT NULL,
    name character varying(100) NOT NULL,
    popularity integer,
    followers integer,
    img_url character varying
);


ALTER TABLE public.artists OWNER TO cnicosia;

--
-- Name: artists_genres; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.artists_genres (
    id integer NOT NULL,
    artist_id character varying(22) NOT NULL,
    genre character varying(30) NOT NULL
);


ALTER TABLE public.artists_genres OWNER TO cnicosia;

--
-- Name: artists_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: cnicosia
--

CREATE SEQUENCE public.artists_genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_genres_id_seq OWNER TO cnicosia;

--
-- Name: artists_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cnicosia
--

ALTER SEQUENCE public.artists_genres_id_seq OWNED BY public.artists_genres.id;


--
-- Name: features; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.features (
    track_id character varying(22) NOT NULL,
    danceability double precision NOT NULL,
    energy double precision NOT NULL,
    key integer NOT NULL,
    loudness double precision NOT NULL,
    mode integer NOT NULL,
    speechiness double precision NOT NULL,
    acousticness double precision NOT NULL,
    instrumentalness double precision NOT NULL,
    liveness double precision NOT NULL,
    valence double precision NOT NULL,
    tempo double precision NOT NULL,
    time_signature integer NOT NULL,
    duration_ms integer NOT NULL
);


ALTER TABLE public.features OWNER TO cnicosia;

--
-- Name: genres; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.genres (
    genre character varying(30) NOT NULL,
    name character varying(30) NOT NULL,
    is_seed boolean NOT NULL
);


ALTER TABLE public.genres OWNER TO cnicosia;

--
-- Name: items; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.items (
    id integer NOT NULL,
    user_id character varying(30) NOT NULL,
    date integer NOT NULL,
    item_type character varying(10) NOT NULL,
    timespan character varying(11) NOT NULL,
    rank integer NOT NULL,
    spotify_id character varying(22) NOT NULL
);


ALTER TABLE public.items OWNER TO cnicosia;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: cnicosia
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO cnicosia;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cnicosia
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.tracks (
    track_id character varying(22) NOT NULL,
    artist_id character varying(22) NOT NULL,
    album_id character varying(22) NOT NULL,
    name character varying(100) NOT NULL,
    popularity integer NOT NULL
);


ALTER TABLE public.tracks OWNER TO cnicosia;

--
-- Name: users; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.users (
    user_id character varying(30) NOT NULL,
    display_name character varying(30),
    profile_photo character varying
);


ALTER TABLE public.users OWNER TO cnicosia;

--
-- Name: artists_genres id; Type: DEFAULT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres ALTER COLUMN id SET DEFAULT nextval('public.artists_genres_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.albums (album_id, artist_id, name, release_year, img_url) FROM stdin;
5wnCTZtzIZxasRSHzI1JeW	0qu422H5MOoQxGjd4IzHbS	Heaven To A Tortured Mind	2020	https://i.scdn.co/image/ab67616d0000b273043864250fbec5f57c7076a7
68HLpLmCtvFKUqwQpUCqwn	65dGLGjkw3UbddUg2GKQoZ	IV	2016	https://i.scdn.co/image/ab67616d0000b273087255518781845b84bc8f92
6wYeJwJU9Y4fuLQVfGyJk9	4lujUKeO6nQAJXpq37Epn7	New Magic	2017	https://i.scdn.co/image/ab67616d0000b273c00c5819ddec8e15cb71ebb6
2oiJM8vFGpxrtGtFfJWhJv	6ltzsmQQbmdoHHbLZ4ZN25	Vide Noir	2018	https://i.scdn.co/image/ab67616d0000b2738431866429dc2ad6eed8c51e
4jQW2mhMH3TxtAOol3Djuf	0YrtvWJMgSdVrk3SfNjTbx	Transatlanticism (10th Anniversary Edition)	2003	https://i.scdn.co/image/ab67616d0000b273c306113cf2eea54867337da2
0qxsfpy2VU0i4eDR9RTaAU	0bzfPKdbXL5ezYW2z3UGQj	Love & Hate	2016	https://i.scdn.co/image/ab67616d0000b2731070095e88dce90a090171b5
6R6pjR9ocMYuqSuNx5e4mg	3M4ThdJR28z9eSMcQHAZ5G	Costello Music	2007	https://i.scdn.co/image/ab67616d0000b27390b7c466e878862b5a9cece3
2ICdqEf91Kc9FwdlLtB748	30DhU7BDmF4PH0JVhu8ZRg	About Time	2017	https://i.scdn.co/image/ab67616d0000b27376165991d7aeecce3634f554
3fUHDbd0oujqAerhHZjdsj	360IAlyVv4PCEVjgyMZrxK	Spotify Singles	2018	https://i.scdn.co/image/ab67616d0000b27353d3c8dce8f55cb13cf148ef
56dfEbntfVTMCxjrjggL1e	34jw2BbxjoYalTp8cJFCPv	Bad Animals	1987	https://i.scdn.co/image/ab67616d0000b2735fa646a4cfcd17842fdd7bbd
0NBTBo1qrg554sAj79nEqD	5Q81rlcTFh3k6DQJXPdsot	Mura Masa	2017	https://i.scdn.co/image/ab67616d0000b2736818aa231aa543cf87e1374a
3DGQ1iZ9XKUQxAUWjfC34w	2YZyLoL8N0Wb9xBt1NhZWg	good kid, m.A.A.d city (Deluxe)	2012	https://i.scdn.co/image/ab67616d0000b273d58e537cea05c2156792c53d
7vXiklrUeffx5o2F8VYwm3	4hz8tIajF2INpgM0qzPJz2	How to: Friend, Love, Freefall	2018	https://i.scdn.co/image/ab67616d0000b2739529217e48fc8bab89c8a1f9
0P3oVJBFOv3TDXlYRhGL7s	1Xyo4u8uXC1ZmMpatF05PJ	Beauty Behind The Madness	2015	https://i.scdn.co/image/ab67616d0000b2737fcead687e99583072cc217b
3vLFWR3fLqfY82WGvaLuyV	7CyeXFnOrfC1N6z4naIpgo	Be My Baby: The Very Best of The Ronettes	2011	https://i.scdn.co/image/ab67616d0000b2734694c5b97d3a88efb5fc71b5
57d5dFo7oN2yUyGfSKPrRv	55VydwMyCuGcavwPuhutPL	The Used	2002	https://i.scdn.co/image/ab67616d0000b273e0827a6cec3f1574249ec8c0
5AYmpTfdv1OoASUJ5rZB7K	08ct2eZF5lUPdJpHwNKWof	Cracked Rear View	1994	https://i.scdn.co/image/ab67616d0000b273820d2376b2fb84aa99823903
5K18gTgac0q6Jma5HkV1vA	37w38cCSGgKLdayTRjna4W	So Tonight That I Might See	1993	https://i.scdn.co/image/ab67616d0000b27389a392107ebd79818022b3ea
2HyJKdwnnaM156kvcPDwr8	4bthk9UfsYUYdcFyqxmSUU	Rule The World: The Greatest Hits	2017	https://i.scdn.co/image/ab67616d0000b273a9fac36898dc1302b5f642b3
58HZZpS0wxJKwGjoerg0mk	4pejUc4iciQfgdX6OKulQn	Songs For The Deaf	2002	https://i.scdn.co/image/ab67616d0000b2739b62c36a1f8ac00d60f460cc
0xAjncT0noqLbBH6iT4HjH	7qKoy46vPnmIxKCN6ewBG4	This Is Me...Justified and Stripped (Live)	2004	https://i.scdn.co/image/ab67616d0000b2735a802d724e98398a7fa7ceee
7cuwWzS0oiApEt2fpKafkX	1eClJfHLoDI4rZe5HxzBFv	Kick	1987	https://i.scdn.co/image/ab67616d0000b2734053ce7818f114a4e8dde08f
05kYWbiEVwGcd2Y2wolwWz	2iul6etLF5hjjpxo43rzz7	Plays Well With Others	2018	https://i.scdn.co/image/ab67616d0000b27385f03546f2dc91930b99874a
15k99o4mZJ9mfpQGIOrZ45	73sIBHcqh3Z3NyqHKZ7FOL	Summer Pack	2018	https://i.scdn.co/image/ab67616d0000b273602ca5b83fe44b68074a74b2
5zi7WsKlIiUXv09tbGLKsE	4V8LLVI7PbaPR0K2TGSxFF	IGOR	2019	https://i.scdn.co/image/ab67616d0000b2737005885df706891a3c182a57
2ninxvLuYGCb6H92qTaSFZ	3oDbviiivRWhXwIE8hxkVV	Greatest Hits	2012	https://i.scdn.co/image/ab67616d0000b27387ff937488599a929a5bfff5
1V8qUSg1WAHf3dCrVYdJ5Z	6loBF9iQdE11WSX29fNKqY	Dream Into Action	1985	https://i.scdn.co/image/ab67616d0000b2734b230178ff0f22cba27d7092
0qnHA4SDco9mPuWGzDqVDK	7guDJrEfX3qb6FEbdPA5qi	Up-Tight	1966	https://i.scdn.co/image/ab67616d0000b273c82a59431ee475300e2f618a
511e7X2zYDqPWQGADatYz2	0YHgnSkV3S5mvSSCTRWDi5	Friends With the Enemy	2011	https://i.scdn.co/image/ab67616d0000b2731706371ccf790d7ec8d0e0a4
7vNmiLEdMqJYUlPxSx2zgg	57bUPid8xztkieZfS7OlEV	I Hear A Symphony	1966	https://i.scdn.co/image/ab67616d0000b27316a6e92d6f1c8a02d68b4e44
4uiVwLbTzE6VMkXpaDAwB8	0X380XXQSNBYuleKzav5UO	The Fragile	1999	https://i.scdn.co/image/ab67616d0000b27378b860d90b266bfcd7e4c0be
1yIqauTni1V7l7djYAKSsZ	0bzfPKdbXL5ezYW2z3UGQj	KIWANUKA	2019	https://i.scdn.co/image/ab67616d0000b27360ada139840fb439d6750f27
6GphKx2QAPRoVGWE9D7ou8	3oDbviiivRWhXwIE8hxkVV	Pet Sounds (Original Mono & Stereo Mix Versions)	1966	https://i.scdn.co/image/ab67616d0000b273bde8dfd1922129f3d9e3732f
51C65YqHrDODM1hD5FEL5x	2YZyLoL8N0Wb9xBt1NhZWg	i	2014	https://i.scdn.co/image/ab67616d0000b2736d89f336fbfbdf2089701da0
7GpuEZzRrPT4IGiEuWaBzy	5eIbEEQnDM8yuDVB0bimSP	NOVA	2018	https://i.scdn.co/image/ab67616d0000b273eded2e9bae0cba9092424797
6XBKxM9rbzyOBP6gpE0qhd	3pkmfqaBNsMqnXus05PNfP	White People	2004	https://i.scdn.co/image/ab67616d0000b27381eac8fc86e62529641d803c
4uP43hIpmEEDuW7aOfiU2C	20wkVLutqVOYrc0kxFs7rA	Pilgrim's Paradise	2015	https://i.scdn.co/image/ab67616d0000b273a117ac19ee51aebdf05fe88c
1bTjSqotSDtUjcwFfukTQP	1mFX1QlezK1lNPKQJkhwWb	Heart Break	1988	https://i.scdn.co/image/ab67616d0000b273c31996a0e8cacc4c908249ca
6thSjE17RxW8tJFtLyXA3B	7guDJrEfX3qb6FEbdPA5qi	I Was Made To Love Her	1967	https://i.scdn.co/image/ab67616d0000b2733acbc801a982cbd02bc782c9
5wpZhWqsoXKBcVwvcEtCvv	0VbDAlm2KUlKI5UhXRBKWp	Electric Feel	2017	https://i.scdn.co/image/ab67616d0000b2739024f71abb56e984f5d9eb4d
4v9R5sk4HQ0X1krbEis34P	7KGqvFukcZRbQ7YFsYrgPa	Dreamin' Wild	1979	https://i.scdn.co/image/ab67616d0000b273556966ae0ac93e2aa1c3896a
0K3FiXt6ekJTWaUku3LpHL	6PEMFpe3PTOksdV4ZXUpbE	Yes Lawd!	2016	https://i.scdn.co/image/ab67616d0000b27313160a2de88c7be0adebb043
4hruYceqit29o6m4arpAql	5wFXmYsg3KFJ8BDsQudJ4f	A Black Mile To The Surface	2017	https://i.scdn.co/image/ab67616d0000b2736827146a676dafc0357fa665
2aaWMtuGxw17AZpKhZGdXQ	4hz8tIajF2INpgM0qzPJz2	RKS	2015	https://i.scdn.co/image/ab67616d0000b2739e16f54ce1b5f9e1d8196ba3
0vVekV45lOaVKs6RZQQNob	2ooIqOf4X2uz4mMptXCtie	In the Aeroplane Over the Sea	1998	https://i.scdn.co/image/ab67616d0000b273589ce9a911c6e65b1f80c558
17l7MIu0Jh0tdgK7or9ovw	1KP6TWI40m7p3QBTU6u2xo	Dopamine	2015	https://i.scdn.co/image/ab67616d0000b273cc2cf912462d8ae4ef856434
0y3tRiTDYzj5IuQb0Kk86x	1MIe1z4RdqLqHSJsb7EBMm	It’s Not All That Bad	2015	https://i.scdn.co/image/ab67616d0000b273069740bb736206138c87f7e8
15RYnRTIMHrCB6X3HjK2mC	4hz8tIajF2INpgM0qzPJz2	Mary (b-sides)	2019	https://i.scdn.co/image/ab67616d0000b273e81cd26a5fc0e1106cc5c747
4lGNpgFI67TUq5BMfnPe3Z	4hz8tIajF2INpgM0qzPJz2	Seven + Mary	2013	https://i.scdn.co/image/ab67616d0000b27317d131d429c783666c929d6b
3pWJFrSX6apPzt4inM4zXt	4l1cKWYW591xnwEGxpUg3J	iii	2016	https://i.scdn.co/image/ab67616d0000b27306eda68098c2a886a43685a8
2PIWPTOIxbaVSjTnc30vXS	0YrtvWJMgSdVrk3SfNjTbx	Asphalt Meadows	2022	https://i.scdn.co/image/ab67616d0000b273b808f709e7d5ed8e79cec246
6gtu2oXhmDQN8TAsWimZbj	1fZpYWNWdL5Z3wrDtISFUH	Tomorrow	2016	https://i.scdn.co/image/ab67616d0000b273d9e9693926785359f903acb5
05LEST8E8mkEIl2LRfUkcI	360IAlyVv4PCEVjgyMZrxK	War & Leisure	2017	https://i.scdn.co/image/ab67616d0000b2735e9dff10c31ac14c6c6c920d
493HYe7N5pleudEZRyhE7R	360IAlyVv4PCEVjgyMZrxK	All I Want Is You	2010	https://i.scdn.co/image/ab67616d0000b273d5a8395b0d80b8c48a5d851c
7kb2GfJGvn8Gr0LCGBSQjZ	0AkmSuTOzM2pNCIOSP8ziv	Volume 1	2018	https://i.scdn.co/image/ab67616d0000b273440d3f67a167757157bfb050
5CPwacWmIAaA5DLUq7EHUC	3dv4Q4q3LWOnbLJnC6GgTY	Harmless Melodies	2016	https://i.scdn.co/image/ab67616d0000b2731fffb4d9edbbc0426938bdcf
3YKQkIPHtWGuvkBeVNIMhg	60df5JBRRPcnSpsIMxxwQm	The Soul Album	1966	https://i.scdn.co/image/ab67616d0000b2734b56389fb1e78b2b3ab443d8
7ezeSBh9E63ijDAxn8Ke4P	360IAlyVv4PCEVjgyMZrxK	The Get Down: Original Soundtrack From The Netflix Original Series (Deluxe Version)	2016	https://i.scdn.co/image/ab67616d0000b273e3ece277a4777d53cc8a6046
3PsFboiPeObjAc6gbQHt54	3JaAGmSTpJK35DqWrDUzBz	Desolation Boulevard	1974	https://i.scdn.co/image/ab67616d0000b273bff2e9307284c5375b2a407a
0vuwlanMPucXrYMGnOjhYL	0EdvGhlC1FkGItLOWQzG4J	40oz. To Freedom	1992	https://i.scdn.co/image/ab67616d0000b273d77299e3d29f44495cd7fbcb
2FZNWUmgRoP8uJZBaHJdfj	7lzordPuZEXxwt9aoVZYmG	Rebel Yell	1983	https://i.scdn.co/image/ab67616d0000b273ea07dca8b4ca808c1e5b17fb
1ZH5g1RDq3GY1OvyD0w0s2	3RGLhK1IP9jnYFH4BRFJBS	Combat Rock (Remastered)	1982	https://i.scdn.co/image/ab67616d0000b27325a4df452a3c42ccc2e9288b
2jnV6ytZOmt71iEC5xHEYz	33EUXrFKGjpUSGacqEHhU4	Lust For Life	1977	https://i.scdn.co/image/ab67616d0000b2734aa5f679427e35409a06f225
02OIGj20Ltaa8rN8mKsHBT	2CVBumuL5KyztqCyo7CETY	Jet Boy	1978	https://i.scdn.co/image/ab67616d0000b27360b02c400bf170f44f8c75d9
48D1hRORqJq52qsnUYZX56	0oSGxfWSnnOXhD2fKuz2Gy	The Rise and Fall of Ziggy Stardust and the Spiders from Mars (2012 Remaster)	1972	https://i.scdn.co/image/ab67616d0000b273c41f4e1133b0e6c5fcf58680
440zYLMcBZhHc93WSGKDKo	5aBEGOeWQCJfptic9xyaAb	Everything!	1984	https://i.scdn.co/image/ab67616d0000b273768d2a36068dd1adcaa1f31b
4aW4iDepQUl5ZCHd1Gli68	0fA0VVWsXO9YnASrzqfmYu	Entergalactic	2022	https://i.scdn.co/image/ab67616d0000b27371cecf4c653a4bad539da13d
5Y0p2XCgRRIjna91aQE8q7	3yY2gUcIsjMr8hjo51PoJ8	The Queen Is Dead	1986	https://i.scdn.co/image/ab67616d0000b273ada101c2e9e97feb8fae37a9
2K2u7usRIF03pywk6qxGlM	4wYk01oPJNfaEssVFL46oQ	Going Mainstream	2021	https://i.scdn.co/image/ab67616d0000b273eda96f4688e29241aaa0e9c3
2qcwXvluk9iFwNNg4eDBXm	0Zy4ncr8h1jd7Nzr9946fD	Night Time	1985	https://i.scdn.co/image/ab67616d0000b2736a0553ce3c8ed791ef923887
4yP0hdKOZPNshxUOjY0cZj	1Xyo4u8uXC1ZmMpatF05PJ	After Hours	2020	https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36
4qZBW3f2Q8y0k1A84d4iAO	1Xyo4u8uXC1ZmMpatF05PJ	My Dear Melancholy,	2018	https://i.scdn.co/image/ab67616d0000b2731f6a2a40bb692936879db730
2ODvWsOgouMbaA5xf0RkJe	1Xyo4u8uXC1ZmMpatF05PJ	Starboy	2016	https://i.scdn.co/image/ab67616d0000b2734718e2b124f79258be7bc452
4AdZV63ycxFLF6Hcol0QnB	1Xyo4u8uXC1ZmMpatF05PJ	Starboy	2016	https://i.scdn.co/image/ab67616d0000b273a048415db06a5b6fa7ec4e1a
0JA38Ekhsv43y2lBj5GQkQ	3hteYQFiMFbJY7wS0xDymP	Hyperion	2019	https://i.scdn.co/image/ab67616d0000b273011a2f51fe757fafe13a0c2e
4ZyeHIgdujClXSjC2cSqSb	1Xyo4u8uXC1ZmMpatF05PJ	After Hours (Deluxe)	2020	https://i.scdn.co/image/ab67616d0000b273b5097b81179824803664aaaf
151w1FgRZfnKZA9FEcg9Z3	06HL4z0CvFAxyc27GXpf02	Midnights	2022	https://i.scdn.co/image/ab67616d0000b273bb54dde68cd23e2a268ae0f5
0Dt3FbpMQwjoT5KNAw0IXR	00FQb4jTyendYWaN8pK0wa	Born To Die – Paradise Edition (Special Version)	2012	https://i.scdn.co/image/ab67616d0000b273f894be72a77b1488292672c7
1D92WOHWUI2AGQCCdplcXL	00FQb4jTyendYWaN8pK0wa	Young And Beautiful	2013	https://i.scdn.co/image/ab67616d0000b273d7fb3e4c63020039d1cff6b2
5XpEKORZ4y6OrCZSKsi46A	00FQb4jTyendYWaN8pK0wa	Norman Fucking Rockwell!	2019	https://i.scdn.co/image/ab67616d0000b273879e9318cb9f4e05ee552ac9
1ORxRsK3MrSLvh7VQTF01F	00FQb4jTyendYWaN8pK0wa	Ultraviolence (Deluxe)	2014	https://i.scdn.co/image/ab67616d0000b2731624590458126fc8b8c64c2f
5pdR4YX2zWMXotdF034UYY	5fMUXHkw8R8eOP2RNVYEZX	Diplo	2022	https://i.scdn.co/image/ab67616d0000b2739cc42f338132f158b06b131f
21XMv0TCsnhWPt7MNVvkzD	360IAlyVv4PCEVjgyMZrxK	Kaleidoscope Dream	2012	https://i.scdn.co/image/ab67616d0000b273fe113f478616e62a8fe14108
4sJXyIfwduIWFISb4iCq2f	360IAlyVv4PCEVjgyMZrxK	Rogue Waves	2016	https://i.scdn.co/image/ab67616d0000b273c4daf0fda7e16ba5b0f86830
47oyrKaeobswT4T8zyaxdM	23fqKkggKUBHNkbKtXEls4	Kids in Love	2017	https://i.scdn.co/image/ab67616d0000b273238d888f4282893ed8f83f2a
1YBO4zKTVcNxP1VREsBc3h	4hz8tIajF2INpgM0qzPJz2	Work Out	2022	https://i.scdn.co/image/ab67616d0000b273f5d07e50c35933044ab97c76
2nkto6YNI4rUYTLqEwWJ3o	4V8LLVI7PbaPR0K2TGSxFF	Flower Boy	2017	https://i.scdn.co/image/ab67616d0000b2738940ac99f49e44f59e6f7fb3
5iUwaD3wFVwfaAfs9Z0eCh	4V8LLVI7PbaPR0K2TGSxFF	BEST INTEREST	2020	https://i.scdn.co/image/ab67616d0000b273ab8995f18dc3dd9f34a6acd4
4YV8SurDnk8sctOOZzYtbH	2RdwBSPQiwcmiDo9kixcl8	Cash In Cash Out	2022	https://i.scdn.co/image/ab67616d0000b2738f0df54fd6043164d7c07ae3
45ba6QAtNrdv6Ke4MFOKk9	4V8LLVI7PbaPR0K2TGSxFF	CALL ME IF YOU GET LOST	2021	https://i.scdn.co/image/ab67616d0000b273696b4e67423edd64784bfbb4
5dbCm8qaCdWnNdVyi3urUO	4V8LLVI7PbaPR0K2TGSxFF	Goblin	2011	https://i.scdn.co/image/ab67616d0000b27328ae9a159d24cb0ab2552712
3rioHzbE7RDGbgxzg9uFNd	4lujUKeO6nQAJXpq37Epn7	aloha	2020	https://i.scdn.co/image/ab67616d0000b2730d830a3889104c583daff2e4
2jGQieA1EggldcxFAiQHjJ	4lujUKeO6nQAJXpq37Epn7	Son Little (Deluxe Edition)	2015	https://i.scdn.co/image/ab67616d0000b273d090f49c5ca5b15746c4bc91
014KjVEwCWxN2hWFYsUWNB	4lujUKeO6nQAJXpq37Epn7	Like Neptune	2022	https://i.scdn.co/image/ab67616d0000b273e8958a117cda0d3b5c474bf8
4VzzEviJGYUtAeSsJlI9QB	4kI8Ie27vjvonwaB2ePh8T	Woodstock	2017	https://i.scdn.co/image/ab67616d0000b273af52c228c9619ff6298b08cd
55A6d8TOuiAs6zDiKj2c3A	0bzfPKdbXL5ezYW2z3UGQj	Cold Little Heart (Radio Edit)	2017	https://i.scdn.co/image/ab67616d0000b273d38e121683bc208a4530fb22
79VDAdjzMMGoftIbw5feYN	0bzfPKdbXL5ezYW2z3UGQj	Home Again	2012	https://i.scdn.co/image/ab67616d0000b273598b2f140fcdaecf31e723e5
0rEbmIQjHTKzKraH4UqiDy	2dBj3prW7gP9bCCOIQeDUf	Cheat Codes	2022	https://i.scdn.co/image/ab67616d0000b2737d79b9c2cacc84b20de67f80
5qmEF78Uq9CjwIgvKQe7WG	0bzfPKdbXL5ezYW2z3UGQj	Money	2019	https://i.scdn.co/image/ab67616d0000b27313df1883a40a27f8f0d41d0a
0QJHIPjOnmwYuduAcNaQ5m	0bzfPKdbXL5ezYW2z3UGQj	Beautiful Life	2021	https://i.scdn.co/image/ab67616d0000b273ee2105ebb1de92f3e2751831
5pCfjopxazLdvmLae6My9w	5wFXmYsg3KFJ8BDsQudJ4f	The Gold (Phoebe Bridgers Version)	2018	https://i.scdn.co/image/ab67616d0000b2738b54cdfa703cc0162b76dfb1
3mD3TH55C4q6H5ObfJw4w6	5wFXmYsg3KFJ8BDsQudJ4f	I Know How To Speak	2018	https://i.scdn.co/image/ab67616d0000b273bdd14f0fd23f03eda6f621e8
3GJ7F5BNIZjY5fhiu8ui4B	5wFXmYsg3KFJ8BDsQudJ4f	The Million Masks Of God	2021	https://i.scdn.co/image/ab67616d0000b273efc9e1e9b5e80a7f3c0a52c9
4gFsfMVkEduaEMfQIlNEqn	0oL26Dn9y761yfJgNb3vfu	In My Head	2022	https://i.scdn.co/image/ab67616d0000b273c6e89fe4cf58c972e98aff09
1RHlOUoinOK5WZconLM6lp	0e9H8oaYYRCKFXOVv848nt	II	2012	https://i.scdn.co/image/ab67616d0000b27309757116183d1d28472dfcd1
0QgLeJOCYZN6V9kUTlgNHu	5wFXmYsg3KFJ8BDsQudJ4f	The Gold (Nick Waterhouse Remix)	2017	https://i.scdn.co/image/ab67616d0000b273f7b82d970070a270a1cd06d6
7g7WzMzTLLOyTSzVUnJACI	462T0buQ5ScBUQCRpodDRf	Changes	2016	https://i.scdn.co/image/ab67616d0000b273b87c50881c048df7a48f4159
6llfJp31mi9r7swqmSAwuK	462T0buQ5ScBUQCRpodDRf	No Time For Dreaming	2011	https://i.scdn.co/image/ab67616d0000b2735299f13d4459546003c9e488
3rimYQyKq7BatxuUoPIBrb	462T0buQ5ScBUQCRpodDRf	Victim of Love	2013	https://i.scdn.co/image/ab67616d0000b27300da03216eb2a67144e8837c
1NFGnxmeIEBakre4DvLaJq	0YrtvWJMgSdVrk3SfNjTbx	Plans	2005	https://i.scdn.co/image/ab67616d0000b273c985bcc18dd81da80839e5a9
3stEKyV4hKU1G5yXtmDOaN	0YrtvWJMgSdVrk3SfNjTbx	The Georgia EP	2021	https://i.scdn.co/image/ab67616d0000b2736ef1d93bbea3ebae665a6a5b
3yoNZlqerJnsnMN5EDwwBS	6ltzsmQQbmdoHHbLZ4ZN25	Strange Trails	2015	https://i.scdn.co/image/ab67616d0000b2739d2efe43d5b7ebc7cb60ca81
2ZDjruwuzzzT8JMJRXvLtl	6ltzsmQQbmdoHHbLZ4ZN25	Lonesome Dreams	2012	https://i.scdn.co/image/ab67616d0000b2739fa1250ee7b5839a4a7d6434
3HHHK8lGDgB9wwGXd0za9o	6ltzsmQQbmdoHHbLZ4ZN25	The Night We Met (feat. Phoebe Bridgers)	2018	https://i.scdn.co/image/ab67616d0000b2739c636fd22a1df32ffc1a3cf6
5xiePX6kXj5ZsmUsqIqzeD	6ltzsmQQbmdoHHbLZ4ZN25	Long Lost	2021	https://i.scdn.co/image/ab67616d0000b2731c18ab47e15a19af3246a792
3oTpxylhyTiGLaZ8IRjJQB	6ltzsmQQbmdoHHbLZ4ZN25	Spotify Singles	2018	https://i.scdn.co/image/ab67616d0000b2734a8c1b492e37b2ea7da2ec20
1YgekJJTEueWDaMr7BYqPk	0du5cEVh5yTK9QJze8zA0C	An Evening With Silk Sonic	2021	https://i.scdn.co/image/ab67616d0000b273fcf75ead8a32ac0020d2ce86
0152qvGv0mmX2vU36Rocng	5p7f24Rk5HkUZsaS3BLG5F	Coast	2022	https://i.scdn.co/image/ab67616d0000b273f5397a412658c978232a1c10
1o8zUe3QYHV42SHSsg6ffu	6PEMFpe3PTOksdV4ZXUpbE	Where I Go (feat. H.E.R.)	2022	https://i.scdn.co/image/ab67616d0000b2733b1f0c3fe1a33f9fd2d88dc5
4VZ7jhV0wHpoNPCB7Vmiml	0du5cEVh5yTK9QJze8zA0C	An Evening With Silk Sonic	2021	https://i.scdn.co/image/ab67616d0000b273d0bbd3ea2ec554f17a6603cc
4VFG1DOuTeDMBjBLZT7hCK	3jK9MiCrA42lLAdMGUZpwa	Malibu	2016	https://i.scdn.co/image/ab67616d0000b273f8e77075414234fd77fce32b
21KIagsx1ZvYcv0sVkEAWv	3qnGvpP8Yth1AqSBMqON5x	Coming Home (Deluxe)	2015	https://i.scdn.co/image/ab67616d0000b273a8df0c930a741d6f49cc3f8d
4HFO9PDRxsdbcegkcNhxgz	2mVVjNmdjXZZDvhgQWiakk	Texas Sun	2020	https://i.scdn.co/image/ab67616d0000b273ff26bd277274b27f249cc638
3tRmxSQyoyXXwcVDcUFQic	55fhWPvDiMpLnE4ZzNXZyW	July (feat. Leon Bridges)	2019	https://i.scdn.co/image/ab67616d0000b273acebb58ea70a6e5ff1c4d261
7J9fifadXb0PPSBWXctbi8	3qnGvpP8Yth1AqSBMqON5x	Good Thing	2018	https://i.scdn.co/image/ab67616d0000b273a47ee7a49c53ccdcb38dc874
2Xs9xSBhvyo8F6daRc1npu	2mVVjNmdjXZZDvhgQWiakk	Texas Moon	2022	https://i.scdn.co/image/ab67616d0000b27328e12bc569f20d9f8ebff84c
03HMOcANauhLD0WNrMkmLU	60df5JBRRPcnSpsIMxxwQm	The Dock of the Bay (Mono)	1968	https://i.scdn.co/image/ab67616d0000b27313a5da9563c438059afa7ad4
2BFOk5b8jjm2xmsbx7qXq3	60df5JBRRPcnSpsIMxxwQm	Pain in My Heart	1964	https://i.scdn.co/image/ab67616d0000b273cd404b5ae961b29d83f17c1f
3mdKPgJ2hyDF9ToznWuCn1	60df5JBRRPcnSpsIMxxwQm	Dock of the Bay Sessions	2018	https://i.scdn.co/image/ab67616d0000b273dec4d47f98dc7f1cccbcf6f7
25uNcuL4dAoV62eKmr8Q0Y	60df5JBRRPcnSpsIMxxwQm	Complete & Unbelievable: The Otis Redding Dictionary of Soul	1966	https://i.scdn.co/image/ab67616d0000b273ffffe932598090498459b77c
68BCjMsHX4Gf11BJSkjwGz	60df5JBRRPcnSpsIMxxwQm	Otis Blue: Otis Redding Sings Soul (Collector's Edition)	1965	https://i.scdn.co/image/ab67616d0000b27309cdd247bd06fb04470aa4b8
5K3FfkoIozJuEOhiwOm5SR	60df5JBRRPcnSpsIMxxwQm	Love Man	1969	https://i.scdn.co/image/ab67616d0000b273a9ccf78623346eacd99a5cb6
5YYP98SsNmRZ8CgoFKifSz	60df5JBRRPcnSpsIMxxwQm	The Great Otis Redding Sings Soul Ballads	1965	https://i.scdn.co/image/ab67616d0000b2735b76382492fe487d46de4c51
3MATDdrpHmQCmuOcozZjDa	13ubrt8QOOCPljQ2FL1Kca	TESTING	2018	https://i.scdn.co/image/ab67616d0000b2739feadc48ab0661e9b3a9170b
3AlyvIIMZyT5LjWFeK5LSl	13ubrt8QOOCPljQ2FL1Kca	Sundress	2018	https://i.scdn.co/image/ab67616d0000b2731ae967e4a02c7a39eb3c189b
3arNdjotCvtiiLFfjKngMc	13ubrt8QOOCPljQ2FL1Kca	AT.LONG.LAST.A$AP	2015	https://i.scdn.co/image/ab67616d0000b27381a6a2cafab2e7a4066b5eec
6rzMufuu8sLkIizM4q9c7J	13ubrt8QOOCPljQ2FL1Kca	LONG.LIVE.A$AP (Deluxe Version)	2013	https://i.scdn.co/image/ab67616d0000b2732ae92030b51fb8135d694af9
7IKkHmEk4It4cRdOYanyvW	50co4Is1HCEo8bhOyUWKpn	Punk	2021	https://i.scdn.co/image/ab67616d0000b273f8d415dab5ed7e3747bd38dd
02KFVEA5tnY0YnypmWY1tz	4V8LLVI7PbaPR0K2TGSxFF	Potato Salad	2018	https://i.scdn.co/image/ab67616d0000b273215cac8c30b47bb1bfb9d2d1
4eLPsYPBmXABThSJ821sqY	2YZyLoL8N0Wb9xBt1NhZWg	DAMN.	2017	https://i.scdn.co/image/ab67616d0000b2738b52c6b9bc4e43d873869699
3pLdWdkj83EYfDN6H2N8MR	2YZyLoL8N0Wb9xBt1NhZWg	Black Panther The Album Music From And Inspired By	2018	https://i.scdn.co/image/ab67616d0000b273c027ad28821777b00dcaa888
79ONNoS4M9tfIA1mYLBYVX	2YZyLoL8N0Wb9xBt1NhZWg	Mr. Morale & The Big Steppers	2022	https://i.scdn.co/image/ab67616d0000b2732e02117d76426a08ac7c174f
6PBZN8cbwkqm1ERj2BGXJ1	2YZyLoL8N0Wb9xBt1NhZWg	good kid, m.A.A.d city	2012	https://i.scdn.co/image/ab67616d0000b273d28d2ebdedb220e479743797
7ycBtnsMtyVbbwTfJwRjSP	2YZyLoL8N0Wb9xBt1NhZWg	To Pimp A Butterfly	2015	https://i.scdn.co/image/ab67616d0000b273cdb645498cd3d8a2db4d05e1
3r46DPIQeBQbjvjjV5mXGg	5SXuuuRpukkTvsLuUknva1	The Melodic Blue	2021	https://i.scdn.co/image/ab67616d0000b2731bfa23b13d0504fb90c37b39
0hMh7RDyxuRD5AoTdh72DN	6QRlkjrHz5A62mqeNZz7t3	Floating Features	2018	https://i.scdn.co/image/ab67616d0000b27348170c8f8e5019f05f034e9a
3B2xgIcoHjm1HdHYDydoUu	6QRlkjrHz5A62mqeNZz7t3	It's Alive	2013	https://i.scdn.co/image/ab67616d0000b2735fb94199e9cef141cba5c038
1b42c8tkc0fLhiLprU1jiX	6QRlkjrHz5A62mqeNZz7t3	Weirdo Shrine	2015	https://i.scdn.co/image/ab67616d0000b273cef715f31e55c61ab008ac69
17WOu1wHd6KdSO2Z0HRz6w	6QRlkjrHz5A62mqeNZz7t3	La Luz	2021	https://i.scdn.co/image/ab67616d0000b2730267086fc351092028382016
1kSTHq1yseNNxYpM48o3ry	6QRlkjrHz5A62mqeNZz7t3	Endless Afternoon	2022	https://i.scdn.co/image/ab67616d0000b273ab6c128b34b0530a2e099f31
7bvUQdrsKA3o6lkjV1ZRPk	5CuU6SRJjbbZL926nSGGxX	Component System with the Auto Reverse	2022	https://i.scdn.co/image/ab67616d0000b27391cd02c1fe687d860916d4f5
1VDnqZVFSg0xVF104kaIix	5CuU6SRJjbbZL926nSGGxX	Brick Body Kids Still Daydream	2017	https://i.scdn.co/image/ab67616d0000b2737092bbc13520b5e56962a059
7BlWNRjwKnLrf7yf0VdSvg	5CuU6SRJjbbZL926nSGGxX	A Special Episode - EP	2015	https://i.scdn.co/image/ab67616d0000b273ce58aacb3d91630e348ffa61
7qlmxswkArGiRuCJtuW7sz	5CuU6SRJjbbZL926nSGGxX	What Happens When I Try to Relax	2018	https://i.scdn.co/image/ab67616d0000b2731be2ba958eb3a6b5e5f9d469
71udkw2yxFqNK4SNSYcCce	6pmxr66tMAePxzOLfjGNcX	The Flying Club Cup	2007	https://i.scdn.co/image/ab67616d0000b273a5818379975d1815f7f4e1b2
4yP7cyoeE3F6EyJPZ9v47V	6pmxr66tMAePxzOLfjGNcX	Gulag Orkestar	2006	https://i.scdn.co/image/ab67616d0000b2736ad0ccb944d30d7e47d26c9a
26G7PfSLTyLiIcITVl7GAK	6pmxr66tMAePxzOLfjGNcX	Artifacts	2022	https://i.scdn.co/image/ab67616d0000b273d34ab0a2566efc1bcab2d090
7HYptJX2aQJPWbxXviXLwQ	6pmxr66tMAePxzOLfjGNcX	The Rip Tide	2011	https://i.scdn.co/image/ab67616d0000b273c5949c3f16dc658aed9a2c73
6iAOkTDFRiWHVNNUjBqIxT	6pmxr66tMAePxzOLfjGNcX	No No No	2015	https://i.scdn.co/image/ab67616d0000b27362a1baec692cd616425c879e
45RV070mrplPB5gMO6Q136	6pmxr66tMAePxzOLfjGNcX	Gallipoli	2019	https://i.scdn.co/image/ab67616d0000b273af0de52ff95a42354790e21f
6k3vC8nep1BfqAIJ81L6OL	3XHO7cRUPCLOr6jwp8vsx5	An Awesome Wave	2012	https://i.scdn.co/image/ab67616d0000b273028c3bb4b81ee71dd73d1596
4oktVvRuO1In9B7Hz0xm0a	3XHO7cRUPCLOr6jwp8vsx5	This Is All Yours	2014	https://i.scdn.co/image/ab67616d0000b27311b3df35e2e46d91f585afd9
5ogYKSRRlVAgMzv09HFeIn	3XHO7cRUPCLOr6jwp8vsx5	The Dream	2022	https://i.scdn.co/image/ab67616d0000b273c44ea63878762e1f3791a551
4Tg1YeHrSMEUVsGiYfkSm3	1Tp7C6LzxZe9Mix6rn4zbI	Surefire (Gus alt-j Remix)	2022	https://i.scdn.co/image/ab67616d0000b27370fc2e1e34f45b817d351abc
5dGWwsZ9iB2Xc3UKR0gif2	1uNFoZAHBGtllmzznpCI3s	Justice	2021	https://i.scdn.co/image/ab67616d0000b273e6f407c7f3a0ec98845e4431
3xybjP7r2VsWzwvDQipdM0	20wkVLutqVOYrc0kxFs7rA	Freudian	2017	https://i.scdn.co/image/ab67616d0000b2733138f891f3075c9c5d944037
5qfhZ5YkZ4LhEUbYgjrWt6	20wkVLutqVOYrc0kxFs7rA	Get You - Single	2016	https://i.scdn.co/image/ab67616d0000b273617c314e94693fad9a26f798
4mvxoogQn8p84Wz17zTHnJ	20wkVLutqVOYrc0kxFs7rA	CASE STUDY 01	2019	https://i.scdn.co/image/ab67616d0000b2737607aa9ae7904e1b12907c93
5z7TD11Qh81Gbf52hd5zAv	5FxD8fkQZ6KcsSYupDVoSO	Ivory	2022	https://i.scdn.co/image/ab67616d0000b27390cf5d1ccfca2beb86149a19
2kdNEYAPZlAoMaIzYQWM8U	20wkVLutqVOYrc0kxFs7rA	Please Do Not Lean	2022	https://i.scdn.co/image/ab67616d0000b27367a8afb7c3e34748f5faf8d8
15M9pZ8gsdoN67yLjyQ039	20wkVLutqVOYrc0kxFs7rA	Who Hurt You?	2018	https://i.scdn.co/image/ab67616d0000b273c70176fa51326491ecc5f79e
4KJGypBUe7ANibtri1msUe	6eU0jV2eEZ8XTM7EmlguK6	Black Pumas	2019	https://i.scdn.co/image/ab67616d0000b273b78008fa0713ff7e5445566b
2opeT2znafgBMJS9q3nlwg	6eU0jV2eEZ8XTM7EmlguK6	OCT 33 - A COLORS SHOW	2020	https://i.scdn.co/image/ab67616d0000b2733c94f4184d2d8e9ced92201e
71iDfOWbiVriNL3FnD6fFJ	6eU0jV2eEZ8XTM7EmlguK6	Fast Car b/w Fire	2020	https://i.scdn.co/image/ab67616d0000b273c69e5c460d895ca60b8856b8
7BEA5emJl0yTMC9XBDJCcm	6eU0jV2eEZ8XTM7EmlguK6	Black Pumas (Deluxe Edition)	2020	https://i.scdn.co/image/ab67616d0000b273fb91a17359bf595af113070b
3mH6qwIy9crq0I9YQbOuDf	2h93pZq0e7k5yf4dywlkpM	Blonde	2016	https://i.scdn.co/image/ab67616d0000b273c5649add07ed3720be9d5526
392p3shh2jkxUxY2VHvlH8	2h93pZq0e7k5yf4dywlkpM	channel ORANGE	2012	https://i.scdn.co/image/ab67616d0000b2737aede4855f6d0d738012e2e5
3RYdEXhGHojkTILUdtnRVJ	2h93pZq0e7k5yf4dywlkpM	Novacane	2011	https://i.scdn.co/image/ab67616d0000b27359a428dc7ef8e0c12b0fe18a
71VX8yv9T2hNIYVZJVUWVp	2h93pZq0e7k5yf4dywlkpM	In My Room	2019	https://i.scdn.co/image/ab67616d0000b273db974f9533dd9b362891b5db
6OGzmhzHcjf0uN9j7dYvZH	2h93pZq0e7k5yf4dywlkpM	Chanel	2017	https://i.scdn.co/image/ab67616d0000b273a0b780c23fc3c19bd412b234
71jxid8dyhioxjrZ4OiLWQ	1zXCFUgH6FWS0iCiCKsH55	Illuminarium	2021	https://i.scdn.co/image/ab67616d0000b273f2c269ce77afc548e0aa4741
3XQya9tCptDZRNFU90qBiL	1zXCFUgH6FWS0iCiCKsH55	Euphoria	2022	https://i.scdn.co/image/ab67616d0000b2735133c6b18b8cc3eb4af76a0e
4jWRGEF8uP4vadXsot9SwK	1zXCFUgH6FWS0iCiCKsH55	Drowning in the XXX	2021	https://i.scdn.co/image/ab67616d0000b273839ff29348a49923e7a8e90f
6wRjGQayCybNhsUiTJdXcc	1zXCFUgH6FWS0iCiCKsH55	Chokin' & Wicked	2021	https://i.scdn.co/image/ab67616d0000b2734129358b74c9b12dff8e4426
1954USRP58YPbatjFxSphC	1zXCFUgH6FWS0iCiCKsH55	Megaphone	2022	https://i.scdn.co/image/ab67616d0000b273cad13a45e5b693b6f7bb25ec
0gpxUkqSnLwD50aaRir6jH	6PEMFpe3PTOksdV4ZXUpbE	Yes Lawd!	2016	https://i.scdn.co/image/ab67616d0000b273cc186f1bfb7589712e2a881f
0YePXgGfk39Rd1OWgqFKRS	17Zu03OgBVxgLxWmRUyNOJ	1988	2020	https://i.scdn.co/image/ab67616d0000b27339d5d182e08f18df9ca86243
3JdE3RuYy67anCwXisf6ml	6PEMFpe3PTOksdV4ZXUpbE	Link Up & Suede	2015	https://i.scdn.co/image/ab67616d0000b273f48c4cb9b9bca6cb6251c266
5t0lQDPLF22wmWCtSZkIVv	3z6Gk257P9jNcZbBXJNX5i	Far	2009	https://i.scdn.co/image/ab67616d0000b2738c8d5428b693308705e7caca
5L6RSDUhfwNAU87Pafcobr	3z6Gk257P9jNcZbBXJNX5i	The Call	2009	https://i.scdn.co/image/ab67616d0000b2736b0a69f71595da9ec310f32f
0ssMZRCnobXKQXjQ2R5A5a	3z6Gk257P9jNcZbBXJNX5i	Begin to Hope (Special Edition)	2006	https://i.scdn.co/image/ab67616d0000b2737fd2d3669c086850c0f766e8
1JS6yTcVopsE6ROReK30ik	0epOFNiUfyON9EYx7Tpr6V	Modern Girls & Old Fashion Men	2004	https://i.scdn.co/image/ab67616d0000b2735c34eb2fe9c204dec08a3d71
0HeAK5QnrTRrksc2WuTYgy	3z6Gk257P9jNcZbBXJNX5i	Soviet Kitsch	2004	https://i.scdn.co/image/ab67616d0000b27376fefb2bcf96e221ce6d4508
5QOP3w3rOF5TBYgzjGep5Y	3z6Gk257P9jNcZbBXJNX5i	You've Got Time	2013	https://i.scdn.co/image/ab67616d0000b27310c91319c637b0f9de5f397d
5AgsHUKFxr5DApRCmulIqJ	3z6Gk257P9jNcZbBXJNX5i	The Hamilton Mixtape	2016	https://i.scdn.co/image/ab67616d0000b27382288d9e37e14447f5c7f4ab
3W6CI0Lw7lElAPID2Fd3B4	74oJ4qxwOZvX6oSsu1DGnw	Disraeli Gears (Deluxe Edition)	1967	https://i.scdn.co/image/ab67616d0000b273db1fb2dede292908e86d94d7
0zrtTZC7yY2TOEhnbJzSb9	74oJ4qxwOZvX6oSsu1DGnw	Wheels Of Fire	1968	https://i.scdn.co/image/ab67616d0000b2735c7731f5acdcb2d02d78b7ee
6iyKqDoL9pRSHUsDBYemlB	74oJ4qxwOZvX6oSsu1DGnw	Fresh Cream	1966	https://i.scdn.co/image/ab67616d0000b27393a3bb62961a598ecaad1f75
2tVc8PhqDSRkpgiGOw7Ukb	74oJ4qxwOZvX6oSsu1DGnw	Goodbye	1969	https://i.scdn.co/image/ab67616d0000b2736e14114e634f57610bc24170
6ZeO3WNF2Gti8ZQnXog5SQ	0XSqX2PB3C5dTMv7SZaxSm	Apologies to the Queen Mary	2005	https://i.scdn.co/image/ab67616d0000b2733674bf46d2590883b6adf1f8
0SGIIeSYwykTlnqfp3WjIN	0XSqX2PB3C5dTMv7SZaxSm	At Mount Zoomer	2008	https://i.scdn.co/image/ab67616d0000b2730a7312e82514d8dde9da1eda
48daTpxQYkfcylr2N7PuUV	0XSqX2PB3C5dTMv7SZaxSm	Cry Cry Cry	2017	https://i.scdn.co/image/ab67616d0000b2731ec465397e20acf6989d9eea
0BwWUstDMUbgq2NYONRqlu	08GQAI4eElDnROBrJRGE0X	Rumours (Super Deluxe)	1977	https://i.scdn.co/image/ab67616d0000b273e52a59a28efa4773dd2bfe1b
4AsXQ17Arq1cUVoa9dKJ3F	08GQAI4eElDnROBrJRGE0X	Tango In the Night (Deluxe Edition)	1987	https://i.scdn.co/image/ab67616d0000b273aaba065944cd82a6f15c86b6
5VIQ3VaAoRKOEpJ0fewdvo	08GQAI4eElDnROBrJRGE0X	Fleetwood Mac	1975	https://i.scdn.co/image/ab67616d0000b2734fb043195e8d07e72edc7226
1bt6q2SruMsBtcerNVtpZB	08GQAI4eElDnROBrJRGE0X	Rumours	1977	https://i.scdn.co/image/ab67616d0000b2730001af4f80be77069fc8fd41
0LfM3PGkXE6KvJEE1HkOnz	08GQAI4eElDnROBrJRGE0X	Greatest Hits	1988	https://i.scdn.co/image/ab67616d0000b273813da91820fd194cbee5bdce
0UMMIkurRUmkruZ3KGBLtG	6l3HvQ5sa6mXTsMTB19rO5	2014 Forest Hills Drive	2014	https://i.scdn.co/image/ab67616d0000b273c6e0948bbb0681ff29cdbae8
5FP9keIJnlSCKnkdVOf623	6l3HvQ5sa6mXTsMTB19rO5	Born Sinner (Deluxe Version)	2013	https://i.scdn.co/image/ab67616d0000b273c1bb124f993488cf21b269fc
3XzSOIE6zGLliuqsVGLmUc	6l3HvQ5sa6mXTsMTB19rO5	MIDDLE CHILD	2019	https://i.scdn.co/image/ab67616d0000b2737f37a4001ae7d8be430bd91b
0fhmJYVhW0e4i33pCLPA5i	6l3HvQ5sa6mXTsMTB19rO5	Cole World: The Sideline Story	2011	https://i.scdn.co/image/ab67616d0000b27399da48a530f6ca2ef86da3cc
4JAvwK4APPArjIsOdGoJXX	6l3HvQ5sa6mXTsMTB19rO5	The Off-Season	2021	https://i.scdn.co/image/ab67616d0000b27310e6745bb2f179dd3616b85f
4Wv5UAieM1LDEYVq5WmqDd	6l3HvQ5sa6mXTsMTB19rO5	KOD	2018	https://i.scdn.co/image/ab67616d0000b273cf0f0affd0138a7442f13706
4wxoPjHSYFYurNyKaEiZNT	6RZUqkomCmb8zCRqc9eznB	Without You I'm Nothing	1998	https://i.scdn.co/image/ab67616d0000b273f05be6e0f6c59b1563b4e35e
7kTsa1wUFrahJJf1cJEOpZ	6RZUqkomCmb8zCRqc9eznB	Covers	2003	https://i.scdn.co/image/ab67616d0000b27362c995dbce6d7ffa4c097475
2toHnQWm3IbSocaWGYi9J4	6RZUqkomCmb8zCRqc9eznB	Sleeping With Ghosts	2003	https://i.scdn.co/image/ab67616d0000b2739b2e4db4b78ab31b5d55f2fc
4rIT7o85FQB2KfTMMT4Pj0	6RZUqkomCmb8zCRqc9eznB	Meds	2006	https://i.scdn.co/image/ab67616d0000b2738d8d7e2161c2bf9ecee56d39
19upQOw6eZRsGUGqGe6zF1	6RZUqkomCmb8zCRqc9eznB	Never Let Me Go	2022	https://i.scdn.co/image/ab67616d0000b2730c8a0bd4dbdd57692580ebb7
0PhJJToPch4jCjrfQjyarw	6RZUqkomCmb8zCRqc9eznB	Black Market Music	2000	https://i.scdn.co/image/ab67616d0000b27393deba59f323074beff846ff
7q6zjWaLw8bN5nYiBWjrus	2PaZWGu5T5nHjY2xxAkFsT	THE SCOTTS	2020	https://i.scdn.co/image/ab67616d0000b27311d6f8c713ef93a9bb64ddfe
0InO6eGRL47KErEYEoc2rP	0fA0VVWsXO9YnASrzqfmYu	Man On The Moon II: The Legend Of Mr. Rager	2010	https://i.scdn.co/image/ab67616d0000b2735a750965d0ad3f11cac34628
38MFjDPIDJFfLF7IVpe1rv	0fA0VVWsXO9YnASrzqfmYu	Pursuit Of Happiness [Extended Steve Aoki Remix (Explicit)]	2012	https://i.scdn.co/image/ab67616d0000b273fe7908b7666690bf4e83ce14
2S8AWAM0nxyFy66YnUfIs3	0fA0VVWsXO9YnASrzqfmYu	Man On The Moon: The End Of Day (Deluxe)	2009	https://i.scdn.co/image/ab67616d0000b273a487deeecb334b6619489d74
64nbgEEIcY4g1ElVLONJ0w	0fA0VVWsXO9YnASrzqfmYu	Man On The Moon III: The Chosen	2020	https://i.scdn.co/image/ab67616d0000b2739bf7698a1737bc7c2e4a14f3
19ZYOtXGdqGpeeDS9SJccD	0fA0VVWsXO9YnASrzqfmYu	The Boy Who Flew To The Moon (Vol. 1)	2022	https://i.scdn.co/image/ab67616d0000b273ef3b5a279ee075749b67e0a7
08eM9GRdr5BCCHNqS3Wwud	0fA0VVWsXO9YnASrzqfmYu	Man On The Moon II: The Legend Of Mr. Rager	2010	https://i.scdn.co/image/ab67616d0000b27359e842b6a3566a141f27f815
6CL2rdgPpUEXwWsNjexAZ5	6ZK2nrW8aCTg8Bid7I7N10	Unknown Rooms: A Collection of Acoustic Songs	2012	https://i.scdn.co/image/ab67616d0000b273d8a8886714a9acb17f5e721d
1nnenAgIzIipcodyg879Vx	6ZK2nrW8aCTg8Bid7I7N10	Hiss Spun	2017	https://i.scdn.co/image/ab67616d0000b2735c0c56da48597a58cba6f7b5
4rpm9Ez8nfVsQvNmHDbgyp	6ZK2nrW8aCTg8Bid7I7N10	Pain Is Beauty	2013	https://i.scdn.co/image/ab67616d0000b2735af1139fdb81e5b88ae3fffd
0lfEFhkPJdimjfkEIjRfZg	0erhjm5MwzWpFRFuorXLT2	Sing More Songs Together...	2014	https://i.scdn.co/image/ab67616d0000b2733cf65808636c5ad4914a1c8d
3Lm4wFlCjymVuRKZ0Z6X94	6ZK2nrW8aCTg8Bid7I7N10	Anhedonia	2021	https://i.scdn.co/image/ab67616d0000b273afea2d268509f9bb20e62c08
6bpgmfwTWBLxT7VuS1phjL	6ZK2nrW8aCTg8Bid7I7N10	Birth of Violence	2019	https://i.scdn.co/image/ab67616d0000b273a351e05ddf1b29a412fa2c2b
7L7IKHnLWh6gIIYNDnZtQ8	6ZK2nrW8aCTg8Bid7I7N10	Oui Oui Marie (From the Original Motion Picture "X")	2022	https://i.scdn.co/image/ab67616d0000b273abef86e564bb02d46d52bd41
3nZHH9trTO9xrV1XrW18cW	6TVVIyd0fsRDGg6WzHKyTP	Private Space	2021	https://i.scdn.co/image/ab67616d0000b273de6c8eddb5cada637afaa082
3idaZ1PVAh5zF50jEipyEq	6TVVIyd0fsRDGg6WzHKyTP	Durand Jones & The Indications (Deluxe Edition)	2018	https://i.scdn.co/image/ab67616d0000b2730a9d33cac8fc6c3798c3ac70
7FU0CDJvPwKDWRXtHYcsoY	6TVVIyd0fsRDGg6WzHKyTP	American Love Call	2019	https://i.scdn.co/image/ab67616d0000b2738deec279b07d5a628aca1ea3
1X0ZHwPLIpROo8arjBErDY	6TVVIyd0fsRDGg6WzHKyTP	Cruisin to the Park	2019	https://i.scdn.co/image/ab67616d0000b27363459524ff99253e99fe1b56
6JaAs0LDI0AyrZhhx3kRJz	6tkrcmVfWoHC4WOhE7IDyq	Rage and Tragedy	2016	https://i.scdn.co/image/ab67616d0000b27328606c5f58772a765bec1a55
3xT7V16ZrX4TE7dWUQVesx	6tkrcmVfWoHC4WOhE7IDyq	Homeward Bound	2015	https://i.scdn.co/image/ab67616d0000b2737be0d1ede9bc0b4a1825e6e6
5hXIEmgAMoi1ZfFrRiq9Jj	6tkrcmVfWoHC4WOhE7IDyq	Weight of a Trigger	2019	https://i.scdn.co/image/ab67616d0000b273c6390546408244ea29c4ad31
09UCMpTfN3XjdOAaEVRrUE	6tkrcmVfWoHC4WOhE7IDyq	The Magnolia Sessions	2021	https://i.scdn.co/image/ab67616d0000b273484254f0f97926c860a4c487
1MGJxZLXW7eDKyAvQYQrqa	6tkrcmVfWoHC4WOhE7IDyq	Life's a Dog-Gone Shame	2013	https://i.scdn.co/image/ab67616d0000b2732433d8da6d969be1b9905f59
11vaCG8601u7A6ViFQIRXA	600GgDUq9kzGJgNIrVsWfz	Habibi	2014	https://i.scdn.co/image/ab67616d0000b27378ddf308ce526944842521c1
5mALDiU9ZL2klZNCrZPuwi	600GgDUq9kzGJgNIrVsWfz	Anywhere But Here	2020	https://i.scdn.co/image/ab67616d0000b2735cf204000680efb26cc32cd5
7n2zrl9YRGAFsHpgCoAhXQ	600GgDUq9kzGJgNIrVsWfz	Nice	2021	https://i.scdn.co/image/ab67616d0000b273228fc415a398049454e0b211
6XqM4NINcx3oc7NhOUKxXp	2jgPkn6LuUazBoBk6vvjh5	Odessey and Oracle	1968	https://i.scdn.co/image/ab67616d0000b2738b9b76a1f9a06cebe9c81b3c
1Sv2t548jDyfBDgvVzYJzw	2jgPkn6LuUazBoBk6vvjh5	Begin Here	1965	https://i.scdn.co/image/ab67616d0000b27399c8f1ba79887383aa27b92d
2ig7JTatcliu92WgxJKcxj	2jgPkn6LuUazBoBk6vvjh5	The Original Studio Recordings, Vol. 1	2007	https://i.scdn.co/image/ab67616d0000b273a484dbd51c21b990e2c94b93
76v4YlZ9Cbh984zti9Q8rp	2jgPkn6LuUazBoBk6vvjh5	The Original Studio Recordings, Vol. 3	2007	https://i.scdn.co/image/ab67616d0000b273396309d775500e52558919d6
5OlEEw6gIk32eMhOqRlfGu	74ASZWbe4lXaubB36ztrGX	Bob Dylan - 30th Anniversary Concert Celebration [(Deluxe Edition) [Remastered]]	1993	https://i.scdn.co/image/ab67616d0000b27383d8116743c8b818a18666c5
3LIMxY8oQG9c70DWKe0iHN	6v8FB84lnmJs434UJf2Mrm	Inherent Vice (Original Motion Picture Soundtrack)	2014	https://i.scdn.co/image/ab67616d0000b273b089402ed16680010d0131d4
31rLr6NpNw9wggFD4QGfhD	6v8FB84lnmJs434UJf2Mrm	Neil Young at Live Aid (Live at John F. Kennedy Stadium, 13th July 1985)	2018	https://i.scdn.co/image/ab67616d0000b2737bdf6ff52c0ef1366d741721
1AWbIu7wKGqsL7be4NlEyY	5M0lbkGluOPXLeFjApw8r8	Campfire (with DRAM & Neil Young) [From Bright: The Album]	2017	https://i.scdn.co/image/ab67616d0000b273526bfde28e823ee55229ae20
0zwNzImUq6DykNGghNGffs	6v8FB84lnmJs434UJf2Mrm	Greatest Classic Hits	2022	https://i.scdn.co/image/ab67616d0000b273506e7a2b8204c583e35c7267
15t7NAV9KXOtPo7HefS39H	6v8FB84lnmJs434UJf2Mrm	Live 8 (Live, July 2005)	2005	https://i.scdn.co/image/ab67616d0000b273df64c5a536d673d865b6d417
4ErXAsdor9LnNuLW4xyzRI	7nqSDaZKccpnUqjzedyZF4	Dead Tracks, Vol. 2	2019	https://i.scdn.co/image/ab67616d0000b273a1d62f9cc9a04c58f5470b8f
6r5e7Kryn9PUFiwofr19K0	3QTDHixorJelOLxoxcjqGx	Nothing Even Matters	2022	https://i.scdn.co/image/ab67616d0000b27302bb0c2402a6c95905572851
5zdFKRmlSDwAMZ5NFVGbx9	3QTDHixorJelOLxoxcjqGx	November	2018	https://i.scdn.co/image/ab67616d0000b2736892023452c99d13a58c7647
5zUDvKAyEKkrhYLWJJWGPQ	3QTDHixorJelOLxoxcjqGx	Chasing Summer	2019	https://i.scdn.co/image/ab67616d0000b273bbee5481e94a03f4fd26fac4
2rMvlXjrgjenPKNBK6ze0q	3QTDHixorJelOLxoxcjqGx	Satisfaction	2022	https://i.scdn.co/image/ab67616d0000b2732c3b34c1a8ec7bf920bcd097
6rdfmpRVrUn1B7Q8rSCHZj	3QTDHixorJelOLxoxcjqGx	Life Is Good (feat. Scribz Riley)	2022	https://i.scdn.co/image/ab67616d0000b2731eb2ec82ec94ded09faeef4a
1YbSlMGiAAaTfR9Kk9HNxk	0qu422H5MOoQxGjd4IzHbS	Mono No Aware	2017	https://i.scdn.co/image/ab67616d0000b2735eef4a5a0481a08f2cf993c3
0oMXn0MNLNyvB4iJPZXOuV	3rWZHrfrsPBxVy692yAIxF	<COPINGMECHANISM>	2022	https://i.scdn.co/image/ab67616d0000b2734979d551303fc09a92dc59e2
3A290H1hI6mUv3uxGDrLlr	0qu422H5MOoQxGjd4IzHbS	God Is a Circle	2022	https://i.scdn.co/image/ab67616d0000b2733fca270016babbe02dec8f27
1IpYZkYoYCjXTYMDEW8Ksk	0qu422H5MOoQxGjd4IzHbS	Safe In The Hands of Love	2018	https://i.scdn.co/image/ab67616d0000b273f5533d680fa116232aa10cbc
2julo3Z5rNzSod7DoEuTz7	0qu422H5MOoQxGjd4IzHbS	The Asymptotical World EP	2021	https://i.scdn.co/image/ab67616d0000b2733cb460f372c84a76dda0001d
2wqG59dVVQlJaxoO7N0LJt	3ycxRkcZ67ALN3GQJ57Vig	Lady Lady	2018	https://i.scdn.co/image/ab67616d0000b273f1814f1b76df2fa196e4f45e
1S0yIZRDiFmqCQyTIEV175	3ycxRkcZ67ALN3GQJ57Vig	Studying Abroad: Extended Stay	2020	https://i.scdn.co/image/ab67616d0000b273472da7a855e1446b36bcb83b
5DxMTCWwHlaz4Hx1og50xL	3ycxRkcZ67ALN3GQJ57Vig	Navajo	2017	https://i.scdn.co/image/ab67616d0000b27328f137f2d8bda3ddd5d045cf
3myUd2MqJKr3rfUrAf41Us	5Vuvs6Py2JRU7WiFDVsI7J	Good & Plenty (Remix)	2021	https://i.scdn.co/image/ab67616d0000b273f3b85f8964b3d2949cc24327
0jKDicrmgUCTSNGRYXffXm	3ycxRkcZ67ALN3GQJ57Vig	Say You Want Me	2022	https://i.scdn.co/image/ab67616d0000b2733c94dda877e3e932283f37a4
45IpQ6F0GYcas0yFGMzvac	3ycxRkcZ67ALN3GQJ57Vig	Flight 99	2019	https://i.scdn.co/image/ab67616d0000b273dc4ae7eec5647789fe3251a1
53FhNZMrcBim6Ec9mp8ifl	7E2ioKxoxI2J94tUkIx6As	Good & Plenty	2020	https://i.scdn.co/image/ab67616d0000b273d577928f641005ea1f9b44f5
6ROLwnmW9pOioLned0DaP3	0cGUm45nv7Z6M6qdXYQGTX	It Was Good Until It Wasn't	2020	https://i.scdn.co/image/ab67616d0000b2733ba8dc55c81f0aaf819057e9
4xkM0BwLM9H2IUcbYzpcBI	77SW9BnxLY8rJ0RciFqkHh	I Love You.	2013	https://i.scdn.co/image/ab67616d0000b2738265a736a1eb838ad5a0b921
18iFxjZugvKhuNNMbLjZJF	77SW9BnxLY8rJ0RciFqkHh	Wiped Out!	2015	https://i.scdn.co/image/ab67616d0000b2733066581d697fbdee4303d685
0ODLCdHBFVvKwJGeSfd1jy	77SW9BnxLY8rJ0RciFqkHh	Hard To Imagine The Neighbourhood Ever Changing	2018	https://i.scdn.co/image/ab67616d0000b2739b6ac98a52f62d5cb473da40
2JyArayVlT6t3MVWLLdSwZ	77SW9BnxLY8rJ0RciFqkHh	Chip Chrome & The Mono-Tones (Deluxe)	2020	https://i.scdn.co/image/ab67616d0000b2733552d3f419afe41cf9b0bd0a
6vdbDPGQbJMCHyZhz9z6GS	77SW9BnxLY8rJ0RciFqkHh	Daddy Issues (Remix) feat. Syd	2015	https://i.scdn.co/image/ab67616d0000b2738b6204ac018967b6388c703d
4uNgt1uQs6wZRm4giB3shX	77SW9BnxLY8rJ0RciFqkHh	Chip Chrome & The Mono-Tones	2020	https://i.scdn.co/image/ab67616d0000b2731a721f3757e5b67f87e1acd3
6wKzNT7iuR06KiXJBTpkuV	5NYEE4kgrEZPlM3DxUsTyc	Let's Have A Satanic Orgy	2022	https://i.scdn.co/image/ab67616d0000b273634878beff5b3292cebce48f
0lFpGD5pdC8Ofbs1MvS0Pg	5NYEE4kgrEZPlM3DxUsTyc	Satan's a Woman	2019	https://i.scdn.co/image/ab67616d0000b27308ac4e1fa693a7dd8d4059bb
5wopjMxpL3Bq6UE3oZ9Sun	5NYEE4kgrEZPlM3DxUsTyc	Twin Temple (Bring You Their Signature Sound.... Satanic Doo-Wop)	2018	https://i.scdn.co/image/ab67616d0000b273940793e30e3ce22bece5fea8
5KbpmB5vJUBpHKpy9j2AYa	5NYEE4kgrEZPlM3DxUsTyc	Twin Temple Summon the Sacred Whore... Babalon	2021	https://i.scdn.co/image/ab67616d0000b2733c8c08ab6d46453920d764c4
4fynbs9l2M5gcBvHMqYGfa	5NYEE4kgrEZPlM3DxUsTyc	I Am a Witch	2019	https://i.scdn.co/image/ab67616d0000b273c4f914f740b6b6fd3b0205d1
2gUufHW7CcgULEywXTQHk4	2pAajGWerK3ghwToNWFENS	Conditions Of My Parole	2011	https://i.scdn.co/image/ab67616d0000b273c63aeb02e90010db90f7dead
5dKl1Mg0MWV7m4Yhu76b9F	2pAajGWerK3ghwToNWFENS	C Is For (Please Insert Sophomoric Genitalia Reference Here)	2009	https://i.scdn.co/image/ab67616d0000b273143386236cdd8bfec16fbc19
6yDwA52kX9NSG21aNTWAuW	2pAajGWerK3ghwToNWFENS	V Is For Vagina (Deluxe)	2007	https://i.scdn.co/image/ab67616d0000b2733f55e66734c050f72b96250f
6MyJhSzVSOravLjL5hpFMk	2pAajGWerK3ghwToNWFENS	Money Shot	2015	https://i.scdn.co/image/ab67616d0000b273fb4f3561a4cd7f7aaef9ca7f
67tFctzjZBBPEU0E8QJwUp	2pAajGWerK3ghwToNWFENS	Sound Into Blood Into Wine	2010	https://i.scdn.co/image/ab67616d0000b273b4a494f199635fcc89ca4046
6SZJfUHQDgW9GVXr3mmQIT	2pAajGWerK3ghwToNWFENS	Donkey Punch The Night	2013	https://i.scdn.co/image/ab67616d0000b2731a090569b265995773d3d12f
64tP0vzCmjHKKJY3PnoLZM	2pAajGWerK3ghwToNWFENS	Don't Shoot The Messenger	2007	https://i.scdn.co/image/ab67616d0000b27386cb1c0cc5329165fc412dcd
4eYJzO460ZGaEFNJ4YCizR	2pAajGWerK3ghwToNWFENS	Existential Reckoning	2020	https://i.scdn.co/image/ab67616d0000b273ee7a2c484f036dad15aa9a27
0ORZb7kyr8aaP2LpL3mhuY	75dQReiBOHN37fQgWQrIAJ	Violet Street	2019	https://i.scdn.co/image/ab67616d0000b273daf19ee32be2d4917c266b09
2qiPY1CqHGexT4yWrQ5uX0	75dQReiBOHN37fQgWQrIAJ	Sunlit Youth	2016	https://i.scdn.co/image/ab67616d0000b2731b7b6f5cc146a35bfb545d82
4DZlJSUZnQUFMv4nW6Ijgv	75dQReiBOHN37fQgWQrIAJ	Dark Days [Feat. Sylvan Esso]	2020	https://i.scdn.co/image/ab67616d0000b273d37160b8c64ec946bc4377cc
5OWYHfYE5Pf06BEkSLPV2W	75dQReiBOHN37fQgWQrIAJ	I Saw You Close Your Eyes	2017	https://i.scdn.co/image/ab67616d0000b2734938af96a9ff8e8908ff2c03
6xfQHjndhrWjgENyEK0z7x	75dQReiBOHN37fQgWQrIAJ	Just Before The Morning	2022	https://i.scdn.co/image/ab67616d0000b2732c97d5f81245b803825e39e6
2cIpJDijNEoHv88jJKwDID	75dQReiBOHN37fQgWQrIAJ	Gorilla Manor	2010	https://i.scdn.co/image/ab67616d0000b2734203f138ac5fed176cfd6bf9
5M50Jray1eYGOW5gkTzUjT	75dQReiBOHN37fQgWQrIAJ	Desert Snow / Hourglass	2022	https://i.scdn.co/image/ab67616d0000b2732640490a2d392eca6f6790f1
1Zmq4tEgCSyTkud2ahysrq	75dQReiBOHN37fQgWQrIAJ	Hummingbird	2013	https://i.scdn.co/image/ab67616d0000b27312843952346aaa03f1f67970
2WedBViHbzk10PflnQhNOg	75dQReiBOHN37fQgWQrIAJ	Music From The Pen Gala 1983	2021	https://i.scdn.co/image/ab67616d0000b27337d7eeeb72ed2ae4430b670b
72qrnM4yUNMDDlWiqKc8iY	22bE4uQ6baNwSHPVcDxLCe	Aftermath	1966	https://i.scdn.co/image/ab67616d0000b273bad7062c3fd2f2d037989694
4l4u9e9jSbotSXNjYfOugy	22bE4uQ6baNwSHPVcDxLCe	Let It Bleed	1969	https://i.scdn.co/image/ab67616d0000b2732af30c881bb23cfb82a8cf99
15XNBzVWARPMlu0sEbfBjJ	22bE4uQ6baNwSHPVcDxLCe	Tattoo You (2009 Re-Mastered)	1981	https://i.scdn.co/image/ab67616d0000b27308fc42e575043a753f60d675
2Q5MwpTmtjscaS34mJFXQQ	22bE4uQ6baNwSHPVcDxLCe	Out Of Our Heads	1965	https://i.scdn.co/image/ab67616d0000b27305c5be85b64eaff732f7cb0b
6OHri5qNxwCdVSdyCslspd	22bE4uQ6baNwSHPVcDxLCe	Beggars Banquet (50th Anniversary Edition)	1968	https://i.scdn.co/image/ab67616d0000b27344934a06d21864415376f5f2
1Jv2AqzhgsduUik2p4k3cS	22bE4uQ6baNwSHPVcDxLCe	Some Girls	1978	https://i.scdn.co/image/ab67616d0000b27305c7aec05eabf142cc33b936
6iVOz2hudE6dv5Yrcsw2c9	22bE4uQ6baNwSHPVcDxLCe	Goats Head Soup (Remastered 2009)	1973	https://i.scdn.co/image/ab67616d0000b273fa3c4374e2cdd3cc1636c79b
29m6DinzdaD0OPqWKGyMdz	22bE4uQ6baNwSHPVcDxLCe	Sticky Fingers (Remastered)	1971	https://i.scdn.co/image/ab67616d0000b273a1d9c9969f2a7ed27e449a3c
7nXJ5k4XgRj5OLg9m8V3zc	5a2EaR3hamoenG9rDuVn8j	Purple Rain	1984	https://i.scdn.co/image/ab67616d0000b273d52bfb90ee8dfeda8378b99b
54DjkEN3wdCQgfCTZ9WjdB	5a2EaR3hamoenG9rDuVn8j	Parade - Music from the Motion Picture Under the Cherry Moon	1986	https://i.scdn.co/image/ab67616d0000b27323cc0f0a925845a3de4aca38
27SA4Pkelh2pbwbVEORPOM	5a2EaR3hamoenG9rDuVn8j	Around The World In A Day	1985	https://i.scdn.co/image/ab67616d0000b273cc6495584fb0e2261ee95868
34MHuXONazzgSxI0cThpAg	5a2EaR3hamoenG9rDuVn8j	1999	1982	https://i.scdn.co/image/ab67616d0000b273337c5517a9a62e0c3f17d59f
7JdnQ7zCfqETcLgS94d3ks	5a2EaR3hamoenG9rDuVn8j	The Gold Experience	1995	https://i.scdn.co/image/ab67616d0000b2736a4175046856b90a9b5d67a1
0j711DtV8bOSMZRCbphtPC	5a2EaR3hamoenG9rDuVn8j	Prince	1979	https://i.scdn.co/image/ab67616d0000b273d539ebc9ac4dc40946532580
2EHUlDJaTyvn0gAvVfUlcY	5a2EaR3hamoenG9rDuVn8j	1999 (Super Deluxe Edition)	2019	https://i.scdn.co/image/ab67616d0000b273d8c154a223634191c4ed18cf
5LEXck3kfixFaA3CqVE7bC	6Ghvu1VvMGScGpOUJBAHNH	White Pony	2000	https://i.scdn.co/image/ab67616d0000b2735c53799f473fa3e1a48c00ed
7o4UsmV37Sg5It2Eb7vHzu	6Ghvu1VvMGScGpOUJBAHNH	Around the Fur	1997	https://i.scdn.co/image/ab67616d0000b2730b1129853982ea17845d4eb6
1GjjBpY2iDwSQs5bykQI5e	6Ghvu1VvMGScGpOUJBAHNH	Diamond Eyes	2008	https://i.scdn.co/image/ab67616d0000b27372c2145d48f68917a7361b15
4ilqDlqD37nilewk9x8tyZ	6Ghvu1VvMGScGpOUJBAHNH	Saturday Night Wrist	2006	https://i.scdn.co/image/ab67616d0000b273c869fa3b4e0ce4dd9818a40e
4PIVdqvL1Rc7T7Vfsr8n8Q	6Ghvu1VvMGScGpOUJBAHNH	Koi No Yokan	2012	https://i.scdn.co/image/ab67616d0000b27373652b7a0dc388dd1d044b69
30YN03R4Bjl8Qwz8wPRoXG	6Ghvu1VvMGScGpOUJBAHNH	Adrenaline	1995	https://i.scdn.co/image/ab67616d0000b273e0aa988082afc4ea586ab8dc
2Y81I8p6wKD13rSgp9aujA	1KP6TWI40m7p3QBTU6u2xo	Electric Love (Oliver Remix)	2015	https://i.scdn.co/image/ab67616d0000b273019fa88b96471d5e0eba56ab
46Mmmgl5yZhchLWhEef7gA	1KP6TWI40m7p3QBTU6u2xo	Seeing Stars	2015	https://i.scdn.co/image/ab67616d0000b273920fd17f01ab138b47f0fcef
0mzh0tCNFhxE2mSWxB4ufh	1KP6TWI40m7p3QBTU6u2xo	Blue Madonna	2018	https://i.scdn.co/image/ab67616d0000b273200a3273cf1334821c4a9e48
3BEUHeIQ39AlivVvDkwzNW	4n0gvapwYbRpzU5Ov68B6P	Love You So	2007	https://i.scdn.co/image/ab67616d0000b273894ecdeeae5912f943df4fe2
7DP9LpHXZ4Ak560LIqDsFT	4n0gvapwYbRpzU5Ov68B6P	Invisible Girl	2009	https://i.scdn.co/image/ab67616d0000b27350b9c1c4fe0e22e5485f4557
1RCFd3FwvpOMk0PzShzN5A	4n0gvapwYbRpzU5Ov68B6P	Bad News Boys	2015	https://i.scdn.co/image/ab67616d0000b2731f235c82b6fca0de6e6fb38e
4NVwqWBq007KCMjfIPu3Bu	4n0gvapwYbRpzU5Ov68B6P	What's For Dinner?	2006	https://i.scdn.co/image/ab67616d0000b273f71222a62884b3f2e2e0b819
0UpIQtXECkZpGtBh0szbNT	4n0gvapwYbRpzU5Ov68B6P	Going Down	2022	https://i.scdn.co/image/ab67616d0000b2735d38c484f202e37e2cf13cbc
6Ap1PVkQ93MHggcPjQ0vuE	4n0gvapwYbRpzU5Ov68B6P	The King Khan & Bbq Show	2007	https://i.scdn.co/image/ab67616d0000b2734de083781ae198fce742457d
2xQ1WHVV0MdVSRkpND5P51	4uSftVc3FPWe6RJuMZNEe9	My Finest Work Yet	2019	https://i.scdn.co/image/ab67616d0000b27374ffdd29cc4898e8ed01d747
2NAQ55IP8e5YH9sasQDuCJ	4uSftVc3FPWe6RJuMZNEe9	I felt a Funeral, in my Brain [feat. Phoebe Bridgers]	2022	https://i.scdn.co/image/ab67616d0000b273b5cd05f9fdf9d19994d1b98a
6TqAnRWjGY3ztfajmS0HSG	4uSftVc3FPWe6RJuMZNEe9	Are You Serious	2016	https://i.scdn.co/image/ab67616d0000b273b06fec2ffbdb24faa70cb468
3Q5tb3gLGSe5JxeEEnTysE	4uSftVc3FPWe6RJuMZNEe9	Inside Problems	2022	https://i.scdn.co/image/ab67616d0000b273250e46be6e6d7ee577b772d0
1XBBNeT50E40fWKY5SOvb5	4uSftVc3FPWe6RJuMZNEe9	I Want to See Pulaski at Night	2013	https://i.scdn.co/image/ab67616d0000b273d5f86e2ed9a548e213030078
6mBVlPWGqKYGGTVsSxPWPW	4uSftVc3FPWe6RJuMZNEe9	Noble Beast	2008	https://i.scdn.co/image/ab67616d0000b27356544c5e3d1a8fe8c28dbb49
1k3MYSTe3zls106XkVRhuW	6AWdGez5g1jxpfl9XD4wI3	None Of The Clocks Work	2017	https://i.scdn.co/image/ab67616d0000b273c0cbb42913ff851a6bbe5af8
4wq7cDPGDhVcvg2vUsn4Wk	6AWdGez5g1jxpfl9XD4wI3	Won't Find Love in the Hills - EP	2016	https://i.scdn.co/image/ab67616d0000b273365cca11dced53b6b0a7ee66
0UMK3JacVsx29KjQuvBWcL	6AWdGez5g1jxpfl9XD4wI3	Can't Be A ____Here: Chapter 3	2018	https://i.scdn.co/image/ab67616d0000b27312ac3abce47210b43a890a2d
2VmrjWEPK3PZ4WOkz4v65p	6AWdGez5g1jxpfl9XD4wI3	Can't Be A ____Here: Chapter 2	2018	https://i.scdn.co/image/ab67616d0000b273684cd71e5374cbea0a6ba883
1jkGweRc6Ek8tqoBNW8snj	6AWdGez5g1jxpfl9XD4wI3	Happening in the Grey Area	2015	https://i.scdn.co/image/ab67616d0000b2733dd286c5a87898ef05e1b2fd
79bRQkpKURXEnggeLVVxFq	7HeVXdOdMhLslVputGTZFQ	Timber Timbre	2009	https://i.scdn.co/image/ab67616d0000b273e17997b5e006fa2a01de51e1
2U1BUKvsYIkUik7xEhAP0C	7HeVXdOdMhLslVputGTZFQ	Hot Dreams	2014	https://i.scdn.co/image/ab67616d0000b27323a8f42410bec13a9cca2a49
2tWkGlUTyWZcVsqryi8U1q	7HeVXdOdMhLslVputGTZFQ	Creep On Creepin' On	2011	https://i.scdn.co/image/ab67616d0000b273d4e5892341fbc81751662d3b
1peaWfJtqMtLmqKK79Cpxu	7HeVXdOdMhLslVputGTZFQ	Timber Timbre	2009	https://i.scdn.co/image/ab67616d0000b273491194f0fea2ddb08367e44d
49I6QGpLjGJYC9WlyMEPhG	7HeVXdOdMhLslVputGTZFQ	Sincerely, Future Pollution	2017	https://i.scdn.co/image/ab67616d0000b273f69a5e14a18f784fad63c42a
5xINyvUV0bHyJxBdFTT8xI	7HeVXdOdMhLslVputGTZFQ	Dissociation Tapes, Volume 1	2021	https://i.scdn.co/image/ab67616d0000b273ae460712b0eebc55493b83e6
4hTlbmXBvgkbvOmvKJFVP3	6CWTBjOJK75cTE8Xv8u1kj	Arts & Crafts: X	2013	https://i.scdn.co/image/ab67616d0000b273fe1358f9a10061d2e9c2ddef
7lWcFkeeWhnaEFJygxwvg9	7HeVXdOdMhLslVputGTZFQ	Medicinals	2007	https://i.scdn.co/image/ab67616d0000b273a4fd8e96a7237975d4996b66
7fJMKBNqYWhvWDs560x6nn	4AKwRarlmsUlLjIwt38NLw	Katchi (Ofenbach vs. Nick Waterhouse)	2017	https://i.scdn.co/image/ab67616d0000b273ea926e8fceb6e4f411144a8f
1gzWphTk6PqMZ5qWbVaBk4	0V7uVrIYr4FwFvUN9S4kYr	Never Twice	2016	https://i.scdn.co/image/ab67616d0000b273b4fa4bac571f63bece60990b
1NVwXCp6SlwgEnZ27QN1cP	0V7uVrIYr4FwFvUN9S4kYr	Holly	2014	https://i.scdn.co/image/ab67616d0000b273d69745b0b4a7409ace5c1cd1
1e1FoOAXam30VAJJb4q4Zk	0V7uVrIYr4FwFvUN9S4kYr	Nick Waterhouse	2019	https://i.scdn.co/image/ab67616d0000b27307c243516ee9c9b9bd85bef5
2ttSZFH721F5dC6fbZznTb	0V7uVrIYr4FwFvUN9S4kYr	Monterey	2022	https://i.scdn.co/image/ab67616d0000b273352e2331927207b86dce8271
0PHH7ZnpTBkek9iQtGNBno	0V7uVrIYr4FwFvUN9S4kYr	Promenade Blue	2021	https://i.scdn.co/image/ab67616d0000b273c7ec21eb68ca90d031b0d3db
2Dpw2XUAsBvuNdNLarNzz8	6hnWRPzGGKiapVX1UCdEAC	The Best of Sam Cooke	1962	https://i.scdn.co/image/ab67616d0000b273a931553dd32099aa87088ecf
2NFd4ApYFitFtJhGTSfDdP	6hnWRPzGGKiapVX1UCdEAC	Ain't That Good News	1964	https://i.scdn.co/image/ab67616d0000b2737329db55d8ec4e851b694aa1
406RCIvK6uh49XviqAI6kY	6hnWRPzGGKiapVX1UCdEAC	Twistin' the Night Away	1962	https://i.scdn.co/image/ab67616d0000b273b3d6f99b4783feeb98b2e7d6
1rEYwOdpVc2W39d0uxf0va	6hnWRPzGGKiapVX1UCdEAC	Mr. Soul	1963	https://i.scdn.co/image/ab67616d0000b2738f41b8c6db5b91d643cdfe99
0cvF6655OPZeLDYeU8UqL6	6hnWRPzGGKiapVX1UCdEAC	A Cupid's Valentine	2022	https://i.scdn.co/image/ab67616d0000b273e99527ff7b46db214c04b17c
40y4Rm3Oum1bQlzIxZpVPq	6hnWRPzGGKiapVX1UCdEAC	Swing Low	1961	https://i.scdn.co/image/ab67616d0000b27388cede5df025bd95e70dce21
1CbtBQqibzdxhmpiLD7vzN	2FRXiAz5Uz78LLLSwEUhLt	Hawaii: Part II	2012	https://i.scdn.co/image/ab67616d0000b2738fcbcb3e5252e5f98f515978
1ltMZOvl4Mcnl0J1eh1t7e	2FRXiAz5Uz78LLLSwEUhLt	Variations on a Cloud	2012	https://i.scdn.co/image/ab67616d0000b273379c20257bd57124d60e9e5e
1Sq6MrxVCTezf62YzsbzED	1fZpYWNWdL5Z3wrDtISFUH	And The War Came	2014	https://i.scdn.co/image/ab67616d0000b27338c6fbc6bc2eb2e68afb0f04
5JcW9l6CD3JJbn7DbJrrkh	1fZpYWNWdL5Z3wrDtISFUH	Ready or Not (feat. Sierra Ferrell)	2022	https://i.scdn.co/image/ab67616d0000b2733b7cd9af5b9f4b24bd9121bc
3JsZjfjVa95IMuZ50eX7BU	1fZpYWNWdL5Z3wrDtISFUH	Shakey Graves on Audiotree Live (2013)	2013	https://i.scdn.co/image/ab67616d0000b27323f53d45b6b71f48231ad2f0
3UHGDyigOGGTj4DyTanLxV	1M3BVQ36cqPQix8lQNCh4K	Busted Jukebox, Volume 1	2015	https://i.scdn.co/image/ab67616d0000b273821d5f21089911bce0d9447a
788jxnxEP2HC7pmIrBu8St	1fZpYWNWdL5Z3wrDtISFUH	A World So Full of Love	2019	https://i.scdn.co/image/ab67616d0000b273f00d5848bb0e3365b4687356
5ZetO1qY0okdczkZzAQEBL	1fZpYWNWdL5Z3wrDtISFUH	Shakey Graves And The Horse He Rode In On (Nobody's Fool and The Donor Blues EP)	2017	https://i.scdn.co/image/ab67616d0000b273633d4bb47d2bd9d993adeb2f
6gujv1pAaPxIvDbv1hYq18	1fZpYWNWdL5Z3wrDtISFUH	Roll The Bones X	2021	https://i.scdn.co/image/ab67616d0000b273bdcc2fadb88ecd11d47362fe
3hd8GiXOy4KUTxVDVUDT5F	7ITd48RbLVpUfheE7B86o2	The King Is Dead	2011	https://i.scdn.co/image/ab67616d0000b2731af6d89d7ccdb5d83fd7c2a8
4qvFBtRrwbSgoH3nyVlTCp	7ITd48RbLVpUfheE7B86o2	The Crane Wife	2006	https://i.scdn.co/image/ab67616d0000b2734c48d53016404efd3fd07ac8
51OgvNl5EtB6iNevPXxiCc	7ITd48RbLVpUfheE7B86o2	Castaways and Cutouts	2002	https://i.scdn.co/image/ab67616d0000b273243e90f4d1c5f3e3c2a52edf
1ofGOFzgt22AGMi9yQIOMq	7ITd48RbLVpUfheE7B86o2	Picaresque	2005	https://i.scdn.co/image/ab67616d0000b273b7c832cb2382b8d230d916cb
2aCFve5jvcVkJ9JFcNeHc6	7ITd48RbLVpUfheE7B86o2	I'll Be Your Girl	2018	https://i.scdn.co/image/ab67616d0000b2739300f050ab5463656bb051a5
4yngOTPwtS3iypFBwU5qqR	7ITd48RbLVpUfheE7B86o2	Hazards Of Love	2009	https://i.scdn.co/image/ab67616d0000b273c1cb94b71281ff93e9e24576
14eK347GdWO4mBBx78tsut	0EdvGhlC1FkGItLOWQzG4J	Sublime	1996	https://i.scdn.co/image/ab67616d0000b2738fc4b0dcfb9509553f195c85
02VqlfUtNMogzTh1lckGOF	0EdvGhlC1FkGItLOWQzG4J	Jah Won't Pay The Bills	1991	https://i.scdn.co/image/ab67616d0000b273e6f11f4c160143e5efb97651
0TGTGuc2vXv6ZECoAf52N0	1yAwtBaoHLEDWAnWR87hBT	Good News For People Who Love Bad News	2004	https://i.scdn.co/image/ab67616d0000b273cc68329bfbf34037df965dc1
2lXBCL76UL5PCPbfAqKBkz	1yAwtBaoHLEDWAnWR87hBT	We Were Dead Before The Ship Even Sank	2007	https://i.scdn.co/image/ab67616d0000b273ed8a70a92499e619895646e8
3PTktNuj2FItJr8afuiieo	1yAwtBaoHLEDWAnWR87hBT	This Is a Long Drive for Someone with Nothing to Think About	1996	https://i.scdn.co/image/ab67616d0000b273384c4e86d7001ca9f10808db
6iKqPv9C5oU29LR82N8lJf	1yAwtBaoHLEDWAnWR87hBT	Strangers to Ourselves	2015	https://i.scdn.co/image/ab67616d0000b273ec0240f3581605ecae347c76
5SbcupirEParczvqqyUPXL	1yAwtBaoHLEDWAnWR87hBT	The Moon & Antarctica	2000	https://i.scdn.co/image/ab67616d0000b2738f7128431367ce70f773651c
5mvHTVy1iUIkAflIufoOpj	1yAwtBaoHLEDWAnWR87hBT	The Lonesome Crowded West	1997	https://i.scdn.co/image/ab67616d0000b2736d36f5f881bb591a529e259b
1xwNW7Q1daqJ8LNgymY04y	6LufpoVlIYKQCu9Gjpk8B7	Naturally	2005	https://i.scdn.co/image/ab67616d0000b273525cfd0227c635cbf89bee9e
5AaBCtOPHVJMYcDyLgu5BD	6LufpoVlIYKQCu9Gjpk8B7	100 Days, 100 Nights	2007	https://i.scdn.co/image/ab67616d0000b2732281dd1f27e4a335a557ed0c
4FZCwaWGcFqd2CBiJUcHnx	6LufpoVlIYKQCu9Gjpk8B7	I Learned the Hard Way	2010	https://i.scdn.co/image/ab67616d0000b2737ea7d71ae1045d003b1a904c
6aihw9128hBziSMwsKncpT	6LufpoVlIYKQCu9Gjpk8B7	Midnight Rider	2016	https://i.scdn.co/image/ab67616d0000b27363ac87742c3c28ad72ca93f3
6HsAPYyRSAmzyNeBZJMC4q	6LufpoVlIYKQCu9Gjpk8B7	Give the People What They Want	2014	https://i.scdn.co/image/ab67616d0000b273af15a339ff5b15caad55dcaf
6dQ4PANge8QXfOywlHNd2J	6LufpoVlIYKQCu9Gjpk8B7	Soul of a Woman	2017	https://i.scdn.co/image/ab67616d0000b273111becf027b82fe1840a5e16
75614DWrksimeV4oXUhaYP	2kGBy2WHvF0VdZyqiVCkDT	Real Love Baby	2016	https://i.scdn.co/image/ab67616d0000b273ae421754a904f1a5178ebb33
2CXVonfqGwTQu8dgr2qkNS	2kGBy2WHvF0VdZyqiVCkDT	Fear Fun	2012	https://i.scdn.co/image/ab67616d0000b273d5a452acd98e9f820ba1d11c
3hL6ZIcwV6zUfqRiPLPBLJ	00FQb4jTyendYWaN8pK0wa	Buddy's Rendezvous	2022	https://i.scdn.co/image/ab67616d0000b273c210a1bace4b8731308775a9
2tfg6zi5pwuYeQ0IHYnOBz	2kGBy2WHvF0VdZyqiVCkDT	Chloë and the Next 20th Century	2022	https://i.scdn.co/image/ab67616d0000b273f3fbf687c0fa8a10140a8e2a
4vTEFCLgDEgKIQXTrsmS6F	2kGBy2WHvF0VdZyqiVCkDT	I Love You, Honeybear	2015	https://i.scdn.co/image/ab67616d0000b2731c483b9ccbabc97c8835fc94
4I5zzKYd2SKDgZ9DRf5LVk	0oSGxfWSnnOXhD2fKuz2Gy	"Heroes" (2017 Remaster)	1977	https://i.scdn.co/image/ab67616d0000b273204f41d52743c6a9efd62985
72mfhbEsMtXR6s7v9UhKe3	0oSGxfWSnnOXhD2fKuz2Gy	Diamond Dogs (2016 Remaster)	1974	https://i.scdn.co/image/ab67616d0000b273ad22c83a6e1567f8453c32b3
1ay9Z4R5ZYI2TY7WiDhNYQ	0oSGxfWSnnOXhD2fKuz2Gy	David Bowie (aka Space Oddity) [2015 Remaster]	1969	https://i.scdn.co/image/ab67616d0000b2733395f3e809dfbc2b1101d464
6fQElzBNTiEMGdIeY0hy5l	0oSGxfWSnnOXhD2fKuz2Gy	Hunky Dory (2015 Remaster)	1971	https://i.scdn.co/image/ab67616d0000b273e464904cc3fed2b40fc55120
4NwG11AsDJluT732lSjMrV	0oSGxfWSnnOXhD2fKuz2Gy	Let's Dance (2018 Remaster)	1983	https://i.scdn.co/image/ab67616d0000b273db0917ddd4139153bc1d1a1a
4Csoz10NhNJOrCTUoPBdUD	68kEuyFKyqrdQQLLsmiatm	Summertime '06	2015	https://i.scdn.co/image/ab67616d0000b27386f51d101637fd4dc59fc32a
09VyQ2zwUx0EBKTJNBUZv1	68kEuyFKyqrdQQLLsmiatm	Yo Love (From "Queen & Slim: The Soundtrack")	2019	https://i.scdn.co/image/ab67616d0000b273aac370232c213219c3c9d47c
2G549zeda2XNICgLmU0pNW	68kEuyFKyqrdQQLLsmiatm	RAMONA PARK BROKE MY HEART	2022	https://i.scdn.co/image/ab67616d0000b2739fd6f55c35811d79d01f94ef
2suR5CCbtL2Wq8ShFo8rFr	68kEuyFKyqrdQQLLsmiatm	Vince Staples	2021	https://i.scdn.co/image/ab67616d0000b273ab1b13e7ec3ada8d31cdae8b
6eQpKhYCtvD0TwXQVHsgC2	6qqNVTkY8uBg9cP3Jd7DAH	&burn (with Vince Staples)	2017	https://i.scdn.co/image/ab67616d0000b273f3425d012117543bf914c451
35s58BRTGAEWztPo9WqCIs	68kEuyFKyqrdQQLLsmiatm	Spider-Man: Into the Spider-Verse (Soundtrack From & Inspired by the Motion Picture)	2018	https://i.scdn.co/image/ab67616d0000b273e2e352d89826aef6dbd5ff8f
5h3WJG0aZjNOrayFu3MhCS	68kEuyFKyqrdQQLLsmiatm	Big Fish Theory	2017	https://i.scdn.co/image/ab67616d0000b2737ba7b4d23c717f3211717946
5D20ZzsNB377xbshIFP9Nb	1hzfo8twXdOegF3xireCYs	Sadnecessary	2014	https://i.scdn.co/image/ab67616d0000b273b5d4730e54f84c66c70fe60a
3anT3sq943fma4yCM5FhvG	1hzfo8twXdOegF3xireCYs	Trip Tape II	2022	https://i.scdn.co/image/ab67616d0000b2739e8a543b2c7aa388a088c2ca
707cK3j40hIquI15sOcYXP	1hzfo8twXdOegF3xireCYs	Trip Tape	2021	https://i.scdn.co/image/ab67616d0000b273cb3aad7083b27bd6c77d9ade
62rE0W1Vy1v48FTO9hxPzx	1hzfo8twXdOegF3xireCYs	Unknown Song	2022	https://i.scdn.co/image/ab67616d0000b273b4e93c36d290f43885578bfd
72YUTJrAuTuSHSVrgixbor	251UrhgNbMr15NLzQ2KyKq	Imaginary Man	2015	https://i.scdn.co/image/ab67616d0000b2733e896ecce01a0b06ee0d8576
26n1VRHY8iKUGgRneKSOud	251UrhgNbMr15NLzQ2KyKq	Feathers & Fishhooks	2012	https://i.scdn.co/image/ab67616d0000b273fa01f83dad686851dca15cd6
43sgLebubxZtXox2i0QiVA	251UrhgNbMr15NLzQ2KyKq	Wide Awake	2018	https://i.scdn.co/image/ab67616d0000b273d124e1bb796385194f659200
2JZRyLhDpddo6XUwtb2ZJA	251UrhgNbMr15NLzQ2KyKq	Ashkelon	2013	https://i.scdn.co/image/ab67616d0000b273d08744369ab8932e6d8f0732
3FoDNOhHqVS1c9mw6NJW3T	251UrhgNbMr15NLzQ2KyKq	Good Mmornin	2019	https://i.scdn.co/image/ab67616d0000b273be6394a3976b6cbba2bc731e
0GeWd0yUKXHbCXVag1mJvO	4DFhHyjvGYa9wxdHUjtDkc	Mer De Noms	2000	https://i.scdn.co/image/ab67616d0000b2732d73b494efcb99356f8c7b28
49K6hYDEr5M3GxIBBxlPf9	4DFhHyjvGYa9wxdHUjtDkc	Thirteenth Step	2003	https://i.scdn.co/image/ab67616d0000b2739fce7baa218063d99799ce52
2UAin9VEGxiZRfe9Q7SKg4	4DFhHyjvGYa9wxdHUjtDkc	eMOTIVe	2004	https://i.scdn.co/image/ab67616d0000b273b899c5d781cdb8bd0788b27f
7Et3bSTLLqdABO1qCxUplS	5IcR3N7QB1j6KBL8eImZ8m	Oxymoron (Deluxe)	2014	https://i.scdn.co/image/ab67616d0000b27336977e237a8f70ec6c990636
3UTp6spxkyTdvsmJDPfb7n	5IcR3N7QB1j6KBL8eImZ8m	CrasH Talk	2019	https://i.scdn.co/image/ab67616d0000b273f2149422121d1674c6f4c009
0YbpATCIng8Fz2JrfHmEf7	5IcR3N7QB1j6KBL8eImZ8m	Blank Face LP	2016	https://i.scdn.co/image/ab67616d0000b27325475181eb4622ed295f9485
1C1mvUxPYGzTqVpXu6vOLf	5IcR3N7QB1j6KBL8eImZ8m	Hands On The Wheel	2012	https://i.scdn.co/image/ab67616d0000b273629677af42887058e877b2a2
5mlCtfr6NLphHzAaXIuXz4	3D4qYDvoPn5cQxtBm4oseo	Catch For Us The Foxes	2004	https://i.scdn.co/image/ab67616d0000b2730c7a52516acf1393f6f75b2f
4yItCYzksCSiB8RcUsAdSg	3D4qYDvoPn5cQxtBm4oseo	Brother, Sister	2006	https://i.scdn.co/image/ab67616d0000b273c3834c0b6955a4e1f0c8dfca
1NAKevr9Io1J3isYJFtUiH	3D4qYDvoPn5cQxtBm4oseo	It's All Crazy! It's All False! It's All A Dream! It's Alright	2009	https://i.scdn.co/image/ab67616d0000b2735faec368c28e163e4b3b182d
0wFPFHvi467fdOlBKTVJRY	3D4qYDvoPn5cQxtBm4oseo	[Untitled]	2018	https://i.scdn.co/image/ab67616d0000b273ca3cdfa734203815440c4b6e
2rErxidCuRG9OAFv2WPMKA	3D4qYDvoPn5cQxtBm4oseo	A To B Life	2002	https://i.scdn.co/image/ab67616d0000b273263c29fea657bd3312b27cc2
7lFxuWjTe0JxXka9tjzGXm	3tJ9PkBOrG7hFkHeNM2tbw	A Música do Olodum	1992	https://i.scdn.co/image/ab67616d0000b273286a1a2e0d44ac6fdf749af0
0BGtZFqDInZuJJvJa8jChx	7dzq55YG3wjViqexDwiycQ	O Carnaval De Ivete Sangalo 2015 (Ao Vivo)	2014	https://i.scdn.co/image/ab67616d0000b273de391f09e5b5e66ac4bb383f
2hC2wtKkPe5Jdkx8g2IJPe	3qvcCP2J0fWi0m0uQDUf6r	SOFRENDO FEITO UM LOUCO (SUMMER VERSION)	2020	https://i.scdn.co/image/ab67616d0000b273f2d2314415d88d0176b5ef78
38e5jYSDDCkTEKFYy5IGss	0BHm7qbh3ENxvXzkQAG7MP	Tudum Remix	2021	https://i.scdn.co/image/ab67616d0000b273108bc1b5543cf74ae06d4367
5haiFJR9CxVYTS3MpZX1NQ	3tJ9PkBOrG7hFkHeNM2tbw	Edição especial para alguém muito especial	1998	https://i.scdn.co/image/ab67616d0000b273daa58d8e6b46db67c73df93c
4RPiOtWQymIOwQhazukSAu	3tJ9PkBOrG7hFkHeNM2tbw	Vale dos Reis: As Sete Portas da Energia	2012	https://i.scdn.co/image/ab67616d0000b273dbc810b6639541544adb1c33
7bY4SH61zQPK4bnffxu64P	3tJ9PkBOrG7hFkHeNM2tbw	O Movimento	1994	https://i.scdn.co/image/ab67616d0000b273e5e7aefe5111dd924e534894
4Pjo3KsaX35V2VHKER39T2	3tJ9PkBOrG7hFkHeNM2tbw	Dose dupla 2	1995	https://i.scdn.co/image/ab67616d0000b273437160af6a89a1689d0333d5
06Atso1IAfXUpWakHGZdjh	3tJ9PkBOrG7hFkHeNM2tbw	Carnaval Nostalgia	2016	https://i.scdn.co/image/ab67616d0000b2734d3f29b483ba2b253e7f4344
6KMdn9HDIqcBPaaok0K34K	2ApaG60P4r0yhBoDCGD8YG	Either/Or	1997	https://i.scdn.co/image/ab67616d0000b27336e934bdc6f83dd9d022389d
1zOxlHQGGV6EH7n4OIFTyh	2ApaG60P4r0yhBoDCGD8YG	XO	1998	https://i.scdn.co/image/ab67616d0000b273cdf1be0ff556d169eade4368
7DC0pE943VR5tAKIvQXHts	2ApaG60P4r0yhBoDCGD8YG	Figure 8	2000	https://i.scdn.co/image/ab67616d0000b273169a2393509223c26e4eedc5
60C4r1YwIxsliktUL6eXfw	2ApaG60P4r0yhBoDCGD8YG	Elliott Smith	1995	https://i.scdn.co/image/ab67616d0000b273b6e316ec3e07cb296cfa7263
3uLHeL4d8aILBRlfpWNPYM	2ApaG60P4r0yhBoDCGD8YG	XO (Deluxe Edition)	1998	https://i.scdn.co/image/ab67616d0000b273e35493a3ac213db02b3ec36e
1tiCHRx9AI11hfcLmkGEXT	20qISvAhX20dpIbOOzGK3q	Magic	2021	https://i.scdn.co/image/ab67616d0000b27390988beeecde0598e8fe5092
6cx4GVNs03Pu4ZczRnWiLd	4RnBFZRiMLRyZy0AzzTg2C	RTJ4	2020	https://i.scdn.co/image/ab67616d0000b2736494393bd8d0fc0d338af3d6
0RTHMVF27KRMHIGnF7iLru	4xRYI6VqpkE3UwrDrAZL8L	Vinyl Days	2022	https://i.scdn.co/image/ab67616d0000b273539aa9de441d386859c5d181
3YQRfcAxfqX4KJt4o0yCTm	6GEykX11lQqp92UVOQQCC7	Hip Hop 50: Vol. 1	2022	https://i.scdn.co/image/ab67616d0000b273baf09e7a651570156243bf75
0L9rBwT5kUeKlwg7HOqwUU	3s7WzrEs4FkNObqj4WyfQm	Long Live DJ Shay	2022	https://i.scdn.co/image/ab67616d0000b273287f3ce80f21b0d0eaeda5d5
5mi7FKaWE5CtcOjdyxScA7	165ZgPlLkK7bf5bDoFc6Sb	Chocolate Starfish And The Hot Dog Flavored Water	2000	https://i.scdn.co/image/ab67616d0000b2734a31b146c7cf07705d912efe
4mLRYZaEEXZn5Ze3gxqtsf	6GEykX11lQqp92UVOQQCC7	Headlines (feat. Westside Gunn, Conway & Benny)	2019	https://i.scdn.co/image/ab67616d0000b273da019b592a2e98188cea6875
2PXyfq0RX8BpA1NfOhnFaJ	6GEykX11lQqp92UVOQQCC7	Our Streets (feat. A$AP Ferg) (feat. A$AP Ferg)	2017	https://i.scdn.co/image/ab67616d0000b2739c8f80bb92d5a4289109a8df
6SFd0NeIrUfZoqCSjoFpe8	4nvFFLtv7ZqoTr83387uK4	A Giant Step	2014	https://i.scdn.co/image/ab67616d0000b273bfa3b54c5b632d077ad792c7
7EfgATnOllXJ96s4sSdzei	1anAI9P9iSzc9qzLv6AtHZ	Sure Sure	2018	https://i.scdn.co/image/ab67616d0000b273140791666d7a1b2c899ed946
31t6VcIOZ3WqsSH2F9Zcy0	1anAI9P9iSzc9qzLv6AtHZ	Spirit Mission	2022	https://i.scdn.co/image/ab67616d0000b2731f2af841a559bc01448905ef
25gXJ8YPQpkC9fUEF5Wxlt	1anAI9P9iSzc9qzLv6AtHZ	What's It Like?	2019	https://i.scdn.co/image/ab67616d0000b2733367807e50d5163ecc0ccb16
22rxIV4YCzp5LpFPDt95Kc	1anAI9P9iSzc9qzLv6AtHZ	Songs from 2014	2016	https://i.scdn.co/image/ab67616d0000b27384e7e4beb620014e8a71ed08
6cI1XoZsOhkyrCwtuI70CN	3yY2gUcIsjMr8hjo51PoJ8	The Smiths	1984	https://i.scdn.co/image/ab67616d0000b273a09b231129ab1cb1a6efc57f
1j57Q5ntVi7crpibb0h4sv	3yY2gUcIsjMr8hjo51PoJ8	Hatful of Hollow	1984	https://i.scdn.co/image/ab67616d0000b273786b44c75ebf915866523f5b
45StnugV9WQMQwk4rRoTy8	3yY2gUcIsjMr8hjo51PoJ8	Louder Than Bombs	1987	https://i.scdn.co/image/ab67616d0000b273ed3953f8af1f764a146b7583
3Yko2SxDk4hc6fncIBQlcM	2auiVi8sUZo17dLy1HwrTU	A Seat at the Table	2016	https://i.scdn.co/image/ab67616d0000b2731c4540d0ecafaa45305aa5a0
4WF4HvVT7VjGnVjxjoCR6w	2auiVi8sUZo17dLy1HwrTU	When I Get Home	2019	https://i.scdn.co/image/ab67616d0000b273b1150f77ae2fbf0d5b4715fc
6VCjvboIlNJ3N881Xja6ng	2auiVi8sUZo17dLy1HwrTU	Losing You	2012	https://i.scdn.co/image/ab67616d0000b2734c6a71f3fc50ec1fce3f8f28
50j4Wm1b9hLpSpPIA39Vp9	6zvul52xwTWzilBZl6BUbT	Surfer Rosa	1988	https://i.scdn.co/image/ab67616d0000b273626ad9bb7d5f84c59652b161
0DQyTVcDhK9wm0f6RaErWO	6zvul52xwTWzilBZl6BUbT	Doolittle	1989	https://i.scdn.co/image/ab67616d0000b273cafe9404f872e4c0e91a8cc8
5F9YYEKDxenkRpyuovdqZe	6zvul52xwTWzilBZl6BUbT	Head Carrier	2016	https://i.scdn.co/image/ab67616d0000b273e420e17950e1432fa2aea4d1
1EzLdeSngJNnzM94BHBtK2	6zvul52xwTWzilBZl6BUbT	Velouria	1990	https://i.scdn.co/image/ab67616d0000b273f7dd685b5f8e4fa01d22d7b8
0BK1LxNNcaNUtAqTBQAOR8	6zvul52xwTWzilBZl6BUbT	Bossanova	1990	https://i.scdn.co/image/ab67616d0000b273344db70acb6e01f66fc9b3df
3a7wlGYi97AWoOBZxgjp77	1nGqKVGfPPiVgxMdx8hYOI	Don't All Look Up At Once	2013	https://i.scdn.co/image/ab67616d0000b273c9ff850c99c602b5491115ee
51BUgK2KdAD7Jtm4nIbKdO	1nGqKVGfPPiVgxMdx8hYOI	This Way to Oblivion	2020	https://i.scdn.co/image/ab67616d0000b2732d6ff637b5ebbf106fdb367b
17udU4Qibj6l4h0HWNd0EO	1nGqKVGfPPiVgxMdx8hYOI	Farewell Griffin	2017	https://i.scdn.co/image/ab67616d0000b2738bdddf11bcd58e7396be0dd5
51kJncbEEq7mLs3J8C2dII	1nGqKVGfPPiVgxMdx8hYOI	his first and last sounds	2022	https://i.scdn.co/image/ab67616d0000b2732df5310c55777fb1e8ac2331
6ZsUkdYEqcFuVVfqsnPLSK	1nGqKVGfPPiVgxMdx8hYOI	Ezra Bell	2018	https://i.scdn.co/image/ab67616d0000b2734f095ff02b2a1bb8fd70b26b
0u0CJa9zwFbGSU8JWQYS5G	432R46LaYsJZV2Gmc4jUV5	Love Will Tear Us Apart	1980	https://i.scdn.co/image/ab67616d0000b2731e0fdc2906851e29d09320c3
33qkK1brpt6t8unIpeM2Oy	432R46LaYsJZV2Gmc4jUV5	Unknown Pleasures (Collector's Edition)	1979	https://i.scdn.co/image/ab67616d0000b27316eb1e685e6bd37ab3228de6
51BKPr5L8cGZGk9bl9Jf5L	432R46LaYsJZV2Gmc4jUV5	Transmission	1979	https://i.scdn.co/image/ab67616d0000b273c5d8dac0b019953e2e00151e
2KPhpTUihx9KRWRwBtpTeJ	432R46LaYsJZV2Gmc4jUV5	Substance	2010	https://i.scdn.co/image/ab67616d0000b273a1d7fb161ce10fbd09b08183
5bXAysvuhQbyWllgYuahwt	432R46LaYsJZV2Gmc4jUV5	Atmosphere	1980	https://i.scdn.co/image/ab67616d0000b27374d7ecc4658fe88970feaa7a
0X9oLn2APMvGOIsogM1TSp	1PryMSya1JnSAlcwYawCxp	The Exciting Sounds of Menahan Street Band	2021	https://i.scdn.co/image/ab67616d0000b2733caa41a592b491dda9b9a817
54XBNTrXWfYgYhPbWVRLpX	1PryMSya1JnSAlcwYawCxp	There's a New Day Coming / Tommy Don't	2019	https://i.scdn.co/image/ab67616d0000b2731ae13baf1f76a2fc91f501c0
6wdxaAC6P7f6w05QadHFcB	1PryMSya1JnSAlcwYawCxp	Make the Road By Walking	2008	https://i.scdn.co/image/ab67616d0000b273eebefe17779f3c57284e3c35
1MY3VMNUb73QNJhZB92uGB	1PryMSya1JnSAlcwYawCxp	The Crossing	2012	https://i.scdn.co/image/ab67616d0000b273acc8a2d86203636c7899a7a7
02j4VRhJ7MKK0Jf3FtBBsD	2bToe6WyGvADJftreuXh2K	Special Night	2016	https://i.scdn.co/image/ab67616d0000b273918cd232ff0ae6b148bd48f3
7ElHdWPD6YbkbltJQgCiDc	2bToe6WyGvADJftreuXh2K	My World	2009	https://i.scdn.co/image/ab67616d0000b2735c3ca0a711ccc10f37950046
6sPPhqjKQHveRVqR6Ijf8s	2bToe6WyGvADJftreuXh2K	It Rains Love	2019	https://i.scdn.co/image/ab67616d0000b273eeb714dd5f7e70889154b586
1mtrVXhx0JBuv53GqqJbiG	2bToe6WyGvADJftreuXh2K	Faithful Man (Instrumentals)	2012	https://i.scdn.co/image/ab67616d0000b27389fae2760a5cfc1a2a289df8
2uKHclIQ4IphYCgJyKfSCe	2bToe6WyGvADJftreuXh2K	Big Crown Vaults Vol. 1 - Lee Fields & The Expressions	2020	https://i.scdn.co/image/ab67616d0000b273040c25691559f0c6c70c65fa
3u38Zm1pGlCrGZSsUk2396	2bToe6WyGvADJftreuXh2K	Emma Jean	2014	https://i.scdn.co/image/ab67616d0000b2732789845d006a9fcaf36dc644
6FCzvataOZh68j8OKzOt9a	3RGLhK1IP9jnYFH4BRFJBS	London Calling (Remastered)	1979	https://i.scdn.co/image/ab67616d0000b273cd9d8bc9ef04014b6e90e182
26zldGZFvob9Lj0kXZ6v7u	3RGLhK1IP9jnYFH4BRFJBS	The Cost of Living - EP	2013	https://i.scdn.co/image/ab67616d0000b2733f0dae4c4a881a0ebb714920
49kzgMsxHU5CTeb2XmFHjo	3RGLhK1IP9jnYFH4BRFJBS	The Clash (Remastered)	1977	https://i.scdn.co/image/ab67616d0000b27346db502388d44edb43ebb261
7iTm9yZznLHb1GBOVm5IB1	7FKTg75ADVMZgY3P9ZMRtH	Citrona	2018	https://i.scdn.co/image/ab67616d0000b27335cedd0fe1bd17882886d400
1gu4P2JcclHD1BvDXx2pqq	7FKTg75ADVMZgY3P9ZMRtH	Shadowglow	2022	https://i.scdn.co/image/ab67616d0000b27375bd963206d2c22841553e38
6uGsmECvPd2VoQI5OfnSPL	7FKTg75ADVMZgY3P9ZMRtH	August (Acoustic)	2019	https://i.scdn.co/image/ab67616d0000b2735b674842e8fbd342df2e2cb4
6tM8YvhhXemdO5xjsmS8Ro	7FKTg75ADVMZgY3P9ZMRtH	Heavy Colors	2017	https://i.scdn.co/image/ab67616d0000b2733d79d99049ec6b41c59ad5a1
3GSahG4letshmP6jWif5rh	7FKTg75ADVMZgY3P9ZMRtH	Churches	2018	https://i.scdn.co/image/ab67616d0000b2730931bcd45fbb95dcd3c9c2a8
4cZhiGqIqqqlHxWOC9r7Jp	7FKTg75ADVMZgY3P9ZMRtH	Something You Needed	2020	https://i.scdn.co/image/ab67616d0000b273553697592a70a6a963ab9fa3
7gPql7GFpBMOxeO80vMMsC	7bu3H8JO7d0UbMoVzbo70s	Three Imaginary Boys (Deluxe Edition)	1979	https://i.scdn.co/image/ab67616d0000b2735d0d65102be8606e439e54cc
3x1CmNdXWU0DzpTZXFFRZu	7bu3H8JO7d0UbMoVzbo70s	Wish	1992	https://i.scdn.co/image/ab67616d0000b273e410fa31e3dfcc7521cde86d
37Q22g0n9PzBLX6lNddrIa	7bu3H8JO7d0UbMoVzbo70s	Kiss Me, Kiss Me, Kiss Me	1987	https://i.scdn.co/image/ab67616d0000b2737f22337546d61faca55e0f4f
6HhpmJekzDCRu2K64ZbWqw	7bu3H8JO7d0UbMoVzbo70s	The Head on the Door	1985	https://i.scdn.co/image/ab67616d0000b2731b54add5c2a3a337e512941b
4Uq47onfCEj5en94jpHovk	7bu3H8JO7d0UbMoVzbo70s	The Head on the Door (Deluxed Edition)	1985	https://i.scdn.co/image/ab67616d0000b27396e854c582f5213d51793cc2
6vQB3ZBxnQPP3jQcGV2qzg	7bu3H8JO7d0UbMoVzbo70s	Disintegration (Deluxe Edition)	1989	https://i.scdn.co/image/ab67616d0000b273c7ca2db25ad377e022bc3975
1T7A6Dt7KktX7pOw4I4Jzj	7bu3H8JO7d0UbMoVzbo70s	Seventeen Seconds (Deluxe Edition)	1980	https://i.scdn.co/image/ab67616d0000b27399027d2948260fdb37436d5d
6fFTxlpJPGQbO3CbVz9MOS	7bu3H8JO7d0UbMoVzbo70s	Japanese Whispers	1983	https://i.scdn.co/image/ab67616d0000b27354cff06df14254eb6ea2dacb
7nqQxq17r4eUTqsDAdrL6v	0oL26Dn9y761yfJgNb3vfu	Misery	2019	https://i.scdn.co/image/ab67616d0000b273079f0dfcc05d7cd097a2b73a
2ZwK8x38X6dRgBTZNSACVU	0oL26Dn9y761yfJgNb3vfu	Let Down	2020	https://i.scdn.co/image/ab67616d0000b27364311e10169adb0beaa6af96
3LuBghNdV7Z1WSiN53P9OI	0oL26Dn9y761yfJgNb3vfu	Nineties	2016	https://i.scdn.co/image/ab67616d0000b2735a98cee63a9f3cd6e858473d
20k8V0vHdLxnkTaJjXGcFE	0oL26Dn9y761yfJgNb3vfu	The Other Way	2022	https://i.scdn.co/image/ab67616d0000b2731fbbbd14385e99c7d7e80275
67DyTWAldohmwTvFvJCJpQ	0oL26Dn9y761yfJgNb3vfu	Midland	2018	https://i.scdn.co/image/ab67616d0000b273a9a88c392c85282d39e64fde
3akwfKkhkypQRsK18KURaA	0oL26Dn9y761yfJgNb3vfu	Everything Will Be Ok Eventually	2021	https://i.scdn.co/image/ab67616d0000b2737abac2f82e3fe9ab600c4c46
2p70Xer2HAT9Ro0qiBVHOc	0oL26Dn9y761yfJgNb3vfu	Stay Out Of It	2022	https://i.scdn.co/image/ab67616d0000b273886e6904fcd9c7df27f97f6b
1fOUybYJNec1lhpwWIln83	0oL26Dn9y761yfJgNb3vfu	Anniversary II	2021	https://i.scdn.co/image/ab67616d0000b273873ab76befb072412a8e21a8
0vgdTFqVOzRDO2r9JXACsZ	0oL26Dn9y761yfJgNb3vfu	Where Do We Go From Here	2019	https://i.scdn.co/image/ab67616d0000b273ac1bcd0d55ee38738e8a411c
7a00isM0AXaDU9VFb7MOfA	0MVp3LuNho9Hk6Q1owsWwt	The Eventually Home	2008	https://i.scdn.co/image/ab67616d0000b2734f8f8eff961c4a030d57da50
7iu0ZqtMGYifxPNnL9h7UX	0MVp3LuNho9Hk6Q1owsWwt	The Bitter End	2007	https://i.scdn.co/image/ab67616d0000b273d54295b01a5be27503e8c7d9
6mCotg8AmjUM3ViiEyoeew	0MVp3LuNho9Hk6Q1owsWwt	The Church of the Good Thief	2012	https://i.scdn.co/image/ab67616d0000b27304fb43d06749a259a49a4be1
08G3mGQXuHItbbsFAz50gJ	1SQRv42e4PjEYfPhS0Tk9E	Kinks (Deluxe)	1964	https://i.scdn.co/image/ab67616d0000b273ca00601a3a6563bf2fc9c1f0
70kpGi2o0I7NY4DfwIN2p0	1SQRv42e4PjEYfPhS0Tk9E	Lola Versus Powerman and the Moneygoround, Pt. 1	1970	https://i.scdn.co/image/ab67616d0000b273ab278571ff1714d21f9440f3
6nkmtyFpZHm7piIFJgsxxa	1SQRv42e4PjEYfPhS0Tk9E	Face to Face (Deluxe)	1966	https://i.scdn.co/image/ab67616d0000b273f79fb85f81d4cab9a391e2ab
5ktMgVAJtsv4HagfFliWpR	1SQRv42e4PjEYfPhS0Tk9E	Something Else (Deluxe)	1967	https://i.scdn.co/image/ab67616d0000b2734eb2ec59c0f3292cb6b588d4
73anEcke1iGiFLxWhXnco8	1SQRv42e4PjEYfPhS0Tk9E	Kinda Kinks (Deluxe)	1965	https://i.scdn.co/image/ab67616d0000b27340bd422af0ccd5c38fc67a49
1WprYNkzlwjeBzByXIZARq	1SQRv42e4PjEYfPhS0Tk9E	One for the Road (Live)	1980	https://i.scdn.co/image/ab67616d0000b273f05dcfe54ef2928a4e2e744d
3sccYVndePjnjJHpfVsOoU	1SQRv42e4PjEYfPhS0Tk9E	Everybody's in Show-Biz (Super Deluxe)	1972	https://i.scdn.co/image/ab67616d0000b273e616896604a520a2ef9c58f9
7aKN7yS7Z9mDtPioRPmcqX	1SQRv42e4PjEYfPhS0Tk9E	State of Confusion	1983	https://i.scdn.co/image/ab67616d0000b273350b8393f8f3e33ea1b6137b
4Pv7m8D82A1Xun7xNCKZjJ	2FXC3k01G6Gw61bmprjgqS	Hozier (Expanded Edition)	2014	https://i.scdn.co/image/ab67616d0000b2734ca68d59a4a29c856a4a39c2
27rVuwJ0g0eKRpnvEhQl3G	0xRXCcSX89eobfrshSVdyu	Tell It To My Heart	2021	https://i.scdn.co/image/ab67616d0000b273a97f3fad25245a1453b1b3b2
5aO7IZl8KxtyCeke37Jvk4	2FXC3k01G6Gw61bmprjgqS	Swan Upon Leda	2022	https://i.scdn.co/image/ab67616d0000b273b53427fe60e7ae869ba9b1a1
6HzebUNgGlzC1AMBwHGIkH	6WY7D3jk8zTrHtmkqqo5GI	The Bones (with Hozier)	2019	https://i.scdn.co/image/ab67616d0000b27323a1cd02bc99c6e8ad9ed0df
2c7gFThUYyo2t6ogAgIYNw	2FXC3k01G6Gw61bmprjgqS	Wasteland, Baby!	2019	https://i.scdn.co/image/ab67616d0000b2735795e01c151ba5a8ce4bd295
2IpHSccHdJGTncaiuSKBjI	0v6gOfGBclTSGu6agfXb23	Drain The Blood	2010	https://i.scdn.co/image/ab67616d0000b2731e22641f1a5ca545e3889481
5X27E81cePL9bNER4QEjmO	0v6gOfGBclTSGu6agfXb23	Hometowns	2009	https://i.scdn.co/image/ab67616d0000b273c9b282dc2d2b3cc1ff55d67b
0yuaRX2zpvhm3lq6cppVRI	0v6gOfGBclTSGu6agfXb23	The Wild	2017	https://i.scdn.co/image/ab67616d0000b2739b08c20687b7f37c9f1e7cbf
4txZYOVE0XqRYVzvcMGXdK	0v6gOfGBclTSGu6agfXb23	Departing	2011	https://i.scdn.co/image/ab67616d0000b2739a899c5d3609eea802d56253
6iHuSGy6pq4tNGFV3ZVPtl	0yNLKJebCb8Aueb54LYya3	Substance	1987	https://i.scdn.co/image/ab67616d0000b273847620cdf72cd76743159265
2ODAEaYlqS88SU4ZZu1bI6	0yNLKJebCb8Aueb54LYya3	Singles (2016 Remaster)	2005	https://i.scdn.co/image/ab67616d0000b273f142205e336ec0af3e1a4eb0
0PSWY4XyjTWppfBb0tBtqu	0yNLKJebCb8Aueb54LYya3	Brotherhood (Collector's Edition)	1986	https://i.scdn.co/image/ab67616d0000b273530a2c5dd17d2ddf8edc2978
6NTrwu1XJ56jBPx7HMksbZ	0yNLKJebCb8Aueb54LYya3	Power Corruption and Lies	1983	https://i.scdn.co/image/ab67616d0000b273a0bb93884823982d57cb2004
2DI73ocB6x1ExxoJbT4QI8	0yNLKJebCb8Aueb54LYya3	Movement	1981	https://i.scdn.co/image/ab67616d0000b2733799b162f6b365f781b07515
7mIOgbore2HTzdh2ZyS4rH	0yNLKJebCb8Aueb54LYya3	Republic	1993	https://i.scdn.co/image/ab67616d0000b2738120870086c90b8de2309ef0
4jPnb0rdxEawWMlO8RfzJP	1Tp7C6LzxZe9Mix6rn4zbI	Wilderado	2021	https://i.scdn.co/image/ab67616d0000b2735e445f9349b6ddc2cfea65bb
62C9L1UCLOvvlu7Jb2FRRE	1Tp7C6LzxZe9Mix6rn4zbI	Latigo EP	2017	https://i.scdn.co/image/ab67616d0000b2735c4db02f033002ce161dc0d5
02ib3HsTaZRxvPnSV3w4vC	1Tp7C6LzxZe9Mix6rn4zbI	Surefire (Piano)	2020	https://i.scdn.co/image/ab67616d0000b2736267136b31b622f9d58d15ae
02ikKnPQUJEz3pJ80yTnKS	2oqwwcM17wrP9hBD25zKSR	EP	2016	https://i.scdn.co/image/ab67616d0000b273d20f1ce118b8c2bc2a3be4ca
7BKGTpCWDwTCeHnlLFcfLJ	2oqwwcM17wrP9hBD25zKSR	Lewis Del Mar	2016	https://i.scdn.co/image/ab67616d0000b27311555ed45c4377e101d7979d
0f6br7CLoGXr5WhM4ZS23K	2oqwwcM17wrP9hBD25zKSR	AUGUST	2020	https://i.scdn.co/image/ab67616d0000b273323b486defbe382273719626
0Z1Y5L90NjqUD351YUQWdA	4BFMTELQyWJU1SwqcXMBm3	The Stooges	1969	https://i.scdn.co/image/ab67616d0000b273002d4aa00a80e1be587cef7e
6mxbG8KrOTZIxlP4gzaliM	4BFMTELQyWJU1SwqcXMBm3	Raw Power	1973	https://i.scdn.co/image/ab67616d0000b2738bced1064027c32db4b01f6e
2jIzYmu0kYyj2NeO9p5Sx5	4BFMTELQyWJU1SwqcXMBm3	Heavy Liquid 'The Album'	2017	https://i.scdn.co/image/ab67616d0000b273c7b636d481ce3ce4dba51690
3FTcomSFg2zWSqWLRgBYpv	4BFMTELQyWJU1SwqcXMBm3	Fun House (Deluxe Edition)	1970	https://i.scdn.co/image/ab67616d0000b27313aa419336db598eb2674b1a
6vHqopioDuXtXTDoJhQZls	4BFMTELQyWJU1SwqcXMBm3	Raw Power (Legacy Edition)	1973	https://i.scdn.co/image/ab67616d0000b27392f5a11ecdc254e9169cf1ca
5S38cTeAWT2aqlArzdWbuc	4BFMTELQyWJU1SwqcXMBm3	The Weirdness	2007	https://i.scdn.co/image/ab67616d0000b273a1734be2bdf36e58b58df7b2
5qhXaVIC5BdE4a5Kq1FMZG	4BFMTELQyWJU1SwqcXMBm3	Funhouse	1970	https://i.scdn.co/image/ab67616d0000b2732c7d41ae194ef7aaaba3fee3
4zDxvE6VjZfELyXA13kLmn	7foyQbi7GKriLiv1GPVEwt	Time in the Sun	2021	https://i.scdn.co/image/ab67616d0000b273b8fd5833ff07658d59009851
7waoPlopLlOLdZnY6PkW5S	7foyQbi7GKriLiv1GPVEwt	Susto	2014	https://i.scdn.co/image/ab67616d0000b2739effb26dd0d5a22d400067a0
5BMjWYvNyJDfdW5Gzfyc21	7foyQbi7GKriLiv1GPVEwt	& I'm Fine Today	2017	https://i.scdn.co/image/ab67616d0000b2734b20d20b18fbabdb699a7aba
07Lss95oyQ0H0UP5i87G0A	7foyQbi7GKriLiv1GPVEwt	Ever Since I Lost My Mind	2019	https://i.scdn.co/image/ab67616d0000b2734155a6e6c0029afae4cb5b36
752tNJJGYbjlnFfSZBO9ju	7foyQbi7GKriLiv1GPVEwt	Weather Balloons [Feat. Frances Cone]	2019	https://i.scdn.co/image/ab67616d0000b2736354c8293366d9cd0d71335f
0Ojio25IPzIrw1rUmgrhrG	0rpMdBzQXf7aYRnu5fDBJy	Violent Femmes	1983	https://i.scdn.co/image/ab67616d0000b27354096a7f898de0233d76f626
1P29pi4JtRPZfpMPnEhCLS	0rpMdBzQXf7aYRnu5fDBJy	Why Do Birds Sing?	1991	https://i.scdn.co/image/ab67616d0000b2732e9a7873e05ab5d2ccf8ed29
69BYin03rGTRdyDChYBxfr	0rpMdBzQXf7aYRnu5fDBJy	Permanent Record: The Very Best Of The Violent Femmes	2005	https://i.scdn.co/image/ab67616d0000b2739a2825f07be644ff8bced40a
2nb3J8l5RKHOU3R4oTQP9u	0rpMdBzQXf7aYRnu5fDBJy	Hallowed Ground	1984	https://i.scdn.co/image/ab67616d0000b273cce256033cf7efe78a7f6cbe
5eqcF7pWzHgWpGdEmHgeSN	2x9SpqnPi8rlE9pjHBwmSC	Talking Heads '77 (Deluxe Version)	1977	https://i.scdn.co/image/ab67616d0000b273e71708b667804f6241dd1a59
4sLCQxMRfn3gAHrBNZtbTH	2x9SpqnPi8rlE9pjHBwmSC	Speaking in Tongues (Deluxe Version)	1983	https://i.scdn.co/image/ab67616d0000b273e35e2e2a4bfa8a30a78fc532
3AQgdwMNCiN7awXch5fAaG	2x9SpqnPi8rlE9pjHBwmSC	Remain in Light (Deluxe Version)	1980	https://i.scdn.co/image/ab67616d0000b273e56fa8c916dc6ce419dcf557
1invpprZoPxP2H3CfGgSfJ	2x9SpqnPi8rlE9pjHBwmSC	Burning Down the House / I Get Wild / Wild Gravity	1983	https://i.scdn.co/image/ab67616d0000b273ee320a29df2f19c3d900b83d
7IMqoztesjFDgyeibke8Jz	2x9SpqnPi8rlE9pjHBwmSC	Little Creatures	1985	https://i.scdn.co/image/ab67616d0000b273ffc1aa3a9e2d29a2d940ae31
5dVZpNJraoqCo3BssinMoo	2x9SpqnPi8rlE9pjHBwmSC	Fear of Music (Deluxe Version)	1979	https://i.scdn.co/image/ab67616d0000b2738365f74aa622b1b86962c8dd
01RJdKvXyz515O37itqMIJ	2x9SpqnPi8rlE9pjHBwmSC	More Songs About Buildings and Food (Deluxe Version)	1978	https://i.scdn.co/image/ab67616d0000b273b7307213fae24e3fbcbe46aa
1JvXxLsm0PxlGH4LXzqMGq	2x9SpqnPi8rlE9pjHBwmSC	Remain in Light	1980	https://i.scdn.co/image/ab67616d0000b273f9e2d82b9969defab2105859
4EK8gtQfdVsmDTji7gBFlz	26T3LtbuGT1Fu9m0eRq5X3	Melophobia	2013	https://i.scdn.co/image/ab67616d0000b273fb1cb900d28642e668d77b12
7H814Cg8HV0qpoMheYbhNn	26T3LtbuGT1Fu9m0eRq5X3	Cage The Elephant (Expanded Edition)	2009	https://i.scdn.co/image/ab67616d0000b273e4800c920780ac18d4ab6730
0nW0w37lrQ87k7PLZvC4qJ	26T3LtbuGT1Fu9m0eRq5X3	Tell Me I'm Pretty	2015	https://i.scdn.co/image/ab67616d0000b273e7dd69ac32cf313fde62cbad
2VuZJsJBPLwg9BeQFQle8G	26T3LtbuGT1Fu9m0eRq5X3	Social Cues	2019	https://i.scdn.co/image/ab67616d0000b27388883701231713b18429f80b
5XmhHMj5LZLWo32aA6ntKE	4LG4Bs1Gadht7TCrMytQUO	Oh, Inverted World (20th Anniversary Remaster)	2001	https://i.scdn.co/image/ab67616d0000b2734205b816277c7f9dba098d28
4Tm0dXi3s3aSAqng2DACHr	4LG4Bs1Gadht7TCrMytQUO	Wincing The Night Away	2007	https://i.scdn.co/image/ab67616d0000b273c4d77bad843dfae691cca473
4ZTcGoOrNro2aCAStXEjZi	4LG4Bs1Gadht7TCrMytQUO	Port Of Morrow	2012	https://i.scdn.co/image/ab67616d0000b273b95a7b881ceea7ae051f86a3
05APAIA6c0Qf7QtFQYZAKm	4LG4Bs1Gadht7TCrMytQUO	Chutes Too Narrow	2003	https://i.scdn.co/image/ab67616d0000b2735c11dcb47cfa23d259df8904
6BN0KczNzSrfmKoQzd6lMS	4fXkvh05wFhuH77MfD4m9o	Half The City	2014	https://i.scdn.co/image/ab67616d0000b273793d44aad3d0c0158d517c15
2fRc3TJSXKXGFdnmcm17p2	4fXkvh05wFhuH77MfD4m9o	Sea of Noise	2016	https://i.scdn.co/image/ab67616d0000b2733aab37beee0e9198e3c324e7
4EN9bVE0g7gUvQlNdPrUhL	4fXkvh05wFhuH77MfD4m9o	Young Sick Camellia	2018	https://i.scdn.co/image/ab67616d0000b273aff0f524411824c03ab57302
36YdveJJhT49E0blTQODsS	4fXkvh05wFhuH77MfD4m9o	Spotify Sessions (Live at SXSW 2014)	2014	https://i.scdn.co/image/ab67616d0000b2730cd990475f5d5ee748f91144
2WmO2kiYt1UsAHOcApQ9cm	6Xa4nbrSTfbioA4lLShbjh	Rarest of Birds	2019	https://i.scdn.co/image/ab67616d0000b2737f28489db59eba6634cbc365
23vRh5kKySeeZ7InWfcOlY	6Xa4nbrSTfbioA4lLShbjh	In My Arms (feat. Jamie N Commons)	2017	https://i.scdn.co/image/ab67616d0000b2738258029366eec7bcd180c341
6R6Xy2gwyTO6GS1Cs4K1cI	6Xa4nbrSTfbioA4lLShbjh	Waking Up The Giants	2015	https://i.scdn.co/image/ab67616d0000b273bda2178fd88a11c96dde5e2e
2oyXZsUW2bwtLdoRcSsFq9	6Xa4nbrSTfbioA4lLShbjh	Endless Summer	2018	https://i.scdn.co/image/ab67616d0000b273fd078cd7e1b6049273dc3a64
5TJvbSps6D0gy3DHqeb8FP	6m4tJuf67jwVSvMP34hrck	Look Closer	2015	https://i.scdn.co/image/ab67616d0000b2732e5dff1708f7a0a08c7134aa
4xwx0x7k6c5VuThz5qVqmV	1nJvji2KIlWSseXRSlNYsC	The Velvet Underground & Nico 45th Anniversary	1967	https://i.scdn.co/image/ab67616d0000b27398260c528e6eec9dd431c1d7
2HOf3Nb44Us8U9oEtKLSrX	1nJvji2KIlWSseXRSlNYsC	The Velvet Underground (45th Anniversary)	1969	https://i.scdn.co/image/ab67616d0000b2739a2c40b6a1af4a92aac991c5
2ny1rPsLOoKNFZhMLubMrs	1nJvji2KIlWSseXRSlNYsC	Loaded: Re-Loaded 45th Anniversary Edition	1970	https://i.scdn.co/image/ab67616d0000b273a6d589272dca67a07a00c8a8
4BrJEabBSw59bwSjKZl25p	32Ko3nL0210QAt14S3Rs4Y	Seventeen	2016	https://i.scdn.co/image/ab67616d0000b273ea18068c00c9780c65415c6a
0C0Oq2jJhJ4Rs6IwgCe0Ob	32Ko3nL0210QAt14S3Rs4Y	I Don't Know	2020	https://i.scdn.co/image/ab67616d0000b2739aea6e6ddcfd574556a96ff8
7HxeuvcM84U4sWEtOSlePG	32Ko3nL0210QAt14S3Rs4Y	win'20	2020	https://i.scdn.co/image/ab67616d0000b2734b3973fe57b73ffaab463c15
6uR4bPGGdQHDphbyubK9zc	32Ko3nL0210QAt14S3Rs4Y	Now & Then	2017	https://i.scdn.co/image/ab67616d0000b2735edda7834f7be30c71bb137e
0dsp6TeaD2da6UvQy4CZ2C	32Ko3nL0210QAt14S3Rs4Y	Change	2021	https://i.scdn.co/image/ab67616d0000b27345ceccf1f9fe28a837218e79
4cGpiQWYOPtHRB3mQLDWCC	32Ko3nL0210QAt14S3Rs4Y	Human Condition	2021	https://i.scdn.co/image/ab67616d0000b273734720642bd6ac0ec2af2106
6a9bsIUvtXmqj6HaEOIAq3	32Ko3nL0210QAt14S3Rs4Y	Better Off	2018	https://i.scdn.co/image/ab67616d0000b273f3844685c74004d516e62a5f
2HatDWFqyd2cFNHX7wX7Yp	32Ko3nL0210QAt14S3Rs4Y	Demos	2015	https://i.scdn.co/image/ab67616d0000b273d4b27d4a7cbf79f091d824e4
5RkPNFjpGpN5KiTRpTRjzv	32Ko3nL0210QAt14S3Rs4Y	High Beam	2017	https://i.scdn.co/image/ab67616d0000b27391f03e7518a16f7e937129e2
3gBVdu4a1MMJVMy6vwPEb8	4Z8W4fKeB5YxbusRsdQVPb	Pablo Honey	1993	https://i.scdn.co/image/ab67616d0000b273df55e326ed144ab4f5cecf95
6dVIqQ8qmQ5GBnJ9shOYGE	4Z8W4fKeB5YxbusRsdQVPb	OK Computer	1997	https://i.scdn.co/image/ab67616d0000b273c8b444df094279e70d0ed856
35UJLpClj5EDrhpNIi4DFg	4Z8W4fKeB5YxbusRsdQVPb	The Bends	1995	https://i.scdn.co/image/ab67616d0000b2739293c743fa542094336c5e12
5vkqYmiPBYLaalcmjujWxK	4Z8W4fKeB5YxbusRsdQVPb	In Rainbows	2007	https://i.scdn.co/image/ab67616d0000b273de3c04b5fc750b68899b20a9
6cmFNl8lllA6BGc7SKLy3y	48vDIufGC8ujPuBiTxY8dm	So Long Forever	2016	https://i.scdn.co/image/ab67616d0000b273929dae46c6b93942c7499b7d
2gnr57XaEBXSDlfbkowBP8	48vDIufGC8ujPuBiTxY8dm	Life After	2019	https://i.scdn.co/image/ab67616d0000b273287d57f51a9220e1b972d576
5KSXwOfUJeKRkTr43FppCM	48vDIufGC8ujPuBiTxY8dm	Shoals	2022	https://i.scdn.co/image/ab67616d0000b273e465f9173df2538a391d9c0b
50lmuZTx1lNcNFjY2cr3HB	48vDIufGC8ujPuBiTxY8dm	Lost in the Night	2014	https://i.scdn.co/image/ab67616d0000b273e84adb5bc350142cb67a5656
0LyecvMmiD3grsZtkEQQJM	48vDIufGC8ujPuBiTxY8dm	Veins	2014	https://i.scdn.co/image/ab67616d0000b273ca84a453df6f486114bcc774
7tZbEknszSim0Ug0Zv3pxf	4zsrUnozu6zRlVELQezaBn	What Have You Done, My Brother?	2009	https://i.scdn.co/image/ab67616d0000b273fb5ff8376c7bc2f70ecb8af8
57mOAqbdhcMncLg0rjaY7w	4zsrUnozu6zRlVELQezaBn	Cold World	2014	https://i.scdn.co/image/ab67616d0000b273e278a1b6b7b239aa15ba2360
4WlxosPPabfbXUJ1w9gpKc	4zsrUnozu6zRlVELQezaBn	Daptone Gold, Vol. II	2015	https://i.scdn.co/image/ab67616d0000b273f8f92cacf69e7e1001c66b08
2uhB1KivbFnlkARpbd0Cvu	6PfSUFtkMVoDkx4MQkzOi3	1000 gecs	2019	https://i.scdn.co/image/ab67616d0000b2734123c0f9b6689205d20f350f
7Amrg2WughWQXMEmUfjhl3	5vSQUyT33qxr1xAX2Tkf3A	32 Levels (Deluxe)	2016	https://i.scdn.co/image/ab67616d0000b27312eb63d50e68cd097f56f92c
6d1vGZsr6Uy3h9IigBpPAf	0eDvMgVFoNV3TpwtrVCoTj	Meet The Woo	2019	https://i.scdn.co/image/ab67616d0000b2738fe5d04b06aff90f9fe796f5
75Z98z7kl42oWcT0UvtO6e	6guC9FqvlVboSKTI77NG2k	Instant Gratification	2015	https://i.scdn.co/image/ab67616d0000b273fc52f6fc7dca9af16569fb2b
0UywfDKYlyiu1b38DRrzYD	2NjfBq1NflQcKSeiDooVjY	Dance Monkey (Stripped Back) / Dance Monkey	2019	https://i.scdn.co/image/ab67616d0000b273c6f7af36ecdc3ed6e0a1f169
52u4anZbHd6UInnmHRFzba	757aE44tKEUQEqRuT6GnEB	Please Excuse Me for Being Antisocial	2019	https://i.scdn.co/image/ab67616d0000b273600adbc750285ea1a8da249f
0kJJubTbpBWH9dwHmRl4qR	6XyY86QOPPrYVGvF9ch6wz	One Step Closer (100 gecs Reanimation)	2021	https://i.scdn.co/image/ab67616d0000b273bc0b95233a832ded76f3ebf7
2LlKseD9In6F377qHat4uZ	422qjlzkDtxmaeeOLhnE6A	ANIME DOROHEDORO ORIGINAL SOUNDTRACK	2020	https://i.scdn.co/image/ab67616d0000b273adaf921eefffa5175aaab58a
37CqAwxTungNxKpIK5vSgE	2cFrymmkijnjDg9SS92EPM	hot girl bummer	2019	https://i.scdn.co/image/ab67616d0000b27395e845fcceb1625ff6178411
3Oj8FdHcV6kAiOVWfkqRaA	1rCIEwPp5OnXW0ornlSsRl	Fantasies	2009	https://i.scdn.co/image/ab67616d0000b27370d7aa769af19e7e2c2e107b
1pFaEu56zqpzSviJc3htZN	6MPCFvOQv5cIGfw3jODMF0	Lemonade (feat. Gunna, Don Toliver & NAV)	2020	https://i.scdn.co/image/ab67616d0000b273d46a8fffbe6c8630784f04da
4Z3RHSVpMYdXciM5wo638s	4sQNUQjOYj9rV2sdfJ8laS	The Deadfaced Dimension	2014	https://i.scdn.co/image/ab67616d0000b27350e62a0b7e4c35d8fcacae65
3cQO7jp5S9qLBoIVtbkSM1	3YQKmKGau1PzlVlkL1iodx	Blurryface	2015	https://i.scdn.co/image/ab67616d0000b273de03bfc2991fd5bcfde65ba3
01NhUvviMytvV12pmJiDZH	6eUKZXaKkcviH0Ku9w2n3V	Bad Habits	2021	https://i.scdn.co/image/ab67616d0000b2734e03a288fd79707055759f9c
0yZuUc5poB8rtqkbmA0APm	0EdvGhlC1FkGItLOWQzG4J	Robbin' The Hood	1994	https://i.scdn.co/image/ab67616d0000b273ffa592514435c93fc05cba5b
3J8W9AOjQhnBLCX33m3atT	3YQKmKGau1PzlVlkL1iodx	Heathens	2016	https://i.scdn.co/image/ab67616d0000b2732ca3ba8f334ca5a5f0312efb
69g3CtOVg98TPOwqmI2K7Q	7GN9PivdemQRKjDt4z5Zv8	Ego Death	2015	https://i.scdn.co/image/ab67616d0000b2731c1c33c63cdbcb5788975a93
5ptl9Sheh9eWaogxFOZ3PV	34Y0ldeyUv7jBvukWOGASO	Hot N*gga	2014	https://i.scdn.co/image/ab67616d0000b273d52e14e0595216ca453572ab
6Xz8eKy8TeAyzwGr8QSOAS	5IcR3N7QB1j6KBL8eImZ8m	Habits & Contradictions	2012	https://i.scdn.co/image/ab67616d0000b273adbae0d44ccbeeab44d47920
5SKnXCvB4fcGSZu32o3LRY	4LLpKhyESsyAXpc4laK94U	Faces	2021	https://i.scdn.co/image/ab67616d0000b273e4251cf5331ad74eaaeca36e
1BOfOlZo9Nzx7SmYAucY9t	2kGBy2WHvF0VdZyqiVCkDT	Fear Fun	2012	https://i.scdn.co/image/ab67616d0000b273dc9ac21e828b6df32f5d4a74
14JU5SskmcyckE5I8PY6lv	7gjAu1qr5C2grXeQFFOGeh	Gossamer	2012	https://i.scdn.co/image/ab67616d0000b273f860547bc8ba0c59df4fe2c3
7jBYJQJTLhKJVADOtpN2q0	3PfyosblIBaNJNH88MUkgM	Code 8 (Original Motion Picture Soundtrack)	2019	https://i.scdn.co/image/ab67616d0000b273d8e981e3061d3fd6ac252a39
3x2uer6Xh0d5rF8toWpRDA	7oPftvlwr6VrsViSDV7fJY	Nimrod	1997	https://i.scdn.co/image/ab67616d0000b273da4f6706ae0f2501c61ce776
6Ax8Neb7dEif3KUlJwj2P8	738wLrAtLtCtFOLvQBXOXp	Free The Universe (Extended Version)	2013	https://i.scdn.co/image/ab67616d0000b2736072cf92e874da9507de3e74
6PkSBdx19zarn4ae1D08gA	6fxyWrfmjcbj5d12gXeiNV	ZUU	2019	https://i.scdn.co/image/ab67616d0000b2735d46e4578c8e1adad9206480
4uG8q3GPuWHQlRbswMIRS6	7oPftvlwr6VrsViSDV7fJY	Dookie	1994	https://i.scdn.co/image/ab67616d0000b273db89b08034de626ebee6823d
1pPpRk6AF8EL19sgm2MkSD	21dooacK2WGBB5amYvKyfM	Deadstar 2	2019	https://i.scdn.co/image/ab67616d0000b27355a8f0638c5d13eff13d08b8
07VnhmPw4Ws1rvCN1z1rUz	7Im2r58zlLJIDfamqDjEE6	Curso de Capoeira Regional	1969	https://i.scdn.co/image/ab67616d0000b27391f893ddac30579061aa0b2c
6YnEvQjRcWyAAxm7dXNEfs	1r59KUMNZRw0M8FDnrHq0o	Come Check This	2020	https://i.scdn.co/image/ab67616d0000b273065b9d84ab86538cb36f7571
41kOXEHM7PivRjZj4WX2Dl	0dlDsD7y6ccmDm8tuWCU6F	All Alone	2019	https://i.scdn.co/image/ab67616d0000b273eac125ae834b76b7d15b3014
1Sf8GsXG32t0jNrX11xqWx	7A8S43ryYdbWpJKeHRZRcq	JACKBOYS	2019	https://i.scdn.co/image/ab67616d0000b273dfc2f59568272de50a257f2f
3IO8IPjwXuzPJnoaqkwYrj	0iEtIxbK0KxaSlF7G42ZOp	NOT ALL HEROES WEAR CAPES (Deluxe)	2018	https://i.scdn.co/image/ab67616d0000b2732887f8c05b5a9f1cb105be29
42WVQWuf1teDysXiOupIZt	0Y5tJX1MQlPlqiwlOH1tJY	Birds In The Trap Sing McKnight	2016	https://i.scdn.co/image/ab67616d0000b273f54b99bf27cda88f4a7403ce
6SInUyQqx0RZaVTSEioHkD	0H39MdGGX6dbnnQPt6NQkZ	Collection One	2018	https://i.scdn.co/image/ab67616d0000b273148e1f0715c7e9c1034d722c
2BxVymXnPiWgxA8k6PWqCS	6Q1ggxOPVDbMyqlhv0tmT4	Capoeira Brasileira by Bode Veio	2012	https://i.scdn.co/image/ab67616d0000b273ad6c26da48be5afc9b5456f8
4kN9CRrkFvXfiadphIZhwX	5m9PQtVJ9ZZVWgb3t2nTMN	Keep Riding Me	2021	https://i.scdn.co/image/ab67616d0000b273312833b9edb1240a7165bda3
4STLPZr5CqrG9yHUvXP665	4RKYu5o9e1MSd5eq3SYr9I	4loko	2021	https://i.scdn.co/image/ab67616d0000b2736b0c3f53d72b2a89053db0f4
4KvTJJPmcAd1XJaO3UrARG	0dlDsD7y6ccmDm8tuWCU6F	GTG	2018	https://i.scdn.co/image/ab67616d0000b273f67a8d19b2c7130f0437887b
6bI4IQKBcLX0KsTjQ9NR97	5dHt1vcEm9qb8fCyLcB3HL	Floor Seats	2019	https://i.scdn.co/image/ab67616d0000b27380dacac510e9d085a591f981
41GuZcammIkupMPKH2OJ6I	0Y5tJX1MQlPlqiwlOH1tJY	ASTROWORLD	2018	https://i.scdn.co/image/ab67616d0000b273072e9faef2ef7b6db63834a3
5olInc6PT2TULCztcT0Csl	18hl4QMrybIXbkGi2BzXcf	O Alto do Cruzeiro e no Quintal da Minha Casa (Ao Vivo)	2022	https://i.scdn.co/image/ab67616d0000b273a489f894b3329d6181b906a5
2uDTi1PlpSpvAv7IRAoAEU	0Y5tJX1MQlPlqiwlOH1tJY	HIGHEST IN THE ROOM	2019	https://i.scdn.co/image/ab67616d0000b273e42b5fea4ac4c3d6328b622b
6o38CdD7CUlZDCFhjZYLDH	0ONHkAv9pCAFxb0zJwDNTy	It's Almost Dry	2022	https://i.scdn.co/image/ab67616d0000b273e27dfef438562f2ecb98a642
2HFagfqzSWiinz9jqcj4Q2	7kA4sEagpoNK91I7wr9tYr	Hit List	2020	https://i.scdn.co/image/ab67616d0000b273e21e2951c334781b69321c5f
3FmLXejluSVOx2Gm8waHFs	0H39MdGGX6dbnnQPt6NQkZ	Roses	2018	https://i.scdn.co/image/ab67616d0000b2737e04e22ba618053c64e89883
6TyPSzd5rA2rQ9yLJJ1Gg2	1SImpQO0GbjRgvlwCcCtFo	Don't You Fake It	2006	https://i.scdn.co/image/ab67616d0000b273f98edbc89407338a90437d34
7b1LmekvPCy9410bKFoMRS	1AldSIJ8ANuZVbjKIhpKKq	Músicas de Capoeira, Vol. 01	2003	https://i.scdn.co/image/ab67616d0000b27316e05b88b5ab8fb49f7e1782
1RmE807F6wsfWzoaxF2qWH	2EhUXeszBQRApbBmTOXlKU	Capoeira Voices Vol 1	2012	https://i.scdn.co/image/ab67616d0000b2733944d72ec889d9687ace530e
78AINSlgE7iolq1bmGfBCH	4CrK2BAeyd3DIt2M2ELPJ4	100% Capoeira - 100 Songs Of Capoeira	2013	https://i.scdn.co/image/ab67616d0000b273b9b23dcd859eac8fbff6c98f
4xeVBTBwaVNQhUdIRC4G9s	5CCwRZC6euC8Odo6y9X8jr	Bang	2021	https://i.scdn.co/image/ab67616d0000b2730b94c63fde72efeb6fd512c4
2SUBknzxng0iqBpKT9vzns	0dlDsD7y6ccmDm8tuWCU6F	Cha Cha	2019	https://i.scdn.co/image/ab67616d0000b27342ffc7773e7f4ea48e5606a8
0qnExDZfz0kVeBjixPsyjS	6PfSUFtkMVoDkx4MQkzOi3	1000 gecs and The Tree of Clues	2020	https://i.scdn.co/image/ab67616d0000b273f91a3040f0be854026ad2dd0
6wTyGUWGCilBFZ837k5aRi	1URnnhqYAYcrqrcwql10ft	SAVAGE MODE II	2020	https://i.scdn.co/image/ab67616d0000b273aa57907bf0cb2ca0c8cc74bc
3zOkSAbg9o7gQ3yXtZhx5v	13ubrt8QOOCPljQ2FL1Kca	Babushka Boi	2019	https://i.scdn.co/image/ab67616d0000b273f0af4e62df674240cc7a35f8
49cBF5iGpJ7nx6EAR8BLga	7HGNYPmbDrMkylWqeFCOIQ	Transa	1972	https://i.scdn.co/image/ab67616d0000b2738261c1838b583c714053ce76
1SYy6QlPiObmtHW2PqpZWu	3qZ2n5keOAat1SoF6bHwmb	Sambabook Zeca Pagodinho, Vol. 2	2014	https://i.scdn.co/image/ab67616d0000b273c30f8f7c317efa606ad366fd
4HCs1WxdaCTb8S1TlgUG9C	7HGNYPmbDrMkylWqeFCOIQ	Prenda Minha	1998	https://i.scdn.co/image/ab67616d0000b2732374e6c8bada807a45cc4b00
2MQvu0dayEtaR5Y2uxX056	1AldSIJ8ANuZVbjKIhpKKq	The Best of Capoeira	2014	https://i.scdn.co/image/ab67616d0000b27326c24c43597ff16c6052ff39
3fAptQHHbsV4bHHNjcGDG0	4kEcRrHPFKoSlsHIhuCN2f	Cantigas De Capu - En Las Calles De Barcelona	2017	https://i.scdn.co/image/ab67616d0000b2733495e5a7177f0454406081a4
3kUdjvoJpl53A2BLu56OvA	1AldSIJ8ANuZVbjKIhpKKq	Os 15 Maiores Sucessos na Capoeira	2008	https://i.scdn.co/image/ab67616d0000b2735705adb069a54c9df630b195
6FdbVYfwhJjaUOzYB7J9Uj	1AldSIJ8ANuZVbjKIhpKKq	Canto na Areia, Vol. 03	2007	https://i.scdn.co/image/ab67616d0000b273bdaab8b09e0dbc8536bb619c
0imwCieoxougGmptrN1WAx	1MXZ0hsGic96dWRDKwAwdr	High Right Now (feat. Wiz Khalifa) [Remix]	2020	https://i.scdn.co/image/ab67616d0000b2732dea10a6e67a8c1ab8b8566e
1EggMJbrddGeSyNjDzDRMI	7HGNYPmbDrMkylWqeFCOIQ	Qualquer Coisa	1975	https://i.scdn.co/image/ab67616d0000b2739a2fc7dc286a9827e98881e3
3eXCgCBM4BS6H83xmxKdL6	7oEkUINVIj1Nr3Wnj8tzqr	Um banda um	1982	https://i.scdn.co/image/ab67616d0000b273369d09bf4a3e24e2fb38e598
6haDxdERWK3rdVCGc2jr8E	5rX2c1zow6hCph8PnnU3kF	The Astrud Gilberto Album	1965	https://i.scdn.co/image/ab67616d0000b273b48a079c5273b6141af2dc35
5tPEQtkCVKj17B9RlxDIKC	7oEkUINVIj1Nr3Wnj8tzqr	As canções de eu, tu, eles	2000	https://i.scdn.co/image/ab67616d0000b273452e0fb204aa84bb56a28e94
5NnAoeNFYhB4ypfoEX8e6H	1b8kpp4DUwt1hWaxTiWQhD	Gal Estratosférica	2016	https://i.scdn.co/image/ab67616d0000b2731287784d133815e5d4e8ad0a
5Tk4wmf1IgEPPq36yD4G7Z	1b8kpp4DUwt1hWaxTiWQhD	Baby (Ao Vivo)	2020	https://i.scdn.co/image/ab67616d0000b27391b78c9a782e4f42ad2e211b
1Vjf7xPNvBhqKnAR4rAXR2	1b8kpp4DUwt1hWaxTiWQhD	Gal Tropical	1979	https://i.scdn.co/image/ab67616d0000b273de4828d89731083b45eb1521
3TCEm1O6JANZ1H55BPZ48L	1AldSIJ8ANuZVbjKIhpKKq	Audácia	2014	https://i.scdn.co/image/ab67616d0000b273bcb4b5ab1bacca1904d541a0
4jY3KTb8z9OZiIM92pTuNe	1b8kpp4DUwt1hWaxTiWQhD	Cantar	1974	https://i.scdn.co/image/ab67616d0000b2732126655adcbebe1795d59869
1wG4O32OX2POpj77Cstqk7	2FW6Zt8gyIF7Fb7O3TGxnE	Sambabook Dona Ivone Lara, Vol. 2	2015	https://i.scdn.co/image/ab67616d0000b27327d5fa9c3b826ccc22bfe945
3qoUU8sm4eBT5POFHQSl5L	7oEkUINVIj1Nr3Wnj8tzqr	Luar	1981	https://i.scdn.co/image/ab67616d0000b2730b74999dae4b5d4ea81b21a9
1FpzNqDbugk77xUj0qOrtQ	5bUj39bg0zEbRzjUEISMG9	Kill Bill Vol. 1 Original Soundtrack (PA Version)	2003	https://i.scdn.co/image/ab67616d0000b273fecfac11994325a39cd03dec
5gK2l2LgWY0BA4p9uy27z6	0Mz5XE0kb1GBnbLQm2VbcO	Black On Both Sides	1999	https://i.scdn.co/image/ab67616d0000b27389b56f56323925d57b38944d
7gkngZkZ51RJBzWUkU8uZ4	0av074qUwLn5eyzwqoq3xh	The Gettin' Off Stage, Step 2	2016	https://i.scdn.co/image/ab67616d0000b27319c85251434dc2c0ed464d89
1v3KoZERdNZ6ddhseotXzx	0oXFsuB6XBuDTsXJgplR7k	Raoui	2001	https://i.scdn.co/image/ab67616d0000b2730110630c6da984c690831c6f
1VGVJdmvOSRK2w9RKXk18A	2PmIyxmEFsNfQJjEifPDZC	Cyberpunk 2077: Radio, Vol. 2 (Original Soundtrack)	2020	https://i.scdn.co/image/ab67616d0000b273a91a5b301baac1f46e6f30eb
64JvR5shy7j04mTiX0wfNp	7HGNYPmbDrMkylWqeFCOIQ	Cinema Transcendental	1979	https://i.scdn.co/image/ab67616d0000b2735c353a216f250a45f794870d
5FrjDW96mCYw9ECc74c637	3Rq3YOF9YG9YfCWD4D56RZ	Metaphorical Music	2003	https://i.scdn.co/image/ab67616d0000b273a1a897ee5e642da6d945bcd7
1uGIwfw9F1lR7TDDukbNyQ	23cC3RI0hgD5sWmXKPAJuG	Skyline	2019	https://i.scdn.co/image/ab67616d0000b273504b51565feda5d86c586f1c
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.artists (artist_id, name, popularity, followers, img_url) FROM stdin;
0qu422H5MOoQxGjd4IzHbS	Yves Tumor	56	257261	https://i.scdn.co/image/ab6761610000e5eb1812767b709d74a801c0e487
65dGLGjkw3UbddUg2GKQoZ	BADBADNOTGOOD	62	634414	https://i.scdn.co/image/ab6761610000e5eb61d28b161209f1ee239fdafa
4lujUKeO6nQAJXpq37Epn7	Son Little	53	136370	https://i.scdn.co/image/ab6761610000e5eb7321188756fe1f5d4b554797
6ltzsmQQbmdoHHbLZ4ZN25	Lord Huron	71	1138454	https://i.scdn.co/image/ab6761610000e5eb1d4e4e7e3c5d8fa494fc5f10
0YrtvWJMgSdVrk3SfNjTbx	Death Cab for Cutie	63	1411686	https://i.scdn.co/image/ab6761610000e5eb378adae733fc578108e3f534
0bzfPKdbXL5ezYW2z3UGQj	Michael Kiwanuka	63	1243492	https://i.scdn.co/image/ab6761610000e5eb413f9f82bd7d821ae0195d67
3M4ThdJR28z9eSMcQHAZ5G	The Fratellis	60	768565	https://i.scdn.co/image/ab6761610000e5ebd693efe23dcda7b9595e77ec
30DhU7BDmF4PH0JVhu8ZRg	Sabrina Claudio	62	1444355	https://i.scdn.co/image/ab6761610000e5eb4ed63962edc0f1817bc349fb
360IAlyVv4PCEVjgyMZrxK	Miguel	76	4260009	https://i.scdn.co/image/ab6761610000e5eb02eeb5305fa7bdd9ddca42fc
34jw2BbxjoYalTp8cJFCPv	Heart	65	2102998	https://i.scdn.co/image/1c145626e516a6817c43e7eab2b1cc3a5a9562a8
5Q81rlcTFh3k6DQJXPdsot	Mura Masa	63	625515	https://i.scdn.co/image/ab6761610000e5eb506f6e096e31255e20668074
2YZyLoL8N0Wb9xBt1NhZWg	Kendrick Lamar	87	21885642	https://i.scdn.co/image/ab6761610000e5eb437b9e2a82505b3d93ff1022
4hz8tIajF2INpgM0qzPJz2	Rainbow Kitten Surprise	67	807772	https://i.scdn.co/image/ab6761610000e5eb1b8f08f741213f04e4c3a25a
1Xyo4u8uXC1ZmMpatF05PJ	The Weeknd	93	52058980	https://i.scdn.co/image/ab6761610000e5ebb5f9e28219c169fd4b9e8379
7CyeXFnOrfC1N6z4naIpgo	The Ronettes	59	220739	https://i.scdn.co/image/ab6761610000e5ebc47897b69089f59e31817f26
55VydwMyCuGcavwPuhutPL	The Used	61	1038188	https://i.scdn.co/image/ab6761610000e5eb779c0b2354fc5392c1378290
08ct2eZF5lUPdJpHwNKWof	Hootie & The Blowfish	58	964835	https://i.scdn.co/image/ab6761610000e5eb783a64d2e0fbfdaed9114594
37w38cCSGgKLdayTRjna4W	Mazzy Star	64	797566	https://i.scdn.co/image/d14e353d562d68036916c64a13912772cf7df91c
4bthk9UfsYUYdcFyqxmSUU	Tears For Fears	72	2584645	https://i.scdn.co/image/ab6761610000e5eb42ed2cb48c231f545a5a3dad
4pejUc4iciQfgdX6OKulQn	Queens of the Stone Age	68	3085280	https://i.scdn.co/image/ab6761610000e5ebc194721f2ca5433bc78b0e74
7qKoy46vPnmIxKCN6ewBG4	Butch Walker	38	43730	https://i.scdn.co/image/ab6761610000e5eb0dc5c48012477ce1d87953c4
1eClJfHLoDI4rZe5HxzBFv	INXS	68	2204392	https://i.scdn.co/image/ab6761610000e5eb9bfd44c9bd2aae22edfd99bf
2iul6etLF5hjjpxo43rzz7	Lera Lynn	42	82864	https://i.scdn.co/image/ab6761610000e5ebde10fb8cd40da4e0af316b77
73sIBHcqh3Z3NyqHKZ7FOL	Childish Gambino	77	9961799	https://i.scdn.co/image/ab6761610000e5eb3ef779aa0d271adb2b6a3ded
4V8LLVI7PbaPR0K2TGSxFF	Tyler, The Creator	83	9835779	https://i.scdn.co/image/ab6761610000e5eb8278b782cbb5a3963db88ada
3oDbviiivRWhXwIE8hxkVV	The Beach Boys	70	3862551	https://i.scdn.co/image/ab6761610000e5eb92602f233ce2295748f44603
6loBF9iQdE11WSX29fNKqY	Howard Jones	49	360551	https://i.scdn.co/image/ab6761610000e5eb93e7c004e39b91f88d1088af
7guDJrEfX3qb6FEbdPA5qi	Stevie Wonder	74	5852498	https://i.scdn.co/image/c59faacbed7aa770266bad048660810eca204108
5wFXmYsg3KFJ8BDsQudJ4f	Manchester Orchestra	60	472364	https://i.scdn.co/image/ab6761610000e5eb3b853e76066d55089ba9581f
2ooIqOf4X2uz4mMptXCtie	Neutral Milk Hotel	55	604997	https://i.scdn.co/image/731f5f71de27c36300d2cf71a7f9cd7f389d0bf7
1KP6TWI40m7p3QBTU6u2xo	BØRNS	66	1102082	https://i.scdn.co/image/ab6761610000e5eb6308e79c621076395807b455
1MIe1z4RdqLqHSJsb7EBMm	The Greeting Committee	51	106769	https://i.scdn.co/image/ab6761610000e5eb7f25f8a78585d6b5cda70a3f
4l1cKWYW591xnwEGxpUg3J	Miike Snow	54	614996	https://i.scdn.co/image/b3944378d08ba28b16c494cc7f63703175169251
1fZpYWNWdL5Z3wrDtISFUH	Shakey Graves	58	462342	https://i.scdn.co/image/ab6761610000e5ebe4368448c8f76d21de6a5c1d
0AkmSuTOzM2pNCIOSP8ziv	Amigo the Devil	49	109268	https://i.scdn.co/image/ab6761610000e5eb757280ee844ac5714b919648
3dv4Q4q3LWOnbLJnC6GgTY	Yellow Days	52	443376	https://i.scdn.co/image/ab6761610000e5eb3a007701f172556b9e917b1e
60df5JBRRPcnSpsIMxxwQm	Otis Redding	67	2001025	https://i.scdn.co/image/4ad89c805aff0fb76b01b6b62b39e21fcd8943c3
3JaAGmSTpJK35DqWrDUzBz	Sweet	57	386408	https://i.scdn.co/image/ab6761610000e5eb29a247c0aac9cbe94bc47865
0EdvGhlC1FkGItLOWQzG4J	Sublime	68	2360221	https://i.scdn.co/image/ab6761610000e5ebe726280500259dbdb97a8be4
7lzordPuZEXxwt9aoVZYmG	Billy Idol	67	1527336	https://i.scdn.co/image/ab6761610000e5ebd42c6334786bfdea92beeb5d
3RGLhK1IP9jnYFH4BRFJBS	The Clash	68	2412332	https://i.scdn.co/image/ab470b275daa38351810a1eb91d107ebdb821302
33EUXrFKGjpUSGacqEHhU4	Iggy Pop	62	1380880	https://i.scdn.co/image/ab6761610000e5eb21e6d14c3d8aab9887380d00
2CVBumuL5KyztqCyo7CETY	Elton Motello	20	2483	https://i.scdn.co/image/c6cd62c680a2993e07f4cd430140be441af6572e
0oSGxfWSnnOXhD2fKuz2Gy	David Bowie	76	8665377	https://i.scdn.co/image/ab6761610000e5ebb78f77c5583ae99472dd4a49
5aBEGOeWQCJfptic9xyaAb	Tones On Tail	35	58831	https://i.scdn.co/image/ab67616d0000b273768d2a36068dd1adcaa1f31b
0fA0VVWsXO9YnASrzqfmYu	Kid Cudi	81	6120574	https://i.scdn.co/image/ab6761610000e5eb876faa285687786c3d314ae0
3yY2gUcIsjMr8hjo51PoJ8	The Smiths	74	3626940	https://i.scdn.co/image/481b980af463122013e4578c08fb8c5cbfaed1e9
4wYk01oPJNfaEssVFL46oQ	Coast Modern	48	172375	https://i.scdn.co/image/ab6761610000e5eb0ea1b10e5b675d3f364927f4
0Zy4ncr8h1jd7Nzr9946fD	Killing Joke	48	268612	https://i.scdn.co/image/ab6761610000e5ebb27c2f14d0deaac56f64c1f4
0xRXCcSX89eobfrshSVdyu	MEDUZA	\N	\N	\N
6WY7D3jk8zTrHtmkqqo5GI	Maren Morris	\N	\N	\N
5vSQUyT33qxr1xAX2Tkf3A	Clams Casino	\N	\N	\N
0eDvMgVFoNV3TpwtrVCoTj	Pop Smoke	\N	\N	\N
6guC9FqvlVboSKTI77NG2k	Dance Gavin Dance	\N	\N	\N
2NjfBq1NflQcKSeiDooVjY	Tones And I	\N	\N	\N
757aE44tKEUQEqRuT6GnEB	Roddy Ricch	\N	\N	\N
6XyY86QOPPrYVGvF9ch6wz	Linkin Park	\N	\N	\N
422qjlzkDtxmaeeOLhnE6A	(K)NoW_NAME	\N	\N	\N
2cFrymmkijnjDg9SS92EPM	blackbear	\N	\N	\N
1rCIEwPp5OnXW0ornlSsRl	Metric	\N	\N	\N
6MPCFvOQv5cIGfw3jODMF0	Internet Money	\N	\N	\N
4sQNUQjOYj9rV2sdfJ8laS	Angerfist	\N	\N	\N
0YHgnSkV3S5mvSSCTRWDi5	Poor Mans Poison	62	155144	https://i.scdn.co/image/ab6761610000e5eb7e8b8316444011b2555929f0
57bUPid8xztkieZfS7OlEV	The Supremes	61	1495411	https://i.scdn.co/image/5c5dc3f7b4569a7727a63a44513c7a602b72da44
0X380XXQSNBYuleKzav5UO	Nine Inch Nails	65	2163976	https://i.scdn.co/image/ab6761610000e5eb047095c90419cf2a97266f77
5eIbEEQnDM8yuDVB0bimSP	RL Grime	59	394503	https://i.scdn.co/image/ab6761610000e5eb8839d67ee5f8963a1ba5458f
3pkmfqaBNsMqnXus05PNfP	Handsome Boy Modeling School	44	127483	https://i.scdn.co/image/ab6761610000e5ebeb049e8fe237761c3ca58fcf
20wkVLutqVOYrc0kxFs7rA	Daniel Caesar	76	3558798	https://i.scdn.co/image/ab6761610000e5ebbd09edfd2babfc9fd2ba748e
1mFX1QlezK1lNPKQJkhwWb	New Edition	56	1392284	https://i.scdn.co/image/44e1b32aa085bd943fabd36678804d3fd3b8fb67
0VbDAlm2KUlKI5UhXRBKWp	Henry Green	50	59532	https://i.scdn.co/image/ab6761610000e5eb6dabc1aa79f0541b26cd1835
7KGqvFukcZRbQ7YFsYrgPa	Donnie & Joe Emerson	42	24658	https://i.scdn.co/image/ab6761610000e5eb1d8289c5a98c178330f4fc32
6PEMFpe3PTOksdV4ZXUpbE	NxWorries	57	223828	https://i.scdn.co/image/ab6761610000e5eb89fa062521347470d69ba4c2
00FQb4jTyendYWaN8pK0wa	Lana Del Rey	88	18561677	https://i.scdn.co/image/ab6761610000e5ebc5903678d3db18e271e42be0
462T0buQ5ScBUQCRpodDRf	Charles Bradley	56	434606	https://i.scdn.co/image/ab6761610000e5eb5b855b0ad3f90d4addabf7f2
3jK9MiCrA42lLAdMGUZpwa	Anderson .Paak	77	2248555	https://i.scdn.co/image/ab6761610000e5eb96287bd47570ff13f0c01496
3qnGvpP8Yth1AqSBMqON5x	Leon Bridges	70	1460179	https://i.scdn.co/image/ab6761610000e5ebc1493f8c442935b396753e21
13ubrt8QOOCPljQ2FL1Kca	A$AP Rocky	80	11469213	https://i.scdn.co/image/ab6761610000e5ebee452efcf24aa4124fb28d94
6QRlkjrHz5A62mqeNZz7t3	La Luz	41	68388	https://i.scdn.co/image/ab6761610000e5eb3622bf879af58458f4172ba9
5CuU6SRJjbbZL926nSGGxX	Open Mike Eagle	44	111165	https://i.scdn.co/image/ab6761610000e5eb07e639e91b9008358ff864ec
6pmxr66tMAePxzOLfjGNcX	Beirut	56	937241	https://i.scdn.co/image/ab6761610000e5eb2d8bf7cc9fdf477efeede65f
3XHO7cRUPCLOr6jwp8vsx5	alt-J	68	3070142	https://i.scdn.co/image/ab6761610000e5eb3fb5214e667e278a20878a6b
6eU0jV2eEZ8XTM7EmlguK6	Black Pumas	58	747119	https://i.scdn.co/image/ab6761610000e5eb026d3ed0a2800958c1d59f4f
2h93pZq0e7k5yf4dywlkpM	Frank Ocean	82	10169099	https://i.scdn.co/image/ab6761610000e5ebfbc3faec4a370d8393bee7f1
1zXCFUgH6FWS0iCiCKsH55	Kai Straw	48	36968	https://i.scdn.co/image/ab6761610000e5eb14e7649374fe27bf1c5a72c0
3z6Gk257P9jNcZbBXJNX5i	Regina Spektor	60	1302676	https://i.scdn.co/image/ab6761610000e5eba36a9f95d59ab791d5e897e9
74oJ4qxwOZvX6oSsu1DGnw	Cream	60	2030704	https://i.scdn.co/image/aab6a0a0e9ca2ab17460b0451e59ba507cc5802a
0XSqX2PB3C5dTMv7SZaxSm	Wolf Parade	40	150811	https://i.scdn.co/image/ab6761610000e5ebe0ee9d6c0075af4fabb763bb
08GQAI4eElDnROBrJRGE0X	Fleetwood Mac	78	8911476	https://i.scdn.co/image/ab6761610000e5eb249d55f2d68a44637905c57e
6l3HvQ5sa6mXTsMTB19rO5	J. Cole	84	18259877	https://i.scdn.co/image/ab6761610000e5ebadd503b411a712e277895c8a
6RZUqkomCmb8zCRqc9eznB	Placebo	65	1674162	https://i.scdn.co/image/ab6761610000e5ebc8b42133fea50275b77f45e2
6ZK2nrW8aCTg8Bid7I7N10	Chelsea Wolfe	49	246625	https://i.scdn.co/image/ab6761610000e5ebb4de2ca8852a45b57575bde8
6TVVIyd0fsRDGg6WzHKyTP	Durand Jones & The Indications	57	257441	https://i.scdn.co/image/ab6761610000e5ebe8611a96977e7c7a04a1fbdf
6tkrcmVfWoHC4WOhE7IDyq	Lost Dog Street Band	45	94393	https://i.scdn.co/image/ab6761610000e5eb115afe5becc81bbc6dd33d69
600GgDUq9kzGJgNIrVsWfz	Habibi	32	32517	https://i.scdn.co/image/ab6761610000e5eba5eb7686c107776ebd315b45
2jgPkn6LuUazBoBk6vvjh5	The Zombies	58	823220	https://i.scdn.co/image/ab6761610000e5eb4bbeb54a562d3de858825979
6v8FB84lnmJs434UJf2Mrm	Neil Young	60	2641498	https://i.scdn.co/image/ab6772690000c46c49b91a07c864561ba7c78ba7
3QTDHixorJelOLxoxcjqGx	SiR	63	744623	https://i.scdn.co/image/ab6761610000e5eb972a4e990fb36451db2f40f2
3ycxRkcZ67ALN3GQJ57Vig	Masego	67	1058915	https://i.scdn.co/image/ab6761610000e5eb161fef4ab6a8ff32c699d6fa
77SW9BnxLY8rJ0RciFqkHh	The Neighbourhood	83	10573242	https://i.scdn.co/image/ab6761610000e5ebdf0b5ac84376a0a4b2166816
5NYEE4kgrEZPlM3DxUsTyc	Twin Temple	43	78820	https://i.scdn.co/image/ab6761610000e5eb4cdf29c756e7fe8eb08851a2
2pAajGWerK3ghwToNWFENS	Puscifer	54	560254	https://i.scdn.co/image/ab6761610000e5ebcba11fb640f2298fe3bd72de
75dQReiBOHN37fQgWQrIAJ	Local Natives	58	614963	https://i.scdn.co/image/ab6761610000e5ebf32fbcfa726d3c7e9a8b0c74
22bE4uQ6baNwSHPVcDxLCe	The Rolling Stones	76	12284482	https://i.scdn.co/image/ab6761610000e5ebd3cb15a8570cce5a63af63d8
5a2EaR3hamoenG9rDuVn8j	Prince	69	6392741	https://i.scdn.co/image/ab6761610000e5ebeaca358712b3fe4ed9814640
6Ghvu1VvMGScGpOUJBAHNH	Deftones	75	3138743	https://i.scdn.co/image/ab6761610000e5eb4b2da0b72cab26ac518f1f0d
4n0gvapwYbRpzU5Ov68B6P	The King Khan & BBQ Show	41	74180	https://i.scdn.co/image/c52c95c28cbf57a5b9b775789799bacadb915292
4uSftVc3FPWe6RJuMZNEe9	Andrew Bird	57	532901	https://i.scdn.co/image/ab6761610000e5eb4bb6b07ebb49a29e623961f4
6AWdGez5g1jxpfl9XD4wI3	Amir Obe	48	130576	https://i.scdn.co/image/ab6761610000e5ebf2bbfca5666eb8c35f438a1f
7HeVXdOdMhLslVputGTZFQ	Timber Timbre	45	186818	https://i.scdn.co/image/ab6761610000e5eb5fc147cc9258d4f029930596
0V7uVrIYr4FwFvUN9S4kYr	Nick Waterhouse	48	89503	https://i.scdn.co/image/ab6761610000e5ebe0108d02daadb928bfbbd68e
6hnWRPzGGKiapVX1UCdEAC	Sam Cooke	65	1410085	https://i.scdn.co/image/ab6761610000e5eb41aaa3a05d2ddba59454273e
2FRXiAz5Uz78LLLSwEUhLt	Miracle Musical	55	236507	https://i.scdn.co/image/ab6761610000e5eb904bf7e11545f9cb5feaf1b2
7ITd48RbLVpUfheE7B86o2	The Decemberists	53	568736	https://i.scdn.co/image/ab6761610000e5ebad12e7af41c3a1903d1273b8
1yAwtBaoHLEDWAnWR87hBT	Modest Mouse	62	1321989	https://i.scdn.co/image/ab6761610000e5eb3ff03c042ca55bcc7e7f490e
6LufpoVlIYKQCu9Gjpk8B7	Sharon Jones & The Dap-Kings	60	252999	https://i.scdn.co/image/cd0f5585d478bbb91cff3e0b723ed91c6d2046d7
2kGBy2WHvF0VdZyqiVCkDT	Father John Misty	59	708209	https://i.scdn.co/image/ab6761610000e5ebdadc30179c554ac7912f8477
68kEuyFKyqrdQQLLsmiatm	Vince Staples	67	1659023	https://i.scdn.co/image/ab6761610000e5eb53054f8bc7e0153daefe12cc
1hzfo8twXdOegF3xireCYs	Milky Chance	71	1699001	https://i.scdn.co/image/ab6761610000e5eb272b8122de18063dd387a155
6PfSUFtkMVoDkx4MQkzOi3	100 gecs	\N	\N	\N
251UrhgNbMr15NLzQ2KyKq	Rayland Baxter	54	145643	https://i.scdn.co/image/ab6761610000e5eb3e4fddfb76e55084bdd1479c
4DFhHyjvGYa9wxdHUjtDkc	A Perfect Circle	60	1605696	https://i.scdn.co/image/ab6761610000e5eb41472573351dfea479a4ffba
5IcR3N7QB1j6KBL8eImZ8m	ScHoolboy Q	71	4296952	https://i.scdn.co/image/ab6761610000e5ebe697a7ddf7af3a306428fa73
3D4qYDvoPn5cQxtBm4oseo	mewithoutYou	43	130190	https://i.scdn.co/image/ab6761610000e5ebe03d502190e35ac58c18d339
3tJ9PkBOrG7hFkHeNM2tbw	Olodum	44	180024	https://i.scdn.co/image/c3ef77c1c27ec33d3356ca7665b09aaf2bfe1c23
2ApaG60P4r0yhBoDCGD8YG	Elliott Smith	63	836507	https://i.scdn.co/image/ab6761610000e5eb079739b801ab3f105866b76f
6GEykX11lQqp92UVOQQCC7	DJ Premier	59	224886	https://i.scdn.co/image/ab6761610000e5eb7bbda26434643249f6228ea1
1anAI9P9iSzc9qzLv6AtHZ	Sure Sure	55	107880	https://i.scdn.co/image/ab6761610000e5eb3a2c4b388f7ababb018e4afa
2auiVi8sUZo17dLy1HwrTU	Solange	60	1844671	https://i.scdn.co/image/ab6761610000e5eb631cf0aa859e5a20e836f14f
6zvul52xwTWzilBZl6BUbT	Pixies	70	2331820	https://i.scdn.co/image/ab6761610000e5ebd0456128dd330d18e18b4715
1nGqKVGfPPiVgxMdx8hYOI	Ezra Bell	44	19076	https://i.scdn.co/image/ab6761610000e5eb597927b89a95412d987c9286
432R46LaYsJZV2Gmc4jUV5	Joy Division	62	1981262	https://i.scdn.co/image/5eeddd733170399db794d2c430a8d2cde7ae1425
1PryMSya1JnSAlcwYawCxp	Menahan Street Band	59	133430	https://i.scdn.co/image/ab6761610000e5eb46dc0fd03399b8a9dfed982d
2bToe6WyGvADJftreuXh2K	Lee Fields & The Expressions	49	139747	https://i.scdn.co/image/ab6761610000e5eb2ab0f0d7e19354bbe50c3546
7FKTg75ADVMZgY3P9ZMRtH	flipturn	54	79507	https://i.scdn.co/image/ab6761610000e5ebfc6b3360ae52cbc1768296d6
7bu3H8JO7d0UbMoVzbo70s	The Cure	74	4034701	https://i.scdn.co/image/7ca743e822b80133971ccf5c70fcbd77a4f4f508
0oL26Dn9y761yfJgNb3vfu	Michigander	50	30226	https://i.scdn.co/image/ab6761610000e5eb5f78a32b18ce30b84b370e39
0MVp3LuNho9Hk6Q1owsWwt	Right Away, Great Captain!	32	41175	https://i.scdn.co/image/ab6761610000e5ebb9b73c2a648759a40a7bdec8
1SQRv42e4PjEYfPhS0Tk9E	The Kinks	64	2249322	https://i.scdn.co/image/ab6761610000e5eb8f8013de1cd216cfdd7a4848
2FXC3k01G6Gw61bmprjgqS	Hozier	76	5271217	https://i.scdn.co/image/ab6761610000e5eb9ba4d95b74bacff4d5747f61
0v6gOfGBclTSGu6agfXb23	The Rural Alberta Advantage	41	67664	https://i.scdn.co/image/ab6761610000e5ebf2acadf50bfd1bb62669a10b
0yNLKJebCb8Aueb54LYya3	New Order	64	1794877	https://i.scdn.co/image/ab6761610000e5eba080a8e96758f416301578f9
1Tp7C6LzxZe9Mix6rn4zbI	Wilderado	55	77700	https://i.scdn.co/image/ab6761610000e5eba7eb714346f5bd4e73a671b7
2oqwwcM17wrP9hBD25zKSR	Lewis Del Mar	48	177602	https://i.scdn.co/image/ab6761610000e5ebb171e75745d404f23b5734c1
4BFMTELQyWJU1SwqcXMBm3	The Stooges	51	534667	https://i.scdn.co/image/1d9f0cf8e6d8d51f28369eccd78dca2882fb0d83
7foyQbi7GKriLiv1GPVEwt	Susto	49	35258	https://i.scdn.co/image/ab6761610000e5eb08465c702d6aa44e045c9300
0rpMdBzQXf7aYRnu5fDBJy	Violent Femmes	56	601033	https://i.scdn.co/image/ab6761610000e5ebf7100a1b5ae490f13b6b8078
2x9SpqnPi8rlE9pjHBwmSC	Talking Heads	68	1984592	https://i.scdn.co/image/e4c5b04fce8706c87663357b1f78522a3a5c641b
26T3LtbuGT1Fu9m0eRq5X3	Cage The Elephant	72	3031444	https://i.scdn.co/image/ab6761610000e5eb7d994f7e137c10249de19455
4LG4Bs1Gadht7TCrMytQUO	The Shins	60	1128339	https://i.scdn.co/image/ab6761610000e5eb6c87e9e995eedad42e73dcc4
4fXkvh05wFhuH77MfD4m9o	St. Paul & The Broken Bones	54	371081	https://i.scdn.co/image/ab6761610000e5ebd312cb24aecff2b4549b72ca
6Xa4nbrSTfbioA4lLShbjh	Grizfolk	50	134964	https://i.scdn.co/image/ab6761610000e5ebe7d47c8222b428e1ae85852f
6m4tJuf67jwVSvMP34hrck	Saun & Starr	42	8694	https://i.scdn.co/image/c0b1f5eb4a0890883235e7791561bc398af8f1a7
1nJvji2KIlWSseXRSlNYsC	The Velvet Underground	62	1610063	https://i.scdn.co/image/d69c2cf10323bf08443c7d122f3a1824a760ab57
32Ko3nL0210QAt14S3Rs4Y	Sjowgren	54	64000	https://i.scdn.co/image/ab6761610000e5eb32d5f17f02a8fb2d170c0e79
4Z8W4fKeB5YxbusRsdQVPb	Radiohead	78	7515520	https://i.scdn.co/image/ab6761610000e5eba03696716c9ee605006047fd
48vDIufGC8ujPuBiTxY8dm	Palace	58	208754	https://i.scdn.co/image/ab6761610000e5ebe18e02fa35631c00252a5204
4zsrUnozu6zRlVELQezaBn	Naomi Shelton	29	1376	https://i.scdn.co/image/350edc3da212585098d60384bde750f274912183
3hteYQFiMFbJY7wS0xDymP	Gesaffelstein	\N	\N	\N
06HL4z0CvFAxyc27GXpf02	Taylor Swift	\N	\N	\N
5fMUXHkw8R8eOP2RNVYEZX	Diplo	\N	\N	\N
23fqKkggKUBHNkbKtXEls4	Kygo	\N	\N	\N
2RdwBSPQiwcmiDo9kixcl8	Pharrell Williams	\N	\N	\N
4kI8Ie27vjvonwaB2ePh8T	Portugal. The Man	\N	\N	\N
2dBj3prW7gP9bCCOIQeDUf	Danger Mouse	\N	\N	\N
0e9H8oaYYRCKFXOVv848nt	Bad Books	\N	\N	\N
0du5cEVh5yTK9QJze8zA0C	Bruno Mars	\N	\N	\N
5p7f24Rk5HkUZsaS3BLG5F	Hailee Steinfeld	\N	\N	\N
2mVVjNmdjXZZDvhgQWiakk	Khruangbin	\N	\N	\N
55fhWPvDiMpLnE4ZzNXZyW	Noah Cyrus	\N	\N	\N
50co4Is1HCEo8bhOyUWKpn	Young Thug	\N	\N	\N
5SXuuuRpukkTvsLuUknva1	Baby Keem	\N	\N	\N
1uNFoZAHBGtllmzznpCI3s	Justin Bieber	\N	\N	\N
5FxD8fkQZ6KcsSYupDVoSO	Omar Apollo	\N	\N	\N
17Zu03OgBVxgLxWmRUyNOJ	Knxwledge	\N	\N	\N
0epOFNiUfyON9EYx7Tpr6V	The Strokes	\N	\N	\N
2PaZWGu5T5nHjY2xxAkFsT	THE SCOTTS	\N	\N	\N
0erhjm5MwzWpFRFuorXLT2	King Dude	\N	\N	\N
74ASZWbe4lXaubB36ztrGX	Bob Dylan	\N	\N	\N
5M0lbkGluOPXLeFjApw8r8	DRAM	\N	\N	\N
7nqSDaZKccpnUqjzedyZF4	The Bronx	\N	\N	\N
3rWZHrfrsPBxVy692yAIxF	WILLOW	\N	\N	\N
5Vuvs6Py2JRU7WiFDVsI7J	Lucky Daye	\N	\N	\N
7E2ioKxoxI2J94tUkIx6As	Alex Isley	\N	\N	\N
0cGUm45nv7Z6M6qdXYQGTX	Kehlani	\N	\N	\N
6CWTBjOJK75cTE8Xv8u1kj	Feist	\N	\N	\N
4AKwRarlmsUlLjIwt38NLw	Ofenbach	\N	\N	\N
1M3BVQ36cqPQix8lQNCh4K	Shovels & Rope	\N	\N	\N
6qqNVTkY8uBg9cP3Jd7DAH	Billie Eilish	\N	\N	\N
7dzq55YG3wjViqexDwiycQ	Ivete Sangalo	\N	\N	\N
3qvcCP2J0fWi0m0uQDUf6r	Luan Santana	\N	\N	\N
0BHm7qbh3ENxvXzkQAG7MP	Mari Fernandez	\N	\N	\N
20qISvAhX20dpIbOOzGK3q	Nas	\N	\N	\N
4RnBFZRiMLRyZy0AzzTg2C	Run The Jewels	\N	\N	\N
4xRYI6VqpkE3UwrDrAZL8L	Logic	\N	\N	\N
3s7WzrEs4FkNObqj4WyfQm	Black Soprano Family	\N	\N	\N
165ZgPlLkK7bf5bDoFc6Sb	Limp Bizkit	\N	\N	\N
4nvFFLtv7ZqoTr83387uK4	Dynamicduo	\N	\N	\N
3YQKmKGau1PzlVlkL1iodx	Twenty One Pilots	\N	\N	\N
6eUKZXaKkcviH0Ku9w2n3V	Ed Sheeran	\N	\N	\N
7GN9PivdemQRKjDt4z5Zv8	The Internet	\N	\N	\N
34Y0ldeyUv7jBvukWOGASO	Bobby Shmurda	\N	\N	\N
4LLpKhyESsyAXpc4laK94U	Mac Miller	\N	\N	\N
7gjAu1qr5C2grXeQFFOGeh	Passion Pit	\N	\N	\N
3PfyosblIBaNJNH88MUkgM	Nate Eiesland	\N	\N	\N
7oPftvlwr6VrsViSDV7fJY	Green Day	\N	\N	\N
738wLrAtLtCtFOLvQBXOXp	Major Lazer	\N	\N	\N
6fxyWrfmjcbj5d12gXeiNV	Denzel Curry	\N	\N	\N
21dooacK2WGBB5amYvKyfM	Smokepurpp	\N	\N	\N
7Im2r58zlLJIDfamqDjEE6	Mestre Bimba	\N	\N	\N
1r59KUMNZRw0M8FDnrHq0o	FETISH	\N	\N	\N
0dlDsD7y6ccmDm8tuWCU6F	Freddie Dredd	\N	\N	\N
7A8S43ryYdbWpJKeHRZRcq	JACKBOYS	\N	\N	\N
0iEtIxbK0KxaSlF7G42ZOp	Metro Boomin	\N	\N	\N
0Y5tJX1MQlPlqiwlOH1tJY	Travis Scott	\N	\N	\N
0H39MdGGX6dbnnQPt6NQkZ	SAINt JHN	\N	\N	\N
6Q1ggxOPVDbMyqlhv0tmT4	Bode Veio	\N	\N	\N
5m9PQtVJ9ZZVWgb3t2nTMN	ur pretty	\N	\N	\N
4RKYu5o9e1MSd5eq3SYr9I	Prison Mike	\N	\N	\N
5dHt1vcEm9qb8fCyLcB3HL	A$AP Ferg	\N	\N	\N
18hl4QMrybIXbkGi2BzXcf	Dj Capoeira	\N	\N	\N
0ONHkAv9pCAFxb0zJwDNTy	Pusha T	\N	\N	\N
7kA4sEagpoNK91I7wr9tYr	Bleu Clair	\N	\N	\N
1SImpQO0GbjRgvlwCcCtFo	The Red Jumpsuit Apparatus	\N	\N	\N
1AldSIJ8ANuZVbjKIhpKKq	Carolina Soares	\N	\N	\N
2EhUXeszBQRApbBmTOXlKU	Mestre Acordeon	\N	\N	\N
4CrK2BAeyd3DIt2M2ELPJ4	Raizes da Capoeira II	\N	\N	\N
5CCwRZC6euC8Odo6y9X8jr	Rita Ora	\N	\N	\N
1URnnhqYAYcrqrcwql10ft	21 Savage	\N	\N	\N
7HGNYPmbDrMkylWqeFCOIQ	Caetano Veloso	\N	\N	\N
3qZ2n5keOAat1SoF6bHwmb	Zeca Pagodinho	\N	\N	\N
4kEcRrHPFKoSlsHIhuCN2f	Mestre Capu	\N	\N	\N
1MXZ0hsGic96dWRDKwAwdr	Tyla Yaweh	\N	\N	\N
7oEkUINVIj1Nr3Wnj8tzqr	Gilberto Gil	\N	\N	\N
5rX2c1zow6hCph8PnnU3kF	Astrud Gilberto	\N	\N	\N
1b8kpp4DUwt1hWaxTiWQhD	Gal Costa	\N	\N	\N
2FW6Zt8gyIF7Fb7O3TGxnE	Sambabook	\N	\N	\N
5bUj39bg0zEbRzjUEISMG9	Bernard Herrmann	\N	\N	\N
5MZqcO35TJh5QXaFmvXmUy	The 5.6.7.8's	\N	\N	\N
0Mz5XE0kb1GBnbLQm2VbcO	Mos Def	\N	\N	\N
0av074qUwLn5eyzwqoq3xh	People Under The Stairs	\N	\N	\N
0oXFsuB6XBuDTsXJgplR7k	Souad Massi	\N	\N	\N
2PmIyxmEFsNfQJjEifPDZC	RAT BOY	\N	\N	\N
3Rq3YOF9YG9YfCWD4D56RZ	Nujabes	\N	\N	\N
23cC3RI0hgD5sWmXKPAJuG	Matt Quentin	\N	\N	\N
246dkjvS1zLTtiykXe5h60	Post Malone	87	38661243	https://i.scdn.co/image/ab6761610000e5ebb894ef9fa437b0389c5567cc
25uiPmTg16RbhZWAqwLBy5	Charli XCX	75	2700180	https://i.scdn.co/image/ab6761610000e5eb576cb43281160e345f728b71
4r63FhuTkUYltbVAg5TQnk	DaBaby	81	10220346	https://i.scdn.co/image/ab6761610000e5eb5ace68c56849548db7f102be
64KEffDW9EtZ1y2vBYgq8T	Marshmello	82	34489969	https://i.scdn.co/image/ab6761610000e5eb41e4a3b8c1d45a9e49b6de21
24XtlMhEMNdi822vi0MhY1	Taking Back Sunday	61	761844	https://i.scdn.co/image/ab6761610000e5ebaf5a3cb16e57a2a815a6207d
15UsOTVnJzReFVN1VCnxy4	XXXTENTACION	86	38796938	https://i.scdn.co/image/ab6761610000e5ebf0c20db5ef6c6fbe5135d2e4
5cj0lLjcoR7YOSnhnX0Po5	Doja Cat	86	22762146	https://i.scdn.co/image/ab6761610000e5eb727a2ac15afe659be999beba
1vCWHaC5f2uS3yhpwWbIA6	Avicii	79	22212397	https://i.scdn.co/image/ab6761610000e5eb09bf4814c6585e1f69dfeef7
5yV1qdnmxyIYiSFB02wpDj	The Postal Service	50	518567	https://i.scdn.co/image/034778d5916fdfaacf926d7ec0e7440f717cd064
41rVuRHYAiH7ltBTHVR9We	Slushii	54	637861	https://i.scdn.co/image/ab6761610000e5eb96ff6643a51f35410a1d7fcf
0EeQBlQJFiAfJeVN2vT9s0	Nipsey Hussle	65	2933732	https://i.scdn.co/image/ab6761610000e5ebe9edae8fe232af1d2995c991
0jNDKefhfSbLR9sFvcPLHo	San Holo	56	668721	https://i.scdn.co/image/ab6761610000e5eb9ba8dc387019ab72831ff2b3
7boQqq2hUcz9kHcQOecG4j	Andre Nickatina	49	194264	https://i.scdn.co/image/62613d0f3cb36995b553137326d87980795cad52
5BvJzeQpmsdsFp4HGUYUEx	Vampire Weekend	64	1820593	https://i.scdn.co/image/ab6761610000e5eb44829ac83c4538a8cf7e9f40
4MCBfE4596Uoi2O4DtmEMz	Juice WRLD	88	26300137	https://i.scdn.co/image/ab6761610000e5eb1908e1a8b79abf71d5598944
30U8fYtiNpeA5KH6H87QUV	Dead Kennedys	54	695894	https://i.scdn.co/image/725a76a15036422522a106bf153471a273e5e93f
3TVXtAsR1Inumwj472S9r4	Drake	96	68510833	https://i.scdn.co/image/ab6761610000e5eb4293385d324db8558179afd9
0SwO7SWeDHJijQ3XNS7xEE	MGMT	73	2630408	https://i.scdn.co/image/ab6761610000e5eb089bb3257ef5b3fab2a3c90d
3AA28KZvwAUcZuOKwyblJQ	Gorillaz	79	9474239	https://i.scdn.co/image/ab6761610000e5ebc19b16a0104300245c65c164
5r4anprO9Hg9CBlmdkwFdE	Capoeira Nagô	20	5158	https://i.scdn.co/image/ab67616d0000b27306ca500ac2d0153dc7912275
\.


--
-- Data for Name: artists_genres; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.artists_genres (id, artist_id, genre) FROM stdin;
1	0qu422H5MOoQxGjd4IzHbS	alternative r&b
2	0qu422H5MOoQxGjd4IzHbS	art pop
3	0qu422H5MOoQxGjd4IzHbS	escape room
4	0qu422H5MOoQxGjd4IzHbS	experimental r&b
5	65dGLGjkw3UbddUg2GKQoZ	alternative hip hop
6	65dGLGjkw3UbddUg2GKQoZ	canadian modern jazz
7	65dGLGjkw3UbddUg2GKQoZ	escape room
8	65dGLGjkw3UbddUg2GKQoZ	indie soul
9	4lujUKeO6nQAJXpq37Epn7	funk
10	4lujUKeO6nQAJXpq37Epn7	indie soul
11	4lujUKeO6nQAJXpq37Epn7	soul
12	6ltzsmQQbmdoHHbLZ4ZN25	indie folk
13	6ltzsmQQbmdoHHbLZ4ZN25	stomp and holler
14	0YrtvWJMgSdVrk3SfNjTbx	indie pop
15	0YrtvWJMgSdVrk3SfNjTbx	indie rock
16	0YrtvWJMgSdVrk3SfNjTbx	modern rock
17	0YrtvWJMgSdVrk3SfNjTbx	washington indie
18	0bzfPKdbXL5ezYW2z3UGQj	british soul
19	0bzfPKdbXL5ezYW2z3UGQj	neo soul
20	0bzfPKdbXL5ezYW2z3UGQj	psychedelic soul
21	0bzfPKdbXL5ezYW2z3UGQj	soul
22	3M4ThdJR28z9eSMcQHAZ5G	alternative rock
23	3M4ThdJR28z9eSMcQHAZ5G	garage rock
24	3M4ThdJR28z9eSMcQHAZ5G	modern rock
25	3M4ThdJR28z9eSMcQHAZ5G	rock
26	3M4ThdJR28z9eSMcQHAZ5G	scottish rock
27	30DhU7BDmF4PH0JVhu8ZRg	pop
28	30DhU7BDmF4PH0JVhu8ZRg	r&b
29	360IAlyVv4PCEVjgyMZrxK	dance pop
30	360IAlyVv4PCEVjgyMZrxK	hip hop
31	360IAlyVv4PCEVjgyMZrxK	pop
32	360IAlyVv4PCEVjgyMZrxK	r&b
33	360IAlyVv4PCEVjgyMZrxK	urban contemporary
34	34jw2BbxjoYalTp8cJFCPv	album rock
35	34jw2BbxjoYalTp8cJFCPv	classic rock
36	34jw2BbxjoYalTp8cJFCPv	hard rock
37	34jw2BbxjoYalTp8cJFCPv	heartland rock
38	34jw2BbxjoYalTp8cJFCPv	mellow gold
39	34jw2BbxjoYalTp8cJFCPv	new wave pop
40	34jw2BbxjoYalTp8cJFCPv	rock
41	34jw2BbxjoYalTp8cJFCPv	soft rock
42	5Q81rlcTFh3k6DQJXPdsot	channel islands indie
43	5Q81rlcTFh3k6DQJXPdsot	hyperpop
44	5Q81rlcTFh3k6DQJXPdsot	vapor soul
45	2YZyLoL8N0Wb9xBt1NhZWg	conscious hip hop
46	2YZyLoL8N0Wb9xBt1NhZWg	hip hop
47	2YZyLoL8N0Wb9xBt1NhZWg	rap
48	2YZyLoL8N0Wb9xBt1NhZWg	west coast rap
49	4hz8tIajF2INpgM0qzPJz2	modern rock
50	1Xyo4u8uXC1ZmMpatF05PJ	canadian contemporary r&b
51	1Xyo4u8uXC1ZmMpatF05PJ	canadian pop
52	1Xyo4u8uXC1ZmMpatF05PJ	pop
53	7CyeXFnOrfC1N6z4naIpgo	brill building pop
54	7CyeXFnOrfC1N6z4naIpgo	classic girl group
55	7CyeXFnOrfC1N6z4naIpgo	soul
56	55VydwMyCuGcavwPuhutPL	post-hardcore
57	55VydwMyCuGcavwPuhutPL	screamo
58	08ct2eZF5lUPdJpHwNKWof	mellow gold
59	08ct2eZF5lUPdJpHwNKWof	neo mellow
60	08ct2eZF5lUPdJpHwNKWof	pop rock
61	08ct2eZF5lUPdJpHwNKWof	rock
62	08ct2eZF5lUPdJpHwNKWof	singer-songwriter
63	37w38cCSGgKLdayTRjna4W	alternative rock
64	37w38cCSGgKLdayTRjna4W	art pop
65	37w38cCSGgKLdayTRjna4W	dream pop
66	37w38cCSGgKLdayTRjna4W	melancholia
67	37w38cCSGgKLdayTRjna4W	rock
68	37w38cCSGgKLdayTRjna4W	shoegaze
69	37w38cCSGgKLdayTRjna4W	slowcore
70	4bthk9UfsYUYdcFyqxmSUU	new romantic
71	4bthk9UfsYUYdcFyqxmSUU	new wave
72	4bthk9UfsYUYdcFyqxmSUU	new wave pop
73	4bthk9UfsYUYdcFyqxmSUU	permanent wave
74	4bthk9UfsYUYdcFyqxmSUU	rock
75	4bthk9UfsYUYdcFyqxmSUU	sophisti-pop
76	4bthk9UfsYUYdcFyqxmSUU	synthpop
77	4pejUc4iciQfgdX6OKulQn	alternative metal
78	4pejUc4iciQfgdX6OKulQn	alternative rock
79	4pejUc4iciQfgdX6OKulQn	blues rock
80	4pejUc4iciQfgdX6OKulQn	modern rock
81	4pejUc4iciQfgdX6OKulQn	nu metal
82	4pejUc4iciQfgdX6OKulQn	palm desert scene
83	4pejUc4iciQfgdX6OKulQn	rock
84	4pejUc4iciQfgdX6OKulQn	stoner metal
85	4pejUc4iciQfgdX6OKulQn	stoner rock
86	1eClJfHLoDI4rZe5HxzBFv	australian rock
87	1eClJfHLoDI4rZe5HxzBFv	classic rock
88	1eClJfHLoDI4rZe5HxzBFv	dance rock
89	1eClJfHLoDI4rZe5HxzBFv	funk rock
90	1eClJfHLoDI4rZe5HxzBFv	mellow gold
91	1eClJfHLoDI4rZe5HxzBFv	new romantic
92	1eClJfHLoDI4rZe5HxzBFv	new wave
93	1eClJfHLoDI4rZe5HxzBFv	new wave pop
94	1eClJfHLoDI4rZe5HxzBFv	pop rock
95	1eClJfHLoDI4rZe5HxzBFv	rock
96	1eClJfHLoDI4rZe5HxzBFv	soft rock
97	2iul6etLF5hjjpxo43rzz7	alternative country
98	2iul6etLF5hjjpxo43rzz7	new americana
99	73sIBHcqh3Z3NyqHKZ7FOL	atl hip hop
100	73sIBHcqh3Z3NyqHKZ7FOL	hip hop
101	73sIBHcqh3Z3NyqHKZ7FOL	pop
102	73sIBHcqh3Z3NyqHKZ7FOL	rap
103	4V8LLVI7PbaPR0K2TGSxFF	hip hop
104	4V8LLVI7PbaPR0K2TGSxFF	rap
105	3oDbviiivRWhXwIE8hxkVV	baroque pop
106	3oDbviiivRWhXwIE8hxkVV	brill building pop
107	3oDbviiivRWhXwIE8hxkVV	classic rock
108	3oDbviiivRWhXwIE8hxkVV	psychedelic rock
109	3oDbviiivRWhXwIE8hxkVV	rock
110	3oDbviiivRWhXwIE8hxkVV	sunshine pop
111	6loBF9iQdE11WSX29fNKqY	mellow gold
112	6loBF9iQdE11WSX29fNKqY	new romantic
113	6loBF9iQdE11WSX29fNKqY	new wave
114	6loBF9iQdE11WSX29fNKqY	new wave pop
115	6loBF9iQdE11WSX29fNKqY	soft rock
116	6loBF9iQdE11WSX29fNKqY	synthpop
117	7guDJrEfX3qb6FEbdPA5qi	funk
118	7guDJrEfX3qb6FEbdPA5qi	motown
119	7guDJrEfX3qb6FEbdPA5qi	quiet storm
120	7guDJrEfX3qb6FEbdPA5qi	soul
121	0YHgnSkV3S5mvSSCTRWDi5	deathgrass
122	57bUPid8xztkieZfS7OlEV	brill building pop
123	57bUPid8xztkieZfS7OlEV	classic girl group
124	57bUPid8xztkieZfS7OlEV	disco
125	57bUPid8xztkieZfS7OlEV	funk
126	57bUPid8xztkieZfS7OlEV	motown
127	57bUPid8xztkieZfS7OlEV	quiet storm
128	57bUPid8xztkieZfS7OlEV	soul
129	0X380XXQSNBYuleKzav5UO	alternative metal
130	0X380XXQSNBYuleKzav5UO	alternative rock
131	0X380XXQSNBYuleKzav5UO	cyberpunk
132	0X380XXQSNBYuleKzav5UO	electronic rock
133	0X380XXQSNBYuleKzav5UO	industrial
134	0X380XXQSNBYuleKzav5UO	industrial metal
135	0X380XXQSNBYuleKzav5UO	industrial rock
136	0X380XXQSNBYuleKzav5UO	nu metal
137	0X380XXQSNBYuleKzav5UO	rock
138	5eIbEEQnDM8yuDVB0bimSP	bass trap
139	5eIbEEQnDM8yuDVB0bimSP	edm
140	5eIbEEQnDM8yuDVB0bimSP	electro house
141	5eIbEEQnDM8yuDVB0bimSP	electronic trap
142	5eIbEEQnDM8yuDVB0bimSP	electropop
143	5eIbEEQnDM8yuDVB0bimSP	pop dance
144	5eIbEEQnDM8yuDVB0bimSP	vapor twitch
145	3pkmfqaBNsMqnXus05PNfP	alternative hip hop
146	3pkmfqaBNsMqnXus05PNfP	hip hop
147	3pkmfqaBNsMqnXus05PNfP	turntablism
148	20wkVLutqVOYrc0kxFs7rA	canadian contemporary r&b
149	20wkVLutqVOYrc0kxFs7rA	pop
150	20wkVLutqVOYrc0kxFs7rA	r&b
151	1mFX1QlezK1lNPKQJkhwWb	boy band
152	1mFX1QlezK1lNPKQJkhwWb	contemporary r&b
153	1mFX1QlezK1lNPKQJkhwWb	new jack swing
154	1mFX1QlezK1lNPKQJkhwWb	quiet storm
155	1mFX1QlezK1lNPKQJkhwWb	r&b
156	1mFX1QlezK1lNPKQJkhwWb	urban contemporary
157	0VbDAlm2KUlKI5UhXRBKWp	indie soul
158	0VbDAlm2KUlKI5UhXRBKWp	vapor soul
159	7KGqvFukcZRbQ7YFsYrgPa	soft rock
160	6PEMFpe3PTOksdV4ZXUpbE	hip hop
161	6PEMFpe3PTOksdV4ZXUpbE	indie soul
162	6PEMFpe3PTOksdV4ZXUpbE	neo soul
163	6PEMFpe3PTOksdV4ZXUpbE	underground hip hop
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.features (track_id, danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, time_signature, duration_ms) FROM stdin;
1Kjw0LwdniCWran4PxJqPQ	0.506	0.746	7	-7.385	0	0.0307	0.00183	0	0.109	0.299	130.996	4	305507
1I40L32fTSSkBkPeArX9Ul	0.619	0.381	11	-10.691	0	0.0523	0.471	0.0318	0.101	0.312	139.929	4	273864
5fBjPtOxhgdpU6LNWLyVHv	0.599	0.377	7	-9.829	1	0.105	0.441	0.00813	0.105	0.543	74.314	4	213137
4FE9SgxcOoCNuGnaaU8TXz	0.686	0.413	6	-6.332	0	0.0263	0.103	0.115	0.122	0.595	95.989	3	311227
4FF4q2qyOsFhRavZ0bdVXT	0.597	0.0958	2	-17.319	1	0.0329	0.775	0.0188	0.11	0.0961	77.681	3	221693
0qprlw0jfsW4H9cG0FFE0Z	0.489	0.404	8	-7.815	1	0.0261	0.487	0.0485	0.14	0.153	108.01	4	597600
3jp7Ryj1sX3riA7NQaVlLd	0.599	0.691	4	-4.571	1	0.0301	0.0489	0	0.0835	0.729	131.578	4	215853
2I88NEWpKrAPZuapXNV5G6	0.605	0.553	10	-10.845	0	0.101	0.274	0.0152	0.184	0.62	152.076	4	185617
6YZQx90VEuzf0lRY9TYh7j	0.673	0.596	11	-6.489	0	0.0438	0.316	1.88e-05	0.107	0.22	75.022	4	226720
54b8qPFqYqIndfdxiLApea	0.418	0.452	1	-13.099	1	0.0356	0.638	0.00026	0.0959	0.168	175.088	4	218733
3sTN90bIP2cJ1783ctHykO	0.625	0.763	8	-4.997	0	0.129	0.147	0.0106	0.214	0.721	88.753	4	192160
2P3SLxeQHPqh8qKB6gtJY2	0.779	0.572	6	-9.985	0	0.378	0.157	0	0.246	0.647	135.956	4	300160
474uVhyGgK5MtY9gMcDgGl	0.744	0.516	2	-6.365	1	0.0513	0.632	0	0.605	0.281	97.944	4	152293
16ro1is6DmDKkarlJMBbzV	0.727	0.48	5	-9.278	0	0.0987	0.444	0	0.118	0.369	120.025	4	269053
4frLb7nWtsz2ymBE6k2GRP	0.659	0.291	2	-8.275	0	0.0348	0.405	0	0.0771	0.406	119.829	3	277680
2G2YzndIA6jeWFPBXhUjh5	0.511	0.769	4	-7.032	1	0.042	0.181	0	0.0921	0.818	129.657	4	160907
5jZ1Z2GFTf2gwmFc3qiUxs	0.541	0.904	7	-3.001	1	0.0435	0.00143	0	0.193	0.541	98.122	4	208693
5vyt44455ipNNVSYq8fYY7	0.789	0.593	5	-7.877	0	0.0582	0.383	1.29e-06	0.191	0.293	109.952	4	163747
1OFKUn2VLafrHj7ybnap0Q	0.49	0.873	6	-5.861	1	0.0355	0.107	5.19e-06	0.118	0.513	103.272	4	229587
21oJ1K99GBJrE2GVQGVjA0	0.486	0.419	5	-6.415	1	0.0563	0.741	6.59e-05	0.096	0.227	119.065	3	244910
1LzNfuep1bnAUR9skqdHCK	0.42	0.33	9	-13.925	1	0.0275	0.245	0.000679	0.0677	0.175	157.143	3	295600
748yv6bb3l3CcKS45a6SZ8	0.602	0.839	4	-4.251	0	0.0255	0.502	0.00128	0.095	0.653	95.159	4	256147
6NvRxjfYkkT2SpirAlmsjH	0.507	0.588	0	-4.881	1	0.0641	0.0359	0.000129	0.373	0.637	170.889	4	278707
0hJS3EHWC4uL9sJ52ErpoN	0.799	0.497	4	-6.57	1	0.141	0.0745	1.28e-05	0.174	0.488	115.157	4	192013
1ZaNp6b4cY3zcrciagi7td	0.376	0.537	9	-8.492	1	0.0801	0.89	0	0.905	0.256	75.496	4	355733
1qQSRy9DjrGh3jtsSCU6B1	0.665	0.686	0	-5.849	1	0.0268	0.0518	0.000176	0.174	0.275	96.848	3	185694
3s8MBOMdUi5Vol77qq8KJJ	0.351	0.467	9	-10.196	0	0.0568	0.69	8.75e-06	0.0904	0.184	158.203	4	245013
4j3GWI86JvSaF0BLdmgcfF	0.76	0.579	0	-7.374	1	0.0567	0.0127	0.00344	0.106	0.129	100.011	4	213600
4f8Mh5wuWHOsfXtzjrJB3t	0.826	0.579	8	-8.241	0	0.0801	0.00881	0	0.129	0.431	121.075	4	212013
6VojZJpMyuKClbwyilWlQj	0.385	0.657	5	-6.975	1	0.0342	0.724	0	0.105	0.672	124.895	4	153867
1TDdYSYLIXMJ4EiKO6ZCYk	0.691	0.482	7	-10.954	1	0.201	0.623	0.00671	0.208	0.433	160.072	4	154213
1RbOObDFn7GOseR1w529Zj	0.752	0.743	7	-6.083	1	0.0331	0.0314	0.000117	0.128	0.832	108.254	4	235827
0Hw6SCrtU9pFCjgAONpnGZ	0.593	0.642	5	-9.894	0	0.0304	0.186	0	0.129	0.919	133.281	4	174400
0S29RwGLJutn4qnFJQL13n	0.48	0.621	10	-6.938	1	0.0345	0.345	0.014	0.255	0.633	175.954	4	204323
5SCB7L1alKg7ZEeSw7Sq9f	0.521	0.606	10	-7.817	0	0.0277	0.322	0.000257	0.0888	0.433	70.38	4	162533
3aN2V18W3EiW7eg5tHALpF	0.551	0.683	0	-7.308	1	0.0345	0.000297	0.305	0.105	0.179	100.03	4	436000
5hVghJ4KaYES3BFUATCYn0	0.554	0.498	9	-8.866	1	0.0685	0.23	5.98e-06	0.795	0.413	79.635	4	190067
6fc51JZVE0Yijdi6RuoLFv	0.754	0.405	7	-11.547	1	0.0378	0.466	0.00179	0.1	0.0843	114.938	4	213973
3zJ5RDG0bLQAV2rntFgUtb	0.643	0.773	1	-7.998	1	0.0414	0.188	0.000412	0.0986	0.653	124.538	4	249333
6iGU74CwXuT4XVepjc9Emf	0.521	0.487	6	-7.525	0	0.0299	0.253	0	0.0579	0.483	117.072	4	173040
7wdzLe2Gsx1RGqbvYZHASz	0.755	0.884	10	-5.296	0	0.0638	0.0208	2.97e-06	0.248	0.897	121.927	4	231933
3imS277wRbz1CFoDySgTff	0.49	0.629	2	-4.072	0	0.0399	0.0732	0	0.0957	0.3	74.967	4	201600
3mT1AONeTJDi1k8vH8pA2L	0.705	0.479	5	-9.217	0	0.0767	0.499	0.000425	0.114	0.431	80.009	4	324067
7Cu2COdH93MnuireuKNiS3	0.41	0.298	3	-11.796	1	0.0473	0.721	0	0.158	0.142	109.651	3	246972
7JmPqImeW3kLoYVNBA9v11	0.588	0.856	5	-12.418	0	0.0378	0.0915	2.62e-05	0.365	0.781	97.968	4	309840
2aCKBrLn7rbhStk5k4FwnF	0.371	0.613	7	-6.685	0	0.0452	0.0589	0	0.0479	0.873	203.732	4	156440
0vJvCnuxXL2BCSRa1ZoeNl	0.399	0.163	3	-16.436	0	0.0382	0.963	0.00132	0.0885	0.242	94.011	3	199654
1zkkvSLk5Nh4uoyKWwuie9	0.564	0.294	7	-8.885	0	0.0349	0.636	0	0.0982	0.213	149.98	4	174387
62wdQ5CInFr7cjISqrr46f	0.508	0.325	2	-11.627	1	0.037	0.96	0.00259	0.188	0.274	92.187	4	250533
3iVp14VoAsAZkIdgQoRRAb	0.353	0.748	0	-5.984	1	0.246	0.565	7.86e-06	0.551	0.287	137.856	3	165627
63k361zOGEhmvgzBdzzSGP	0.512	0.614	6	-14.368	1	0.0292	0.104	0.738	0.252	0.965	168.071	4	117173
04M3DsiMNyn8s5XQJrW5sL	0.631	0.277	5	-10.985	1	0.0537	0.772	0	0.114	0.214	114.765	4	237493
5rfT032kGmLvbxZzfHlu5D	0.271	0.714	7	-5.124	1	0.0329	0.392	0	0.115	0.239	94.158	3	202347
5zzWx7oJ9zBmv76uFaFeYR	0.763	0.599	9	-8.285	0	0.0417	0.0856	0.00678	0.113	0.306	110.098	4	229653
2pA4ip3VIEVcIa3qE02oAX	0.568	0.578	6	-5.589	1	0.0404	0.00694	0.000353	0.099	0.555	139.951	4	174693
1k7aPYyAnNTjVbjw1YDNp1	0.621	0.427	11	-11.464	0	0.0733	0.79	0	0.189	0.275	150.037	4	196573
41xaZ4WLlKD95U5PknoJrV	0.678	0.81	7	-5.665	1	0.279	0.0635	3.8e-06	0.0343	0.804	74.964	4	172467
33vFhGNZa44VJ0I21AOGYe	0.758	0.551	0	-8.879	1	0.0732	0.604	0.000663	0.104	0.365	114.892	4	109227
03v70ZBxmcPX3RWAZMzqaW	0.644	0.478	11	-6.469	1	0.0529	0.194	0.00376	0.106	0.496	159.898	4	190253
1RzgWAFlI6KOenjOxJYcH0	0.501	0.477	6	-9.507	1	0.217	0.987	0.803	0.154	0.0897	106.595	3	127640
2OeL43EXwaC205Xr1da1qJ	0.411	0.096	10	-17.007	1	0.0588	0.863	0.000245	0.117	0.198	91.91	4	242227
5CU1bbfY1wUPm7fU255Dhf	0.407	0.519	5	-6.47	1	0.0336	0.11	0.889	0.409	0.342	94.001	4	120427
0dqJjKKxuKD5Dt3QH2n4CG	0.426	0.634	4	-7.116	1	0.0341	0.404	0.00356	0.222	0.284	98.925	4	257693
5C90m8eM6GJR2SACiLAWHo	0.786	0.607	2	-7.992	0	0.0517	0.114	0.372	0.104	0.56	125.811	4	197773
4Fc62OkXYtEOjMmaSyJoQY	0.544	0.625	10	-6.797	0	0.0342	0.00384	0.00657	0.0889	0.43	75.243	4	210080
244QS6446wyO1UfVTWlOlR	0.266	0.426	9	-9.114	1	0.0364	0.0911	0.16	0.181	0.236	101.249	4	178307
5L7IgwUPhir2FJftGNXJDW	0.632	0.556	1	-8.851	1	0.12	0.721	0	0.0995	0.385	78.603	4	219696
35mL8keNDi2VLHrFXZCgJR	0.699	0.458	0	-12.357	1	0.106	0.372	1.33e-06	0.111	0.269	129.991	4	221546
50bmpfgcV29ouRVDfr5wOc	0.466	0.302	9	-10.334	0	0.0509	0.388	0	0.262	0.298	131.951	4	215427
5IRdIQNIZzVqE4XyBylkvd	0.595	0.537	9	-7.666	1	0.0325	0.108	0.00511	0.11	0.217	129.764	4	249147
5do7Ql6G8N03fY6G9Y08Ec	0.725	0.362	7	-12.424	1	0.0643	0.84	0.181	0.106	0.249	119.938	4	231907
0ZAbupc7jAQpG9IxojQ3s3	0.822	0.362	2	-7.462	1	0.0411	0.16	0	0.313	0.159	119.903	4	229667
6MDijuuArPJv1vbp7K1x3f	0.688	0.847	10	-3.238	0	0.0508	0.04	2.81e-06	0.598	0.453	93.979	4	212147
0b2vqB7QNT4z8nnaYqbuel	0.692	0.391	9	-9.073	1	0.0338	0.00563	0.000397	0.0983	0.387	95.022	4	220453
47KDDZgFiX1w6RFOuLXsSn	0.564	0.354	7	-10.85	1	0.0334	0.73	3.43e-06	0.208	0.423	98.075	3	240587
3LcjZGk0GBlPRe5XhYVGgM	0.624	0.726	2	-4.585	1	0.052	0.0298	0	0.301	0.83	99.996	4	213720
37ZvpHeZKazqOnLfAGm9nb	0.624	0.476	4	-10.993	1	0.0416	0.0238	0.141	0.0997	0.184	119.968	4	206627
0JXXNGljqupsJaZsgSbMZV	0.684	0.607	11	-8.127	0	0.1	0.0267	0.000307	0.191	0.498	81.001	4	195373
3banchOoe2giyRK0jaO1c7	0.718	0.327	9	-7.602	0	0.0292	0.776	2.05e-05	0.088	0.507	82.582	4	201000
27AG99NmWMFLRoyZMMPNW2	0.342	0.613	7	-4.084	1	0.0311	0.705	0	0.14	0.267	145.84	4	266107
7trx783SvnHhKkmgSSTIFJ	0.554	0.337	1	-10.189	1	0.0351	0.581	0	0.0871	0.216	89.961	4	343485
7l5j3FapCyr6HxUgoAynM2	0.576	0.535	9	-8.392	1	0.041	0.588	0.0106	0.31	0.196	139.939	4	280074
5VA4Ispp52EA1sOqzMz3Av	0.776	0.603	5	-5.696	1	0.0343	0.0728	6.25e-05	0.111	0.921	96.888	4	295920
7qHoVZ6076OGx18G6W5vQ9	0.753	0.18	7	-13.618	1	0.0566	0.975	0.00266	0.111	0.187	114.891	4	196453
4hv7GT5g9qNnrxlocsOSYt	0.554	0.56	4	-4.824	0	0.0415	0.142	0	0.104	0.0786	131.206	4	233707
4PFiLGx8jAzcAJxwPLUeZ9	0.483	0.275	0	-13.609	1	0.0418	0.232	0	0.125	0.31	138.063	3	240800
1ULovMYbbglXIn9TQzMsKz	0.219	0.827	5	-5.395	1	0.123	0.0477	0	0.135	0.121	131.7	4	186280
4isk4UYRcmslphcTq61xUg	0.372	0.641	9	-4.819	0	0.149	0.216	0	0.114	0.647	67.82	4	226360
5WoaF1B5XIEnWfmb5NZikf	0.674	0.506	6	-10.532	1	0.0434	0.173	0	0.0866	0.183	145.965	4	259333
7sf0tmuGZlHXUWpi9dQqcw	0.67	0.735	0	-6.712	1	0.0645	0.108	0.00042	0.251	0.498	112.52	4	315933
5p0bEz7DNsULez2X9yrNGa	0.79	0.737	8	-7.92	1	0.0284	0.0236	0.0149	0.114	0.693	119.001	4	168187
1dxXQuExRVu77xF1r5YtRF	0.518	0.757	6	-8.584	0	0.0555	0.000777	0.00931	0.115	0.189	129.901	4	130107
3Pu3IChaAoa5EjgUBv5F6x	0.644	0.799	4	-10.856	0	0.0598	0.0821	0.00154	0.055	0.889	108.381	4	246573
0wejso6CHHEEqvTD3f3gBz	0.544	0.369	10	-9.617	1	0.0319	0.527	0.000189	0.101	0.105	144.073	4	246080
23od4rorIdhvYeLL7YqP9n	0.641	0.507	9	-11.326	1	0.027	0.167	0.424	0.095	0.312	114.99	3	315427
2I3ZdIFXnRn1PSAdMC4w71	0.553	0.526	2	-11.51	1	0.0257	0.368	9.81e-05	0.288	0.582	83.99	4	218947
5eKfpH2dQ7FltCqb7LWEGJ	0.464	0.334	6	-12.916	1	0.0313	0.307	0.247	0.11	0.326	165.278	4	328933
7Cva2EgJougx6O6M5xgWAq	0.62	0.773	2	-8.324	1	0.0382	0.0741	0.000606	0.158	0.934	157.991	4	226320
7KR5uycb8gfQYRl1MTL8aB	0.47	0.696	2	-8.996	0	0.0347	0.00128	0.000168	0.098	0.263	156.916	4	264960
7xjbn0bhs7zx7E1s0lCqT3	0.619	0.578	7	-8.829	1	0.0738	0.0185	3.11e-05	0.139	0.556	144.986	5	245427
72dIN8F7D5ydB3auSqNi84	0.449	0.357	1	-8.48	1	0.0266	0.0605	0.483	0.105	0.178	66.979	4	419093
4oB0d8H93GtllDkoHNuLIN	0.361	0.454	0	-8.494	1	0.0305	0.0931	0.00146	0.0737	0.298	124.899	4	234933
0vF9RAGwgYtfO1Aajwb7et	0.505	0.879	1	-6.078	1	0.0354	0.00011	0.49	0.579	0.338	112.021	3	275973
10fiZCExnOMqElSX952WZI	0.42	0.582	8	-7.53	1	0.0383	0.00112	0.117	0.0866	0.248	127.272	4	293920
1AR58rtcLziNnRHTCmCywd	0.537	0.784	9	-7.78	1	0.0425	0.00694	6.99e-05	0.298	0.395	78.053	4	211680
3Cx9j78Z0NE6jYwBWvvV3P	0.925	0.229	4	-9.68	1	0.445	0.579	0.00578	0.116	0.168	104.273	4	140227
3EytfC22ikoXM921cJbejn	0.394	0.689	9	-6.648	1	0.0385	0.00119	0.0131	0.176	0.457	180.111	3	273067
3s5N94NsDYcOqgi7cSakv6	0.431	0.806	1	-6.852	0	0.0384	0.00318	0.45	0.124	0.171	127.854	4	266760
4J6JARDGkdc1fqLEflP94Z	0.303	0.344	6	-11.919	0	0.0327	0.817	0.0512	0.118	0.164	154.572	3	278200
4ZTl5GUAmO49b2cf6jovqx	0.538	0.67	6	-8.548	1	0.0374	0.00391	0.0691	0.116	0.33	120.053	5	312413
5avF5IwDg2v1QCxPvX9Fru	0.368	0.0212	5	-20.06	1	0.046	0.918	0.000509	0.111	0.197	144.828	3	252947
4TIJ7zSBNejpoIPaWpWRKc	0.53	0.864	4	-4.948	0	0.061	0.000753	0.000459	0.354	0.484	166.312	4	288533
56KqaFSGTb7ifpt16t5Y1N	0.797	0.872	9	-6.727	0	0.0575	0.291	0	0.284	0.866	129.885	4	222427
21YxK0klhpfLW8budkJaMF	0.383	0.97	9	-5.638	1	0.0435	0.0276	0	0.0942	0.62	101.603	4	313926
29iwiYD3KVWBKxe31nGjEL	0.56	0.941	10	-6.173	1	0.0849	0.255	0.0019	0.153	0.822	165.058	4	190693
3YZa4IzxK2UtEKTvdTgsi8	0.455	0.883	2	-9.159	1	0.0384	0.368	0	0.277	0.782	142.638	4	208413
5El6bpLd8nYPsvWgZLdHio	0.562	0.809	0	-6.791	1	0.0385	0.0276	0.23	0.11	0.451	174.527	4	268773
7xENAAODeE2hKzdWFI6YaB	0.269	0.387	6	-13.482	0	0.0382	0.44	0.895	0.126	0.0494	84.823	4	90480
0WQiDwKJclirSYG9v5tayI	0.523	0.769	4	-5.855	1	0.0269	0.04	0	0.136	0.876	136.162	4	244587
0ncGfTV06HogJIgn2Ujjgb	0.549	0.657	3	-7.924	1	0.0264	0.0502	1.67e-05	0.35	0.641	82.033	4	212867
14z3RzUHeZQgtpOlSYvmZD	0.471	0.758	7	-8.308	0	0.0401	0.0317	0.514	0.199	0.558	125.791	4	408827
0VjIjW4GlUZAMYd2vXMi3b	0.514	0.73	1	-5.934	1	0.0598	0.00146	9.54e-05	0.0897	0.334	171.005	4	200040
1cKHdTo9u0ZymJdPGSh6nq	0.323	0.737	10	-4.008	1	0.0338	0.142	0.000162	0.163	0.155	113.26	4	241067
7MXVkk9YMctZqd1Srtv4MB	0.679	0.587	7	-7.015	1	0.276	0.141	6.35e-06	0.137	0.486	186.003	4	230453
09mEdoA6zrmBPgTEN5qXmN	0.461	0.593	1	-4.954	1	0.0356	0.17	0	0.307	0.175	134.17	3	228373
5QO79kh1waicV47BqGRL3g	0.68	0.826	0	-5.487	1	0.0309	0.0212	1.24e-05	0.543	0.644	118.051	4	215627
2LBqCSwhJGcFQeTHMVGwy3	0.586	0.525	1	-7.163	0	0.0615	0.111	0	0.134	0.508	133.629	4	260253
7fBv7CLKzipRk6EC6TWHOB	0.585	0.564	0	-7.063	0	0.0515	0.0671	0	0.135	0.137	113.003	4	242253
2vXKRlJBXyOcvZYTdNeckS	0.658	0.671	2	-12.21	1	0.0363	0.0933	0.000927	0.115	0.166	100.966	4	202093
5gDWsRxpJ2lZAffh5p7K0w	0.715	0.47	5	-12.638	0	0.0772	0.353	0.0923	0.104	0.426	89.965	4	111627
1oFAF1hdPOickyHgbuRjyX	0.65	0.825	0	-4.645	1	0.0325	0.0215	2.44e-05	0.0936	0.593	118.091	4	191014
1wtOxkiel43cVs0Yux5Q4h	0.663	0.319	9	-13.481	1	0.0375	0.69	0.000993	0.117	0.193	109.957	4	256124
1Ist6PR2BZR3n2z2Y5R6S1	0.566	0.647	1	-6.815	0	0.0335	0.0477	0	0.121	0.22	111.96	4	264773
2nMeu6UenVvwUktBCpLMK9	0.324	0.416	11	-8.92	0	0.0368	0.262	3.69e-05	0.11	0.151	113.986	4	236053
0Oqc0kKFsQ6MhFOLBNZIGX	0.641	0.559	7	-11.132	0	0.0355	0.404	0.00402	0.0937	0.523	144.982	4	202193
1NZs6n6hl8UuMaX0UC0YTz	0.404	0.664	1	-6.698	1	0.0407	0.542	0.00402	0.11	0.0949	107.747	4	351640
5Y6nVaayzitvsD5F7nr3DV	0.527	0.591	6	-7.664	0	0.0396	0.194	0.0194	0.0907	0.461	123.167	4	256760
3lG6OtGDsYAOALxEmubQQm	0.467	0.119	2	-10.99	1	0.0401	0.969	1.4e-06	0.0973	0.156	70.499	4	272485
2mdEsXPu8ZmkHRRtAdC09e	0.294	0.337	6	-10.614	0	0.036	0.814	0.414	0.14	0.135	91.781	5	300683
1KuVEZR4xuQVNr1KkanAV4	0.255	0.468	7	-6.43	0	0.0317	0.822	0.248	0.339	0.175	111.67	4	181960
3RIgHHpnFKj5Rni1shokDj	0.215	0.203	5	-12.65	1	0.0346	0.968	0.0585	0.0923	0.143	78.287	1	248934
1eUGmzzvahJjOSWgDHuRlv	0.372	0.239	6	-11.314	0	0.0296	0.856	0.000175	0.168	0.127	113.451	4	102813
22pjmqZq2oTZtEThEt66Zn	0.638	0.875	2	-6.222	1	0.0413	0.0239	0.0149	0.119	0.251	121.035	4	199091
25cUhiAod71TIQSNicOaW3	0.625	0.576	11	-5.693	0	0.175	0.0543	4.07e-05	0.187	0.235	179.063	4	193147
1m8WpLYXEiNVZchsWEcCSy	0.461	0.653	6	-8.617	1	0.327	0.158	0	0.197	0.588	81.628	1	322000
3lB0GMiI5KxDbTOG8V3bOx	0.529	0.894	2	-3.599	1	0.0412	0.308	5.38e-06	0.254	0.543	108.024	4	253347
6xTU6B6nFwKKTSZ9ySXS80	0.689	0.505	0	-6.389	1	0.0933	0.158	0	0.138	0.312	99.017	4	217293
5ctk3VJoHoURSiwkCJn2bf	0.379	0.608	0	-7.011	0	0.134	0.00311	0.000614	0.248	0.241	81.822	4	272987
0HsGh7cboYz6cVMIyFrQ8j	0.679	0.63	2	-6.83	1	0.158	0.758	7.06e-05	0.111	0.558	123.082	4	188280
6vyFAHVKIsp3pdyhlOKMAz	0.455	0.525	7	-9.225	1	0.149	0.802	0	0.226	0.383	83.237	4	171025
1wQhpsuVJFxrvESjqUvlkt	0.645	0.591	2	-10.591	1	0.0483	0.679	0.00295	0.136	0.232	129.993	4	291776
7KA4W4McWYRpgf0fWsJZWB	0.558	0.559	6	-9.222	1	0.0959	0.371	7.49e-06	0.109	0.62	78.558	4	180387
0fv2KH6hac06J86hBUTcSf	0.621	0.73	5	-5.414	0	0.107	0.0967	0.000131	0.673	0.464	139.566	4	195320
5TxRUOsGeWeRl3xOML59Ai	0.216	0.497	10	-8.025	1	0.0371	0.128	2.39e-06	0.111	0.313	187.308	3	265480
3jHdKaLCkuNEkWcLVmQPCX	0.596	0.575	11	-8.325	0	0.0514	0.0861	0.000153	0.334	0.34	98.265	3	127921
3S68RFe1lsdCdTMPIMJM3X	0.877	0.56	7	-3.751	1	0.0596	0.00721	1.45e-06	0.0839	0.154	119.971	4	216136
1hz7SRTGUNAtIQ46qiNv2p	0.518	0.492	10	-8.436	0	0.193	0.216	0.0012	0.146	0.471	78.848	4	375387
5B0kgjHULYJhAQkK5XsMoC	0.493	0.653	0	-5.666	0	0.0466	0.269	0	0.511	0.852	142.347	4	121573
3EG9FJ0ToLfgnc1IG2Z1wz	0.468	0.652	0	-4.912	1	0.0722	0.333	0.000318	0.55	0.39	140.223	4	588139
0SA0mMXWh23raZ6xzOCU2V	0.35	0.621	8	-6.495	0	0.233	0.256	3.44e-05	0.613	0.459	83.375	4	253387
2a5qaGUrVHWAIrh0xmTADM	0.573	0.494	7	-8.938	0	0.0735	0.48	0.0259	0.121	0.762	149.883	4	221476
3x8IsQzb1KhPPo6zNGzzL1	0.467	0.257	5	-10.123	1	0.0314	0.775	0	0.118	0.255	106.605	3	228000
6GXbpne1EKdVlYhFazWFs4	0.807	0.63	9	-8.401	0	0.046	0.0589	0.000128	0.104	0.404	127.969	4	172863
3mslSmibP6M7u9RQEOZ2Zh	0.374	0.424	7	-9.012	0	0.0613	0.657	0.000149	0.353	0.296	151.307	4	233853
6E39NM14yu6A6uFjuiQfZt	0.586	0.401	6	-11.063	0	0.223	0.128	0.00472	0.263	0.405	115.951	4	195341
7e1DF2fp2NP2zHlEClZP2z	0.815	0.248	7	-11.901	0	0.193	0.122	0.000403	0.113	0.54	169.946	4	212988
6J4et4u2ECB9AH2QC9B5tg	0.851	0.565	5	-9.43	0	0.102	0.0716	0.000525	0.116	0.551	130.022	4	175938
4SMHL36a0GQKh8ZuE33cby	0.599	0.229	11	-10.219	1	0.0517	0.429	3.26e-05	0.0955	0.446	169.647	3	226554
2YSgnpegXNXgk8UxgG8znT	0.486	0.504	8	-7.591	1	0.0283	0.0453	0.00135	0.695	0.34	89.523	4	321947
7KX65PC1UZuImsUInThbav	0.629	0.58	7	-6.208	0	0.0278	0.357	0.000353	0.436	0.655	110.264	4	210300
46EuzanXhKwIc7755wLAvS	0.524	0.321	9	-11.452	0	0.032	0.702	0	0.124	0.27	85.328	4	212373
7oOEFDLSQscl0uGulnIEmG	0.278	0.494	7	-7.853	0	0.029	0.157	0.000407	0.173	0.527	169.661	4	427093
0f2zcrhhHT59aIGQvRlTZ1	0.684	0.764	6	-5.342	0	0.0254	0.0129	0.000171	0.141	0.944	107.806	4	233413
1WS1Q9G8vj0gPN2aOkZ80A	0.614	0.88	1	-7.643	1	0.257	0.0642	2.6e-06	0.667	0.775	86.98	4	238440
2LUTN2pDXUplYlc7WjE1Mm	0.774	0.419	4	-9.649	0	0.0758	0.539	0.0698	0.029	0.644	118.008	4	291569
5j5RHCFkS5TFLbQRUJ65HH	0.482	0.449	9	-8.418	0	0.0335	0.715	0.0134	0.124	0.132	132.379	4	242760
3aLq93pLZHx25jcFhfbEee	0.398	0.176	2	-8.68	0	0.0311	0.743	0.00509	0.118	0.0691	139.941	4	233053
7qcXUzPwoxSBFxjTbNrV0B	0.299	0.399	10	-12.176	1	0.0376	0.816	0.00117	0.147	0.302	158.253	3	233227
4G9aoDV0KAsAYqTEKY53BF	0.505	0.62	11	-8.635	1	0.0268	0.00154	0.281	0.093	0.255	149.965	4	360213
2i8fcnTT5iItxMNwa8mfr3	0.583	0.45	9	-9.873	1	0.0287	0.778	0.00399	0.139	0.492	95.923	4	148787
5P4zryS2epwU5j5fkmwO8Z	0.698	0.766	5	-5.718	1	0.0509	0.0376	0.0104	0.096	0.692	113.006	4	195748
5S67wnJOMjuySVEu4ssCof	0.719	0.718	11	-5.482	1	0.0426	0.331	4.39e-05	0.107	0.91	113.965	4	223840
5qVVPptGHVCPMci6NCbLCq	0.689	0.54	9	-9.878	1	0.0478	0.317	0.0122	0.129	0.474	120.083	4	249773
1fOc4Kf82a6J1C9gS5sE0d	0.373	0.469	0	-7.282	1	0.0415	0.00591	0.00887	0.0656	0.22	150.74	3	360829
0PbOwOT7vjiO0NiI8D31XH	0.749	0.659	4	-7.617	0	0.0278	0.139	0.000447	0.0716	0.93	91.199	4	183440
7a5xvCgoD8qFEQmO8Jjvtf	0.715	0.6	5	-7.728	0	0.0264	0.0714	0.00165	0.0876	0.77	86.989	4	202492
0LHm5xYhzH6ZfmTVJ6LWpR	0.72	0.759	0	-7.774	1	0.0804	0.0371	0.0228	0.101	0.61	101.317	4	172559
4ml0940tmn92PzmkSb2lwU	0.769	0.71	9	-5.223	0	0.0745	0.0884	0.0561	0.0678	0.64	88.788	4	191553
6ZWDOwh9OO57DaO0ROHIHO	0.716	0.545	8	-8.444	0	0.0515	0.0675	0.17	0.0671	0.552	96.47	4	181362
2aWr9QRr0pSmYFH04zngiP	0.631	0.726	5	-6.079	1	0.0296	0.16	9.6e-05	0.11	0.623	87.067	4	222371
3F4WWA3JqsX2VmvqHywxEA	0.338	0.777	2	-8.936	0	0.0946	0.0324	0.00374	0.193	0.514	77.567	1	191338
2dDR1wNf50GYrWohFnS3Pv	0.535	0.566	3	-7.02	1	0.0375	0.355	0.000545	0.0999	0.508	84.218	3	234799
5nMZwcaQcQCONoiHmov5YT	0.557	0.496	7	-6.335	1	0.0314	0.529	2.18e-05	0.306	0.522	78.37	4	237918
3kZC0ZmFWrEHdUCmUqlvgZ	0.517	0.206	5	-12.233	1	0.0421	0.924	0	0.118	0.489	80.401	4	189187
5yc59J3MR3tVDPTOgwgRI5	0.621	0.853	2	-5.735	0	0.0253	0.0767	3.26e-06	0.0893	0.714	128.142	4	229413
6LNwTodkmxsc2dKRJWQr6y	0.64	0.321	3	-12.581	1	0.0292	0.809	0.00126	0.107	0.356	135.799	4	215920
0PTYTZvNNtlvdOwWRYrbfC	0.423	0.761	6	-6.593	1	0.0278	0.00559	0.000535	0.215	0.781	175.349	4	132507
0DoACS30GwIY6qaFjCMMUz	0.44	0.446	9	-9.928	1	0.031	0.39	0.569	0.179	0.201	127.372	4	475093
0hgEsoAu23ap8V5GFX9Y3i	0.752	0.544	9	-10.373	1	0.0314	0.343	0.0811	0.109	0.723	115.803	4	219267
1crbFuCkGL4kXnAGd63RXq	0.579	0.662	9	-6.885	1	0.0245	0.000625	3.89e-06	0.117	0.574	102.951	4	203733
6p8ZhmQS4fia0j93S2M3Fj	0.483	0.436	8	-8.734	1	0.0389	0.663	0.000586	0.103	0.241	171.842	4	264160
0QZ5yyl6B6utIWkxeBDxQN	0.545	0.366	2	-9.51	1	0.0378	0.969	0.267	0.641	0.1	86.997	3	208212
4yyg2J2uXOjCtCyT64984C	0.555	0.584	4	-8.667	1	0.0301	0.274	0.0228	0.254	0.41	120.965	4	284147
5JVlz4JCy3cv8pZB12sKJL	0.417	0.362	9	-11.109	1	0.0409	0.974	0.172	0.631	0.12	174.004	3	209081
1bqrRn1pJWowNLA5N9L6uW	0.543	0.925	6	-6.783	0	0.0448	0.392	0.456	0.0668	0.594	80.499	1	262209
7xQg5QTx8eiQnsxEnfynPh	0.44	0.269	5	-10.769	1	0.0262	0.914	0.261	0.132	0.138	103.877	3	234383
6gdCb962lq0Xdg7ypVLuLt	0.417	0.285	2	-11.041	1	0.0346	0.803	0.005	0.269	0.243	120.954	1	346373
0zCckv4tx3KzJ5GGTRbbLf	0.484	0.74	0	-6.671	1	0.029	0.257	0.000105	0.0999	0.393	84.956	4	270667
0JfpIwZfcRwDzD6GRYzfKN	0.507	0.715	7	-5.93	0	0.0267	0.576	0.00416	0.155	0.793	76.01	4	220738
4UGoW08gaqIEWNTam1UNen	0.47	0.548	9	-7.227	1	0.0271	0.77	0.0014	0.123	0.186	137.084	4	224062
02VBYrHfVwfEWXk5DXyf0T	0.586	0.616	5	-7.964	1	0.0324	0.182	0	0.0927	0.719	148.088	4	242096
3xVZYkcuWalGudeKl861wb	0.627	0.618	2	-8.529	1	0.0437	0.0558	0	0.351	0.848	82.03	4	197443
1l4iQsOZ5sOXZPMQLvouaB	0.701	0.875	11	-4.1	1	0.0757	0.0262	7.32e-06	0.137	0.84	111.976	4	166720
7jvCeWOSnJs2N3spqobWnO	0.708	0.598	5	-8.365	1	0.0291	0.037	0	0.17	0.698	112.027	4	203123
3MlQPB0wJuopo3NTZGlMpI	0.62	0.396	1	-15.498	0	0.206	0.735	0.000985	0.0976	0.774	87.865	4	201027
3jiKUMXqwEodB7gVv1RMZU	0.651	0.703	0	-8.958	0	0.0816	0.0297	0	0.0608	0.647	140.051	4	249444
3a6FcTyvSf0ED3VXeH3PJ5	0.783	0.627	2	-8.521	1	0.102	0.00756	0	0.0606	0.48	100.025	4	219389
2JUQ7mV1AHk2owXLydmN4Z	0.711	0.605	6	-9.801	0	0.031	0.0396	2.29e-05	0.104	0.807	140.981	4	307014
2K6vUau7bnZUamjbRSOOvJ	0.836	0.622	1	-11.003	1	0.0946	0.00269	0.000566	0.335	0.892	102.015	4	165001
276zciJ7Fg7Jk6Ta6QuLkp	0.841	0.898	8	-7.135	1	0.104	0.271	0.0151	0.304	0.931	98.401	4	169727
3hhbDnFUb2bicI2df6VurK	0.635	0.184	8	-10.785	1	0.0456	0.665	0	0.146	0.177	128.424	4	240200
24ntSW3QVJzR79lHAAOTaY	0.636	0.634	7	-10.01	1	0.0342	0.0364	0.147	0.0998	0.599	111.563	4	252812
3V0nnQhqvbE3JmiDdnzQFQ	0.708	0.211	9	-9.603	0	0.0424	0.853	0	0.131	0.362	72.5	4	152280
1Omt5bfz1tZUCqd26HxbS0	0.581	0.687	6	-5.4	1	0.105	0.229	0	0.109	0.187	76.014	4	240600
65GbQI9VDTs7vo6MJL2iJA	0.424	0.465	6	-6.595	1	0.0297	0.461	5.52e-05	0.154	0.462	112.418	3	206387
3dvXRk7TZ929m21p49RR5P	0.593	0.576	2	-10.331	1	0.032	0.526	0.718	0.0827	0.559	109.935	4	310554
2DccHqTquzubziHAPZRdct	0.732	0.734	7	-10.574	1	0.0541	0.0777	0.172	0.327	0.687	104.764	4	274391
1EUOby36hEzSkTVVKRAWQP	0.675	0.28	3	-11.854	1	0.0632	0.594	0.00916	0.109	0.218	129.942	4	190433
7FxzgizJRGTQ3fxUqfvljg	0.783	0.629	5	-6.152	0	0.0607	0.231	0.000536	0.0881	0.7	111.978	4	207307
7pnVHbcqbmP7LA1ey3ydvu	0.667	0.556	5	-8.921	0	0.0306	0.0591	0.0108	0.0972	0.692	132.83	4	314684
3zBhihYUHBmGd2bcQIobrF	0.769	0.367	2	-11.226	1	0.0312	0.684	1.62e-05	0.081	0.535	103.621	4	163756
1aj4GXfmEYXfdVZohCpNKu	0.883	0.464	10	-11.251	1	0.0591	0.279	1.51e-05	0.0744	0.925	111.548	4	172333
7FXuCkl1kfxwS5icDjTwbM	0.666	0.55	10	-8.672	1	0.0612	0.573	1.84e-06	0.122	0.961	95.552	4	141000
4skknrc3sJqaPTtUr2cwFq	0.403	0.284	10	-14.014	1	0.0338	0.798	0	0.142	0.686	176.537	3	154533
36AlMHDBFwSsD3FQOy1R81	0.587	0.133	9	-15.151	0	0.0565	0.186	2.26e-05	0.258	0.068	102.938	4	201733
5zQyqgNXKzhifkivumzxDS	0.74	0.322	0	-9.26	1	0.0399	0.551	0.000763	0.17	0.629	102.889	4	175853
4pdLyulbYLCrPmDzWWeJIZ	0.499	0.246	9	-12.806	1	0.0325	0.7	0.00227	0.0965	0.152	148.468	3	181667
16dz1n3ctolQbuZPtvHVqH	0.588	0.611	11	-9.088	1	0.0311	0.197	8.79e-05	0.0518	0.937	149.141	4	139493
3p6keDkfLYYpuAdvv1Ktsh	0.473	0.421	3	-10.234	0	0.0558	0.757	0	0.145	0.682	161.584	3	144373
7ycWLEP1GsNjVvcjawXz3z	0.854	0.569	5	-8.151	0	0.106	0.0609	0.0816	0.1	0.294	80.015	4	205040
2aPTvyE09vUCRwVvj0I8WK	0.721	0.707	6	-6.364	1	0.0595	0.181	3.68e-06	0.143	0.743	125.005	4	158206
2N3U8uTYhjX2KwGT0pf5x0	0.394	0.661	4	-8.684	1	0.192	0.00996	0	0.343	0.335	149.818	4	260987
4X5f3vT8MRuXF68pfjNte5	0.853	0.693	1	-6.87	1	0.275	0.0239	0	0.11	0.662	95.967	4	233787
7zjEyeBsaw9gV0jofJLfOM	0.767	0.313	7	-12.059	1	0.0798	0.838	0	0.105	0.765	82.582	4	210907
4S7YHmlWwfwArgd8LfSPud	0.598	0.252	2	-15.086	1	0.0644	0.194	0.133	0.0992	0.0352	120.064	4	238307
1jzIJcHCXneHw7ojC6LXiF	0.538	0.612	2	-6.02	1	0.424	0.308	0	0.213	0.684	168.197	4	182493
2gAGWaK4wvt2xrFUlR4mK8	0.284	0.803	2	-5.293	0	0.173	0.302	0	0.242	0.553	67.536	4	323960
1j6kDJttn6wbVyMaM42Nxm	0.485	0.72	6	-5.991	1	0.127	0.0123	0	0.0546	0.0471	207.982	4	126960
1AqemxWsT0iGg5Lvkm16Bt	0.798	0.412	2	-9.305	1	0.36	0.443	7.43e-05	0.219	0.304	135.959	4	192973
7KXjTSCq5nL1LoYtL7XAwS	0.908	0.621	1	-6.638	0	0.102	0.000282	5.39e-05	0.0958	0.421	150.011	4	177000
3GCdLUSnKSMJhs4Tj6CV3s	0.698	0.633	8	-4.946	1	0.0597	0.0605	0.000194	0.0926	0.552	96.924	4	232187
0fX4oNGBWO3dSGUZcVdVV2	0.79	0.67	1	-5.527	1	0.105	0.377	2.32e-06	0.119	0.408	139.956	4	195950
6PGoSes0D9eUDeeAafB2As	0.8	0.585	10	-7.343	1	0.0924	0.264	0	0.153	0.779	126.058	4	213400
2g6tReTlM2Akp41g0HaeXN	0.775	0.736	1	-8.072	0	0.247	0.319	0.00116	0.127	0.362	100.988	4	239027
6IZvVAP7VPPnsGX6bvgkqg	0.665	0.535	4	-7.056	0	0.0572	0.0786	1.68e-05	0.154	0.37	138.842	4	275253
2HbKqm4o0w5wEeEFXm2sD4	0.716	0.531	7	-7.355	1	0.122	0.0703	0	0.224	0.344	71.994	4	386907
3iVcZ5G6tvkXZkZKlMpIUs	0.796	0.766	7	-5.974	1	0.238	0.0742	0	0.0827	0.558	110.034	4	219333
6HZILIRieu8S0iqY8kIKhj	0.638	0.523	1	-6.664	1	0.357	0.00454	0	0.0842	0.422	139.913	4	185947
3QFInJAm9eyaho5vBzxInN	0.711	0.611	1	-5.453	1	0.33	0.00588	0	0.23	0.144	134.093	4	252262
0P2vjYoUjjHBeYArlQtRmf	0.244	0.719	5	-5.675	1	0.031	0.000826	0.855	0.186	0.441	99.61	4	133703
60JTA6msKu6uFlpvK8Tynn	0.282	0.942	11	-3.058	1	0.0696	0.00136	0.00057	0.453	0.687	92.318	4	143253
1ZUTRq6PQhYfHJk3qeP7FR	0.476	0.564	9	-9.559	1	0.0282	0.296	0.00424	0.129	0.178	95.833	4	183427
3Gb1M4i5UlDauEnaLJF2HT	0.57	0.667	0	-8.108	1	0.0294	0.259	0.79	0.158	0.683	125.658	4	208907
3AIt9LB3C7Jz99OnvVjbyv	0.327	0.5	0	-9.585	1	0.0789	0.926	0.657	0.113	0.302	168.963	3	275781
4viHP6kRmImqmVGQjE8sks	0.216	0.744	6	-4.232	0	0.0318	0.00676	0.126	0.186	0.56	153.195	4	156183
20OiuevLsmNprmh6wZKljU	0.43	0.678	10	-7.776	1	0.037	0.127	0.147	0.464	0.559	143.41	4	165067
2kkJY0ENKaDX5Np8fjyYLM	0.282	0.856	9	-5.19	1	0.0375	8.3e-05	0.44	0.056	0.858	170.607	4	167892
0J0UZpA2Ivp4qaXe3QzCrT	0.319	0.61	5	-6.863	1	0.0314	0.195	0.0222	0.38	0.352	139.99	4	200825
1uSkFxzLIEtObyJtROqbnl	0.506	0.779	0	-4.634	1	0.0365	0.0227	0.0134	0.183	0.384	97.531	4	199493
0xFiDbmCNEcs8TE9hToHpa	0.715	0.858	6	-8.785	0	0.887	0.934	0.000582	0.164	0.698	80.534	4	122857
0V6QNE31BWyMuiKlvDRnE9	0.623	0.819	7	-6.377	1	0.222	0.121	0.141	0.118	0.705	79.435	4	254049
41t7RkFBjaEFoGvr29QhYL	0.593	0.565	1	-9.441	1	0.335	0.355	0.0122	0.229	0.368	87.994	4	242067
7fjLBPTsQrbkV2WRedi2bw	0.683	0.86	7	-7.317	1	0.31	0.0117	0.000379	0.356	0.298	143.311	4	175357
1pHKJodnA1bOXyWj981Tmx	0.717	0.821	1	-7.183	0	0.195	0.00478	0.625	0.0801	0.54	96.984	4	163058
08rUqqyHYLORJvK6pqiUOM	0.461	0.736	0	-5.934	1	0.197	0.00203	8.3e-06	0.0804	0.313	179.373	4	215265
46lQe6895zxB3HRP6YPbnl	0.66	0.666	7	-7.897	1	0.455	0.384	1.37e-06	0.163	0.601	85.567	4	185493
36iXvmiL3tsJX0QfhVZkhb	0.453	0.552	1	-7.519	1	0.219	0.146	0	0.683	0.807	168.576	4	133170
4eJpFVLqB3SVzciiTdK82L	0.434	0.736	2	-6.709	1	0.281	0.414	0	0.863	0.388	142.061	4	184032
09u4JUpXt3LrZmqnW92GSk	0.792	0.558	9	-9.07	1	0.425	0.721	2.98e-06	0.109	0.573	119.972	4	180835
1WBSFlSLyOZnSa8fj7a5yC	0.434	0.531	1	-9.553	1	0.0425	0.781	0.0134	0.135	0.641	131.199	4	230200
7H0UxIN751StFi2tznmHlg	0.621	0.569	2	-7.318	0	0.0297	0.928	0.0361	0.115	0.402	110.022	4	257480
5loVmc3MmtYGsTw12eDgcU	0.211	0.708	8	-6.008	1	0.0507	0.798	0.00402	0.0742	0.476	179.794	3	345093
2bxQP85JNU11CQV4KXCnau	0.728	0.679	11	-6.764	1	0.0271	0.296	0.00733	0.11	0.953	131.715	4	254387
1dD6UAnqCJotTyU1bhCnDQ	0.619	0.874	0	-7.014	1	0.0353	0.391	0.363	0.466	0.961	89.582	4	170640
1xRzpBiy7nmgP0oVmnseNF	0.697	0.729	11	-6.402	1	0.0675	0.488	0.637	0.0673	0.81	94.044	4	217400
3XHtGQBlfMHfKcXdTX7Mt0	0.561	0.739	7	-7.752	1	0.028	0.0846	0.422	0.1	0.146	123.983	4	164773
56llQt0PCV67SUpmOTBLDs	0.749	0.292	1	-8.988	0	0.0356	0.714	0.0476	0.118	0.483	109.795	4	221720
13NiyfKg0aELrTWvgVL7eH	0.572	0.557	9	-6.249	0	0.0397	0.034	0.686	0.1	0.837	90.006	4	166973
3rWZv4pUVvPkQLYm3ItGDv	0.504	0.607	10	-8.1	1	0.0323	0.456	0.573	0.0765	0.337	133.393	3	246643
3n69hLUdIsSa1WlRmjMZlW	0.615	0.658	5	-7.299	1	0.0343	0.096	0.000911	0.205	0.293	150.093	4	227080
4iEOVEULZRvmzYSZY2ViKN	0.697	0.877	3	-4.465	1	0.0462	0.462	0.00943	0.083	0.802	101.99	4	173631
4tmwiN9YU7xMjh2hoqcVuI	0.359	0.48	5	-10.634	1	0.0349	0.779	0.00328	0.0784	0.283	171.75	4	305981
7DdXf9x75iEVCHWfoRwRuR	0.584	0.594	9	-6.935	1	0.0487	0.142	0.00117	0.105	0.36	143.935	4	219400
3xqxETvPg43KWP0HOGiOmu	0.682	0.581	7	-10.339	1	0.0295	0.714	0.323	0.0802	0.539	108.98	4	217320
3aA5fk4c6a7e5HM4rJqkSF	0.578	0.675	2	-9.208	1	0.03	0.787	0.403	0.116	0.281	147.947	4	228707
1o22EcqsCANhwYdaNOSdwS	0.702	0.607	2	-6.509	1	0.0405	0.364	0.0271	0.123	0.436	116.969	4	181400
3i4ColsuZEvjeLz63m0jPt	0.587	0.722	7	-8.332	1	0.0574	0.133	0.00322	0.133	0.294	81.973	4	198840
6neF3KiuooS7xcTtj18PRL	0.507	0.977	8	-2.845	0	0.134	0.015	0	0.13	0.34	126.011	4	233620
0pCTr2E9CtulIwNprituKi	0.609	0.413	5	-11.407	1	0.0351	0.876	0.0239	0.0799	0.0697	130.969	4	238747
4iJyoBOLtHqaGxP12qzhQI	0.677	0.696	0	-6.181	1	0.119	0.321	0	0.42	0.464	90.03	4	198082
7zFXmv6vqI4qOt4yGf3jYZ	0.658	0.294	4	-8.533	0	0.0321	0.422	5.2e-05	0.0749	0.358	74.038	4	278180
1RMJOxR6GRPsBHL8qeC2ux	0.524	0.364	7	-10.209	1	0.0367	0.808	0	0.1	0.436	75.24	4	209831
1boXOL0ua7N2iCOUVI1p9F	0.707	0.238	3	-8.818	1	0.0379	0.0905	2.42e-06	0.0842	0.345	124.156	3	270847
3uouaAVXpQR3X8RYkJyitQ	0.589	0.652	10	-7.498	1	0.373	0.704	0.00055	0.125	0.486	158.49	4	194960
7jhxagwOk9y1HC5ciRfmkQ	0.555	0.474	6	-11.706	0	0.0668	0.224	0.00426	0.162	0.262	134.89	4	216160
5uXO1sjZ7VbNKexKaFRna3	0.67	0.41	1	-13.444	1	0.0381	0.241	8.55e-06	0.167	0.46	127.972	4	240938
23c9gmiiv7RCu7twft0Mym	0.649	0.493	11	-7.645	0	0.11	0.586	0.000167	0.0667	0.277	104.542	4	231964
59acp1OhcvxwVBwQJBYKuX	0.198	0.162	1	-15.815	1	0.0343	0.926	0.00896	0.135	0.0527	70.453	1	185523
6d4FWjx72iuRWzn1HwywLK	0.391	0.692	1	-6.543	0	0.0462	0.0946	1.58e-05	0.191	0.56	180.008	4	246587
2LTah3NcoIJI9WHJW3VIlC	0.529	0.613	3	-7.61	0	0.037	0.145	0.00538	0.141	0.732	159.414	4	221947
4j5x8nURU1SNMFvVxcJj65	0.713	0.838	9	-7.872	0	0.0545	0.0863	0.00658	0.349	0.839	95.963	4	246120
03Yo5FRYVfTB2EuiyOmHLe	0.701	0.606	9	-8.774	0	0.0693	0.167	0.0797	0.0728	0.965	157.241	4	249920
25yl3A22f7gtJ5p5jfpuNn	0.657	0.257	9	-10.882	0	0.0399	0.85	0	0.111	0.109	135.755	4	313911
6Vjch0N0MK9NZ5piuLZHv1	0.661	0.365	0	-6.28	1	0.0352	0.759	0	0.206	0.546	91.617	4	342816
7GatRcyMDn5qX61851iS6i	0.648	0.604	11	-7.802	0	0.0253	0.144	0.0747	0.116	0.785	97.759	4	267440
6bZ9xnCsvwUacb29fbJ4xc	0.396	0.7	6	-9.153	0	0.134	0.182	6.1e-06	0.183	0.466	181.827	4	383413
6fGZAk8pyUwKw7E1Eoepkz	0.527	0.663	9	-7.961	0	0.0398	0.0307	3.13e-05	0.0369	0.712	81.238	4	258067
4YKSJHezbvr4e0026rz8Zo	0.618	0.486	9	-7.766	0	0.0475	0.567	0.000986	0.177	0.493	155.998	4	289707
3xKsf9qdS1CyvXSMEid6g8	0.545	0.545	9	-7.362	1	0.107	0.667	5.48e-05	0.417	0.549	159.94	3	184516
3GZD6HmiNUhxXYf8Gch723	0.913	0.603	8	-4.892	1	0.226	0.0272	0.000503	0.167	0.497	123.061	4	234093
4osgfFTICMkcGbbigdsa53	0.762	0.508	3	-9.112	1	0.0919	0.0584	0.00126	0.16	0.37	93.51	4	302347
2ZWlPOoWh0626oTaHrnl2a	0.575	0.386	9	-9.584	0	0.037	0.785	0.000289	0.229	0.466	116.408	4	249191
7eqoqGkKwgOaWNNHx90uEZ	0.457	0.551	5	-9.36	0	0.167	0.427	1.15e-06	0.113	0.428	89.87	4	307151
4S4Mfvv03M1cHgIOJcbUCL	0.861	0.647	7	-7.425	1	0.0675	0.594	0.661	0.114	0.67	158.037	4	133680
6Nle9hKrkL1wQpwNfEkxjh	0.776	0.503	0	-5.732	0	0.237	0.874	0	0.112	0.473	110.134	4	210285
2LMkwUfqC6S6s6qDVlEuzV	0.501	0.0958	0	-15.605	1	0.0433	0.77	0	0.298	0.204	108.741	4	248808
7DfFc7a6Rwfi3YQMRbDMau	0.721	0.339	0	-11.195	1	0.0532	0.409	0.00153	0.0973	0.2	129.83	4	200747
5GUYJTQap5F3RDQiCOJhrS	0.581	0.21	8	-10.426	1	0.0321	0.768	0	0.369	0.452	80.099	4	249668
3vvnpqqg7Jbi2c2aOn6GHt	0.663	0.592	5	-7.533	0	0.127	0.0402	9.38e-05	0.352	0.786	159.999	4	207000
7zJHwxabKK5TqW7xrKEC73	0.9	0.597	4	-7.23	1	0.0769	0.707	1.46e-05	0.132	0.588	87.973	4	165000
4s8uPDOuyjoO6Rmn7Armjc	0.863	0.419	7	-7.069	1	0.0813	0.816	0	0.151	0.8	115.037	4	187826
1G9pU58ocxSyaBTOfDE15F	0.509	0.424	7	-7.209	0	0.127	0.752	0	0.031	0.534	97.447	4	156632
1dc7H76rkWGymUigYxQ4hp	0.656	0.569	11	-7.921	0	0.202	0.391	5.73e-06	0.11	0.45	109.975	4	231273
0hVU7w5aEVjqYVbMcnp1CS	0.816	0.706	3	-6.793	1	0.0617	0.352	6.43e-06	0.0956	0.336	119.975	4	190000
4O4A5zbsLjBtN6Xsi2jLRt	0.89	0.519	6	-7.253	1	0.335	0.624	0	0.271	0.668	107.425	4	145794
67mBvvGurWeq8ILhG2Zyj5	0.388	0.243	6	-9.781	0	0.0646	0.95	3.88e-05	0.194	0.144	116.16	4	198000
6ErgLGql7HUEVbkQQJbjJt	0.905	0.652	5	-5.372	1	0.101	0.298	2.75e-06	0.0765	0.428	137.954	4	196522
1uX4eg17USq3HclX45P8Kf	0.655	0.357	6	-10.207	0	0.0478	0.809	3.93e-06	0.183	0.318	99.817	4	214274
0iizrCBnUUJuAwCPJaWWY0	0.689	0.735	7	-7.26	0	0.327	0.463	0	0.103	0.736	117.171	4	174867
6QdcmLnJLkOhfN2y9KKt7k	0.229	0.727	6	-3.047	0	0.143	0.141	4.67e-06	0.872	0.725	64.315	3	103735
5mtfHX4VyY5D81WMaOHgHV	0.455	0.529	9	-5.693	0	0.153	0.148	0	0.161	0.55	74.885	4	156133
02sagHhK9h0nODtzjF33yP	0.703	0.493	1	-6.217	0	0.278	0.0339	0	0.449	0.579	85.039	4	150760
5lYXMlzWEc8uDbMd1v0V35	0.544	0.836	5	-7.416	1	0.0953	0.473	0	0.209	0.893	170.264	3	177147
08VNThwlDByBAaZUNZj1aS	0.458	0.773	10	-6.925	0	0.343	0.242	2.3e-05	0.225	0.811	78.331	4	243973
2XHouWEiXbXB7m50ybUG8h	0.667	0.652	7	-7.283	1	0.198	0.0946	0	0.203	0.548	96.074	4	304907
4UoOaaxDdx9ndmdg3mbc83	0.531	0.67	2	-6.889	0	0.0748	0.116	0	0.378	0.81	87.729	3	147573
4xSQLj346ynlX8vopebWTQ	0.656	0.814	1	-7.228	1	0.269	0.0861	0.00037	0.173	0.526	100.086	4	211093
2n0U2OG5d6TuW5mKx7YrC0	0.546	0.5	0	-8.881	1	0.0379	0.802	0.00108	0.107	0.449	150.92	4	195840
341863z079BT4EFPiSw9DP	0.58	0.101	10	-15.661	1	0.0289	0.934	0.000302	0.0768	0.302	91.003	3	187427
6GskIhdM6TN6EkPgeSjVfW	0.923	0.518	5	-6.008	1	0.0492	0.52	0.000142	0.104	0.682	93.023	4	226680
2bbhyUWJ5VjdfI3P4PRLu2	0.49	0.193	11	-9.544	1	0.0421	0.862	9.74e-06	0.113	0.184	89.154	4	189507
4yVixayMpxm2MUGOePA192	0.506	0.604	9	-4.179	1	0.0283	0.0138	0.427	0.0435	0.347	110.921	4	221627
6zJms3MX11Qu1IKF44LoRW	0.217	0.305	1	-9.495	1	0.0321	0.885	0.00271	0.201	0.12	82.848	4	292400
1vDMGBzqLJWZC5UzePDURw	0.321	0.955	10	-2.749	0	0.146	0.00464	0.00897	0.269	0.331	167.467	4	189480
0N9WhEz6DiBDvBxa6uJCTY	0.665	0.446	1	-11.884	1	0.0439	0.57	0.000669	0.082	0.172	141.94	4	230867
1fq4k7G5kYqUvKIuEmFAAo	0.545	0.232	2	-10.72	1	0.0287	0.985	0.000596	0.126	0.144	105.686	4	145787
6uA9lKAYHcBLhxb5KZYygj	0.88	0.413	0	-8.459	1	0.0462	0.586	0.000833	0.0693	0.44	101.991	4	200413
2K2M0TcglCRLLpFOzKeFZA	0.683	0.594	2	-8.289	1	0.0347	0.385	8.61e-05	0.121	0.734	115.099	4	250400
3Xls4cNOwy01dtrNXb1inG	0.553	0.576	0	-13.458	1	0.0304	0.191	0.00664	0.0365	0.457	109.827	4	298333
47bXIv24jthL4vzZy3j7CY	0.603	0.563	2	-9.932	1	0.0283	0.47	1.04e-05	0.29	0.642	106.431	4	166280
62nYkaIBesfvQSSwTjPnYS	0.375	0.448	9	-14.06	1	0.0264	0.106	5.55e-05	0.141	0.564	88.371	4	171507
6PUabSMXmPnZna361Wwmf7	0.391	0.756	7	-11.317	1	0.0648	0.413	0.0418	0.879	0.839	131.648	4	258467
0GxV3poTM7Z7fKSUqy5qFw	0.538	0.476	0	-9.215	0	0.049	0.0178	4.26e-05	0.101	0.188	105.642	4	166453
3oaSvU9VBBmyfPA4lbibQM	0.636	0.589	9	-8.196	1	0.0387	0.389	0.000211	0.379	0.959	113.403	4	144840
08xsXR637CEqbxJmpFcuSA	0.596	0.575	4	-14.254	0	0.04	0.449	0.000104	0.0839	0.745	107.573	4	164707
2JbS4ZDBIUcXavA9mfb2nC	0.549	0.599	4	-6.786	0	0.0454	0.272	1.11e-06	0.147	0.835	124.22	4	151680
2uxsnsH0XzOBZkMrSFVmll	0.476	0.504	0	-14.532	1	0.0282	0.295	0.000153	0.256	0.947	183.057	4	189440
7zxikeAavSLQVGocbK2nau	0.259	0.936	0	-5.261	1	0.151	0.367	0	0.0565	0.166	143.756	3	276613
6aAhBncpJcB0gJCKobVsrI	0.597	0.611	0	-9.878	1	0.0414	0.365	0.592	0.132	0.615	117.419	4	391880
3lvt2HbhH4wApvt05BfDkB	0.556	0.877	5	-4.926	1	0.0393	0.704	0.113	0.131	0.527	120.125	4	172253
3LDd0iCbcOrNT2iTQjtHx4	0.469	0.988	9	-5.318	1	0.0442	0.29	0.0272	0.111	0.622	132.508	4	227360
6ZwdMyNfYEejW0ADt7pZy8	0.473	0.81	9	-5.441	0	0.133	0.432	0	0.399	0.79	170.955	4	174836
4kj7eh4GVbTMQOzItZtA9X	0.509	0.852	0	-5.392	1	0.0884	0.647	0	0.236	0.516	143.313	4	219573
4HSaCZopbqkyAKrr3neDFL	0.435	0.728	4	-4.287	1	0.114	0.0236	0.205	0.11	0.609	164.959	4	219120
0TK9GvIvCsQ9MK2ot0qDpT	0.368	0.837	2	-5.509	0	0.039	0.221	0.432	0.117	0.503	124.604	4	205680
0BCY1jYJREuo3jnqIOqSTI	0.507	0.781	8	-4.482	1	0.0451	0.631	3.46e-05	0.153	0.674	126.308	4	205098
3wJqhhpTF7mFXgZUWuxhya	0.235	0.914	0	-4.778	1	0.0536	0.649	0.000295	0.255	0.286	127.016	4	238854
0ofHAoxe9vBkTCp2UQIavz	0.828	0.492	0	-9.744	1	0.0276	0.0644	0.00428	0.128	0.789	120.151	4	257800
5e9TFTbltYBg2xThimr0rU	0.545	0.67	9	-8.81	1	0.0496	0.009	0.000822	0.0451	0.481	151.553	4	270213
254bXAqt3zP6P50BdQvEsq	0.73	0.487	4	-10.991	1	0.0303	0.258	0.01	0.0852	0.731	114.965	4	226653
5ihS6UUlyQAfmp48eSkxuQ	0.414	0.161	7	-22.32	0	0.0318	0.883	0.000223	0.117	0.423	159.375	4	199493
07GvNcU1WdyZJq3XxP0kZa	0.583	0.947	5	-5.12	1	0.0378	0.0185	0.00109	0.0679	0.803	135.448	4	223613
4bEb3KE4mSKlTFjtWJQBqO	0.671	0.71	9	-7.724	1	0.0356	0.0393	1.12e-05	0.0387	0.834	118.745	4	193347
05oETzWbd4SI33qK2gbJfR	0.723	0.49	9	-14.745	0	0.0296	0.111	0.0946	0.0923	0.795	129.012	4	252773
19Ym5Sg0YyOCa6ao21bdoG	0.622	0.54	5	-13.99	1	0.0261	0.017	0.00771	0.265	0.847	130.879	4	264907
4CoSCPlKNrWli7E5kFtbcl	0.64	0.649	2	-10.345	1	0.0264	0.216	8.3e-05	0.0551	0.865	124.825	4	221053
19Shlms2uTnOjIUg50TXzd	0.654	0.336	6	-12.825	1	0.0379	0.858	0.385	0.0786	0.947	176.083	4	134400
68Dni7IE4VyPkTOH9mRWHr	0.69	0.521	10	-8.492	0	0.339	0.324	0	0.0534	0.494	100.028	4	292799
4tqcoej1zPvwePZCzuAjJd	0.495	0.722	6	-8.108	0	0.357	0.0697	0	0.113	0.539	175.627	4	239267
0Fs9cdPDhptWEDJmiCbkEW	0.766	0.74	1	-10.363	1	0.0807	0.0193	0.0784	0.229	0.183	118.008	4	296520
2JvzF1RMd7lE3KmFlsyZD8	0.837	0.364	8	-11.713	1	0.276	0.149	0	0.271	0.463	123.984	4	213594
2wAJTrFhCnQyNSD3oUgTZO	0.831	0.427	2	-6.903	1	0.106	0.0531	0	0.307	0.216	93.004	4	235320
5W8jRrZ6tWrTrqnKRtIQBf	0.861	0.656	4	-7.867	0	0.425	0.104	0	0.0986	0.331	88.967	4	218210
1D3z6HTiQsNmZxjl7F7eoG	0.597	0.587	7	-7.026	0	0.137	0.0622	0	0.214	0.0753	140.021	4	218802
2uwnP6tZVVmTovzX5ELooy	0.667	0.608	1	-7.054	1	0.216	0.324	0.000198	0.426	0.475	99.992	4	241160
2e3Ea0o24lReQFR4FA7yXH	0.677	0.638	8	-8.631	1	0.333	0.589	0	0.193	0.435	82.81	4	211497
6tZ3b7ik1QDXFAZlXib0YZ	0.829	0.527	6	-6.644	0	0.367	0.482	0	0.631	0.475	116.079	4	200310
2Srd8Jgif3kc6ou6Z4pSYJ	0.478	0.923	10	-7.547	1	0.0569	2.7e-05	0.719	0.325	0.165	133.135	4	213800
0uYVJ8z5kgMayMNPJA6Cz9	0.45	0.357	10	-13.691	0	0.0338	0.268	0.519	0.0944	0.0838	179.935	4	297320
2yYASbXnAV71CLbNY1HCWf	0.328	0.904	3	-5.063	0	0.0455	4.31e-05	0.064	0.11	0.516	186.253	4	190573
0AATuEhrQtGDevnhq9Nx2k	0.3	0.571	10	-10.152	0	0.0331	0.00082	0.8	0.0851	0.0413	178.089	4	315987
32F0zqsDgqpIEYApk2b8sr	0.348	0.898	8	-6.835	1	0.0701	0.0367	3.73e-05	0.11	0.2	81.268	4	254760
7pmahAnqScI4MjbQiZZqei	0.461	0.91	1	-7.198	1	0.0359	8.58e-05	0.0471	0.0863	0.615	155.697	4	214907
6Vkn98iI3sfATzdacZ307z	0.435	0.886	11	-4.749	1	0.0803	0.0061	0.00482	0.0993	0.44	165.007	4	216187
54s0TZeheZOxoVFxxmB3wA	0.408	0.891	0	-7.094	1	0.0505	3.51e-05	0.000517	0.11	0.196	167.996	4	248543
0W6QtgkxPNJ7simo1UcBIr	0.397	0.942	1	-2.53	1	0.0869	0.000227	0.24	0.14	0.356	158.993	4	232307
7jxR5vYnUhwE6niPPyzR4V	0.588	0.691	7	-5.83	1	0.0466	0.000328	9.74e-06	0.819	0.521	118.98	4	187751
39Yp9wwQiSRIDOvrVg7mbk	0.716	0.537	0	-7.648	0	0.0514	0.233	0	0.157	0.28	129.979	4	165978
2ncLdwTd8qzkxiJjlbiOgC	0.675	0.734	7	-8.659	1	0.0265	0.38	0.895	0.141	0.533	101.998	4	294213
5PX4uS1LqlWEPL69phPVQQ	0.722	0.687	0	-5.189	1	0.0556	0.00949	0.00413	0.0462	0.619	128.013	4	373627
6MtKObWYda2qnNIpJI21uD	0.63	0.605	0	-8.951	1	0.0414	0.484	9.29e-05	0.298	0.266	115.277	4	295293
30KctD1WsHKTIYczXjip5a	0.712	0.556	5	-7.214	0	0.0531	0.084	5.04e-05	0.527	0.22	90.494	4	193293
5wfllwdjglyQislkskYLBv	0.881	0.441	11	-6.278	0	0.0646	0.48	9.08e-06	0.119	0.804	138.014	4	221240
5XFoaqV1Z8XaLJidchVWhh	0.574	0.736	5	-4.743	1	0.0465	0.146	1.66e-05	0.407	0.344	138.501	4	328573
6XkuklKiHYVTlVvWlTgQYP	0.687	0.631	9	-5.612	1	0.129	0.063	0	0.108	0.853	186.071	4	192253
5CFJRZRq6sdKKtRwNPWbYv	0.619	0.589	1	-6.531	1	0.124	0.43	0.000392	0.378	0.158	143.896	4	174960
5OIz27S6SQOJtweneBd6QP	0.822	0.874	6	-4.006	1	0.113	0.0895	3.71e-06	0.0737	0.369	155.032	4	172053
3diqzmavbWJdQiIuIbvoWt	0.211	0.274	7	-14.899	0	0.031	0.595	0.318	0.0884	0.173	82.812	4	240861
6dfWiUc39g9BjD01irYviR	0.286	0.588	0	-5.727	0	0.031	4.59e-05	0.735	0.106	0.0438	157.986	4	258555
0ImjeKKMwhUNJwVe4JXEDy	0.598	0.48	5	-12.478	0	0.0409	0.0508	0.867	0.089	0.0357	124.007	4	202069
0Mg797QegnaC7LIRVU0WYh	0.2	0.774	0	-4.144	0	0.0526	0.0164	0.0948	0.123	0.699	101.75	3	178000
4qGchgaW78B1Z9kmF9lt2w	0.1	0.163	8	-17.106	1	0.0345	0.376	0.0188	0.15	0.0394	76.478	4	271071
4xTfQPuQR1VulbeAn63cgX	0.518	0.543	4	-9.253	0	0.0291	0.0137	0.858	0.112	0.0347	122.991	4	300395
0Fs7jajFWWfBcC4Mox3m7p	0.196	0.626	1	-5.805	0	0.0357	0.0014	0.0318	0.135	0.135	142.176	4	211514
020Ur4viDDscjoH9IvpHRE	0.216	0.697	11	-6.64	0	0.0401	0.000122	0.931	0.443	0.144	149.74	4	182300
76nPiuy1rkMFQqWDFaScP4	0.192	0.485	7	-9.548	0	0.0289	0.514	0.000959	0.334	0.244	77.887	4	375000
0aFXE1GU6jYnz8MkKyArZw	0.263	0.34	0	-7.686	0	0.0317	0.00355	0.624	0.1	0.0361	129.887	4	360649
6W9rbkBueZQrwuzO24GHZ2	0.803	0.59	11	-11.187	0	0.0798	0.201	0.00216	0.0605	0.743	118.022	4	222901
6kle4XS7gyiUIb0tmsyCf4	0.546	0.38	2	-6.279	0	0.0291	0.633	0.593	0.0899	0.408	137.02	4	276600
5ZK62nSchTamBy8F6HIZov	0.793	0.537	0	-7.123	0	0.0338	0.834	0.00256	0.326	0.778	120.012	4	197227
6KNV6L3b7beomEUnzWgw0X	0.607	0.629	2	-10.509	1	0.0406	0.375	0.0806	0.0844	0.688	101.974	4	254722
3XITcXbaKS08ardf8ahKqM	0.707	0.681	2	-7.588	1	0.0606	0.521	0.0175	0.0985	0.751	147.745	4	212488
5Dxv2JoDim8FfyUzCbOqvQ	0.71	0.533	8	-11.754	1	0.0489	0.243	0.06	0.0677	0.899	115.049	4	210329
0jecTSpHjOy5CyqEdfod5c	0.676	0.657	4	-4.185	0	0.0333	0.64	4.95e-05	0.107	0.727	96.034	4	200687
4bQhGIHwo1ZpixP9MudUbV	0.629	0.498	2	-10.313	0	0.0823	0.197	0.00045	0.206	0.591	82.108	4	225461
1m6FCJ4TWoqCz2ubKdep0Z	0.656	0.883	7	-4.434	1	0.156	0.368	5.61e-05	0.153	0.846	175.382	4	201082
59FqreVbI6rLyFaxIUnAEg	0.529	0.554	4	-5.158	0	0.062	0.25	1.73e-05	0.225	0.918	205.736	4	198096
5Gr3F9wpvAJ6jxjMKMhUvp	0.358	0.666	9	-5.015	1	0.0408	0.059	0.281	0.125	0.566	199.494	4	290157
1s26EtMcz12WYu7CyETg8w	0.472	0.429	9	-5.081	1	0.0273	0.588	2.67e-06	0.0925	0.589	80.062	4	220590
6c4i2FZ8Ul9O7BriSjkH2k	0.316	0.459	7	-6.014	1	0.0308	0.473	5.99e-06	0.135	0.354	145.777	3	199753
7JG2ctxDwLvqT799vKFvWv	0.338	0.428	7	-7.104	1	0.0268	0.543	4.61e-06	0.143	0.325	144.989	3	275584
5Ff4k65YPPlQjzZEr2a0oU	0.458	0.422	0	-6.954	1	0.0287	0.413	0.00332	0.0952	0.743	150.752	4	230899
1xqRfUNinqusubH9EnyQM8	0.579	0.572	4	-5.136	1	0.0348	0.738	0.000254	0.355	0.86	122.234	4	207586
6MoVJYJzWDFtSJr4VqaFvN	0.491	0.512	6	-6.492	0	0.0275	0.0237	0.112	0.354	0.481	143.649	3	344213
6UyWIB10XzRIfkKTBtiJCl	0.454	0.507	4	-4.715	1	0.0277	0.577	0	0.177	0.436	137.62	4	200448
07a6JUWUqw0EMKdhLvZQqS	0.632	0.595	11	-2.807	0	0.0311	0.632	1.56e-05	0.281	0.366	106.139	4	255392
3SR15t0DS0T5K7jDtp31dh	0.39	0.381	4	-7.431	1	0.0289	0.78	0.0046	0.118	0.561	142.576	4	315665
13jJmDyFCslJf1rpJJGFsg	0.458	0.546	11	-11.663	0	0.0563	0.441	0.747	0.103	0.0798	180.216	4	183973
14nAUobNnAo4nSJjXbQofp	0.47	0.688	9	-8.984	1	0.0282	0.5	0.705	0.199	0.725	133.709	4	283987
1jkdnGOfeWDMVUqX2xXxsw	0.659	0.556	6	-9.392	1	0.0483	0.00734	0.000319	0.0988	0.757	167.873	4	104840
6RyC5X1YGBBvNP0vKYYuvI	0.753	0.462	9	-6.677	1	0.0313	0.136	1.03e-06	0.111	0.825	131.11	4	145340
3Xt9sp779WQWqLYPVbLU0q	0.553	0.556	5	-9.98	1	0.0421	0.134	0.0447	0.123	0.763	172.869	4	137760
5pU3F1qCcnYi6EAsEh9dvU	0.563	0.453	2	-10.678	1	0.0428	0.143	0	0.122	0.721	146.598	4	141120
2iZPHjqqRTnEspcty3sx2d	0.456	0.673	9	-7.33	1	0.0331	0.755	0.442	0.199	0.406	97.538	4	269726
7voNFu2PSUXeWbFYHYz5Kj	0.56	0.584	4	-10.062	1	0.043	0.205	0.1	0.131	0.855	175.305	4	181093
6f0OgGA8oU8anD99LKvX0Z	0.555	0.615	7	-9.759	1	0.034	0.00594	0.0313	0.115	0.731	151.869	4	158213
5RVO5uHpeQVveseIWQRfvI	0.657	0.51	10	-10.665	1	0.0335	0.0364	0.215	0.407	0.692	89.089	4	207187
6hleUCx3E4gB2urwRvx1QT	0.536	0.696	4	-6.818	0	0.0365	0.134	3.19e-06	0.287	0.683	117.179	4	214027
4Wzt8Dm4xpO3LjWDecP4bA	0.523	0.803	4	-5.189	0	0.045	0.583	0	0.0948	0.898	132.3	4	145293
49TIT8O6KR9rdfgVBwdbac	0.317	0.453	9	-8.161	0	0.0337	0.907	0.00195	0.113	0.398	178.734	3	137733
560OsnDa7tpsK2B0krVlOP	0.524	0.424	9	-7.491	1	0.0311	0.626	0	0.191	0.534	97.283	4	127733
69GPTeIbtyU1Vd1NPYX95k	0.62	0.148	1	-13.124	0	0.078	0.954	0	0.0968	0.578	114.643	4	108573
5AxeiXkrfb2e4PsZ02CSyC	0.757	0.435	8	-10.139	0	0.032	0.339	0.396	0.0997	0.942	135.639	4	126600
7p1fSjOvkphYCqxJupK8Et	0.542	0.865	9	-4.253	0	0.0362	0.37	0.001	0.0754	0.805	131.579	4	99947
5Q08lzb2Uj4X9VVDGmUebR	0.498	0.491	0	-5.704	1	0.0276	0.764	0	0.31	0.543	103.634	3	136027
1SnTzsiSyLSbdO0DHVIZOw	0.421	0.58	7	-7.029	1	0.0286	0.264	0.0129	0.0973	0.397	129.961	4	235827
2tv1TH489D5jYz96DeGwT3	0.594	0.448	6	-9.734	0	0.0337	0.751	0	0.106	0.383	110.334	4	183213
0bIGNGUqgpB82sAksxonkZ	0.439	0.867	4	-7.722	1	0.0618	0.00907	8.93e-06	0.679	0.318	129.103	4	279907
73uAQw29X3mrO1taWZaOvm	0.523	0.305	0	-12.834	1	0.0399	0.42	0	0.162	0.435	95.854	4	141907
285vxuRky8WKTIrNP332sl	0.469	0.773	0	-6.055	1	0.0454	0.441	5.16e-05	0.987	0.325	112.718	4	143921
1HipTbE3pVedq6OGGjxhWj	0.352	0.967	9	-7.023	0	0.128	0.0363	0.443	0.986	0.225	114.436	4	374760
7kwliM8TCIwdAXBXX0LJXd	0.4	0.756	5	-6.174	1	0.0545	0.401	0	0.967	0.512	126.171	3	287637
4Z65ex2SD2OblueL5FjRPT	0.676	0.803	7	-5.457	1	0.122	0.00284	0	0.138	0.34	125.053	4	220240
5T1mYdPKZjnpD8n6HLt2W5	0.88	0.344	7	-15.19	1	0.0584	0.257	0.0376	0.0283	0.89	117.644	4	199240
3gXMNdXzS4KkS8DQJbXxdN	0.454	0.454	0	-8.516	1	0.0292	0.573	0	0.946	0.272	106.778	4	323741
0yooAzGi7j1BFEQmJHXDbc	0.338	0.862	7	-8.699	1	0.0598	0.116	0.023	0.984	0.631	107.228	4	340293
6pPrIe2PQWqwq0CHGcjYVq	0.419	0.586	5	-7.787	1	0.0301	0.0655	0.689	0.0891	0.111	110.935	4	214200
1pJsmr01tzKnFfjeCvzcdc	0.545	0.768	4	-5.249	0	0.269	0.46	0	0.118	0.557	115.052	4	219130
0wY9rA9fJkuESyYm9uzVK5	0.784	0.586	1	-3.417	1	0.187	0.00558	0.000286	0.106	0.656	132.169	4	171818
5ibTi2YwtvbB1bTOv2I93d	0.734	0.438	6	-6.124	0	0.0865	0.224	0.00292	0.215	0.645	143.961	4	187893
4sFzG7iUlyPmuyASCkre9A	0.793	0.489	8	-10.984	0	0.284	0.25	0.000101	0.432	0.47	120.097	4	216933
0hZIaQMGqu41dozEwqVa1b	0.685	0.577	7	-4.655	0	0.108	0.66	2.69e-06	0.109	0.371	110.326	4	130982
5LKzqs734Xs528hqK8bGS1	0.622	0.584	0	-7.891	1	0.122	0.0628	0.000152	0.119	0.545	158.276	4	174947
4bxr2sOVZSLjIN7tQx53ir	0.659	0.675	1	-6.005	0	0.19	0.198	0.00129	0.108	0.19	146.049	4	197260
3Ku9kSWtDQPC8bSWpHR7z0	0.64	0.496	3	-6.077	0	0.284	0.333	0	0.13	0.547	119.849	4	241747
33fgHbTXA4hVRriK2W1khx	0.527	0.494	0	-6.606	1	0.088	0.049	2.76e-06	0.091	0.374	129.555	4	178400
3J5fFQ0PxfKQU5putEvUoM	0.608	0.651	5	-6.954	0	0.0376	0.0631	0.00111	0.151	0.252	89.097	4	191973
5YixskhSGNwmqjUrG0DTEY	0.584	0.703	7	-7.236	0	0.0837	0.0211	1.64e-06	0.535	0.65	94.01	4	106102
2wiV5iKq5F5A0KUee4OrlK	0.325	0.322	8	-16.613	1	0.03	0.887	0.214	0.118	0.724	182.073	3	329361
46LX0sSwIU4GFLcj23ZfMA	0.565	0.726	0	-6.715	1	0.0548	0.00181	3.06e-06	0.103	0.715	178.078	4	198627
0FqkI0vR3Z28v6GSudbKXj	0.651	0.759	11	-9.689	1	0.0356	0.0148	0.0108	0.165	0.929	143.04	4	112448
4sbsJMnW6k7TuLhVmodlFx	0.561	0.896	11	-5.005	0	0.0346	0.000255	0.376	0.373	0.447	109.606	4	214133
4chSRXrdadYm2ujaCyP3Cf	0.531	0.619	1	-7.285	1	0.074	0.00368	1.87e-05	0.0912	0.566	149.007	4	185560
3pihS07XVQEavaS9n7kObt	0.67	0.528	8	-9.372	0	0.0323	0.0565	0.00117	0.102	0.628	87.965	4	278311
6Ucrht7JfguIXoa4hF9Leo	0.369	0.923	0	-6.591	1	0.0445	4.1e-06	0.878	0.393	0.64	168.003	4	232947
6DJdXo8oT7kTA9mYpvpJRk	0.751	0.528	5	-10.874	0	0.0495	0.5	0.799	0.125	0.342	117.969	4	232760
51rPRW8NjxZoWPPjnRGzHw	0.704	0.487	9	-6.407	0	0.0604	0.669	8.64e-05	0.111	0.313	121.726	4	301893
0bkTdkWwGk3OGFX0afD3Wj	0.747	0.494	3	-7.957	0	0.141	0.393	0	0.0982	0.624	76.006	4	228453
6zWU7YALeEDMcPGhKKZJhV	0.567	0.593	6	-7.404	0	0.288	0.117	1.32e-06	0.248	0.358	88.545	4	194157
6T3Ebo7EOh8cUOyE4OhFpp	0.629	0.579	9	-6.543	0	0.107	0.811	0.00366	0.0813	0.363	135.86	4	204706
1xTYy3K3hiTcoZfoD7culn	0.884	0.658	0	-5.94	1	0.134	0.19	0.00164	0.103	0.502	112.978	4	196495
5tkR9JkBj3Ueeo8W4k8IZD	0.818	0.461	6	-6.475	0	0.292	0.598	0.000135	0.108	0.532	88.006	4	188053
5z2XleKRbvbiytGucM5v2D	0.589	0.431	9	-10.096	0	0.0475	0.554	0.0317	0.0878	0.159	134.688	4	167143
1VAKnb1btGrQXcVZVSRkPe	0.658	0.619	9	-7.316	0	0.0772	0.788	0.0667	0.0951	0.354	136.077	4	204706
0QUbiLQySWPq5Lh3f7A9bN	0.663	0.626	1	-4.756	1	0.0567	0.456	7.25e-06	0.0984	0.494	105.026	4	278715
5KaIIT6ijzJvlZPPiJby36	0.8	0.552	5	-7.103	0	0.0862	0.16	7.05e-05	0.049	0.834	85.005	4	186400
64DpBZj4IlDFzCwxTq7azl	0.0621	0.887	7	-4.305	1	0.0632	0.0399	0.000156	0.619	0.48	198.441	4	192533
0n97PkKoTpnp5L343TMAgB	0.192	0.377	7	-9.157	1	0.0352	0.285	0.813	0.173	0.0976	84.768	4	117307
41WcmdweTbIJAc8tiOR6xw	0.365	0.357	4	-6.227	0	0.0343	0.744	1.97e-05	0.11	0.117	118.436	3	498147
5Rim1zEhBbmeKUPaMhDMh9	0.192	0.943	4	-4.059	1	0.0828	0.0249	7.61e-06	0.135	0.218	136.369	4	248573
7BSadtswKNAyWfiuHZNeih	0.283	0.683	2	-4.907	0	0.0303	0.0557	0.846	0.529	0.308	109.766	3	113147
4gD68gReo8iXcV9FeRTyQL	0.446	0.366	8	-7.158	1	0.0264	0.696	0	0.136	0.131	91.19	3	313973
2QjOHCTQ1Jl3zawyYOpxh6	0.612	0.807	10	-2.81	1	0.0336	0.0495	0.0177	0.101	0.398	124.053	4	240400
5E30LdtzQTGqRvNd7l6kG5	0.588	0.521	10	-9.461	1	0.0329	0.0678	0.149	0.123	0.337	85.012	4	260173
2K7xn816oNHJZ0aVqdQsha	0.575	0.568	9	-5.509	0	0.03	0.0484	0.000417	0.286	0.37	93.986	4	206280
7zwn1eykZtZ5LODrf7c0tS	0.551	0.881	7	-6.099	0	0.0542	0.186	0.0791	0.152	0.387	88.036	4	153000
2xql0pid3EUwW38AsywxhV	0.648	0.594	11	-7.027	0	0.0293	0.114	0.0462	0.116	0.544	113.983	4	244013
2u0CelO5c81XS7z3dGpHbS	0.245	0.64	2	-7.426	0	0.0608	0.131	8.11e-06	0.0766	0.105	135.739	4	255133
7brQHA2CgQpcMBiOlfiXYb	0.464	0.701	6	-5.693	0	0.0411	0.00892	0.309	0.335	0.356	83.996	4	251187
0VF7YLIxSQKyNiFL3X6MmN	0.512	0.483	0	-7.798	1	0.0298	0.00304	0.0011	0.12	0.367	160.009	4	217027
5Q6fh8OEhBYepJaORz9lxe	0.623	0.533	10	-8.164	1	0.0653	0.245	0.00717	0.112	0.247	84.982	4	181187
7IL8PSVwLOJxqYne6azxQv	0.578	0.386	6	-11.464	1	0.0278	0.208	0.0453	0.307	0.569	154.902	4	234093
1wJCQOm2LmQVTfO0d2Ax87	0.617	0.685	8	-6.389	0	0.0402	0.58	7.2e-06	0.0887	0.654	130.182	4	244035
3VAIsHnHts4Q50xC0U389K	0.316	0.81	10	-4.334	1	0.0353	0.217	0	0.201	0.938	139.529	4	170945
4QdF1Ph72wZ9yWmK8TsDnJ	0.398	0.405	10	-7.464	1	0.0265	0.561	0.00403	0.178	0.267	135.988	3	349489
0Xpwy9bUKl1vKBAL55rdSk	0.474	0.658	2	-3.849	1	0.0322	0.436	0.000889	0.265	0.479	121.294	4	281165
2nHrv8WYddyiom6o7xbE6d	0.488	0.944	1	-2.337	1	0.0357	0.24	0.000488	0.525	0.719	94.008	4	206000
0mUs7SDoJPWCgNv0Tmdg97	0.365	0.628	5	-4.443	1	0.033	0.251	0.219	0.125	0.581	122.838	4	215324
3kp9ibchTs1RKlXnxlmooG	0.251	0.5	0	-4.799	0	0.0325	0.335	0.184	0.0863	0.214	186.037	3	284259
7zcDDM8zY0icYDU2r90JRo	0.454	0.602	10	-3.822	0	0.0339	0.609	0.0203	0.207	0.458	127.809	4	184802
3HOJK8zgaNqcK0HuTrdL4s	0.44	0.635	0	-10.863	0	0.0335	0.052	0	0.0365	0.906	138.248	4	170301
1yTjpC27Sbdn5gcNeQF2qU	0.515	0.659	8	-4.7	1	0.0305	0.539	0.00211	0.195	0.468	120.493	4	251646
5O7M9Ef0F5orV3UNJ4URNx	0.558	0.835	4	-4.642	0	0.0576	0.0063	0.00415	0.116	0.591	146.581	4	174160
69GE6yPZZldvqtgBHrKXxg	0.554	0.327	4	-12.79	0	0.03	0.796	0.00763	0.125	0.0341	144.171	4	305520
6vX3f406IBBmI6mAHLARGa	0.659	0.622	5	-7.796	0	0.0704	0.0171	0.226	0.303	0.734	170.003	4	208247
57ULv0uC3dyWCxqh8AtOh8	0.466	0.759	11	-8.148	0	0.0311	0.0304	0.0405	0.171	0.659	180.021	5	367192
6WpBbL2UkFz4QQNpQuG9qD	0.592	0.723	7	-6.095	1	0.0386	0.00426	0.628	0.0757	0.335	159.991	4	275187
5RVMaBTIAr8PM2keeeZlnZ	0.485	0.6	10	-6.805	0	0.067	0.663	4.33e-05	0.274	0.0365	84.985	4	234827
7oF9EZknm2mlqJeiS5FlKt	0.707	0.678	1	-4.656	1	0.244	0.303	0	0.167	0.689	80.922	4	224427
2pw4svMKO3dMCbagNki1MG	0.641	0.728	5	-7.798	0	0.0748	0.0269	0.119	0.118	0.67	88.96	4	223696
3KaDyCGZ4sRvtDDjJ0IUyW	0.705	0.881	7	-4.747	1	0.0676	0.0194	0.0147	0.106	0.541	116.002	3	282760
2q93bHAeQ1X3mpJbldnVzK	0.604	0.694	7	-6.614	1	0.0333	0.242	0.255	0.103	0.286	129.995	3	305733
5wCVLW9qMtIY9IkBeyYnh6	0.452	0.834	11	-4.657	1	0.0967	0.0417	0.00036	0.119	0.514	142.088	4	264213
7LZN7FkxHZk6maiN6NdI2i	0.604	0.655	9	-7.088	1	0.0273	0.109	0.0019	0.125	0.59	115.038	4	180413
6ZMYbLF33jIECoG2MClauD	0.644	0.578	9	-7.78	1	0.0256	0.181	0.119	0.0966	0.629	114.944	4	181213
5AKYyNPYhumqKeOMhdEgQO	0.385	0.604	9	-6.709	1	0.0321	0.0753	1.27e-05	0.718	0.251	77.468	4	216840
3fIblK7WOWpnT39WIjP8tD	0.543	0.672	0	-7.399	1	0.0344	0.00844	0.00672	0.188	0.144	88.956	4	214498
53I7CviVHhNYEKth717RLG	0.566	0.576	5	-4.859	1	0.0365	0.0578	0	0.0523	0.607	138.045	4	237693
44DnIGEvTlhDkGv3xLSDcp	0.528	0.86	11	-8.033	0	0.0397	0.00131	0.25	0.251	0.49	123.12	4	266053
0BVZY0wh4lUICV71haiBR4	0.526	0.558	5	-8.359	1	0.0272	0.341	0.0381	0.112	0.557	77.558	4	215853
1lTlQGQzaZoNX8SDNqYtUi	0.504	0.768	4	-8.64	0	0.0383	0.644	0.207	0.0922	0.441	79.985	4	176413
6D5ALH11CwnnUaVqyyGmUS	0.831	0.426	9	-11.249	0	0.0354	0.478	0.0061	0.138	0.43	126.03	4	274360
63T7DJ1AFDD6Bn8VzG6JE8	0.464	0.795	1	-9.267	1	0.0926	0.0493	0.00244	0.399	0.612	158.691	4	202267
6H3kDe7CGoWYBabAeVWGiD	0.634	0.63	1	-8.277	0	0.031	0.447	0.039	0.17	0.489	118.628	4	270773
7HKez549fwJQDzx3zLjHKC	0.631	0.932	5	-4.142	1	0.0354	0.0436	0.137	0.0918	0.971	122.429	4	213067
2PzU4IB8Dr6mxV3lHuaG34	0.723	0.863	2	-7.89	1	0.0338	0.0383	0.0317	0.128	0.931	136.302	4	222813
1Ud6moTC0KyXMq1Oxfien0	0.702	0.668	9	-9.237	1	0.214	0.518	0	0.0588	0.561	116.063	4	378147
77oU2rjC5XbjQfNe3bD6so	0.783	0.878	1	-3.864	0	0.0308	0.39	0.000778	0.0426	0.885	100.626	4	265173
1GcVa4jFySlun4jLSuMhiq	0.429	0.554	9	-6.128	0	0.0291	0.67	0.000152	0.105	0.407	136.302	4	272000
3hJLKtTpgct9Y9wKww0BiR	0.795	0.71	9	-4.746	0	0.0392	0.443	0.0215	0.344	0.845	109.689	4	288667
52dm9op3rbfAkc1LGXgipW	0.432	0.389	7	-6.517	1	0.0255	0.687	0.0107	0.0788	0.158	139.506	4	341773
6lFZbCc7pn6Lme1NP7qQqQ	0.32	0.62	0	-9.686	1	0.0594	0.64	6.36e-05	0.253	0.472	86.327	4	448720
54X78diSLoUDI3joC2bjMz	0.367	0.452	10	-10.422	1	0.0307	0.0353	0.00228	0.689	0.189	113.066	4	520787
62LJFaYihsdVrrkgUOJC05	0.898	0.271	7	-12.238	1	0.091	0.0135	0.00138	0.0461	0.742	111.485	4	226240
51H2y6YrNNXcy3dfc3qSbA	0.729	0.989	9	-4.613	0	0.049	0.0102	4.45e-05	0.443	0.84	126.47	4	352906
2I1W3hcSsPIsEJfD69pHrW	0.761	0.67	2	-12.759	1	0.0438	0.21	0.000426	0.0684	0.91	120.75	4	215173
0QeI79sp1vS8L3JgpEO7mD	0.309	0.93	11	-6.399	1	0.125	0.0192	0.0022	0.106	0.376	195.815	4	280000
2QSUyofqpGDCo026OPiTBQ	0.864	0.826	10	-5.496	1	0.0814	0.23	2.36e-06	0.0663	0.596	118.955	4	373747
0aPaGIX2QIMAH5SMp0VEMe	0.489	0.693	6	-4.952	1	0.0427	0.0182	5.63e-06	0.304	0.453	185.758	4	265320
6fBwVe6udYdnRqwqo06if8	0.731	0.75	2	-10.457	1	0.0321	0.0862	0.000388	0.202	0.639	135.406	4	178987
2XLAzm8bMDSI7MhbRW8nVj	0.812	0.506	1	-8.825	0	0.0453	0.0399	0.0847	0.0671	0.727	114.832	4	347667
4N1dFbXmRng8qJ3KdJrbLr	0.789	0.808	1	-6.176	1	0.0881	0.148	1.32e-05	0.84	0.803	123.011	4	188373
51c94ac31swyDQj9B3Lzs3	0.269	0.853	7	-4.647	0	0.0854	0.000249	0.000246	0.118	0.179	141.581	4	299533
1158ckiB5S4cpsdYHDB9IF	0.443	0.781	1	-4.277	1	0.0377	1.33e-05	0.205	0.166	0.372	71.841	4	214760
4Uiw0Sl9yskBaC6P4DcdVD	0.206	0.965	1	-5.116	1	0.079	9.91e-06	0.827	0.367	0.168	92.615	4	299867
1EryAkZ0VHstC6haIxVBiE	0.367	0.634	5	-6.475	1	0.027	0.000824	0.0759	0.116	0.0964	89.981	4	241533
70L6nHORQsblY813yNqUR3	0.47	0.859	2	-3.663	1	0.0537	0.000362	0.00691	0.142	0.17	124.01	4	317707
4FEr6dIdH6EqLKR0jB560J	0.285	0.613	5	-6.412	1	0.0421	0.0185	0.1	0.114	0.0772	126.628	4	413347
4cLdpErILMO8Db8pQVAVcZ	0.472	0.446	5	-7.416	0	0.0354	0.00273	0.0606	0.091	0.0456	77.562	4	225293
6DoXuH326aAYEN8CnlLmhP	0.431	0.906	9	-6.13	1	0.0945	0.0001	0.0001	0.123	0.53	125.459	4	223893
3Fwe3XoPOiyWUPYdBKMTqV	0.449	0.87	5	-4.241	0	0.112	1.94e-05	0.0411	0.0797	0.229	79.952	4	211733
2jSJm3Gv6GLxduWLenmjKS	0.338	0.859	4	-4.938	0	0.0824	0.00122	0.211	0.0936	0.504	92.966	4	255373
2GiJYvgVaD2HtM8GqD9EgQ	0.611	0.797	6	-7.627	0	0.0533	0.00543	0.00137	0.26	0.518	120.041	4	218107
4AewKenHXKBt643p473xCk	0.542	0.867	6	-5.26	0	0.0813	0.0226	0.00347	0.116	0.326	134.984	4	260987
1Dr5JexwA15wmKe7Y7maA9	0.743	0.685	4	-6.863	1	0.0975	0.0664	6.75e-05	0.0884	0.443	109.988	4	274320
00Ci0EXS4fNPnkTbS6wkOh	0.53	0.77	9	-5.882	1	0.0824	0.000965	0.0115	0.265	0.107	184.537	3	253880
62ZXL1CWLJDiDWUZUhfLfU	0.551	0.813	5	-4.25	1	0.0621	0.0155	5.82e-06	0.105	0.568	97.557	4	224373
2CzXAeABCmbEB52ZziuMsH	0.638	0.893	6	-4.21	0	0.059	0.0534	0	0.256	0.904	91.981	4	189467
03YZnK3XQWKpvo9TyNZzXf	0.418	0.688	11	-5.515	1	0.0265	0.212	0.00964	0.705	0.319	150.03	4	224787
4JEhFF1J95HoXuuXkyxMyS	0.767	0.376	0	-10.485	1	0.0386	0.555	0.00791	0.108	0.615	123.954	4	139604
5rwQGBi5mdmU7dqNM7x9Oo	0.398	0.909	5	-2.493	1	0.0593	0.714	0.000553	0.286	0.644	115.162	4	225881
00XrSeoUJusUuWvqd08lyF	0.443	0.876	10	-4.588	1	0.0499	0.411	0	0.36	0.706	154.588	4	190413
16zn1yeH0Ia8JJJZh1fe1P	0.412	0.866	1	-5.049	1	0.0376	0.00181	0.00382	0.0804	0.492	118.789	4	189040
1ZXZQqS5hNvnKvhK8Q6Vz3	0.293	0.889	9	-6.097	0	0.087	0.265	0.757	0.365	0.579	151.426	4	232667
5kMxNkoBH6XZfmfIqWmkHo	0.497	0.92	5	-3.098	1	0.0491	0.00219	0.814	0.16	0.663	82.87	4	128787
5vWqMMqif5Vm1e1TK8NgbY	0.355	0.473	0	-7.692	1	0.0344	0.0405	0.059	0.0664	0.617	183.472	3	258493
5WENROwBwUlSPqfP6qiuBv	0.685	0.872	1	-6.218	1	0.081	0.832	0.0557	0.259	0.969	115.745	4	142092
777LjHoW3blYhduQVUrCPk	0.407	0.98	4	-0.489	1	0.0456	0.806	0.348	0.287	0.674	150.415	4	170520
6Vt3tMlZpK4jJV6QcD1CZK	0.388	0.937	6	-7.16	1	0.0476	0.292	0.878	0.13	0.963	176.74	4	149013
0DbvxgPkYpy5auMoE19Pvh	0.356	0.83	4	-7.794	1	0.0457	0.00145	0.05	0.106	0.575	119.844	4	240600
403vzOZN0tETDpvFipkNIL	0.631	0.792	0	-4.364	0	0.0427	0.23	0.000317	0.0756	0.462	82.901	4	247493
7ko94TOP3vONuYqHLH6zpe	0.327	0.142	3	-12.071	1	0.0364	0.882	7.74e-05	0.099	0.0926	74.334	3	249135
7oChm7YC5PS1NvEkRCgswG	0.631	0.619	0	-6.403	0	0.025	0.321	0	0.0658	0.417	100.258	4	317413
5fMZ4cDsfhxR7gnFdtrWCy	0.594	0.689	2	-8.395	0	0.0393	0.302	0.0173	0.0869	0.76	138.4	4	243120
2OYmCSVGmN5vXuG5dX5LKY	0.749	0.48	0	-8.374	1	0.0285	0.378	0.00132	0.0974	0.664	99.859	4	218413
0H4b4uRUjtSjI91UYA2zSz	0.66	0.443	7	-10.031	1	0.0471	0.248	0.00959	0.094	0.71	154.877	4	205560
3v6NuKeDbFbaq1lNjw3XtR	0.446	0.643	7	-7.925	1	0.0561	0.67	0.000818	0.0951	0.531	99.608	4	289093
1oMorGwgReaTZ46f3rbqAs	0.658	0.432	0	-10.934	1	0.0302	0.647	0.059	0.115	0.438	122.263	4	231133
0lWLMR456FAFjlLIEBLzWf	0.547	0.662	4	-5.196	0	0.0293	0.571	0.00146	0.122	0.498	82.173	4	389160
2dAzuxEnwjHmYN1K5bAZDC	0.745	0.486	7	-9.79	1	0.0553	0.0622	0.000825	0.117	0.518	82.505	4	221213
3TfTZ3fGLYtR1azsY8iEp4	0.664	0.38	6	-8.297	0	0.0625	0.0423	0.000537	0.122	0.236	144.045	4	190000
5TidpShGz6Jxsbx8fzKDlC	0.851	0.359	0	-8.335	1	0.0832	0.0207	0	0.105	0.159	137.034	4	192600
62LFFIgexF6K6FgT7F3iGO	0.907	0.371	11	-9.932	1	0.162	0.00847	0.00351	0.0918	0.287	139.957	4	198693
1INuxWCWyhe19KD0b2ndxe	0.731	0.338	4	-11.774	0	0.102	0.186	7.33e-05	0.115	0.0607	128.045	4	136934
7xMfEa2LiJEecDg90ux5Se	0.658	0.422	3	-10.727	1	0.0532	0.0171	0.255	0.107	0.0354	94.993	4	167133
1nynzV70VzfWjcCX9u64QV	0.567	0.343	11	-13.203	1	0.0414	0.22	0.351	0.148	0.113	150.062	4	143947
0Eet41iyLiVDtBmLp447pA	0.457	0.325	1	-10.811	0	0.0387	0.123	1.87e-06	0.108	0.0388	102.91	4	255907
0C42kuXV8DNlXzJTIUNFFE	0.528	0.478	6	-9.857	1	0.0592	0.171	6.08e-05	0.111	0.343	80.003	4	120667
2VZDujZxmIDhW1G2sPsKqQ	0.705	0.426	3	-9.078	0	0.039	0.0157	0.00491	0.113	0.241	123.967	4	220707
2JbNx2R6LaF2dZ2CYA1kDV	0.69	0.46	5	-9.147	0	0.183	0.0355	9.89e-05	0.115	0.243	90.114	3	128575
2XvpMAHHUVuKodlo7BKqpv	0.654	0.155	5	-15.098	1	0.0372	0.962	0.000904	0.115	0.247	75.742	4	219268
3kpRgTtMnArQ5Gay0JxElf	0.55	0.373	9	-8.772	1	0.0314	0.391	0.0551	0.0935	0.33	121.941	3	293213
0AwLsPPWgYkib7HCrayqwy	0.44	0.416	11	-7.222	1	0.0322	0.19	0.723	0.11	0.412	101.93	3	256920
14lFMWrwM30Q8FiijmxWVz	0.649	0.261	9	-10.247	0	0.0298	0.494	0.0573	0.149	0.386	75.679	4	187227
7BT2BsgZZffGmiENrzxCzy	0.738	0.334	9	-14.653	1	0.0505	0.825	0.189	0.0845	0.489	78.026	4	364333
5Y8IMaCAPl996kjC4uo9Tx	0.384	0.441	9	-10.411	1	0.029	0.254	0.276	0.0725	0.22	81.493	4	274773
2rsswxxShjBqoEj7dbr4Sb	0.749	0.46	4	-7.641	0	0.0372	0.117	0.00237	0.106	0.43	91.99	3	261187
3rly0zvX18j9J00wh5bs5S	0.634	0.308	7	-15.771	1	0.0371	0.0605	0.822	0.108	0.131	111.973	3	266751
0s5VgEWaorOXCP0XdgTGXM	0.507	0.333	9	-10.079	0	0.034	0.563	0.515	0.311	0.334	103.541	4	249227
4lzPv33jwjnTJ7b2LMAmpG	0.614	0.508	11	-10.445	1	0.0675	0.824	4.53e-05	0.112	0.624	85.485	4	145453
2NF8A7C6tICScdRaZ0BrEe	0.837	0.793	11	-5.048	0	0.0567	0.0261	9.04e-05	0.0743	0.87	124.988	4	151011
09uXepY9uC1cUlvZ6kbOy6	0.677	0.721	9	-7.499	0	0.039	0.127	0.00105	0.111	0.964	123.862	4	220240
3JlInp87C2VJ86UUrXkTM0	0.711	0.432	6	-10.398	1	0.0372	0.5	0.189	0.159	0.77	127.488	4	171920
0yfxzBChrAXXoUKuUvSgzm	0.641	0.76	6	-8.222	1	0.03	0.0862	0.00719	0.104	0.966	145.798	4	169693
3CI8Y7vvCYUKo8kjZteCrz	0.704	0.202	9	-12.796	0	0.0304	0.865	0.0659	0.112	0.161	84.103	4	250720
6naEBVsSQonTSqTOsquBA9	0.616	0.548	5	-9.846	0	0.0301	0.408	7.22e-06	0.274	0.676	120.365	4	208573
501jsSXfxhgClQe4UDrofk	0.646	0.91	0	-5.78	0	0.0334	0.183	0.000146	0.063	0.958	151.78	4	200813
5mqop2IekTZWc2hRE7NpmW	0.594	0.93	1	-5.224	1	0.038	0.112	0.0112	0.119	0.963	124.506	4	180960
1Zi74xhSWk5R13oGceGsfm	0.512	0.667	3	-5.463	1	0.0274	0.623	0.069	0.255	0.496	103.949	4	233357
7N15WWy12QAMpGAh6QMAej	0.771	0.522	11	-12.193	1	0.0368	0.571	0	0.145	0.94	128.641	4	129061
0KOE1hat4SIer491XKk4Pa	0.212	0.383	10	-10.071	1	0.0347	0.723	0	0.299	0.452	173.79	3	191160
5EoYc5wvRYOtkudLfrjsL1	0.487	0.532	0	-7.496	1	0.0322	0.631	0	0.184	0.609	70.838	4	164252
7FS541dJh3iQAEXEZoDhE6	0.458	0.801	9	-7.83	1	0.0565	0.691	0	0.328	0.93	160.547	4	159853
6e6Kxot9nHyZ4I8GgmGKII	0.373	0.301	9	-11.843	1	0.0314	0.769	0	0.0816	0.436	65.488	3	158680
5z8DiKSG4EwxmO6gUi12rZ	0.776	0.659	9	-7.767	1	0.051	0.434	0	0.0868	0.969	123.094	4	160000
24lvdbt9pS7DFEjhEWSl49	0.558	0.311	4	-9.582	0	0.0288	0.887	0	0.118	0.415	95.978	4	163480
4UcxTnA6C5vCW79PIZ38Vx	0.663	0.638	2	-8.765	1	0.0592	0.691	0	0.302	0.869	119.476	4	146493
7uIaBPSTlBaAQr1asfZ3B4	0.181	0.359	9	-12.46	1	0.0498	0.921	4.9e-06	0.25	0.367	80.954	4	144907
7v1858htfU0srTDwhxeka8	0.703	0.724	7	-10.818	1	0.0467	0.73	0	0.518	0.963	131.821	4	155173
3RznzRnsl8mzP63l4AF2M7	0.341	0.426	0	-11.194	1	0.0416	0.919	0.0673	0.106	0.187	169.986	4	420012
0AFydkgl5Creero3gNjqvF	0.333	0.41	11	-9.534	0	0.0305	0.873	0.406	0.122	0.262	143.975	4	222986
7qLs0IyUn6TrqgMzQ33SdH	0.339	0.23	0	-10.803	1	0.0317	0.979	0.000951	0.353	0.113	66.352	3	101007
2aDk1KkyB7ieSwwEDXCHJg	0.227	0.431	7	-9.527	0	0.0432	0.666	0.0239	0.126	0.575	76.986	4	373359
0L7MpEwFgZRP5rFdXOYaRT	0.496	0.803	1	-6.234	1	0.0498	0.0214	0.000734	0.328	0.318	126.885	5	152746
5YsZ99OX1aOyppre3Zwhnp	0.486	0.22	10	-15.069	1	0.0289	0.912	0.444	0.137	0.188	159.993	4	220092
19siCk4vlsMuzQmLTwi5yt	0.587	0.878	0	-6.667	0	0.137	0.0277	0.228	0.182	0.377	148.01	4	227346
5ELOH7ea3ZkSeWTMIpWGDv	0.755	0.705	0	-6.835	1	0.0546	0.508	0.000725	0.108	0.926	144.015	4	190048
5djzvjJY39rwAQaHgpPR02	0.637	0.53	6	-7.252	1	0.0399	0.159	0.0241	0.108	0.666	144.023	4	215242
3C5CcBXFEldHfgwDe62zWI	0.753	0.774	7	-8.086	1	0.0504	0.27	0.589	0.0874	0.924	152.027	4	149949
0ewrI06EIDMGXvgJxuyF3U	0.576	0.609	7	-5.921	1	0.107	0.303	0	0.164	0.737	86.703	4	212800
2NAOqvZIf7onZ4kDLU560I	0.727	0.576	5	-9.722	0	0.052	0.464	0.0342	0.116	0.672	88.791	4	192902
1Yxbxg5R6dQcYmOdjvlXP0	0.597	0.549	1	-10.253	1	0.0586	0.651	1.47e-05	0.0991	0.204	122.801	4	291596
6INaSJ4clfZ8pvXSGZQnJ7	0.587	0.731	7	-5.632	1	0.0398	0.12	5.78e-06	0.132	0.539	110.936	4	268667
5lJ1NMNz6ymwdaL9aejm8e	0.738	0.478	10	-12.328	1	0.0507	0.499	0.41	0.43	0.369	112.981	4	319840
77OBKDqQD0tvocHP5AXDDV	0.744	0.391	0	-8.374	1	0.0266	0.769	0.000762	0.109	0.533	104.874	4	171958
5wDkzGnw8nsQUbgMryKWBl	0.501	0.458	1	-10.32	1	0.0944	0.229	2.67e-06	0.19	0.185	125.637	4	363143
3HUCTp20rxqMnCtdyU7JgU	0.634	0.433	2	-8.018	1	0.0256	0.864	0.00858	0.102	0.268	101.791	4	191671
5a2yG11mx2vNBcOo6UMIel	0.519	0.236	8	-15.29	0	0.0453	0.879	0.00912	0.0926	0.243	110.013	4	191295
2UODQhPzz51lssoMPOlfy5	0.494	0.836	7	-4.327	1	0.0531	0.0249	0	0.457	0.627	142.56	4	256560
721tATaNQPPGSuC3dYEI3h	0.331	0.559	2	-8.263	1	0.0316	0.224	0	0.297	0.236	115.117	4	313600
7IxWqdG1zG0gaAFYq2q0Iy	0.487	0.81	4	-4.067	0	0.0357	0.000754	0	0.352	0.702	123.493	4	221853
0IwXp8V7wgFCIthRh2z8Ot	0.588	0.613	2	-9.656	1	0.0396	0.369	0.0422	0.107	0.185	119.536	4	258333
221bl0jrSfJ1LMgUw36zRJ	0.531	0.765	0	-7.844	1	0.0349	0.0068	0.000313	0.209	0.452	135.457	4	227907
2GRbFpacyEnbA3Mk7KcfM4	0.411	0.754	7	-6.515	1	0.0294	0.101	2.83e-06	0.141	0.602	189.9	4	269147
5eltlS3CM4xGNkL6VhpTDm	0.391	0.581	9	-5.481	0	0.0901	0.25	0	0.0861	0.459	83.587	4	525933
1bvERTuePaoVjQ3NpJq9aH	0.593	0.365	9	-6.407	1	0.0252	0.511	0	0.139	0.159	98.345	4	237547
38psZM2gA6UWA7rqqgOjGL	0.605	0.789	4	-7.035	0	0.0338	0.00219	0.0178	0.127	0.434	136.041	4	243800
5QTKgUArMLt1JzM2JXlYCN	0.677	0.871	11	-6.198	0	0.0294	0.0129	1.33e-06	0.397	0.518	115.138	4	195947
2hnMS47jN0etwvFPzYk11f	0.682	0.765	1	-5.021	0	0.0395	0.0268	3.42e-05	0.188	0.567	90.807	4	182747
3B4q6KbHbGV51HO3GznBFF	0.804	0.696	7	-7.47	1	0.0899	0.00877	0.000985	0.314	0.657	95.721	4	170907
4eamJr2k9YDH8j58RSTmSc	0.708	0.757	7	-5.121	1	0.0791	0.0362	0	0.17	0.552	80.976	4	253840
2PdIo7ewQPuAsP99LVg9uy	0.69	0.681	9	-5.653	1	0.0379	0.0623	0	0.137	0.911	75.034	4	136147
4paJ10JPNCyOaLtz2cY928	0.801	0.548	11	-5.482	0	0.0516	0.0854	0.000232	0.387	0.627	92.059	4	188086
0Jur3mZsQba3vqSpcmsOPm	0.761	0.687	7	-6.185	1	0.131	0.00469	0.00532	0.245	0.316	95.089	4	173427
2JKlf0IYz5oWsT3OCLyjpO	0.753	0.484	9	-7.519	1	0.258	0.0149	0	0.135	0.597	79.668	4	211560
0vtJ9Dq53hfXE3KyP1yPni	0.688	0.489	0	-7.848	1	0.0378	0.00053	0.00292	0.143	0.364	94.27	4	183000
7FLQo89iaS5gf2hnIEW7P9	0.64	0.695	4	-8.196	0	0.202	0.0113	2.75e-05	0.36	0.787	102.288	4	217653
3kGt9uxpJzKTxwp2uJHrU5	0.638	0.864	2	-4.255	0	0.0358	0.00253	0	0.178	0.811	102.289	4	156160
2lwwrWVKdf3LR9lbbhnr6R	0.649	0.888	6	-4.807	1	0.0293	0.013	2.23e-06	0.0888	0.553	100.975	4	208467
0Fe3WxeO6lZZxj7ytvbDUh	0.639	0.903	11	-5.013	0	0.0371	0.00963	7.06e-05	0.174	0.96	135.938	4	246173
5vtRk4rYxiy4cj95cmJ5Ma	0.378	0.736	4	-9.438	0	0.0407	0.326	0.105	0.107	0.796	182.672	3	342000
4asjU3sDnn3002bTJIg2vZ	0.71	0.698	2	-5.797	1	0.0332	0.0697	0	0.478	0.852	104.007	4	264813
5op53ANI4exiWqFHKuwWxd	0.523	0.477	6	-9.076	1	0.0254	0.0961	0.000106	0.101	0.249	76.973	4	272507
5jJ69cMDMC0aeWPjZo6VP2	0.659	0.906	7	-3.906	0	0.0428	0.156	3.27e-06	0.105	0.792	94.997	4	187720
4ToYlykhwpW98KtMIGnWQK	0.646	0.964	7	-3.177	1	0.0369	0.0407	3.65e-06	0.293	0.747	95.479	4	224333
1pPqVrG2RCHXx81Aw4xp99	0.395	0.443	4	-7.972	1	0.0396	0.431	0.0352	0.504	0.714	103.262	4	259840
5EsM3rVaMDRsOXJq7oe3tY	0.478	0.552	2	-6.46	1	0.0337	0.129	0.169	0.103	0.886	176.156	4	209960
7Gi8kaILAUgjYqgdee9410	0.536	0.567	7	-7.512	1	0.113	0.326	1.87e-05	0.109	0.433	82.191	4	238493
113bLFbp3F9MVN0w2KJ1ma	0.674	0.909	10	-3.369	0	0.0464	0.469	0.0131	0.105	0.969	103.942	4	243760
46qpQWRt75ZlVPLtlwQvty	0.704	0.606	5	-8.752	1	0.104	0.254	8.29e-06	0.168	0.74	95.287	4	147627
4inbFqrP4CS3Ig99dIwfQ1	0.771	0.639	6	-8.151	1	0.0321	0.312	6.42e-06	0.14	0.887	110.509	4	166767
30lSYnB1aJjmxuJFXhJuhD	0.654	0.965	7	-3.85	1	0.0559	0.222	0.333	0.0825	0.848	122.911	4	182827
5RlLg00cYLUNOBo1edu51Z	0.77	0.578	7	-9.233	1	0.0281	0.622	2.61e-06	0.357	0.963	89.845	4	183520
1lDrb5N8RmfD1USPQYPpUu	0.823	0.549	6	-7.77	1	0.0532	0.533	0	0.0981	0.943	97.374	4	219613
0THjXAVqAVDyIcihu1FKL8	0.676	0.918	2	-3.885	1	0.0559	0.248	0.000409	0.0955	0.905	96.41	4	197527
69YW4FrGpsjzt9lr517bUz	0.452	0.557	9	-6.899	0	0.0351	0.606	0	0.283	0.68	111.362	4	225133
1fEUMHp0jSNrZfzINtXCq6	0.539	0.478	10	-8.757	1	0.0581	0.414	0	0.611	0.541	91.286	4	143840
6oobvM9iZY1OF18kC36llz	0.714	0.498	2	-8.154	0	0.0545	0.753	0.000463	0.0816	0.723	92.71	4	176560
0Z57YWES04xGh3AImDz6Qr	0.417	0.686	7	-6.484	1	0.0373	0.0955	0.0287	0.0989	0.625	204.113	4	189293
77RNVzAVwqWiZrZuWqMV2i	0.534	0.641	0	-9.172	1	0.0276	0.523	0.0428	0.0904	0.505	107.081	4	234160
3O30ywyRk6EKT68sBvVqOP	0.578	0.808	9	-4.131	1	0.0284	0.0608	0.144	0.0388	0.597	93.979	4	190613
7qqrGV5WpQnMKqVTsDZd9J	0.289	0.324	5	-9.866	1	0.0301	0.851	0.00368	0.112	0.244	77.94	4	301480
7ydJaSdC8Au68eYgspNznY	0.506	0.47	2	-8.787	1	0.0284	0.737	0.608	0.125	0.477	104.967	4	300240
3wfF0Nw234zHY1vdIWIc2g	0.446	0.807	0	-5.222	1	0.041	0.215	0	0.226	0.8	188.094	4	170827
2gUwnJ5cpl40TSlqmjfqAC	0.584	0.87	10	-4.703	1	0.0351	0.114	5.21e-06	0.108	0.852	164.992	4	215147
0rGB4l2BHJhL4C1s8w6jZG	0.426	0.453	2	-8.574	1	0.027	0.389	0.0971	0.123	0.175	87.787	4	143240
5AHYDez7G9xD3CIReL88yU	0.565	0.461	4	-8.337	1	0.0294	0.737	0	0.0943	0.318	104.771	4	219260
5jLMFDMUkGpzIgPF2sxWkB	0.189	0.726	7	-6.191	0	0.0511	0.303	0.00352	0.0807	0.322	210.495	3	278773
7Jh1bpe76CNTCgdgAdBw4Z	0.489	0.758	7	-6.491	1	0.0297	0.000678	0.49	0.092	0.435	112.113	4	371413
0pQskrTITgmCMyr85tb9qq	0.486	0.449	5	-10.298	1	0.0267	0.166	2.23e-06	0.54	0.549	100.456	4	254293
2EC9IJj7g0mN1Q5VrZkiYY	0.635	0.686	9	-15.648	1	0.053	0.209	0.0176	0.282	0.464	125.988	4	274747
72Z17vmmeQKAg8bptWvpVG	0.31	0.403	0	-13.664	1	0.0326	0.0726	9.27e-05	0.139	0.466	134.48	4	318027
3ZE3wv8V3w2T2f7nOCjV0N	0.445	0.384	10	-14.642	1	0.0417	0.635	7.74e-05	0.0539	0.216	123.295	4	235987
3ix6K4wZY29bCujrSznwFZ	0.654	0.743	10	-7.44	0	0.0605	0.0125	0.0272	0.153	0.632	114.846	4	457676
6mib3N4E8PZHAGQ3xy7bho	0.56	0.605	11	-11.209	0	0.0348	0.0408	0.000162	0.0585	0.756	144.478	4	279693
0LrwgdLsFaWh9VXIjBRe8t	0.559	0.308	0	-11.75	1	0.0376	0.505	0	0.109	0.414	113.633	4	217747
3gxEZXUjrNbl3TlSrTGbR5	0.358	0.938	0	-5.577	1	0.0483	0.00375	9.2e-06	0.117	0.944	182.836	4	288339
5IyL3XOaRPpTgxVjRIAxXU	0.515	0.554	7	-11.616	1	0.0784	0.0478	0	0.219	0.509	80.146	4	193880
4uQ7wYsuL0DryknoDc11Hk	0.925	0.549	7	-6.572	1	0.0656	0.396	0.000154	0.11	0.0904	100.014	4	183160
3Vj8RQkFwOmDvUrwu6MtQZ	0.703	0.573	0	-9.032	1	0.0724	0.565	3.13e-06	0.0987	0.491	147.038	4	143830
0lqAn1YfFVQ3SdoF7tRZO2	0.593	0.947	4	-6.206	0	0.631	0.888	0	0.823	0.682	157.85	4	67210
5OFEJMirg4NPz7G1zgXDYu	0.859	0.423	1	-10.698	0	0.283	0.543	0	0.104	0.563	125.89	4	138410
1jhdCONafFj1hzJsPvZx27	0.699	0.782	2	-5.538	1	0.124	0.00664	0.000517	0.182	0.227	161.721	4	227873
7uX3gufAoBVqKVoD3dBLLD	0.776	0.379	9	-9.351	0	0.331	0.213	0.00175	0.0969	0.346	82.531	4	179016
7pBsquIkbED6W6uSQJGbkn	0.604	0.736	10	-5.596	0	0.0555	0.00608	0.109	0.11	0.345	118.012	4	211360
6eL1ncVDtQHgSm3E288TS7	0.898	0.547	3	-5.707	0	0.313	0.484	1.04e-05	0.37	0.763	100.01	4	198133
7jN5Abri3a1crehbnlWa1F	0.743	0.601	4	-6.684	0	0.181	0.272	9.65e-05	0.496	0.284	89.97	4	226006
7bUcBztfGqO7cSI2gMZeCI	0.706	0.775	1	-6.819	1	0.335	0.152	3.32e-05	0.416	0.847	127.929	4	180893
6vECYJHxYmm3Ydt3fF01pE	0.885	0.581	11	-8.813	1	0.0378	0.427	0.000204	0.0759	0.728	114.016	4	313684
3GXgrEjBjonrQrPEEi13yU	0.728	0.82	11	-6.198	0	0.031	0.00898	0.000216	0.176	0.652	124.001	4	164577
7HNpXPaTcX5CoNBjTAEWBr	0.688	0.697	9	-7.955	1	0.0485	0.753	6.21e-05	0.109	0.46	114.03	4	241053
5mpLcXEsk3jjzLFGuNKk5I	0.839	0.84	11	-8.721	1	0.0474	0.389	0.0319	0.114	0.904	117.98	4	262000
35iR1qzexmbcUSgA01S4gI	0.79	0.744	9	-7.033	0	0.0294	0.287	0.000934	0.0909	0.798	123.984	4	174348
0RtXNY1EREFz5sO94TIHM9	0.96	0.652	6	-6.941	1	0.0443	0.365	0.0042	0.0951	0.887	123.974	4	155173
2zR85boqjMOKPygjdDbGbC	0.74	0.503	1	-11.347	1	0.0522	0.0898	0.0665	0.118	0.548	118.026	4	250521
6XWsIlOw94W4lT5Xu0MdRf	0.831	0.726	9	-6.493	0	0.0566	0.342	0.00366	0.159	0.902	124.038	4	169573
0ZYok0WAPtc97pzHuDwW1f	0.684	0.766	7	-7.53	1	0.0593	0.152	5.59e-06	0.138	0.648	147.996	4	202747
1X6Kmaa2Yq70vF0cIQ6V0f	0.766	0.523	1	-9.495	0	0.0322	0.751	0	0.363	0.691	119.981	4	183277
3HOXNIj8NjlgjQiBd3YVIi	0.496	0.679	10	-7.898	1	0.0368	0.0948	0	0.103	0.507	154.028	4	230787
40DGtj95w54IDSbA7BWn3o	0.629	0.551	7	-9.44	1	0.0321	0.685	2.88e-05	0.0889	0.698	81.995	4	233693
6H96yLcXFKuBYTFEEi4Vl2	0.498	0.512	1	-8.201	0	0.053	0.519	0	0.106	0.491	166.926	4	223547
5aXYNj2v1ut661U0HLT6fP	0.626	0.632	10	-7.918	1	0.0426	0.199	5.44e-05	0.0748	0.66	88.521	4	223440
3BkBTso1LQicQOkU1ga0xY	0.481	0.343	7	-9.822	1	0.0354	0.737	1.38e-06	0.556	0.386	152.131	4	344573
6FR7CxgunBBN1jYJxsX8uZ	0.318	0.586	2	-7.606	0	0.0375	0.383	0	0.145	0.211	80.806	4	313868
1Wi0vXVg2cAXmfkrHwoQx4	0.668	0.525	5	-9.485	1	0.0859	0.625	0.0227	0.106	0.41	74.412	4	336507
1b3UY0WcVkxQvPDGo7T36s	0.485	0.75	10	-6.564	1	0.0289	0.0278	0	0.385	0.802	91.795	4	234800
6lzjz4VBXtloniJwMXWicE	0.586	0.33	7	-11.789	1	0.0321	0.927	4.88e-06	0.105	0.355	104.807	4	306400
58qolKVzSJM0o4SblVgzPL	0.416	0.341	0	-9.168	1	0.0402	0.916	1.13e-06	0.263	0.32	139.899	5	238580
5KDNFlHAdDJ84fhK27c35X	0.366	0.894	11	-4.682	0	0.0568	3.45e-05	0.17	0.267	0.304	82.305	3	247267
6CqYhhUPJORx1vvdTNc8jv	0.328	0.843	6	-6.644	1	0.0887	0.000111	0.801	0.0496	0.422	113.329	4	246000
5kHkaBN8OEQlmXfQkACxSt	0.518	0.744	9	-8.248	1	0.0374	0.00383	0.007	0.078	0.211	144.019	3	219640
7gDVjl5fEw2OPAtjbW4LzR	0.483	0.841	1	-7.494	0	0.0523	0.000172	0.861	0.108	0.13	159.747	3	195133
27msmgcdSRniJHfocEf6EH	0.542	0.806	8	-4.973	1	0.0482	0.0021	0.436	0.291	0.333	140.155	4	274333
4XDBEoD6QFnzDY5oMmNVXN	0.295	0.789	1	-5.559	1	0.0702	0.000166	0.0898	0.0986	0.515	104.135	4	178960
7slyp653Si99N4yQcJ2E9T	0.445	0.708	5	-6.207	1	0.0343	0.00112	0.0104	0.0982	0.119	86.875	4	250173
6lvNLD1XRU5paMwWH0RGRI	0.679	0.409	1	-10.41	1	0.0313	0.0695	0.265	0.079	0.31	131.983	4	293173
47HJ7biEuVZxoPkauczu2R	0.585	0.603	6	-7.152	1	0.0254	0.000234	0.891	0.201	0.212	102.364	4	246067
6tgTTBaIf0tO6lvDhoXfMg	0.413	0.784	4	-8.231	0	0.0746	0.0105	0.0473	0.247	0.317	177.88	4	253667
0zO8ctW0UiuOefR87OeJOZ	0.825	0.575	11	-4.87	1	0.0633	0.025	9.94e-06	0.205	0.65	153.954	4	299960
5SsR3wtCOafDmZgvIdRhSm	0.749	0.865	3	-5.228	1	0.0413	0.00536	0	0.198	0.371	111.914	4	216013
29gsi1zZrZxdStACmTQB0Z	0.709	0.589	8	-7.776	0	0.0433	0.0507	0	0.0585	0.58	133.922	3	278067
4LmAnpjlhWTahvRkYR8xJa	0.768	0.471	2	-8.406	1	0.259	0.0201	0	0.268	0.405	131.023	4	267427
6tByydPskASjm9jTPkNQq0	0.885	0.492	1	-6.015	1	0.367	0.00172	7.79e-05	0.081	0.203	156.958	4	107147
6BKAKoo7J2vwJGZJs5dhGD	0.825	0.644	1	-6.001	1	0.175	0.0311	0	0.086	0.79	132.019	4	161480
0IH3D0P8OrQFs6ajcqbm0R	0.414	0.544	5	-9.455	1	0.102	0.636	1.71e-05	0.0813	0.0569	171.867	4	150613
2yJ9GVCLMmzBBfQAnfzlwr	0.927	0.535	6	-7.59	0	0.0911	0.0855	0	0.136	0.336	112.96	4	313573
4NN6N5TxBO5k9uqu0W4gfQ	0.906	0.545	11	-4.977	0	0.344	0.181	0	0.091	0.543	139.932	4	186827
2kfpH2OAAdpk5J3JaraAIh	0.65	0.859	1	-4.54	0	0.0957	0.021	0	0.0986	0.169	127.828	4	197800
0BMzC3hYff1zj2MsllexiU	0.453	0.956	4	-4.973	1	0.0666	0.0014	0.877	0.0997	0.269	81.529	4	206440
2v4kQsvlTPEYOIyJkytzGH	0.425	0.79	9	-6.675	1	0.0471	0.0157	0.000255	0.0625	0.297	120.998	4	326067
4SenxwCmSCIXfklUvmXyNc	0.531	0.879	9	-3.943	1	0.0769	0.264	0	0.347	0.863	92.537	4	210907
3NMFdFi82kdYIAuM7RoLNA	0.451	0.717	4	-5.188	0	0.0449	0.0047	6.2e-06	0.405	0.437	124.011	4	232600
2ppb1P4Ca7mFUay8seG0V2	0.506	0.671	7	-5.97	0	0.0321	0.000156	0.765	0.369	0.353	118.043	4	237463
0iCmSNHh2SaJPa6G3Mx105	0.611	0.785	6	-5.46	0	0.0317	0.0444	0.00071	0.118	0.672	77.452	4	211427
6FciQamZ49aqlmn06yJjYx	0.565	0.732	1	-6.27	0	0.0363	0.000385	0.000148	0.134	0.596	131.718	4	227453
5IOjHxhDVsW9hCebpWIjkq	0.408	0.991	2	-2.895	0	0.112	0.0152	0	0.503	0.305	91.253	4	156973
4IDOe60g0rR3hQqpAluLgN	0.335	0.331	11	-8.368	0	0.0516	0.695	0	0.108	0.443	173.786	3	361133
24gpcyxzfyE8DI89FXFHLh	0.378	0.704	9	-7.692	0	0.0971	0.0323	0.000628	0.134	0.189	151.337	4	167560
6Vi3zrYtd2n53YUiYLTnNC	0.619	0.631	5	-12.295	1	0.0529	0.644	0	0.759	0.949	153.246	4	156240
0Xt2ZJpiBRYnExG0k2Zk9b	0.677	0.792	3	-8.115	1	0.0527	0.119	0.0126	0.374	0.83	106.988	4	332387
1wHNSciCOxqs4dft2EWrIC	0.715	0.715	11	-6.344	1	0.162	0.37	1.03e-05	0.318	0.844	135.146	4	170388
7c60MUlDMw6ZI1Ft4LxLBY	0.672	0.525	4	-13.177	0	0.0485	0.381	2.21e-06	0.115	0.9	90.319	4	227160
4zW2uJshw0MqCjlLlW7T51	0.398	0.882	7	-4.114	1	0.061	0.0454	0.361	0.0732	0.813	177.197	4	95925
3vdevXZtf1T08rQubQcwY4	0.674	0.612	11	-8.034	0	0.0918	0.482	6.63e-06	0.0663	0.943	82.908	4	247947
1uJKTRjp5WxzrWwfElOZDp	0.639	0.577	6	-9.969	1	0.103	0.412	6.38e-05	0.076	0.832	124.688	4	235160
2gVRDshVuLTKslwTequSO1	0.497	0.948	7	-6.712	1	0.115	0.0763	1.24e-05	0.879	0.743	87.595	4	286680
632pAox1NgFyiubpHzps90	0.584	0.538	4	-10.021	1	0.215	0.686	0	0.0969	0.925	122.043	5	256667
42zb6MpkTpMhuV3C3OeFXK	0.802	0.849	8	-6.753	1	0.092	0.246	0	0.135	0.936	104.816	4	234560
3mtIUX9LrCpIUiAAv9SD4a	0.519	0.0774	7	-23.593	0	0.0629	0.937	0.886	0.107	0.353	135.245	3	141200
5AMrnF761nziCWUfjBgRUI	0.633	0.49	10	-7.668	1	0.0255	0.395	6.92e-05	0.0886	0.66	132.178	3	280107
2uwN3PDudlRkAKE3wA0OqJ	0.53	0.0993	4	-23.548	0	0.0549	0.86	0.2	0.153	0.588	118.139	4	176827
3XtkcPHbYX0BImTQLlbSVN	0.499	0.0875	5	-20.383	1	0.05	0.871	0.000221	0.11	0.418	153.439	4	139000
4xfAVJL8R7mVYbDk8a9xOY	0.576	0.367	1	-14.785	1	0.03	0.432	2.24e-06	0.124	0.77	108.446	4	129333
6WuRo5MdVrpKCl6lkKIAlp	0.552	0.213	5	-16.777	1	0.0387	0.577	0.0105	0.116	0.332	116.165	4	259893
1Q0sk7b7PAGjgC3R5zyuWt	0.447	0.208	2	-18.663	1	0.0337	0.883	0.153	0.105	0.511	105.669	3	202533
4zetUxeSCCDwrr1jJT0SuD	0.57	0.398	5	-13.111	1	0.0294	0.43	0.00638	0.11	0.411	125.132	3	192280
3nkdVXnH4xC6f3YZS0C8pC	0.346	0.175	10	-17.192	1	0.0427	0.426	0.000263	0.154	0.357	168.045	4	157733
6tPiCU4LFsXUQPRIykOAnl	0.522	0.79	9	-6.242	1	0.0252	0.00581	0.00102	0.288	0.244	96.062	4	184293
14246VCxRDGZHqlMlqWSz4	0.601	0.938	1	-4.382	1	0.282	0.0225	0	0.0508	0.762	87.129	4	190261
5taqLrLouA4vCjM7ZQpEtW	0.686	0.824	11	-5.413	1	0.34	0.157	0	0.242	0.405	170.079	4	183827
1NfIOF8pH2auEaGq4roP2I	0.694	0.874	7	-2.96	1	0.333	0.38	0	0.122	0.591	89.959	4	282581
3rSiXFJlhhhy36761mj9js	0.572	0.85	3	-4.475	1	0.197	0.0893	0	0.191	0.797	96.335	4	137995
5UcJZVvqgX9dnjq161bGQ4	0.63	0.77	7	-6.655	1	0.386	0.215	0	0.205	0.829	91.713	4	201129
5Wt2UAS92w2ZyDqX2dOEBg	0.903	0.785	8	-6.285	0	0.309	0.0192	3.83e-06	0.177	0.965	94.211	4	259107
34rwJDeFgvZXd9KtiBkQKI	0.557	0.845	10	-4.373	0	0.344	0.496	0	0.115	0.867	93.374	4	159155
04jxZHjzLOknmIJSgjefyZ	0.486	0.928	8	-4.13	0	0.363	0.467	0	0.116	0.57	90.036	4	207673
0lRhj7HyP2KObeyFPUOPRA	0.349	0.892	6	-3.011	1	0.351	0.112	0	0.212	0.849	172.639	4	183688
3TPvrMAd1hbPRXuHCRX0Pl	0.446	0.764	2	-6.479	1	0.181	0.057	0	0.141	0.576	152.604	4	316944
6PuoZT4kgw5DrUEdnQ6e01	0.886	0.371	5	-10.542	1	0.0465	0.349	0.00138	0.0985	0.928	115.026	4	219261
7rNnqDOzc3Qoom2VhIyuxx	0.802	0.325	10	-9.327	1	0.0467	0.165	0.163	0.156	0.649	110.996	4	246200
0aPX1AXz8Tp51Nak6B04ij	0.775	0.721	11	-5.446	1	0.0288	0.369	0.00513	0.0517	0.974	90.986	4	167813
3YSefJ4OGYCIHNVowuSx7O	0.699	0.487	5	-7.747	1	0.0389	0.16	0.000191	0.0859	0.625	115.769	4	171714
0tN5MAdqjjhYS4HE2JnfzJ	0.786	0.384	5	-8.655	1	0.0654	0.072	0.00114	0.0484	0.771	137.943	4	211147
7dW6aiHZG0A8xApW0Xg40G	0.589	0.598	5	-7.103	0	0.0613	0.479	0.000237	0.117	0.726	130.059	4	167067
1wDBglPaH5ehDDNiNWCHp0	0.76	0.755	7	-5.714	1	0.05	0.256	0.00765	0.0817	0.55	104.655	4	231573
7c0AtG5G1kbVUrBYxREGXv	0.731	0.447	6	-11.585	1	0.0466	0.234	0.218	0.182	0.34	106.006	4	235738
0CNJyQiyzYxbsuMGTQlria	0.759	0.668	11	-5.235	1	0.0365	0.294	0.000824	0.0804	0.716	117.884	4	250000
56L8kmwn2EkIJjTJ5vMlpD	0.848	0.576	4	-7.634	1	0.0466	0.294	0.000587	0.209	0.485	119.024	4	169718
1FvDJ9KGxcqwv1utyPL3JZ	0.611	0.846	11	-5.9	1	0.0436	0.00509	0	0.0784	0.751	103.912	4	162920
1xaTREM89RbIxkcjlpf4Uw	0.609	0.759	6	-4.862	1	0.0276	0.028	0	0.183	0.774	114.045	4	215760
6LUGvXEAK8WxIBYK43uoTb	0.626	0.488	2	-7.805	1	0.0253	0.0102	0.000188	0.141	0.404	104.13	3	186627
1YrnDTqvcnUKxAIeXyaEmU	0.398	0.93	11	-6.76	1	0.0615	0.000854	0.121	0.0874	0.725	190.818	4	408173
6BrMEbPSSj55nQhkgf6DnE	0.241	0.468	2	-9.579	1	0.0272	0.534	0	0.161	0.451	91.581	3	112707
69Kzq3FMkDwiSFBQzRckFD	0.696	0.628	2	-8.407	1	0.0274	0.00102	0.428	0.272	0.701	100.038	4	221533
2OErSh4oVVAUll0vHxdr6p	0.401	0.901	1	-5.011	0	0.041	0.0704	0	0.538	0.839	134.799	4	193320
3M2bD9SMYnJIPdrTKUnBd3	0.407	0.424	0	-10.583	1	0.0318	0.0847	0	0.234	0.404	113.311	3	349187
64D3dzWyj0GpQT1AHx4kbK	0.53	0.861	7	-4.67	1	0.0372	0.0175	0.0177	0.0857	0.844	130.476	4	140507
48EjSdYh8wz2gBxxqzrsLe	0.719	0.615	6	-5.972	1	0.045	0.408	0.000147	0.235	0.465	96.988	4	250973
6IAgarq2wDeYzpsY2Kx0Hw	0.827	0.553	1	-5.296	1	0.032	0.0227	1.52e-05	0.176	0.0631	110.015	4	236120
7yvdp8dqmxExSJwT2fn6Xq	0.863	0.625	8	-6.323	1	0.313	0.101	4.13e-06	0.166	0.456	83.98	4	111227
6GCIYIWUBSLontW6divqsw	0.823	0.558	9	-7.119	1	0.0278	0.397	2.03e-05	0.0821	0.674	155.974	4	175707
22DHmfJa31hKpc2Lg0gVBV	0.827	0.477	0	-5.025	1	0.254	0.101	4.15e-05	0.0908	0.599	119.807	4	235493
0deHsjyrgcKGMZzIuvawq3	0.661	0.368	5	-7.342	0	0.0727	0.827	0.249	0.111	0.211	112.891	4	148253
5hR0wTnydz6lmErOV4c0sp	0.736	0.798	0	-6.174	1	0.127	0.0579	0.0681	0.161	0.464	113.996	4	260400
688iitLNSV6Iik1QESqvth	0.507	0.418	1	-8.659	0	0.167	0.651	7.36e-06	0.126	0.24	84.902	4	101813
2TyCAfhwu5tRqFW8VnGMIL	0.823	0.411	0	-7.061	1	0.0557	0.409	0.00135	0.649	0.397	90.997	4	257547
4o8Rk1YzdkTxsSEXd3YhAK	0.8	0.526	10	-6.403	0	0.0326	0.326	0.0416	0.153	0.454	120	4	185960
7wCmS9TTVUcIhRalDYFgPy	0.519	0.441	4	-14.178	1	0.0353	0.0204	0.000453	0.076	0.25	81.334	4	234973
4IvZLDtwBHmBmwgDIUbuwa	0.669	0.795	2	-10.865	1	0.0285	0.00772	0.0781	0.401	0.882	124.594	4	201187
0p5eZCY0R7uNCZS1YDtIYI	0.59	0.372	7	-12.37	1	0.0318	0.00105	0.00929	0.316	0.306	99.887	4	210907
3NfqN997u9A3YAAafgzhIa	0.251	0.575	8	-7.819	1	0.0311	0.00405	0.00135	0.15	0.218	185.731	4	187320
6BT7qiDY4A5tOyklohjQuW	0.654	0.39	6	-10.638	0	0.0307	0.00418	0.0069	0.271	0.566	116.572	4	175333
5cy5IStIn7OSHDEIgXeDyq	0.489	0.913	5	-9.152	0	0.0479	0.00015	0.709	0.0703	0.539	135.756	4	171747
7oDDV1cal0M0RIjr4HuuJ9	0.658	0.475	4	-12.688	1	0.033	0.000892	0.0194	0.105	0.461	125.747	4	162533
16EKGMPGE3f6X3p18CjtkB	0.73	0.54	0	-9.046	0	0.045	0.362	0.00334	0.0419	0.977	109.76	4	118933
51Z2IzJvLCnZaIpBV0IYRr	0.587	0.811	5	-10.824	1	0.0328	0.000135	0.472	0.0901	0.75	132.727	4	123907
4lSqfVzoGBmBGnBZrSrKOJ	0.66	0.417	8	-14.317	0	0.0265	0.0262	0.0238	0.0894	0.352	105.675	4	129440
2Gzg7PlsNS1XunWQFJBVt9	0.739	0.18	0	-11.439	1	0.0715	0.494	0	0.159	0.229	93.136	4	72747
0vmxiz1Zx3OP8C5CjfhIXK	0.314	0.43	10	-9.825	1	0.0296	0.466	3.59e-06	0.0997	0.152	176.944	3	180651
4nIVHPwEXljxt1D8hxEXgO	0.61	0.671	9	-4.688	0	0.0406	0.493	0	0.0928	0.542	120.424	4	150133
5yqEdgJawICKIDA5cQZBOn	0.685	0.509	9	-6.422	0	0.0571	0.536	0	0.042	0.386	116.095	4	143987
5jKBxNnQEs2gOtQkyBJF2z	0.581	0.569	0	-4.578	1	0.0391	0.0962	2.87e-06	0.0529	0.471	91.946	4	207480
0Qdti49fC0gs6nhWjEWXGp	0.414	0.57	5	-8.377	1	0.0388	0.519	0.0755	0.105	0.612	181.555	3	158027
1Qc9iyuYBNMvlooaz4GRfN	0.334	0.338	7	-10.796	1	0.0382	0.518	0	0.115	0.222	96.921	4	168125
0EYe1EIFXb5Ob9hgDtCj0w	0.755	0.66	9	-7.347	0	0.0841	0.472	0	0.1	0.869	118.757	4	173573
6ixvtEJ8wDs6Rg41ttIVqa	0.749	0.42	0	-8.219	1	0.031	0.248	3.11e-06	0.126	0.754	84.07	4	110373
3P2q1CHk8hVmu1IXjr8Us4	0.476	0.665	2	-6.895	1	0.0333	0.422	0.000754	0.0849	0.809	112.403	4	234027
34iOH7LY3vme5rQxsVILZ4	0.527	0.923	2	-7.458	1	0.0379	0.000541	0.765	0.127	0.899	146.924	4	208453
5fbQCQt91LsVgXusFS0CCD	0.32	0.798	10	-7.078	0	0.124	0.00033	0.692	0.176	0.74	84.696	4	209040
4ZuC5MfGjRQs3pZtPxqMYP	0.433	0.756	9	-7.855	1	0.0565	0.000997	0.761	0.124	0.117	145.443	4	233720
0rcLhYRihks3t4lFPtHhQV	0.485	0.846	11	-7.63	0	0.0528	0.0157	0.0287	0.0766	0.743	144.246	4	237013
1Bq65xKgu0kjSUMUlfWyPl	0.496	0.849	7	-6.512	1	0.0401	0.0202	0.573	0.102	0.65	153.724	4	218440
58vvxoXqQicDlUFJHfOuEs	0.561	0.7	0	-8.82	1	0.0798	0.356	2.96e-05	0.0723	0.607	82.857	4	144662
3iMq9V0Ece9ubjWAYVcMwj	0.478	0.783	9	-7.346	1	0.0419	0.000126	0.582	0.225	0.746	156.337	4	137653
5EabbLQZbdhCqG6aK9PFLU	0.387	0.525	2	-9.634	1	0.035	0.00236	0.769	0.251	0.258	78.339	4	291706
7k42ztYdHyKWrKrENxwjkV	0.609	0.399	6	-10.79	1	0.03	0.242	0.406	0.109	0.469	119.937	4	252093
4lmYkAt0bgbNW2BhMXLWpa	0.565	0.773	2	-9.214	1	0.0745	0.283	0.121	0.0888	0.842	167.735	4	169594
2Y3x5VcEAxLNmVHxQOE0jB	0.778	0.399	1	-8.984	1	0.0858	0.0751	0.835	0.103	0.321	137.305	4	67720
5nqd51nD2UACz5JQ83v878	0.382	0.507	2	-8.179	1	0.0323	0.787	0.0124	0.235	0.494	135.787	4	143120
1bZH8L8V2m454tdcSPEIl7	0.628	0.585	3	-8.036	0	0.0421	0.147	0.927	0.0465	0.618	100.95	4	162267
1xDeDsNoBNyBidVQKPnWXE	0.587	0.732	5	-8.097	1	0.0317	0.055	0.924	0.247	0.747	96.848	4	202240
18OzYEBhFuusiRbvkhf6Zl	0.615	0.76	10	-8.393	0	0.0317	0.0186	0.053	0.0825	0.902	90.847	4	183213
4evkhyjgx4eLgyvujGWSTc	0.611	0.785	2	-7.174	1	0.0301	0.0866	0.83	0.129	0.656	103.688	4	228920
4EGhtRnsa6DoGImFOzVzLd	0.692	0.661	10	-7.157	1	0.0606	0.0544	0.657	0.113	0.698	117.472	4	233000
5aqR0sE4AVaycHGVVjoZmx	0.393	0.892	2	-4.685	0	0.0514	0.00187	0.89	0.0926	0.704	190.157	4	157613
74gBEukHVsGBlEdYWiwLWK	0.493	0.573	5	-8.564	1	0.0287	0.116	0.722	0.139	0.702	158.262	4	177013
5ggyTMSZovcl1Pg79uZTN5	0.445	0.752	1	-8.226	1	0.0648	0.0401	0.867	0.0884	0.834	178.009	4	306680
25z7NYgTEt6MiA5qExNSH2	0.768	0.682	0	-8.316	0	0.0892	0.49	0.0249	0.132	0.657	78.877	4	265003
1emxi7e5EWFsJmwSKTuUDH	0.487	0.497	4	-5.776	0	0.064	0.124	0.167	0.109	0.195	160.317	4	246573
6iNHWlOLt4NuDi9iSvtznO	0.48	0.751	1	-5.702	0	0.0383	0.188	1.69e-05	0.163	0.789	177.371	4	257387
2axJJQBO4KbFsx0Twvb8mn	0.579	0.837	6	-5.193	0	0.107	0.172	0.0312	0.13	0.768	83.566	4	235213
5ZmpzweHaXXOa1lndt3vDj	0.352	0.502	4	-8.477	0	0.0277	0.0187	0.883	0.185	0.365	177.921	3	251427
2vroaTJq214LCxTtRGzrFf	0.81	0.76	7	-4.368	1	0.0411	0.00281	0.002	0.101	0.945	133.251	4	160701
6eFsavqVXRlyeSnlX75pc4	0.765	0.497	1	-6.829	0	0.0483	0.766	0.151	0.111	0.509	86.173	4	212939
6Tn9J7LOj5CuytqzORpkrz	0.596	0.652	1	-4.703	1	0.0483	0.305	0.000866	0.071	0.898	162.675	4	229720
2mGWmvIIvs7jKEXxyh7Wfb	0.612	0.792	7	-7.382	0	0.0278	0.021	0.951	0.0987	0.546	115.111	4	214063
6gZkoHTufo7bTuMHFyppWv	0.716	0.805	1	-8.838	0	0.0527	0.0464	0.701	0.127	0.372	98.219	4	240307
39shmbIHICJ2Wxnk1fPSdz	0.743	0.836	2	-6.465	1	0.116	0.0804	0	0.384	0.82	113.375	4	188987
5jzma6gCzYtKB1DbEwFZKH	0.651	0.801	0	-7.34	1	0.0514	0.123	0	0.0825	0.776	133.769	4	200480
6ITuEsxEy2qPhqMowdDAeI	0.762	0.722	2	-8.712	1	0.0428	0.0922	0.000368	0.132	0.966	122.769	4	194667
5dAxeuDkIkpa6wZpMOuG9i	0.526	0.9	2	-6.815	1	0.0545	0.00539	4.12e-05	0.14	0.883	151.279	4	163240
0jnFDxgNhS156vu6roUVco	0.74	0.613	7	-9.487	1	0.0856	0.00494	0.118	0.095	0.676	96.491	4	192440
72boGlgSwUK01n44O2tOCv	0.608	0.634	4	-11.24	1	0.0727	0.0568	0.00615	0.116	0.84	147.515	4	226947
6IMlcKjsIM3l3yXWykTa3y	0.721	0.488	4	-10.294	0	0.067	0.0289	0.038	0.18	0.884	152.287	4	363373
7FYkZkF9fog6WS818wJnhl	0.52	0.906	9	-6.534	1	0.0601	0.0196	7.99e-05	0.0925	0.868	151.608	4	128267
2ax1vei61BzRGsEn6ckEdL	0.802	0.596	7	-11.663	1	0.06	0.0465	1.17e-05	0.0695	0.702	90.275	4	330507
0elCmyfISzkP5tAYTVuYjS	0.45	0.602	6	-4.301	1	0.0273	0.0892	0.00625	0.107	0.16	172.161	4	261734
2BedHMJWiW5CuiTd2wza1u	0.722	0.418	9	-8.274	1	0.0319	0.00461	0.76	0.127	0.134	123.028	4	227213
2JXiyD1zucGdFmnTeYb5Ry	0.52	0.265	6	-12.78	1	0.0316	0.223	0.152	0.113	0.0855	79.819	4	302000
2BIfG6wL1t5wk1KixoK2BV	0.709	0.655	4	-9.638	1	0.0342	0.543	0.00283	0.0931	0.609	111.97	4	319821
21lfQ6cXJF15ubyPLB6qHz	0.633	0.761	11	-7.097	1	0.034	0.0502	0.00114	0.638	0.801	96.061	4	248438
7r5elbHLaVama2WsDQpDp6	0.316	0.38	9	-8.547	1	0.0304	0.793	0.063	0.0765	0.123	80.673	4	274377
2rpbbxk3EtstH1flOZcvVd	0.503	0.792	8	-6.061	0	0.0358	0.000345	0.000738	0.0721	0.508	167.975	4	269367
3FRJFImdfX5NSY3QH3jI4u	0.658	0.83	3	-5.522	1	0.0307	0.26	1.33e-05	0.108	0.336	127.04	4	247559
2gxYpg3ruB8p9DFWvnTHNX	0.64	0.802	7	-5.383	1	0.0481	0.0344	0.00373	0.255	0.546	92.928	4	213878
0cUGSqx7MfnjiVwDzpYdYo	0.482	0.654	5	-9.453	1	0.0518	0.121	0.494	0.0829	0.194	165.145	4	209667
4dneV7C1yDt9UtyxrQY375	0.465	0.841	11	-5.767	0	0.0633	0.00486	0	0.109	0.689	168.743	4	157533
263aNAQCeFSWipk896byo6	0.526	0.762	0	-12.437	0	0.0342	0.000972	0.000116	0.338	0.505	136.203	4	214400
76GlO5H5RT6g7y0gev86Nk	0.43	0.971	9	-3.845	1	0.0524	0.0271	2.16e-05	0.185	0.764	151.219	4	212000
7ABE6G4uQxbNtYgVrpBBPA	0.725	0.524	11	-11.121	1	0.116	0.0748	0.764	0.0819	0.961	185.134	4	203267
07CyrZF9eVd02zzIse7tZA	0.541	0.83	9	-6.246	1	0.0316	0.109	0.701	0.167	0.711	142.592	4	177987
0X5C4WjQNubRysTkHOubz3	0.611	0.813	9	-7.689	0	0.0279	0.339	0.898	0.224	0.821	140.112	4	209573
4d4oXk7O2lEhZ83ivV93li	0.718	0.557	9	-10.679	1	0.0328	0.185	0.707	0.055	0.586	94.095	4	249880
3O4TPMOgChXOerSdB5WENH	0.633	0.62	0	-11.271	1	0.0648	0.34	0.605	0.0977	0.421	81.117	4	354933
5rzr3lYGJiw3OXEg8imWgH	0.748	0.569	9	-12.975	0	0.0752	0.459	1.21e-06	0.364	0.967	91.833	4	220093
1tuwC1Ob5vnYZhvg3zyzJg	0.484	0.776	9	-6.48	1	0.0312	0.00371	0.109	0.131	0.495	171.935	4	448467
6Zz846CtUmQGP5z4F7sccA	0.343	0.732	0	-5.189	1	0.044	0.00533	0.00302	0.0685	0.392	180.162	4	180772
6zvpLxTrTKDzdeQ9OLshpQ	0.472	0.906	10	-3.12	1	0.0567	0.0565	3.59e-05	0.0901	0.177	128.941	4	176462
29WtjZlOl5MbzC3lhllMNv	0.505	0.645	2	-5.374	1	0.0264	0.0517	0.0451	0.0727	0.176	78.028	4	211875
72tFZO4vGmXJvjG62rnpWI	0.549	0.792	9	-4.163	1	0.0444	0.00479	0	0.266	0.531	102.394	4	190916
3NsIAWbfXNKbwC0UfvzyrK	0.461	0.45	11	-9.445	1	0.0334	0.594	0.231	0.105	0.118	99.895	4	316680
2C93EaiXnfll8oL9TWqQTA	0.375	0.914	8	-3.241	1	0.0589	0.000558	4.55e-05	0.101	0.254	138.934	4	294072
1f8G4jvkONnLMxJMx7V2Ck	0.481	0.917	2	-3.366	1	0.0385	0.00104	3.95e-06	0.398	0.377	108.747	4	185317
2DPTXclMay45uBj9bKEq9B	0.595	0.25	2	-10.885	1	0.0322	0.836	0	0.0897	0.15	114.928	4	202758
0njZM9hISA7MaO01hvZKXZ	0.524	0.648	8	-6.586	1	0.0275	0.0108	0.00189	0.116	0.429	90.998	4	261141
5s1Qv9rWyU2f941kH0lqnS	0.43	0.544	4	-5.171	1	0.0369	0.509	0.0352	0.307	0.744	157.885	3	109584
0KAlzEswdQxSP9oRJ7uuJG	0.714	0.194	10	-16.611	0	0.0502	0.889	0	0.0806	0.374	123.847	4	114892
4pfQLkCEKxD9Z40ijuNG9N	0.66	0.105	7	-20.306	1	0.0414	0.954	0	0.112	0.194	113.798	4	199506
1tnUY4PC2ToRWtsU5eZsvv	0.769	0.471	9	-7.511	1	0.0347	0.675	0.508	0.0929	0.712	91.972	4	183197
5O8CVNL7n2Ybvyks4j4vyN	0.589	0.0226	11	-16.9	1	0.052	0.941	0.000388	0.126	0.0467	123.571	3	264619
2Ryo7zxOVxGQnSM0ohTkC4	0.59	0.311	3	-8.336	1	0.0364	0.66	0	0.109	0.199	117.844	4	269740
3BVx9YuGzTg9azhlhdK9PA	0.58	0.0527	7	-17.393	1	0.0504	0.743	0	0.0995	0.381	129.982	4	226893
1J1UJMBMu8alNXRVJiPCbe	0.294	0.139	4	-9.874	0	0.035	0.673	0.0281	0.106	0.0407	144.2	3	415190
0mHmf1gKE8s360PJzbFXY3	0.553	0.12	2	-17.085	1	0.156	0.635	0	0.369	0.259	86.813	4	178907
2PXi4bCUVYjt9wpHonanEH	0.732	0.0903	8	-15.494	1	0.0424	0.913	0.00844	0.111	0.255	101.914	3	288616
29SyMC0plk6qw8NMF7lfRL	0.573	0.939	8	-6.441	1	0.0808	0.493	0	0.0994	0.963	137.382	4	134253
4ZKgPZ9d4V5WW6H2s4qMD3	0.456	0.894	9	-4.602	1	0.037	0.458	0.485	0.0695	0.926	151.333	4	241991
78JmElAFmrPNhLjovDR9Jm	0.551	0.86	7	-7.839	1	0.0796	0.262	4.57e-06	0.0558	0.723	136.921	4	141507
0DQqzCHlPyKQXfF8uL01SI	0.595	0.462	2	-8.414	0	0.0259	0.102	0	0.0641	0.526	124.991	4	210525
5nrmGFJ87crVoJF5xdRqwn	0.512	0.69	1	-6.969	0	0.0249	0.162	0	0.167	0.417	107.839	4	194216
5e3isD5st7PGYzSJuoRSIV	0.53	0.873	4	-5.105	0	0.118	0.297	0	0.0521	0.583	162.154	4	161587
1LH9QyMF3YIqYRoVsoXihB	0.458	0.423	0	-8.647	1	0.0321	0.254	0.00013	0.118	0.491	126.984	4	201022
6UTxpt4Fn0cRBZlki1dRFq	0.485	0.782	9	-12.526	1	0.0875	0.153	0.0381	0.798	0.482	80.726	4	287340
0aGkeYwsDGqtsjzOQnmVAB	0.612	0.42	7	-15.645	1	0.0443	0.855	0.0166	0.1	0.874	150.125	4	211578
0cTwMCvozZBj8jCq6o27nk	0.491	0.751	7	-11.549	1	0.0686	0.23	1.22e-05	0.0666	0.916	152.43	4	236735
1CS7Sd1u5tWkstBhpssyjP	0.566	0.664	4	-5.303	0	0.0464	0.634	0	0.116	0.437	128.945	4	241693
46nvQpUDsxpS08UTFOeKTA	0.539	0.715	11	-6.639	0	0.0595	0.0265	0	0.609	0.489	123.854	4	165524
57V4uc2b2diZ4RPHXWecb9	0.539	0.179	7	-14.33	1	0.0309	0.921	0.393	0.106	0.145	140.01	3	198027
3JtVtwLYCy9WXcHLQyzRnl	0.351	0.41	2	-8.66	1	0.0327	0.494	0.44	0.131	0.129	125.995	4	222026
1yTTMcUhL7rtz08Dsgb7Qb	0.561	0.597	11	-6	0	0.0405	0.286	0	0.0979	0.355	76.826	4	197299
2DNXgvkyv35vTWvdgjs7qn	0.443	0.533	7	-5.956	1	0.0473	0.429	3.66e-06	0.332	0.596	183.791	4	222813
5Apvsk0suoivI1H8CmBglv	0.523	0.687	7	-5.601	1	0.105	0.0215	2.86e-06	0.203	0.711	90.036	4	217480
1C042FLYy7rP3MfnkOcnha	0.415	0.11	1	-14.901	1	0.0388	0.951	0.00236	0.0962	0.234	81.876	4	240147
37zuIvk4KBkAxxLJsxJaHq	0.521	0.526	5	-6.032	1	0.0281	0.243	0.00537	0.108	0.502	130.694	4	268293
5TgEJ62DOzBpGxZ7WRsrqb	0.531	0.363	10	-7.672	1	0.0608	0.749	0	0.112	0.259	121.412	4	229720
6qNuZL98ZSFOzIuG5zJrAj	0.779	0.365	2	-11.394	0	0.0361	0.885	0.00175	0.0992	0.445	105.891	4	180867
4nVfmii8T3OKMm8zRBPCiO	0.637	0.838	8	-8.985	1	0.205	0.0375	0	0.0704	0.747	168.067	4	155373
0qA28TWVwPoIf8GuFO7O1V	0.617	0.351	11	-10.67	0	0.0365	0.338	0.00355	0.11	0.319	130.045	4	205347
1tErORKj41UML6EhV2g63R	0.627	0.559	0	-6.185	0	0.0249	0.211	0.0693	0.0871	0.294	103.905	4	208980
4Vcs4KDTuIs1ogt2i6T2aG	0.651	0.874	9	-5.256	1	0.0419	0.0687	1.96e-06	0.0957	0.196	122.126	4	234585
0EwnZr3b2hDTjnciMacmaA	0.758	0.394	3	-10.798	1	0.0493	0.305	0.00293	0.149	0.149	120.004	4	156667
703ov0hqV8reMGlX7dIpUv	0.549	0.91	11	-4.884	0	0.0615	0.00694	0.00841	0.0753	0.562	93.989	4	194998
6NcVekIpjSmZQjj7Odk3d2	0.633	0.544	9	-6.459	1	0.0316	0.401	0.000265	0.107	0.292	165.939	4	193289
1ST1bodYfLasETDkH67ZrR	0.54	0.608	5	-8.572	1	0.0351	0.0048	2.64e-06	0.0953	0.449	134.939	4	228267
3TU3qRbVu8jSv6IrfY0FoV	0.497	0.589	0	-11.072	1	0.0333	0.0618	0.000281	0.09	0.395	167.944	4	208547
6hHc7Pks7wtBIW8Z6A0iFq	0.762	0.651	0	-13.34	1	0.0655	0.00198	0.856	0.111	0.941	130.395	4	449160
3PQEaRs2JEwtk79IqbQYt1	0.701	0.878	7	-7.911	1	0.035	2.79e-05	0.522	0.0608	0.875	130.512	4	251973
6wVViUl2xSRoDK2T7dMZbR	0.613	0.885	10	-7.463	1	0.052	0.0804	0.746	0.0997	0.919	118.506	4	263213
2EEinN4Zk8MUv4OQuLsTBj	0.372	0.91	2	-5.559	1	0.0392	0.00101	0.0944	0.13	0.756	161.964	4	315333
32TKQVwtSGCHIqmbmaNdFj	0.606	0.913	9	-7.865	1	0.0417	0.0154	0.905	0.326	0.817	146.15	4	195307
1UVll7jjUlqSGxCZ6uXVaD	0.506	0.931	5	-5.635	1	0.0305	0.00146	0.0227	0.27	0.865	129.568	4	248973
5CRPGdCSOfstyTVK9Ja5EQ	0.558	0.436	5	-13.496	1	0.0269	0.00405	0.742	0.11	0.38	140.757	4	263600
4fpxnJGDWFxjGvLJOqPPt8	0.589	0.784	0	-13.037	1	0.0312	0.175	0.0767	0.132	0.941	116.981	4	355067
7j5Q3zhjvpQvMeoPSZwdsa	0.6	0.881	0	-9.478	1	0.0337	0.29	0.851	0.222	0.936	124.977	4	419240
0F0imGVd7KnvQPkBmVtPo9	0.537	0.862	7	-7.648	1	0.028	0.0489	0.505	0.1	0.879	134.831	4	281773
7MbVZOLSUloG4J3nH3Tnos	0.661	0.699	11	-5.548	1	0.0286	0.00977	0.000427	0.106	0.717	126.001	4	241194
3C3KF3yVvF7iIsGxkmr6VB	0.621	0.61	10	-9.088	1	0.0358	0.141	0.0462	0.11	0.85	80.008	4	210895
3o5K1YmFz9i9KluRGJusd1	0.559	0.454	9	-8.377	0	0.0377	0.376	4.88e-06	0.258	0.284	134.941	4	204000
6hokBBgD7caSiEXJxPmryn	0.493	0.831	4	-4.298	1	0.0372	0.00116	0.0045	0.179	0.768	179.967	4	226027
3cHo4JYNEprRGPtunpABIK	0.767	0.376	11	-8.038	1	0.0294	0.564	1.56e-06	0.108	0.44	125.04	4	241302
7JsrgtynTsvDBuzUJ82o89	0.541	0.81	5	-3.524	1	0.0308	0.00525	0	0.127	0.679	145.008	4	197738
564vp2eEPOegtvHjnkhnhs	0.632	0.305	0	-11.948	1	0.0311	0.849	0.00383	0.112	0.348	119.877	4	220406
65LAG4XH7Oq0mZhFdPYqO4	0.457	0.58	9	-4.971	1	0.0286	0.00606	2.68e-05	0.0847	0.336	76.048	4	220253
2De9pbFUgiS2tSG9xxzMNY	0.564	0.725	5	-6.334	1	0.0302	0.294	0.000567	0.0878	0.61	136.955	3	199258
3TTVgqpcMhzeymFY0OJ4Ia	0.62	0.515	4	-8.174	0	0.172	0.505	6.5e-05	0.103	0.375	73.997	4	238400
4kK14radw0XfwxJDPt9tnP	0.726	0.861	6	-5.167	1	0.0695	0.277	4.12e-06	0.0534	0.711	91.966	4	243413
7GQFqo7uDoOkTXrVBpARME	0.53	0.868	7	-4.999	1	0.0378	0.0424	1.5e-05	0.504	0.573	162.016	4	174240
4WBXTnzVmz3Thn76w3rYUR	0.613	0.531	2	-9.172	1	0.0338	0.144	3.74e-06	0.801	0.338	152.023	4	285467
5DOadSIDaKFwUPcbcbDv5J	0.721	0.585	9	-6.508	0	0.0678	0.296	2.28e-05	0.092	0.475	140.107	4	249573
2Aj1tRbhbsBWVOMVgcO9pR	0.522	0.536	5	-6.73	0	0.145	0.351	0	0.311	0.294	75.054	4	253293
4g5MorMCNI2aOwEBSov4RT	0.705	0.72	8	-8.229	1	0.144	0.489	0.0466	0.13	0.353	122.001	4	261120
1PBp3M4Dh1TO0D6kgL8GqA	0.598	0.841	5	-6.652	0	0.0563	0.107	8.22e-05	0.154	0.367	116.077	4	138173
28nC2aXXUqvQCT3XeJs5Yd	0.428	0.82	5	-5.504	0	0.0803	0.32	0	0.379	0.269	143.366	4	217600
6IexNWMbsvI5x0T0CQX3yT	0.667	0.647	5	-7.787	1	0.0487	0.245	0.000297	0.0633	0.3	143.995	4	273693
79MMMdYL00iwKVHBSAUkLY	0.523	0.941	4	-4.444	0	0.0377	0.0878	0.148	0.106	0.145	120.67	4	192324
00sydAz6PeOxYzwG1dRIPi	0.235	0.977	6	0.878	1	0.107	0.00353	0.00604	0.172	0.241	152.952	4	208133
2ukIOcbkpWR5pjDtCRHCcX	0.445	0.927	9	-6.097	1	0.147	5.05e-05	0.000155	0.252	0.571	120.934	4	138624
3NpnrlBcEwRIgBs8tUrhyb	0.591	0.746	2	-7.066	1	0.0265	0.000107	0.527	0.195	0.857	131.377	4	223760
74CcP6fDBFdH8Xjo2F6Nb4	0.455	0.588	3	-12.238	0	0.0489	0.00461	0.549	0.131	0.348	131.857	4	209093
4bscUDqkO6soLEFXMr22ji	0.485	0.829	2	-5.251	1	0.0524	0.000176	0.0229	0.178	0.726	106.98	4	247840
6hAOC89VqirgFxREaQoGDQ	0.586	0.772	9	-4.732	1	0.0292	0.00557	0.0346	0.137	0.727	122.531	4	318213
406huHGjSj2bz0cnoeGI8j	0.259	0.933	9	-8.076	1	0.085	1.46e-05	0.00656	0.0599	0.352	161.106	4	197773
21xrImrAULwa0VT8n4BJoA	0.407	0.665	5	-8.077	1	0.0365	0.00801	0.196	0.115	0.581	141.79	4	420133
4giZRI3pgupzawIJXLx7T9	0.362	0.896	2	-6.812	1	0.0338	3e-06	0.79	0.355	0.713	136.083	4	213027
1uWp3OTBE1pryDJ4igGD1q	0.603	0.693	9	-5.461	1	0.0356	0.0163	0.000115	0.123	0.735	113.111	4	151515
7k6Ia6hsrweMKk1LiObkC9	0.578	0.897	6	-6.25	0	0.0413	0.0963	0.00215	0.195	0.768	96.027	4	201893
43Rh4q9wWgIEETAt0F2zCu	0.658	0.576	4	-8.367	1	0.0451	0.434	0	0.109	0.551	79.517	4	184300
7EDmkAQSnaGYk0ZoXbqvIM	0.551	0.927	1	-7.17	0	0.0464	0.395	0.00355	0.132	0.238	111.022	4	166478
37eZez9K3jcLUha0byAI4m	0.499	0.721	0	-7.353	1	0.0364	0.175	0.00312	0.0682	0.441	129.98	4	161789
0epaptkWK7BHkHJheQJtZ4	0.604	0.6	11	-8.751	1	0.0386	0.477	0.0847	0.0936	0.872	85.003	4	183205
0Vc56o8yGFp7Sm2z62lGQA	0.657	0.753	7	-7.139	1	0.0256	0.0853	0.111	0.353	0.735	101.975	4	215395
4FMeyMuT6Rk1B34v0AzV9q	0.439	0.527	0	-8.997	1	0.0294	0.299	0.038	0.118	0.546	177.965	4	170234
5n6BdIWBSpkfjZ29JP7WzK	0.597	0.472	0	-8.728	1	0.0247	0.24	0.000664	0.202	0.356	102.885	4	266053
4mOmMccRWthpaUtjPhiQm8	0.422	0.455	9	-8.49	1	0.0287	0.0355	1.76e-06	0.109	0.201	94.888	4	212503
7jIAttgQTpLDoNtykIQXjH	0.726	0.537	0	-8.896	1	0.114	0.316	0	0.0707	0.882	96.889	4	145707
5fj76kVAnqRKKhAw5d06jj	0.661	0.662	4	-8.88	0	0.0931	0.255	0	0.131	0.825	87.119	4	176720
7mVoBnU3mxV5Q6n4DmOv6K	0.568	0.948	2	-4.265	0	0.078	0.448	0.00059	0.19	0.84	79.329	4	186067
61QW3AcU1jm5ttPOn8eZhn	0.41	0.763	4	-7.904	1	0.337	0.273	1.29e-05	0.0553	0.649	171.956	4	284333
21F39lpBdWHu5aRy68V8xj	0.541	0.704	0	-7.436	1	0.0453	0.086	3.32e-05	0.114	0.794	133.914	4	230573
7ccurrFI92e3hBtU02WgTL	0.369	0.319	2	-12.088	1	0.0288	0.752	0.000837	0.154	0.476	160.359	4	236840
4sxVoAf7uvxCSgTCRNDohP	0.651	0.449	0	-8.412	1	0.0399	0.234	0	0.0963	0.832	85.433	4	255400
6jcYInRCmQcUdRVjm4kRoh	0.69	0.493	2	-9.211	0	0.0355	0.665	0.0014	0.0987	0.35	118.832	4	249133
1kqBAV3R35lVIRvhYmSI6s	0.679	0.384	9	-15.216	1	0.0416	0.421	1.14e-06	0.135	0.752	101.981	4	302000
2vU1H8XKsK6bUff94gTorE	0.651	0.872	9	-5.855	1	0.103	0.269	0.000127	0.138	0.8	90.84	4	158640
1i6N76fftMZhijOzFQ5ZtL	0.721	0.521	2	-8.123	1	0.0613	0.0708	0.00545	0.127	0.942	123.118	4	261413
6aBUnkXuCEQQHAlTokv9or	0.942	0.641	7	-10.15	1	0.0333	0.331	0.179	0.028	0.966	114.443	4	296147
38Ngied9rBORlAbLYNCl4k	0.644	0.919	2	-6.289	1	0.0561	0.181	0.134	0.622	0.871	117.459	4	259907
2VNfJpwdEQBLyXajaa6LWT	0.779	0.87	5	-13.141	0	0.0574	0.00644	0.0107	0.0399	0.555	102.689	4	241920
5gS8whHdcpbkdz0qonQZF8	0.661	0.713	2	-7.825	1	0.0296	0.0361	2.27e-05	0.153	0.632	110.364	4	259107
5JwK7v6XhG0YgqDuCgzOy8	0.763	0.629	9	-9.947	1	0.0322	0.013	0.0585	0.0756	0.973	126.477	4	219200
7CqleiaEqHVazV19P532X9	0.801	0.93	9	-7.365	1	0.0354	0.0806	0.152	0.0558	0.967	133.255	4	221320
1oV1tu8utgHQjLJsEK9sVl	0.66	0.485	2	-8.101	1	0.0258	0.242	0.0102	0.0585	0.829	99.828	4	302520
1Tr4K5MU5XYE44umXGDndd	0.646	0.88	2	-7.753	1	0.0637	0.0623	0.157	0.355	0.802	116.916	4	259600
3yO1OjqT59JyjHaQZcCYDX	0.776	0.871	5	-11.108	0	0.0519	0.00294	0.0129	0.0598	0.57	103.249	4	241773
2tznHmp70DxMyr2XhWLOW0	0.636	0.676	2	-3.442	1	0.0263	0.0807	0	0.0831	0.273	113.98	4	208760
3Pzh926pXggbMe2ZpXyMV7	0.636	0.849	0	-7.075	1	0.106	0.0438	0	0.372	0.917	156.036	4	175493
4sebUbjqbcgDSwG6PbSGI0	0.44	0.778	1	-1.786	0	0.0327	0.0265	1.04e-06	0.151	0.304	148.038	4	229347
5n0CTysih20NYdT2S0Wpe8	0.47	0.623	0	-5.655	1	0.0302	0.392	0.000439	0.0992	0.298	77.861	4	225973
1Q3t9fWvHUXKsMmpD2XpUu	0.549	0.789	5	-6.071	1	0.0313	0.0178	6.7e-05	0.059	0.715	136.125	4	214387
1KuVdyg8d6NlRhbpHxg5UF	0.668	0.913	9	-3.097	1	0.0348	0.0119	6.7e-06	0.111	0.933	132.039	4	219053
0tkBOcK7oRVXQJY97zzSvr	0.589	0.481	0	-4.801	1	0.0285	0.273	1.33e-05	0.0986	0.176	93.568	4	228293
4Y6GIje3GErVRIq1Ff5BJq	0.705	0.728	4	-3.184	0	0.035	0.00122	0.0693	0.0753	0.966	109.991	4	226533
5r5Lj2MkgwQJz6TaBdL865	0.543	0.946	2	-0.734	1	0.0454	0.00614	1.49e-05	0.106	0.547	117.962	4	222813
4dpEYOPcmHNfvERbiajp3G	0.524	0.532	6	-6.07	0	0.026	0.0285	7.86e-05	0.242	0.367	135.678	4	224893
0NslHuacjxQYfUTOW3HCIV	0.67	0.403	0	-10.623	1	0.031	0.753	0.0903	0.0858	0.622	129.984	4	230867
47TQjzeG4KI0XWWb0wkbri	0.416	0.827	4	-5.177	1	0.0384	0.00428	0.000242	0.277	0.87	169.902	4	236712
48bo7uexDvAThcRDvEB2W7	0.546	0.878	7	-5.137	1	0.0525	0.0133	0	0.135	0.35	119.945	4	255400
1d1Uc9yNUMvUb0RbakGDt0	0.407	0.776	2	-6.184	1	0.0372	0.023	8.34e-06	0.188	0.508	95.075	4	199053
3Bz3lj6E9VFBk1Wj1hC8vw	0.51	0.498	4	-8.993	1	0.0347	0.167	0.00498	0.13	0.167	115.011	4	237726
3NPiFBw3mA9qbJfo0nhk6X	0.515	0.848	9	-4.835	1	0.0375	0.000486	0	0.0946	0.475	119.84	4	287567
6Q0ah7m011fAcNTFJBjQGI	0.623	0.671	0	-4.164	1	0.0262	0.00637	0	0.0768	0.505	114.064	4	193547
4Omfr1OV4e0eaLcPe5JFRa	0.594	0.338	9	-11.365	1	0.039	0.85	0.0592	0.0937	0.14	119.605	4	325375
6WBNQSfB047hAZ7tusGhqB	0.462	0.754	7	-3.361	1	0.0459	0.00843	0	0.118	0.475	110.397	3	168533
4RMoPuik89bh3vHz2IUaku	0.56	0.865	0	-5.222	1	0.0356	0.000872	2.25e-05	0.106	0.472	121.988	4	221692
5Z0MrFDEIDB075We9w9276	0.573	0.786	7	-4.354	1	0.0352	0.0634	0.212	0.117	0.612	110.289	4	171267
2eM4Ew20VXdjBhm6a6Cs9l	0.61	0.752	10	-5.062	0	0.0389	0.294	0.0755	0.116	0.832	89.995	4	196867
4lhhYqzREcts4uOOqWHjRJ	0.712	0.8	9	-5.068	0	0.0377	0.0747	0.185	0.0938	0.685	107.047	4	283880
1NwyJs8dFvkV5cvvehav7s	0.546	0.681	7	-5.931	0	0.113	0.216	0.00661	0.0588	0.689	178.522	4	197360
59s5vTB8LNV4tyZPp9HM3f	0.732	0.703	1	-6.159	0	0.0584	0.215	0.34	0.202	0.725	113.926	4	290422
26icLILupXJtsQq5EtZdwn	0.269	0.164	3	-12.865	1	0.0389	0.879	0.00066	0.122	0.254	69.071	3	133320
3ItddtEzeCE37ScY8o3Tbg	0.573	0.901	0	-4.924	0	0.0434	0.405	0.111	0.307	0.794	98.454	4	202627
2rNVmfuyXAfmvZfg8O9D92	0.34	0.491	7	-7	1	0.0322	0.428	0.0397	0.226	0.248	176.309	3	254333
2z6qRBkf6jjWUuzLA9CXO0	0.322	0.719	8	-4.641	1	0.0591	0.156	0.00695	0.668	0.328	148.308	3	316511
26Vcf2qFrnaa0pFJkGFh61	0.418	0.344	7	-8.42	1	0.0391	0.103	0.198	0.214	0.231	111.709	4	355627
3cXQrWACMWmJTQaQUoqLMj	0.591	0.601	7	-7.222	1	0.0269	0.19	0.0026	0.0958	0.515	117.073	3	209480
3WV1rfVVexVVvCP06BaaKX	0.385	0.739	5	-5.598	1	0.0318	0.0463	3.32e-05	0.152	0.37	133.735	4	172360
4yb3ikgJkgBNTSkGm2Lvhz	0.588	0.602	11	-8.919	0	0.0322	0.0442	0.00278	0.428	0.239	128.019	4	234800
43a41kwTMZClWCLTONiaqm	0.562	0.695	6	-4.662	1	0.0332	0.0151	0.119	0.122	0.446	118.174	4	216067
4HSzQXLeBD9fV6U4RVDHg9	0.553	0.843	11	-4.664	0	0.0298	0.000168	0.25	0.335	0.67	112.967	4	213360
2yTjzLPyPgLSfBGHgwCRr6	0.588	0.666	2	-6.466	0	0.0391	0.087	0	0.0667	0.438	126.752	4	188773
6P0dI2yAf2cmg4UrCcStwE	0.588	0.894	3	-5.564	1	0.0403	0.000176	0.23	0.141	0.552	123.031	4	237853
472mFdP6wkHO6xzKn5F4et	0.566	0.819	6	-5.246	0	0.0581	0.00203	0.00339	0.0941	0.525	112.91	4	209707
24kirWnsEEyGgbl2NuhSVz	0.498	0.727	4	-6.116	1	0.0308	0.0562	0	0.609	0.441	79.994	4	212600
7rbxwTq9AK7a6jvEU1Gvsz	0.499	0.821	3	-3.961	1	0.0413	0.000592	7.06e-05	0.257	0.358	150.013	4	216973
7lIiKyRg4KumhJ4xf5VTFt	0.705	0.401	8	-7.473	1	0.0257	0.607	0	0.305	0.61	97.689	3	163280
6NgoSSG4H4LyMQGbHulkcm	0.745	0.911	5	-5.247	0	0.0475	0.323	1.41e-06	0.619	0.9	95.675	4	211413
2X1D6fTtA76LsJh5JxB9c8	0.733	0.719	1	-6.399	0	0.0336	0.12	4.57e-05	0.0758	0.961	90.554	4	198667
0S9zKOWiIwsR9Vla8NVYJd	0.775	0.623	5	-5.755	0	0.0279	0.274	2.73e-06	0.116	0.893	95.519	4	242907
5Wl6Nt74mR9RYy7R7GOWNa	0.595	0.83	4	-7.92	0	0.0529	0.357	7.87e-06	0.0822	0.884	145.053	4	172907
2KaRGgJ1qMsFOOWvUL7aD2	0.597	0.668	10	-6.893	1	0.0389	0.21	0.000131	0.0614	0.874	91.881	4	225347
723j4ubztPUgRKvQfflQNy	0.59	0.699	5	-8.148	1	0.0916	0.257	1.11e-06	0.102	0.716	167.359	4	194160
2VHbTftHVMguJfRpi5lsSt	0.566	0.676	1	-6.133	0	0.078	0.438	0	0.0786	0.922	74.101	4	223720
6XYVdHPqfmmoOPWZk46EAP	0.846	0.545	3	-7.482	1	0.0525	0.266	0.000215	0.0624	0.961	116.68	4	269667
4VSubATiLD4126APjXmQcD	0.321	0.392	11	-6.644	1	0.0323	0.467	0	0.0869	0.28	176.919	3	216440
11607FzqoipskTsXrwEHnJ	0.506	0.442	5	-13.268	0	0.0276	0.0869	0.00239	0.0846	0.532	105.826	4	175893
11VwZwNF29HrqwalYUMitb	0.637	0.107	5	-18.759	1	0.0349	0.911	0.00146	0.103	0.296	82.879	4	339533
3PG7BAJG9WkmNOJOlc4uAo	0.55	0.145	0	-15.753	1	0.0332	0.913	0	0.118	0.138	103.918	4	159000
4PINSJIlBWsnVeveicq1S8	0.609	0.295	7	-14.933	1	0.0328	0.176	1.86e-06	0.0859	0.279	108.976	4	134040
6cA1usDL8nTHeSgFewQat3	0.608	0.152	7	-20.989	0	0.172	0.836	0	0.182	0.472	120.834	4	127453
0i19MAZbyn8uTir7FprXId	0.399	0.467	5	-11.763	1	0.0284	0.303	0.0186	0.124	0.525	75.601	4	445187
3cw3Z7mS55gd3NUjh4k0bL	0.619	0.637	2	-7.369	1	0.0286	0.015	0	0.374	0.936	105.205	4	246307
1o6DclZHw0HomxXEQR1ijX	0.494	0.735	5	-8.347	1	0.0345	0.00401	3.14e-06	0.544	0.742	132.526	4	283000
3fElupNRLRJ0tbUDahPrAb	0.679	0.645	7	-9.765	1	0.0442	0.032	0.868	0.152	0.826	125.844	4	279520
29engDqjmMr3VLqMm0c0WE	0.225	0.618	8	-9.922	0	0.0331	0.00137	0.616	0.079	0.567	144.724	4	312253
4gsR34XSIE2fUY4odwZqym	0.612	0.725	7	-5.602	1	0.0416	0.305	0.0784	0.0548	0.333	146.008	4	225667
56PgQIFxAvXcEtXNYrsB0w	0.673	0.739	1	-7.529	1	0.0266	0.0115	0.0162	0.371	0.961	111.968	4	195045
0H6hMpN8zxZT3ToOelM5Cl	0.531	0.267	6	-12.877	0	0.0276	0.84	0.903	0.0889	0.45	80.129	3	62080
41oqThgUF4yiNz77TazXtl	0.543	0.549	0	-6.497	1	0.0306	0.149	0.082	0.114	0.404	80.079	4	205893
03rZ4jEeqvKjrqdRHPZmpp	0.645	0.295	10	-12.59	1	0.0272	0.62	0.419	0.195	0.343	75.902	4	90227
4ulOJhLqbDeBFEbYVX6yjG	0.561	0.798	10	-4.619	0	0.0389	0.0219	0.217	0.109	0.422	93.028	4	131619
2oBzsiZT8qmlovYS1FMf06	0.623	0.458	11	-7.727	1	0.0262	0.737	2.69e-05	0.7	0.426	97.92	4	195924
1EmUW3D8vAfp2miQJTMupc	0.63	0.433	10	-5.874	1	0.0291	0.559	0.00702	0.0873	0.56	104.042	4	179933
3dJSC3yIV69Afxvme5qf5d	0.397	0.188	8	-12.851	0	0.0364	0.862	0.000615	0.126	0.35	184.057	3	237405
4UDBvtxDnUjzVu0HopFsZ8	0.705	0.674	7	-5.589	1	0.0306	0.000349	0.706	0.22	0.265	115.972	4	254520
70LcF31zb1H0PyJoS1Sx1r	0.515	0.43	7	-9.935	1	0.0372	0.0097	0.000133	0.129	0.104	91.844	4	238640
10nyNJ6zNy2YVYLrcwLccB	0.255	0.393	5	-10.654	1	0.0278	0.0577	0.00361	0.113	0.118	76.426	4	229120
63OQupATfueTdZMWTxW03A	0.36	0.501	7	-9.129	1	0.0258	0.0638	9.32e-05	0.172	0.324	74.807	4	264067
2a1iMaoWQ5MnvLFBDv4qkf	0.419	0.383	4	-11.782	1	0.0256	0.0724	0.0176	0.0896	0.35	87.568	4	257480
0z1o5L7HJx562xZSATcIpY	0.293	0.276	4	-11.357	0	0.0349	0.224	0.122	0.167	0.195	121.603	4	267187
73CKjW3vsUXRpy3NnX4H7F	0.463	0.229	2	-12.592	1	0.0297	0.167	0.0997	0.202	0.135	73.543	4	290707
4wajJ1o7jWIg62YqpkHC7S	0.531	0.61	11	-8.025	0	0.0387	0.772	0.756	0.0908	0.199	152.958	4	318187
1dyTcli07c77mtQK3ahUZR	0.291	0.767	7	-6.913	0	0.0862	0.000401	0.012	0.0763	0.359	175.702	4	234800
0YJ9FWWHn9EfnN0lHwbzvV	0.462	0.832	11	-6.085	0	0.0479	0.108	0.00416	0.0741	0.807	165.653	4	248893
6LgJvl0Xdtc73RJ1mmpotq	0.251	0.848	5	-6.501	1	0.0579	0.0377	0.00591	0.0545	0.207	163.709	4	387213
2H30WL3exSctlDC9GyRbD4	0.496	0.644	2	-5.385	1	0.0269	0.264	0	0.0695	0.435	96.017	3	249840
2DkZisoN9h1dLa8Sn5sx0n	0.203	0.715	9	-5.485	1	0.0494	0.0487	0.00082	0.051	0.327	78.554	4	233360
3Rl26h1HiMCV0HFHHVb2IM	0.424	0.42	4	-10.536	1	0.0373	0.168	0.124	0.107	0.176	138.079	4	437577
23uCHFc7xcQWgXh2oelMOe	0.421	0.777	0	-5.778	1	0.0454	0.0276	0.000353	0.122	0.436	122.911	4	246893
5Zejf0AVF45ZXdcePeghId	0.579	0.396	4	-8.65	0	0.0297	0.719	0.000444	0.135	0.351	137.023	4	130309
4Yv6i6vsR5RoSsuTX8Anr3	0.51	0.574	7	-11.302	1	0.0337	0.0401	2.6e-06	0.154	0.234	125.407	4	250794
3RQA5wzKg5MFqoRJytmYEN	0.621	0.21	7	-10.218	1	0.0448	0.895	0.00085	0.107	0.14	149.415	4	124096
1UsXMQwIzCKSk6oIdRE5Jc	0.429	0.273	0	-9.719	1	0.0287	0.349	0.0384	0.111	0.112	110.161	3	269975
6wimdClggXbqamkhOsyRQ9	0.383	0.393	2	-9.357	1	0.0252	0.147	0.00511	0.142	0.177	88.127	4	242430
3SJI20YW5l5Ri1etVIx1Vo	0.364	0.513	9	-6.108	0	0.0311	0.179	0	0.345	0.341	134.075	3	198013
1ceeCjdsXB1PRoUQ5EKvZj	0.59	0.433	0	-6.626	1	0.0296	0.653	0.000166	0.286	0.453	77.012	3	176093
34Yd2MzccdIpLaGEWdL4I4	0.752	0.674	10	-4.889	0	0.0348	0.727	0	0.0915	0.902	101.65	4	225827
7MR20mD5bWffs5yNmtmvnK	0.691	0.787	11	-5.501	0	0.0705	0.504	0	0.172	0.805	76.159	4	171733
6x6xL8nI9uj94pd4cUyiHB	0.799	0.833	10	-7.472	0	0.0442	0.163	0.000458	0.281	0.923	110.735	4	181973
3igY2JZg3xnyuZIEaZAE2Q	0.745	0.655	9	-5.275	0	0.0421	0.196	0	0.33	0.883	118.628	4	179120
2XdlLaMNZKmh8bqA4yK7pO	0.793	0.728	0	-5.619	1	0.0328	0.592	0	0.111	0.85	102.658	4	262760
1sOaZDQR1VSJZqxkD55ZtP	0.552	0.509	0	-6.93	1	0.0401	0.512	0.000122	0.0817	0.235	124.673	3	172440
0Kj3JOdo5iWJcOic035iNs	0.61	0.667	0	-6.408	1	0.0449	0.587	0	0.119	0.807	82.533	4	185173
7grHWewXZi12Qn941ePu4A	0.768	0.8	7	-5.204	1	0.0578	0.563	0	0.0538	0.96	117.547	4	170493
339AymorMFeh9GvJahQvnq	0.741	0.842	8	-4.706	1	0.0375	0.771	0.00331	0.616	0.921	106.053	4	242000
7CUkeiG7QtB7tPU9f8SANS	0.659	0.473	1	-7.306	0	0.125	0.274	0	0.28	0.788	84.505	4	126616
734xplxSpoW22U5OeeZcr8	0.763	0.63	9	-8.258	0	0.142	0.0622	1.02e-05	0.285	0.17	124.973	4	188027
65ENznU4hwrR04whyJboxr	0.803	0.66	1	-3.257	1	0.276	0.241	0	0.384	0.736	104.955	4	167760
0fIffclhgJC5h8AdMMVvkp	0.637	0.723	2	-5.547	1	0.091	0.0134	7.87e-05	0.196	0.228	143.013	4	214960
4rc2WNOt2w8BHfQjBC8PO0	0.224	0.905	5	-3.239	0	0.0722	0.0509	0	0.281	0.485	78.318	4	205707
2XU0oxnq2qxCpomAAuJY8K	0.824	0.588	6	-6.4	0	0.0924	0.692	0.000104	0.149	0.513	98.027	4	209438
61bwFjzXGG1x2aZsANdLyl	0.68	0.659	6	-7.186	1	0.151	0.229	0	0.474	0.75	98.877	4	114460
0nbXyq5TXYPCO7pr3N8S4I	0.896	0.586	10	-6.687	0	0.0559	0.104	0	0.79	0.642	116.971	4	196653
4jM6Tl8062cc9gTJgTZTpx	0.632	0.708	1	-5.247	1	0.0829	0.0492	0.00306	0.125	0.687	95.03	4	141072
2SY8qCm2nwl2JK3BBOhBrl	0.548	0.799	5	-7.057	0	0.0475	0.0112	0.601	0.175	0.503	119.976	4	99800
7aiClxsDWFRQ0Kzk5KI5ku	0.778	0.559	6	-7.109	0	0.0776	0.128	0	0.399	0.678	129.989	1	185093
1z4xjDLLWJgG48Bn8OCxZv	0.565	0.877	5	-4.561	0	0.0614	0.00813	0.00251	0.26	0.389	118.484	4	285920
02kDW379Yfd5PzW5A6vuGt	0.799	0.66	1	-6.153	0	0.079	0.256	0	0.111	0.471	140.04	4	195429
4fuPFCrsnZ85emMfL52CKp	0.34	0.954	6	-3.576	0	0.11	0.0828	0.566	0.173	0.196	169.924	3	242824
2Z8WuEywRWYTKe1NybPQEW	0.645	0.713	6	-5.355	1	0.0393	0.00835	0	0.113	0.566	74.989	4	214507
6PQ88X9TkUIAUIZJHW2upE	0.808	0.897	11	-3.712	0	0.0348	0.0469	3.14e-05	0.364	0.591	126.026	4	231041
2eel5Us5RHsvtBNPnFT5E1	0.512	0.364	6	-8.31	0	0.0935	0.664	0	0.672	0.11	132.426	4	92453
6i0V12jOa3mr6uu4WYhUBr	0.732	0.396	4	-9.348	0	0.0286	0.0841	3.58e-05	0.105	0.548	90.024	4	195920
3NWTRZ0A8xKlBP1qgNftql	0.795	0.409	9	-10.134	0	0.0859	0.183	0.00108	0.112	0.518	120.095	4	176187
19gEmPjfqSZT0ulDRfjl0m	0.794	0.51	9	-7.314	1	0.42	0.0505	1.81e-06	0.0562	0.18	167.879	4	194561
78JKJfKsqgeBDBF58gv1SF	0.646	0.784	1	-7.471	0	0.108	0.0166	0	0.0721	0.179	127.839	4	197132
367HmvU5MpsWZdAJ3QbGlZ	0.732	0.635	1	-7.891	1	0.41	0.493	7.02e-06	0.388	0.581	147.025	4	211683
0wzruvvN7f5wu39aFcjTMw	0.58	0.806	9	-4.131	1	0.0283	0.0655	0.148	0.0386	0.576	94.016	4	190613
3p9x4bK5bwmgXE6POMvOp0	0.56	0.799	5	-4.466	0	0.0675	0.174	0.0679	0.304	0.304	69.972	4	235600
6bnF93Rx87YqUBLSgjiMU8	0.537	0.746	10	-5.507	0	0.15	0.0236	1.01e-06	0.156	0.252	170.062	4	198267
4EFy48vEJNG3xQf5Er4scn	0.541	0.252	7	-15.109	1	0.0322	0.845	0.000383	0.165	0.302	101.825	4	251954
6ORqU0bHbVCRjXm9AjyHyZ	0.475	0.432	7	-7.844	1	0.0302	0.183	0	0.161	0.648	94.605	4	153467
2fwz9mBaELJCzXuEEEe35Y	0.608	0.708	6	-5.682	1	0.244	0.128	8.65e-05	0.821	0.798	75.048	4	141290
11CiPQqnR8j7nsfZVMpboM	0.857	0.503	9	-7.526	1	0.46	0.505	0	0.89	0.704	107.873	4	272387
22VdIZQfgXJea34mQxlt81	0.705	0.769	9	-5.526	0	0.0425	0.113	0	0.105	0.583	107.949	4	213520
0yhGTljYYHyP7phuxoKWiJ	0.612	0.657	11	-6.971	0	0.0454	0.103	0.124	0.131	0.767	87.94	4	289973
2QbGvQssb0VLLS4x5NOmyJ	0.776	0.562	9	-6.901	1	0.363	0.0399	0	0.138	0.521	169.03	4	147867
7vaFuClNKe02pjKYbXEJ46	0.639	0.737	9	-6.683	1	0.324	0.148	0.00111	0.12	0.182	154.984	4	174675
6L89mwZXSOwYl76YXfX13s	0.442	0.943	3	-3.205	1	0.0602	0.00293	8.71e-06	0.091	0.781	85.064	4	181533
0z5oHDjD9vMsck14zoAQOc	0.811	0.69	10	-7.844	0	0.272	0.0366	0	0.106	0.646	139.97	4	140369
0KV4Ax6L10oSTWqC8607K4	0.701	0.681	11	-8.244	1	0.407	0.831	5.02e-06	0.0663	0.4	97.983	4	136150
6myUpr3GDR80Dg3zqNTmmG	0.646	0.758	4	-7.75	0	0.0708	0.556	0.00316	0.335	0.0642	172.995	4	199787
1xzUQMiCoY5pdego0pHMeV	0.39	0.724	6	-7.607	0	0.0889	0.162	0	0.393	0.312	165.945	4	216560
3ImnbJHoSy5uUhC0ydBVI9	0.752	0.861	11	-6.852	1	0.0989	0.114	0.649	0.201	0.482	125.015	4	191905
5V5BHmvpylV0nSc2Yu2Mu4	0.69	0.88	1	-3.525	1	0.284	0.0384	0.502	0.126	0.813	159.933	4	174250
40mjsnRjCpycdUw3xhS20g	0.594	0.676	2	-5.808	1	0.344	0.135	0	0.163	0.472	143.477	4	181145
4IIuCotvqijraSdnVLaFnM	0.331	0.513	11	-15.392	0	0.632	0.972	0.953	0.882	0.42	133.971	4	37013
6LyAwkJsHlW7RQ8S1cYAtM	0.638	0.4	11	-11.212	0	0.0425	0.733	0.000133	0.334	0.495	150.133	4	166093
6gBFPUFcJLzWGx4lenP6h2	0.841	0.728	7	-3.37	1	0.0484	0.0847	0	0.149	0.43	130.049	4	243837
3mRlFZHUyvJbPTlkzg4LyJ	0.782	0.5	5	-6.473	0	0.0611	0.342	1.88e-05	0.133	0.28	102.008	4	173611
5B3b5qszWCl22HlzitMh7x	0.907	0.412	8	-10.738	1	0.224	0.401	0	0.0846	0.885	87.977	4	168080
1tX1GK4bLfoS9oDIIbhYAv	0.626	0.781	3	-6.292	1	0.0445	0.00312	0	0.0879	0.481	163.983	4	141966
4nuAslShoN77tq12fzwjUq	0.636	0.647	5	-6.971	0	0.0381	0.247	0.00123	0.113	0.416	158.073	4	176027
4xSY7Pxe3bveG1WOIIcYdr	0.838	0.362	11	-13.827	0	0.288	0.308	4.9e-05	0.136	0.495	137.165	4	134075
46M2hXnaQpueG7vSvgVtVH	0.88	0.777	7	-6.875	0	0.125	0.164	0.0171	0.0957	0.974	154.955	4	93894
6AomCkEOQUODCYzQwH4SWC	0.705	0.733	5	-4.942	1	0.102	0.069	0.154	0.823	0.681	135.993	4	157507
2cYqizR4lgvp4Qu6IQ3qGN	0.763	0.628	11	-5.85	1	0.05	0.0531	0	0.114	0.193	140.958	4	190557
2p23H2gdnWEiGUEymqarpJ	0.682	0.484	11	-10.844	1	0.0812	0.836	0	0.241	0.879	82.983	4	95400
3eekarcy7kvN4yt5ZFzltW	0.598	0.427	7	-8.764	0	0.0317	0.0546	5.83e-06	0.21	0.0605	76.469	4	175721
1ZM8toCOlnfBKJdvR8GqUq	0.687	0.783	0	-4.573	1	0.191	0.0526	0	0.0718	0.359	156.141	4	233923
14eDzYfNRuqs1kf7zfIFJW	0.714	0.453	10	-13.085	1	0.0857	0.775	0	0.415	0.836	97.332	4	66213
1dQtt3K8GyPmH7ZD1LJ2ox	0.803	0.902	1	-2.934	1	0.0676	0.00533	0.667	0.111	0.628	126.999	4	166777
24jP9hAAauSG4IH5zGji8a	0.593	0.42	5	-8.7	0	0.272	0.366	1.95e-05	0.239	0.247	204.044	4	178824
2Guz1b911CbpG8L92cnglI	0.29	0.48	5	-6.583	1	0.0296	0.116	3.03e-06	0.626	0.382	112.62	4	229235
2MLuFz9Y3Vg3PF0Yf93M5c	0.399	0.754	5	-5.283	0	0.374	0.205	0	0.742	0.36	130.475	4	140183
1x5ihkusmVWsQWtvSCtW9q	0.905	0.407	10	-10.363	0	0.463	0.131	0.000333	0.0725	0.527	135.077	4	304867
0XLQyCwYu8dhhzWAKSs3wr	0.78	0.704	9	-6.241	1	0.0575	0.872	0	0.0726	0.96	116.101	4	268080
1fewSx2d5KIZ04wsooEBOz	0.901	0.464	5	-9.789	0	0.0645	0.368	1.71e-05	0.238	0.638	109.004	4	203267
1tzTiTLSRisnQiOnhgAdtF	0.768	0.728	11	-5.029	1	0.114	0.778	0	0.0968	0.938	127.304	4	108275
1wAdcYWWPbcqiUcum9brWw	0.742	0.486	1	-8.347	0	0.269	0.817	0	0.112	0.921	103.743	4	229200
2dy2C0StZ3yiEeb0Aoolcn	0.764	0.846	10	-2.743	0	0.0636	0.159	0.000263	0.0475	0.777	122.992	4	179579
3WKrSWltDbNcY5M3haaFxQ	0.583	0.549	2	-7.378	1	0.0452	0.715	0.00117	0.492	0.698	148.011	4	262525
1vvBUZseJ7fwYPX1NedOLd	0.792	0.698	1	-6.364	1	0.172	0.489	0.0788	0.127	0.751	129.971	4	173938
4FeBA1bxkUae1aDsplsmrv	0.441	0.882	0	-3.686	1	0.327	0.305	2.22e-06	0.293	0.733	170.19	4	166356
5SWnsxjhdcEDc7LJjq9UHk	0.819	0.626	10	-4.574	0	0.202	0.00748	0.101	0.167	0.415	143.01	4	195906
643PW82aBMUa1FiWi5VQY7	0.897	0.743	10	-5.446	0	0.222	0.304	4.44e-05	0.137	0.905	134.979	4	187105
6dLAFNEb2ufM0OjhPpMbFY	0.733	0.505	0	-7.087	1	0.151	0.115	0	0.363	0.481	139.953	4	128714
05BnyatUof9QNcvTXzdtW4	0.744	0.423	2	-13.645	1	0.359	0.817	0	0.322	0.91	82.515	4	102280
4Amw1lKBUbmaanUTGzv77U	0.578	0.551	10	-6.196	1	0.0313	0.853	0	0.0833	0.946	80.186	4	119240
0G88ZH0qqBCBbtrHnEDqrn	0.619	0.43	9	-11.118	1	0.0576	0.663	0.000197	0.119	0.718	128.322	4	584107
7lzfMZak2HjNPXXSxksjPB	0.723	0.694	0	-6.694	1	0.0802	0.313	0	0.052	0.739	106.359	4	168948
02a8cGumnKuEPgoCzmalJp	0.481	0.284	11	-14.762	0	0.186	0.634	0.000168	0.91	0.528	83.979	3	190533
1EIWddhCtay8sMJeu58lvm	0.578	0.471	6	-6.451	1	0.0361	0.846	0	0.099	0.392	86.509	4	259680
1Hn0iEB1FPfJzJPK49qVtH	0.47	0.248	2	-13.407	1	0.039	0.739	0.00598	0.466	0.2	140.229	4	375173
2xmOKduEJr0OwXim7ngrGG	0.666	0.644	11	-6.321	1	0.0461	0.565	0	0.123	0.926	82.646	4	274800
4RXnp2ZTi0CyetuM6xTcjg	0.635	0.682	1	-4.977	0	0.0576	0.805	0	0.119	0.785	92.171	4	194973
4cy68Rp4tdkCVoo8lj30F5	0.635	0.445	11	-5.252	0	0.0472	0.571	0	0.195	0.734	145.445	4	128840
4q8CVsKQcAeNZ3RguQjmTU	0.704	0.662	5	-6.836	1	0.092	0.589	0	0.152	0.682	113.069	4	192960
7eiI2R22MxDNVLN7S9VqVH	0.889	0.377	11	-7.961	1	0.0389	0.799	0	0.116	0.579	104.973	4	113067
7z8F1kHqUvh8jA4hztNeU8	0.583	0.428	6	-6.618	1	0.196	0.824	0	0.0903	0.376	132.294	4	594933
5DPASDOoVakOcD8EIhb46T	0.737	0.548	4	-7.003	0	0.0498	0.0127	9.76e-06	0.176	0.156	160.058	4	175759
6Sm4XdGI7GhHG7sjVcVrI2	0.671	0.798	4	-6.914	1	0.181	0.583	0	0.241	0.502	95.6	4	210960
044fQ35cLbMVwta0KyN5dM	0.474	0.0577	2	-17.945	1	0.0758	0.907	7.16e-05	0.137	0.182	77.689	3	174133
2BvDFQOl4JieEGK2cgKOey	0.774	0.647	1	-6.682	0	0.0514	0.47	0.000569	0.46	0.965	95.098	4	200960
3QKJELWORZZ7rUZDWeMWSA	0.653	0.319	4	-17.813	0	0.0364	0.439	0	0.0906	0.845	147.858	4	138013
3zcBNmJH6ToRCI0WNEIuES	0.653	0.647	4	-7.028	1	0.0437	0.201	0	0.0753	0.936	156.28	4	256693
50c0knPGjaJAuE4hRg28Qq	0.761	0.59	10	-10.274	1	0.0449	0.454	0.00933	0.0926	0.895	158.053	4	267267
5JuWx9sV8TbtIMhiiPVbnz	0.661	0.191	2	-15.779	1	0.0503	0.588	0	0.24	0.586	111.353	4	194800
5YctcwZCRMxlIHDpTuqKOE	0.495	0.306	9	-11.173	0	0.0303	0.777	0	0.887	0.356	108.416	4	187179
6sKopGG4r21ObTE8V6pD6x	0.6	0.12	7	-12.805	1	0.0502	0.87	0	0.088	0.439	60.761	3	214693
78BnUN9YVNWCZ3cqPDOpvp	0.707	0.757	4	-7.799	0	0.0575	0.233	0	0.173	0.684	92.994	4	254653
78I8jaChZbPu72bIGGPMKk	0.472	0.0322	9	-22.076	0	0.0378	0.979	0.00288	0.111	0.138	90.205	4	215440
7kdyc52WSOnaYetBSS4mE5	0.886	0.539	1	-9.838	1	0.403	0.269	7.11e-05	0.0884	0.471	134.93	4	231800
5Ikos3uiBfPYAf7EZfz8t3	0.596	0.451	5	-9.468	1	0.0404	0.64	3.52e-06	0.158	0.486	148.045	4	228133
1M1B2Bk0EsaSmgkac8EGZb	0.704	0.627	5	-7.737	0	0.105	0.351	0	0.302	0.801	117.207	4	229920
1zkUmmdxUJbMw52fVEjWUN	0.645	0.575	2	-7.707	1	0.0552	0.168	0	0.152	0.466	150.168	4	208560
2wL88cvKXUOfHuYVd62hji	0.734	0.787	1	-7.358	0	0.0461	0.489	0.0461	0.329	0.757	108.329	4	266173
3Y9wdXMh6sNt9fUwUqTqb7	0.622	0.166	4	-14.063	0	0.0588	0.982	0.109	0.111	0.224	115.022	4	87667
43HM6P2yX7ls3q92qrkhL4	0.763	0.574	10	-9.283	1	0.0315	0.447	3.56e-06	0.086	0.48	110.111	4	239533
6S9lcjREUTU4Yv5y7oMcv2	0.566	0.811	11	-9.849	0	0.0435	0.732	0.638	0.596	0.961	127.944	4	119387
1O5pf5R8xvppS2pD03HVy5	0.825	0.679	11	-7.408	0	0.05	0.0164	0.838	0.0468	0.613	91.674	4	209067
20I1Mickm2w7qGxk7uzOKr	0.844	0.707	11	-8.422	0	0.158	0.165	0	0.664	0.717	99.011	4	236768
4PmJRTntkZRVG6kiVljmlA	0.607	0.0361	7	-13.197	0	0.0445	0.907	0	0.112	0.575	81.735	4	227000
4mn5HdatHKN7iFGDes9G8i	0.751	0.74	9	-6.016	1	0.045	0.152	5.75e-05	0.0873	0.788	138.066	4	116161
5RfZC411UVifpYPOmzfgyl	0.485	0.23	0	-8.47	0	0.0417	0.881	0.000363	0.0998	0.447	70.957	4	249493
7cEfPAbju7glmdAgT4e1AU	0.8	0.234	0	-12.292	0	0.138	0.537	9.67e-06	0.339	0.757	115.936	4	139933
0JL9TZip7mL7iwC5EOkALS	0.499	0.874	0	-4.586	1	0.097	0.611	0.000639	0.0703	0.861	97.317	4	199160
0Nkp56EKreoWMYxpXJqUNZ	0.782	0.365	7	-14.049	0	0.0726	0.532	0.89	0.0837	0.684	91.894	4	168913
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.genres (genre, name, is_seed) FROM stdin;
alternative r&b	alternative r&b	f
art pop	art pop	f
escape room	escape room	f
experimental r&b	experimental r&b	f
alternative hip hop	alternative hip hop	f
canadian modern jazz	canadian modern jazz	f
indie soul	indie soul	f
funk	funk	f
soul	soul	f
indie folk	indie folk	f
stomp and holler	stomp and holler	f
indie pop	indie pop	f
indie rock	indie rock	f
modern rock	modern rock	f
washington indie	washington indie	f
british soul	british soul	f
neo soul	neo soul	f
psychedelic soul	psychedelic soul	f
alternative rock	alternative rock	f
garage rock	garage rock	f
rock	rock	f
scottish rock	scottish rock	f
pop	pop	f
r&b	r&b	f
dance pop	dance pop	f
hip hop	hip hop	f
urban contemporary	urban contemporary	f
album rock	album rock	f
classic rock	classic rock	f
hard rock	hard rock	f
heartland rock	heartland rock	f
mellow gold	mellow gold	f
new wave pop	new wave pop	f
soft rock	soft rock	f
channel islands indie	channel islands indie	f
hyperpop	hyperpop	f
vapor soul	vapor soul	f
conscious hip hop	conscious hip hop	f
rap	rap	f
west coast rap	west coast rap	f
canadian contemporary r&b	canadian contemporary r&b	f
canadian pop	canadian pop	f
brill building pop	brill building pop	f
classic girl group	classic girl group	f
post-hardcore	post-hardcore	f
screamo	screamo	f
neo mellow	neo mellow	f
pop rock	pop rock	f
singer-songwriter	singer-songwriter	f
dream pop	dream pop	f
melancholia	melancholia	f
shoegaze	shoegaze	f
slowcore	slowcore	f
new romantic	new romantic	f
new wave	new wave	f
permanent wave	permanent wave	f
sophisti-pop	sophisti-pop	f
synthpop	synthpop	f
alternative metal	alternative metal	f
blues rock	blues rock	f
nu metal	nu metal	f
palm desert scene	palm desert scene	f
stoner metal	stoner metal	f
stoner rock	stoner rock	f
australian rock	australian rock	f
dance rock	dance rock	f
funk rock	funk rock	f
alternative country	alternative country	f
new americana	new americana	f
atl hip hop	atl hip hop	f
baroque pop	baroque pop	f
psychedelic rock	psychedelic rock	f
sunshine pop	sunshine pop	f
motown	motown	f
quiet storm	quiet storm	f
deathgrass	deathgrass	f
disco	disco	f
cyberpunk	cyberpunk	f
electronic rock	electronic rock	f
industrial	industrial	f
industrial metal	industrial metal	f
industrial rock	industrial rock	f
bass trap	bass trap	f
edm	edm	f
electro house	electro house	f
electronic trap	electronic trap	f
electropop	electropop	f
pop dance	pop dance	f
vapor twitch	vapor twitch	f
turntablism	turntablism	f
boy band	boy band	f
contemporary r&b	contemporary r&b	f
new jack swing	new jack swing	f
underground hip hop	underground hip hop	f
anti-folk	anti-folk	f
chamber pop	chamber pop	f
elephant 6	elephant 6	f
lo-fi	lo-fi	f
kc indie	kc indie	f
alternative dance	alternative dance	f
indietronica	indietronica	f
new rave	new rave	f
swedish electropop	swedish electropop	f
swedish indie pop	swedish indie pop	f
swedish synthpop	swedish synthpop	f
austin americana	austin americana	f
austindie	austindie	f
country rap	country rap	f
bedroom pop	bedroom pop	f
classic soul	classic soul	f
memphis soul	memphis soul	f
soul blues	soul blues	f
southern soul	southern soul	f
classic uk pop	classic uk pop	f
glam rock	glam rock	f
reggae fusion	reggae fusion	f
ska mexicano	ska mexicano	f
ska punk	ska punk	f
punk	punk	f
post-punk	post-punk	f
protopunk	protopunk	f
art rock	art rock	f
dark wave	dark wave	f
gothic rock	gothic rock	f
uk post-punk	uk post-punk	f
ohio hip hop	ohio hip hop	f
madchester	madchester	f
indie poptimism	indie poptimism	f
modern alternative rock	modern alternative rock	f
modern blues	modern blues	f
east coast hip hop	east coast hip hop	f
indie garage rock	indie garage rock	f
indie surf	indie surf	f
neo-psychedelic	neo-psychedelic	f
abstract hip hop	abstract hip hop	f
albuquerque indie	albuquerque indie	f
retro soul	retro soul	f
lgbtq+ hip hop	lgbtq+ hip hop	f
lilith	lilith	f
piano rock	piano rock	f
folk rock	folk rock	f
roots rock	roots rock	f
supergroup	supergroup	f
canadian indie	canadian indie	f
quebec indie	quebec indie	f
yacht rock	yacht rock	f
north carolina hip hop	north carolina hip hop	f
britpop	britpop	f
dark pop	dark pop	f
doomgaze	doomgaze	f
gaian doom	gaian doom	f
sacramento indie	sacramento indie	f
roots americana	roots americana	f
british invasion	british invasion	f
bubblegum pop	bubblegum pop	f
canadian singer-songwriter	canadian singer-songwriter	f
classic canadian rock	classic canadian rock	f
la pop	la pop	f
shimmer pop	shimmer pop	f
la indie	la indie	f
minneapolis sound	minneapolis sound	f
synth funk	synth funk	f
rap metal	rap metal	f
garage pop	garage pop	f
punk blues	punk blues	f
chicago indie	chicago indie	f
trap soul	trap soul	f
new weird america	new weird america	f
toronto indie	toronto indie	f
modern folk rock	modern folk rock	f
double drumming	double drumming	f
black americana	black americana	f
german pop	german pop	f
deep new americana	deep new americana	f
rap rock	rap rock	f
gangster rap	gangster rap	f
pop rap	pop rap	f
southern hip hop	southern hip hop	f
trap	trap	f
dreamo	dreamo	f
emo	emo	f
philly indie	philly indie	f
axe	axe	f
brazilian percussion	brazilian percussion	f
mpb	mpb	f
pagode	pagode	f
samba	samba	f
samba reggae	samba reggae	f
boom bap	boom bap	f
hardcore hip hop	hardcore hip hop	f
jazz boom bap	jazz boom bap	f
afrofuturism	afrofuturism	f
hip pop	hip pop	f
boston rock	boston rock	f
portland indie	portland indie	f
afrobeat	afrobeat	f
brass band	brass band	f
instrumental funk	instrumental funk	f
jacksonville indie	jacksonville indie	f
michigan indie	michigan indie	f
irish singer-songwriter	irish singer-songwriter	f
nyc pop	nyc pop	f
detroit rock	detroit rock	f
south carolina indie	south carolina indie	f
acoustic punk	acoustic punk	f
art punk	art punk	f
zolo	zolo	f
swedish alternative rock	swedish alternative rock	f
oxford indie	oxford indie	f
english indie rock	english indie rock	f
proto-hyperpop	proto-hyperpop	f
dfw rap	dfw rap	f
melodic rap	melodic rap	f
candy pop	candy pop	f
metropopolis	metropopolis	f
post-teen pop	post-teen pop	f
uk pop	uk pop	f
brostep	brostep	f
progressive electro house	progressive electro house	f
pop punk	pop punk	f
emo rap	emo rap	f
miami hip hop	miami hip hop	f
seattle indie	seattle indie	f
future bass	future bass	f
pop edm	pop edm	f
capoeira	capoeira	f
slap house	slap house	f
hyphy	hyphy	f
west coast trap	west coast trap	f
aesthetic rap	aesthetic rap	f
phonk	phonk	f
chicago rap	chicago rap	f
early us punk	early us punk	f
hardcore punk	hardcore punk	f
skate punk	skate punk	f
canadian hip hop	canadian hip hop	f
toronto rap	toronto rap	f
pittsburgh rap	pittsburgh rap	f
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.items (id, user_id, date, item_type, timespan, rank, spotify_id) FROM stdin;
1	12163992542	1668149257	track	long_term	1	1Kjw0LwdniCWran4PxJqPQ
2	12163992542	1668149257	track	long_term	2	1I40L32fTSSkBkPeArX9Ul
3	12163992542	1668149257	track	long_term	3	5fBjPtOxhgdpU6LNWLyVHv
4	12163992542	1668149257	track	long_term	4	4FE9SgxcOoCNuGnaaU8TXz
5	12163992542	1668149257	track	long_term	5	4FF4q2qyOsFhRavZ0bdVXT
6	12163992542	1668149257	track	long_term	6	0qprlw0jfsW4H9cG0FFE0Z
7	12163992542	1668149257	track	long_term	7	3jp7Ryj1sX3riA7NQaVlLd
8	12163992542	1668149257	track	long_term	8	2I88NEWpKrAPZuapXNV5G6
9	12163992542	1668149257	track	long_term	9	6YZQx90VEuzf0lRY9TYh7j
10	12163992542	1668149257	track	long_term	10	54b8qPFqYqIndfdxiLApea
11	12163992542	1668149257	track	long_term	11	3sTN90bIP2cJ1783ctHykO
12	12163992542	1668149257	track	long_term	12	2P3SLxeQHPqh8qKB6gtJY2
13	12163992542	1668149257	track	long_term	13	474uVhyGgK5MtY9gMcDgGl
14	12163992542	1668149257	track	long_term	14	16ro1is6DmDKkarlJMBbzV
15	12163992542	1668149257	track	long_term	15	4frLb7nWtsz2ymBE6k2GRP
16	12163992542	1668149257	track	long_term	16	2G2YzndIA6jeWFPBXhUjh5
17	12163992542	1668149257	track	long_term	17	5jZ1Z2GFTf2gwmFc3qiUxs
18	12163992542	1668149257	track	long_term	18	5vyt44455ipNNVSYq8fYY7
19	12163992542	1668149257	track	long_term	19	1OFKUn2VLafrHj7ybnap0Q
20	12163992542	1668149257	track	long_term	20	21oJ1K99GBJrE2GVQGVjA0
21	12163992542	1668149257	track	long_term	21	1LzNfuep1bnAUR9skqdHCK
22	12163992542	1668149257	track	long_term	22	748yv6bb3l3CcKS45a6SZ8
23	12163992542	1668149257	track	long_term	23	6NvRxjfYkkT2SpirAlmsjH
24	12163992542	1668149257	track	long_term	24	0hJS3EHWC4uL9sJ52ErpoN
25	12163992542	1668149257	track	long_term	25	1ZaNp6b4cY3zcrciagi7td
26	12163992542	1668149257	track	long_term	26	1qQSRy9DjrGh3jtsSCU6B1
27	12163992542	1668149257	track	long_term	27	3s8MBOMdUi5Vol77qq8KJJ
28	12163992542	1668149257	track	long_term	28	4j3GWI86JvSaF0BLdmgcfF
29	12163992542	1668149257	track	long_term	29	4f8Mh5wuWHOsfXtzjrJB3t
30	12163992542	1668149257	track	long_term	30	6VojZJpMyuKClbwyilWlQj
31	12163992542	1668149257	track	long_term	31	1TDdYSYLIXMJ4EiKO6ZCYk
32	12163992542	1668149257	track	long_term	32	1RbOObDFn7GOseR1w529Zj
33	12163992542	1668149257	track	long_term	33	0Hw6SCrtU9pFCjgAONpnGZ
34	12163992542	1668149257	track	long_term	34	0S29RwGLJutn4qnFJQL13n
35	12163992542	1668149257	track	long_term	35	5SCB7L1alKg7ZEeSw7Sq9f
36	12163992542	1668149257	track	long_term	36	3aN2V18W3EiW7eg5tHALpF
37	12163992542	1668149257	track	long_term	37	5hVghJ4KaYES3BFUATCYn0
38	12163992542	1668149257	track	long_term	38	6fc51JZVE0Yijdi6RuoLFv
39	12163992542	1668149257	track	long_term	39	3zJ5RDG0bLQAV2rntFgUtb
40	12163992542	1668149257	track	long_term	40	6iGU74CwXuT4XVepjc9Emf
41	12163992542	1668149257	track	long_term	41	7wdzLe2Gsx1RGqbvYZHASz
42	12163992542	1668149257	track	long_term	42	3imS277wRbz1CFoDySgTff
43	12163992542	1668149257	track	long_term	43	3mT1AONeTJDi1k8vH8pA2L
44	12163992542	1668149257	track	long_term	44	7Cu2COdH93MnuireuKNiS3
45	12163992542	1668149257	track	long_term	45	7JmPqImeW3kLoYVNBA9v11
46	12163992542	1668149257	track	long_term	46	2aCKBrLn7rbhStk5k4FwnF
47	12163992542	1668149257	track	long_term	47	0vJvCnuxXL2BCSRa1ZoeNl
48	12163992542	1668149257	track	long_term	48	1zkkvSLk5Nh4uoyKWwuie9
49	12163992542	1668149257	track	long_term	49	62wdQ5CInFr7cjISqrr46f
50	12163992542	1668149257	track	long_term	50	3iVp14VoAsAZkIdgQoRRAb
51	12163992542	1668149257	track	medium_term	1	16ro1is6DmDKkarlJMBbzV
52	12163992542	1668149257	track	medium_term	2	0hJS3EHWC4uL9sJ52ErpoN
53	12163992542	1668149257	track	medium_term	3	5vyt44455ipNNVSYq8fYY7
54	12163992542	1668149257	track	medium_term	4	474uVhyGgK5MtY9gMcDgGl
55	12163992542	1668149257	track	medium_term	5	1TDdYSYLIXMJ4EiKO6ZCYk
56	12163992542	1668149257	track	medium_term	6	63k361zOGEhmvgzBdzzSGP
57	12163992542	1668149257	track	medium_term	7	04M3DsiMNyn8s5XQJrW5sL
58	12163992542	1668149257	track	medium_term	8	6fc51JZVE0Yijdi6RuoLFv
59	12163992542	1668149257	track	medium_term	9	5rfT032kGmLvbxZzfHlu5D
60	12163992542	1668149257	track	medium_term	10	5zzWx7oJ9zBmv76uFaFeYR
61	12163992542	1668149257	track	medium_term	11	2pA4ip3VIEVcIa3qE02oAX
62	12163992542	1668149257	track	medium_term	12	1k7aPYyAnNTjVbjw1YDNp1
63	12163992542	1668149257	track	medium_term	13	41xaZ4WLlKD95U5PknoJrV
64	12163992542	1668149257	track	medium_term	14	1zkkvSLk5Nh4uoyKWwuie9
65	12163992542	1668149257	track	medium_term	15	33vFhGNZa44VJ0I21AOGYe
66	12163992542	1668149257	track	medium_term	16	03v70ZBxmcPX3RWAZMzqaW
67	12163992542	1668149257	track	medium_term	17	1RzgWAFlI6KOenjOxJYcH0
68	12163992542	1668149257	track	medium_term	18	2OeL43EXwaC205Xr1da1qJ
69	12163992542	1668149257	track	medium_term	19	5CU1bbfY1wUPm7fU255Dhf
70	12163992542	1668149257	track	medium_term	20	0dqJjKKxuKD5Dt3QH2n4CG
71	12163992542	1668149257	track	medium_term	21	5C90m8eM6GJR2SACiLAWHo
72	12163992542	1668149257	track	medium_term	22	4Fc62OkXYtEOjMmaSyJoQY
73	12163992542	1668149257	track	medium_term	23	244QS6446wyO1UfVTWlOlR
74	12163992542	1668149257	track	medium_term	24	5L7IgwUPhir2FJftGNXJDW
75	12163992542	1668149257	track	medium_term	25	35mL8keNDi2VLHrFXZCgJR
76	12163992542	1668149257	track	medium_term	26	3aN2V18W3EiW7eg5tHALpF
77	12163992542	1668149257	track	medium_term	27	50bmpfgcV29ouRVDfr5wOc
78	12163992542	1668149257	track	medium_term	28	5IRdIQNIZzVqE4XyBylkvd
79	12163992542	1668149257	track	medium_term	29	4FF4q2qyOsFhRavZ0bdVXT
80	12163992542	1668149257	track	medium_term	30	5do7Ql6G8N03fY6G9Y08Ec
81	12163992542	1668149257	track	medium_term	31	6YZQx90VEuzf0lRY9TYh7j
82	12163992542	1668149257	track	medium_term	32	0ZAbupc7jAQpG9IxojQ3s3
83	12163992542	1668149257	track	medium_term	33	6MDijuuArPJv1vbp7K1x3f
84	12163992542	1668149257	track	medium_term	34	0b2vqB7QNT4z8nnaYqbuel
85	12163992542	1668149257	track	medium_term	35	47KDDZgFiX1w6RFOuLXsSn
86	12163992542	1668149257	track	medium_term	36	3LcjZGk0GBlPRe5XhYVGgM
87	12163992542	1668149257	track	medium_term	37	37ZvpHeZKazqOnLfAGm9nb
88	12163992542	1668149257	track	medium_term	38	0JXXNGljqupsJaZsgSbMZV
89	12163992542	1668149257	track	medium_term	39	3banchOoe2giyRK0jaO1c7
90	12163992542	1668149257	track	medium_term	40	27AG99NmWMFLRoyZMMPNW2
91	12163992542	1668149257	track	medium_term	41	7trx783SvnHhKkmgSSTIFJ
92	12163992542	1668149257	track	medium_term	42	7l5j3FapCyr6HxUgoAynM2
93	12163992542	1668149257	track	medium_term	43	5VA4Ispp52EA1sOqzMz3Av
94	12163992542	1668149257	track	medium_term	44	7qHoVZ6076OGx18G6W5vQ9
95	12163992542	1668149257	track	medium_term	45	4hv7GT5g9qNnrxlocsOSYt
96	12163992542	1668149257	track	medium_term	46	4PFiLGx8jAzcAJxwPLUeZ9
97	12163992542	1668149257	track	medium_term	47	1ULovMYbbglXIn9TQzMsKz
98	12163992542	1668149257	track	medium_term	48	4isk4UYRcmslphcTq61xUg
99	12163992542	1668149257	track	medium_term	49	5WoaF1B5XIEnWfmb5NZikf
100	12163992542	1668149257	track	medium_term	50	7sf0tmuGZlHXUWpi9dQqcw
101	12163992542	1668149257	track	short_term	1	0b2vqB7QNT4z8nnaYqbuel
102	12163992542	1668149257	track	short_term	2	474uVhyGgK5MtY9gMcDgGl
103	12163992542	1668149257	track	short_term	3	16ro1is6DmDKkarlJMBbzV
104	12163992542	1668149257	track	short_term	4	1TDdYSYLIXMJ4EiKO6ZCYk
105	12163992542	1668149257	track	short_term	5	5vyt44455ipNNVSYq8fYY7
106	12163992542	1668149257	track	short_term	6	0hJS3EHWC4uL9sJ52ErpoN
107	12163992542	1668149257	track	short_term	7	6fc51JZVE0Yijdi6RuoLFv
108	12163992542	1668149257	track	short_term	8	63k361zOGEhmvgzBdzzSGP
109	12163992542	1668149257	track	short_term	9	5p0bEz7DNsULez2X9yrNGa
110	12163992542	1668149257	track	short_term	10	1k7aPYyAnNTjVbjw1YDNp1
111	12163992542	1668149257	track	short_term	11	1dxXQuExRVu77xF1r5YtRF
112	12163992542	1668149257	track	short_term	12	244QS6446wyO1UfVTWlOlR
113	12163992542	1668149257	track	short_term	13	3Pu3IChaAoa5EjgUBv5F6x
114	12163992542	1668149257	track	short_term	14	0wejso6CHHEEqvTD3f3gBz
115	12163992542	1668149257	track	short_term	15	23od4rorIdhvYeLL7YqP9n
116	12163992542	1668149257	track	short_term	16	2I3ZdIFXnRn1PSAdMC4w71
117	12163992542	1668149257	track	short_term	17	5eKfpH2dQ7FltCqb7LWEGJ
118	12163992542	1668149257	track	short_term	18	7Cva2EgJougx6O6M5xgWAq
119	12163992542	1668149257	track	short_term	19	7KR5uycb8gfQYRl1MTL8aB
120	12163992542	1668149257	track	short_term	20	7xjbn0bhs7zx7E1s0lCqT3
121	12163992542	1668149257	track	short_term	21	1zkkvSLk5Nh4uoyKWwuie9
122	12163992542	1668149257	track	short_term	22	2OeL43EXwaC205Xr1da1qJ
123	12163992542	1668149257	track	short_term	23	4Fc62OkXYtEOjMmaSyJoQY
124	12163992542	1668149257	track	short_term	24	72dIN8F7D5ydB3auSqNi84
125	12163992542	1668149257	track	short_term	25	33vFhGNZa44VJ0I21AOGYe
126	12163992542	1668149257	track	short_term	26	1RzgWAFlI6KOenjOxJYcH0
127	12163992542	1668149257	track	short_term	27	41xaZ4WLlKD95U5PknoJrV
128	12163992542	1668149257	track	short_term	28	4oB0d8H93GtllDkoHNuLIN
129	12163992542	1668149257	track	short_term	29	0vF9RAGwgYtfO1Aajwb7et
130	12163992542	1668149257	track	short_term	30	10fiZCExnOMqElSX952WZI
131	12163992542	1668149257	track	short_term	31	1AR58rtcLziNnRHTCmCywd
132	12163992542	1668149257	track	short_term	32	3Cx9j78Z0NE6jYwBWvvV3P
133	12163992542	1668149257	track	short_term	33	3EytfC22ikoXM921cJbejn
134	12163992542	1668149257	track	short_term	34	3s5N94NsDYcOqgi7cSakv6
135	12163992542	1668149257	track	short_term	35	4J6JARDGkdc1fqLEflP94Z
136	12163992542	1668149257	track	short_term	36	4ZTl5GUAmO49b2cf6jovqx
137	12163992542	1668149257	track	short_term	37	5avF5IwDg2v1QCxPvX9Fru
138	12163992542	1668149257	track	short_term	38	4TIJ7zSBNejpoIPaWpWRKc
139	12163992542	1668149257	track	short_term	39	56KqaFSGTb7ifpt16t5Y1N
140	12163992542	1668149257	track	short_term	40	04M3DsiMNyn8s5XQJrW5sL
141	12163992542	1668149257	track	short_term	41	21YxK0klhpfLW8budkJaMF
142	12163992542	1668149257	track	short_term	42	29iwiYD3KVWBKxe31nGjEL
143	12163992542	1668149257	track	short_term	43	3YZa4IzxK2UtEKTvdTgsi8
144	12163992542	1668149257	track	short_term	44	5El6bpLd8nYPsvWgZLdHio
145	12163992542	1668149257	track	short_term	45	7xENAAODeE2hKzdWFI6YaB
146	12163992542	1668149257	track	short_term	46	50bmpfgcV29ouRVDfr5wOc
147	12163992542	1668149257	track	short_term	47	0dqJjKKxuKD5Dt3QH2n4CG
148	12163992542	1668149257	track	short_term	48	0WQiDwKJclirSYG9v5tayI
149	12163992542	1668149257	track	short_term	49	0ncGfTV06HogJIgn2Ujjgb
150	12163992542	1668149257	track	short_term	50	14z3RzUHeZQgtpOlSYvmZD
151	12163992542	1668149259	artist	long_term	1	1Xyo4u8uXC1ZmMpatF05PJ
152	12163992542	1668149259	artist	long_term	2	00FQb4jTyendYWaN8pK0wa
153	12163992542	1668149259	artist	long_term	3	360IAlyVv4PCEVjgyMZrxK
154	12163992542	1668149259	artist	long_term	4	4hz8tIajF2INpgM0qzPJz2
155	12163992542	1668149259	artist	long_term	5	4V8LLVI7PbaPR0K2TGSxFF
156	12163992542	1668149259	artist	long_term	6	4lujUKeO6nQAJXpq37Epn7
157	12163992542	1668149259	artist	long_term	7	0bzfPKdbXL5ezYW2z3UGQj
158	12163992542	1668149259	artist	long_term	8	5wFXmYsg3KFJ8BDsQudJ4f
159	12163992542	1668149259	artist	long_term	9	462T0buQ5ScBUQCRpodDRf
160	12163992542	1668149259	artist	long_term	10	0YrtvWJMgSdVrk3SfNjTbx
161	12163992542	1668149259	artist	long_term	11	6ltzsmQQbmdoHHbLZ4ZN25
162	12163992542	1668149259	artist	long_term	12	3jK9MiCrA42lLAdMGUZpwa
163	12163992542	1668149259	artist	long_term	13	3qnGvpP8Yth1AqSBMqON5x
164	12163992542	1668149259	artist	long_term	14	60df5JBRRPcnSpsIMxxwQm
165	12163992542	1668149259	artist	long_term	15	13ubrt8QOOCPljQ2FL1Kca
166	12163992542	1668149259	artist	long_term	16	2YZyLoL8N0Wb9xBt1NhZWg
167	12163992542	1668149259	artist	long_term	17	6QRlkjrHz5A62mqeNZz7t3
168	12163992542	1668149259	artist	long_term	18	5CuU6SRJjbbZL926nSGGxX
169	12163992542	1668149259	artist	long_term	19	6pmxr66tMAePxzOLfjGNcX
170	12163992542	1668149259	artist	long_term	20	3XHO7cRUPCLOr6jwp8vsx5
171	12163992542	1668149259	artist	long_term	21	20wkVLutqVOYrc0kxFs7rA
172	12163992542	1668149259	artist	long_term	22	6eU0jV2eEZ8XTM7EmlguK6
173	12163992542	1668149259	artist	long_term	23	2h93pZq0e7k5yf4dywlkpM
174	12163992542	1668149259	artist	long_term	24	1zXCFUgH6FWS0iCiCKsH55
175	12163992542	1668149259	artist	long_term	25	6PEMFpe3PTOksdV4ZXUpbE
176	12163992542	1668149259	artist	long_term	26	3z6Gk257P9jNcZbBXJNX5i
177	12163992542	1668149259	artist	long_term	27	74oJ4qxwOZvX6oSsu1DGnw
178	12163992542	1668149259	artist	long_term	28	0XSqX2PB3C5dTMv7SZaxSm
179	12163992542	1668149259	artist	long_term	29	08GQAI4eElDnROBrJRGE0X
180	12163992542	1668149259	artist	long_term	30	6l3HvQ5sa6mXTsMTB19rO5
181	12163992542	1668149259	artist	long_term	31	6RZUqkomCmb8zCRqc9eznB
182	12163992542	1668149259	artist	long_term	32	0fA0VVWsXO9YnASrzqfmYu
183	12163992542	1668149259	artist	long_term	33	6ZK2nrW8aCTg8Bid7I7N10
184	12163992542	1668149259	artist	long_term	34	6TVVIyd0fsRDGg6WzHKyTP
185	12163992542	1668149259	artist	long_term	35	6tkrcmVfWoHC4WOhE7IDyq
186	12163992542	1668149259	artist	long_term	36	600GgDUq9kzGJgNIrVsWfz
187	12163992542	1668149259	artist	long_term	37	2jgPkn6LuUazBoBk6vvjh5
188	12163992542	1668149259	artist	long_term	38	6v8FB84lnmJs434UJf2Mrm
189	12163992542	1668149259	artist	long_term	39	3QTDHixorJelOLxoxcjqGx
190	12163992542	1668149259	artist	long_term	40	0qu422H5MOoQxGjd4IzHbS
191	12163992542	1668149259	artist	long_term	41	3ycxRkcZ67ALN3GQJ57Vig
192	12163992542	1668149259	artist	long_term	42	2ooIqOf4X2uz4mMptXCtie
193	12163992542	1668149259	artist	long_term	43	77SW9BnxLY8rJ0RciFqkHh
194	12163992542	1668149259	artist	long_term	44	5NYEE4kgrEZPlM3DxUsTyc
195	12163992542	1668149259	artist	long_term	45	2pAajGWerK3ghwToNWFENS
196	12163992542	1668149259	artist	long_term	46	75dQReiBOHN37fQgWQrIAJ
197	12163992542	1668149259	artist	long_term	47	22bE4uQ6baNwSHPVcDxLCe
198	12163992542	1668149259	artist	long_term	48	5a2EaR3hamoenG9rDuVn8j
199	12163992542	1668149259	artist	long_term	49	6Ghvu1VvMGScGpOUJBAHNH
200	12163992542	1668149259	artist	long_term	50	1KP6TWI40m7p3QBTU6u2xo
201	12163992542	1668149259	artist	medium_term	1	4hz8tIajF2INpgM0qzPJz2
202	12163992542	1668149259	artist	medium_term	2	5wFXmYsg3KFJ8BDsQudJ4f
203	12163992542	1668149259	artist	medium_term	3	360IAlyVv4PCEVjgyMZrxK
204	12163992542	1668149259	artist	medium_term	4	0YrtvWJMgSdVrk3SfNjTbx
205	12163992542	1668149259	artist	medium_term	5	0fA0VVWsXO9YnASrzqfmYu
206	12163992542	1668149259	artist	medium_term	6	2ooIqOf4X2uz4mMptXCtie
207	12163992542	1668149259	artist	medium_term	7	4n0gvapwYbRpzU5Ov68B6P
208	12163992542	1668149259	artist	medium_term	8	1KP6TWI40m7p3QBTU6u2xo
209	12163992542	1668149259	artist	medium_term	9	3jK9MiCrA42lLAdMGUZpwa
210	12163992542	1668149259	artist	medium_term	10	4lujUKeO6nQAJXpq37Epn7
211	12163992542	1668149259	artist	medium_term	11	0XSqX2PB3C5dTMv7SZaxSm
212	12163992542	1668149259	artist	medium_term	12	1zXCFUgH6FWS0iCiCKsH55
213	12163992542	1668149259	artist	medium_term	13	3XHO7cRUPCLOr6jwp8vsx5
214	12163992542	1668149259	artist	medium_term	14	4uSftVc3FPWe6RJuMZNEe9
215	12163992542	1668149259	artist	medium_term	15	462T0buQ5ScBUQCRpodDRf
216	12163992542	1668149259	artist	medium_term	16	6AWdGez5g1jxpfl9XD4wI3
217	12163992542	1668149259	artist	medium_term	17	7HeVXdOdMhLslVputGTZFQ
218	12163992542	1668149259	artist	medium_term	18	6ltzsmQQbmdoHHbLZ4ZN25
219	12163992542	1668149259	artist	medium_term	19	0V7uVrIYr4FwFvUN9S4kYr
220	12163992542	1668149259	artist	medium_term	20	6hnWRPzGGKiapVX1UCdEAC
221	12163992542	1668149259	artist	medium_term	21	2FRXiAz5Uz78LLLSwEUhLt
222	12163992542	1668149259	artist	medium_term	22	2pAajGWerK3ghwToNWFENS
223	12163992542	1668149259	artist	medium_term	23	1Xyo4u8uXC1ZmMpatF05PJ
224	12163992542	1668149259	artist	medium_term	24	1fZpYWNWdL5Z3wrDtISFUH
225	12163992542	1668149259	artist	medium_term	25	7ITd48RbLVpUfheE7B86o2
226	12163992542	1668149259	artist	medium_term	26	0EdvGhlC1FkGItLOWQzG4J
227	12163992542	1668149259	artist	medium_term	27	1yAwtBaoHLEDWAnWR87hBT
228	12163992542	1668149259	artist	medium_term	28	6TVVIyd0fsRDGg6WzHKyTP
229	12163992542	1668149259	artist	medium_term	29	00FQb4jTyendYWaN8pK0wa
230	12163992542	1668149259	artist	medium_term	30	6LufpoVlIYKQCu9Gjpk8B7
231	12163992542	1668149259	artist	medium_term	31	2kGBy2WHvF0VdZyqiVCkDT
232	12163992542	1668149259	artist	medium_term	32	0oSGxfWSnnOXhD2fKuz2Gy
233	12163992542	1668149259	artist	medium_term	33	60df5JBRRPcnSpsIMxxwQm
234	12163992542	1668149259	artist	medium_term	34	68kEuyFKyqrdQQLLsmiatm
235	12163992542	1668149259	artist	medium_term	35	1hzfo8twXdOegF3xireCYs
236	12163992542	1668149259	artist	medium_term	36	251UrhgNbMr15NLzQ2KyKq
237	12163992542	1668149259	artist	medium_term	37	4DFhHyjvGYa9wxdHUjtDkc
238	12163992542	1668149259	artist	medium_term	38	5IcR3N7QB1j6KBL8eImZ8m
239	12163992542	1668149259	artist	medium_term	39	3D4qYDvoPn5cQxtBm4oseo
240	12163992542	1668149259	artist	medium_term	40	3tJ9PkBOrG7hFkHeNM2tbw
241	12163992542	1668149259	artist	medium_term	41	0bzfPKdbXL5ezYW2z3UGQj
242	12163992542	1668149259	artist	medium_term	42	2ApaG60P4r0yhBoDCGD8YG
243	12163992542	1668149259	artist	medium_term	43	6RZUqkomCmb8zCRqc9eznB
244	12163992542	1668149259	artist	medium_term	44	6GEykX11lQqp92UVOQQCC7
245	12163992542	1668149259	artist	medium_term	45	1anAI9P9iSzc9qzLv6AtHZ
246	12163992542	1668149259	artist	medium_term	46	3qnGvpP8Yth1AqSBMqON5x
247	12163992542	1668149259	artist	medium_term	47	3yY2gUcIsjMr8hjo51PoJ8
248	12163992542	1668149259	artist	medium_term	48	75dQReiBOHN37fQgWQrIAJ
249	12163992542	1668149259	artist	medium_term	49	2auiVi8sUZo17dLy1HwrTU
250	12163992542	1668149259	artist	medium_term	50	77SW9BnxLY8rJ0RciFqkHh
251	12163992542	1668149259	artist	short_term	1	4hz8tIajF2INpgM0qzPJz2
252	12163992542	1668149259	artist	short_term	2	0YrtvWJMgSdVrk3SfNjTbx
253	12163992542	1668149259	artist	short_term	3	5wFXmYsg3KFJ8BDsQudJ4f
254	12163992542	1668149259	artist	short_term	4	4lujUKeO6nQAJXpq37Epn7
255	12163992542	1668149259	artist	short_term	5	0fA0VVWsXO9YnASrzqfmYu
256	12163992542	1668149259	artist	short_term	6	462T0buQ5ScBUQCRpodDRf
257	12163992542	1668149259	artist	short_term	7	6TVVIyd0fsRDGg6WzHKyTP
258	12163992542	1668149259	artist	short_term	8	0EdvGhlC1FkGItLOWQzG4J
259	12163992542	1668149259	artist	short_term	9	0oSGxfWSnnOXhD2fKuz2Gy
260	12163992542	1668149259	artist	short_term	10	6ltzsmQQbmdoHHbLZ4ZN25
261	12163992542	1668149259	artist	short_term	11	6LufpoVlIYKQCu9Gjpk8B7
262	12163992542	1668149259	artist	short_term	12	75dQReiBOHN37fQgWQrIAJ
263	12163992542	1668149259	artist	short_term	13	2ooIqOf4X2uz4mMptXCtie
264	12163992542	1668149259	artist	short_term	14	6zvul52xwTWzilBZl6BUbT
265	12163992542	1668149259	artist	short_term	15	0V7uVrIYr4FwFvUN9S4kYr
266	12163992542	1668149259	artist	short_term	16	3yY2gUcIsjMr8hjo51PoJ8
267	12163992542	1668149259	artist	short_term	17	1nGqKVGfPPiVgxMdx8hYOI
268	12163992542	1668149259	artist	short_term	18	432R46LaYsJZV2Gmc4jUV5
269	12163992542	1668149259	artist	short_term	19	1fZpYWNWdL5Z3wrDtISFUH
270	12163992542	1668149259	artist	short_term	20	1PryMSya1JnSAlcwYawCxp
271	12163992542	1668149259	artist	short_term	21	2bToe6WyGvADJftreuXh2K
272	12163992542	1668149259	artist	short_term	22	1anAI9P9iSzc9qzLv6AtHZ
273	12163992542	1668149259	artist	short_term	23	3RGLhK1IP9jnYFH4BRFJBS
274	12163992542	1668149259	artist	short_term	24	7FKTg75ADVMZgY3P9ZMRtH
275	12163992542	1668149259	artist	short_term	25	7bu3H8JO7d0UbMoVzbo70s
276	12163992542	1668149259	artist	short_term	26	0oL26Dn9y761yfJgNb3vfu
277	12163992542	1668149259	artist	short_term	27	0MVp3LuNho9Hk6Q1owsWwt
278	12163992542	1668149259	artist	short_term	28	1SQRv42e4PjEYfPhS0Tk9E
279	12163992542	1668149259	artist	short_term	29	2FXC3k01G6Gw61bmprjgqS
280	12163992542	1668149259	artist	short_term	30	60df5JBRRPcnSpsIMxxwQm
281	12163992542	1668149259	artist	short_term	31	0v6gOfGBclTSGu6agfXb23
282	12163992542	1668149259	artist	short_term	32	0yNLKJebCb8Aueb54LYya3
283	12163992542	1668149259	artist	short_term	33	1Tp7C6LzxZe9Mix6rn4zbI
284	12163992542	1668149259	artist	short_term	34	2oqwwcM17wrP9hBD25zKSR
285	12163992542	1668149259	artist	short_term	35	0XSqX2PB3C5dTMv7SZaxSm
286	12163992542	1668149259	artist	short_term	36	4BFMTELQyWJU1SwqcXMBm3
287	12163992542	1668149259	artist	short_term	37	7foyQbi7GKriLiv1GPVEwt
288	12163992542	1668149259	artist	short_term	38	0rpMdBzQXf7aYRnu5fDBJy
289	12163992542	1668149259	artist	short_term	39	2x9SpqnPi8rlE9pjHBwmSC
290	12163992542	1668149259	artist	short_term	40	1KP6TWI40m7p3QBTU6u2xo
291	12163992542	1668149259	artist	short_term	41	26T3LtbuGT1Fu9m0eRq5X3
292	12163992542	1668149259	artist	short_term	42	4LG4Bs1Gadht7TCrMytQUO
293	12163992542	1668149259	artist	short_term	43	4fXkvh05wFhuH77MfD4m9o
294	12163992542	1668149259	artist	short_term	44	6Xa4nbrSTfbioA4lLShbjh
295	12163992542	1668149259	artist	short_term	45	6m4tJuf67jwVSvMP34hrck
296	12163992542	1668149259	artist	short_term	46	1nJvji2KIlWSseXRSlNYsC
297	12163992542	1668149259	artist	short_term	47	32Ko3nL0210QAt14S3Rs4Y
298	12163992542	1668149259	artist	short_term	48	4Z8W4fKeB5YxbusRsdQVPb
299	12163992542	1668149259	artist	short_term	49	48vDIufGC8ujPuBiTxY8dm
300	12163992542	1668149259	artist	short_term	50	4zsrUnozu6zRlVELQezaBn
301	the_real_wjdhollow	1668156740	track	long_term	1	7CUkeiG7QtB7tPU9f8SANS
302	the_real_wjdhollow	1668156740	track	long_term	2	0HsGh7cboYz6cVMIyFrQ8j
303	the_real_wjdhollow	1668156740	track	long_term	3	50bmpfgcV29ouRVDfr5wOc
304	the_real_wjdhollow	1668156740	track	long_term	4	0ZAbupc7jAQpG9IxojQ3s3
305	the_real_wjdhollow	1668156740	track	long_term	5	474uVhyGgK5MtY9gMcDgGl
306	the_real_wjdhollow	1668156740	track	long_term	6	4uQ7wYsuL0DryknoDc11Hk
307	the_real_wjdhollow	1668156740	track	long_term	7	734xplxSpoW22U5OeeZcr8
308	the_real_wjdhollow	1668156740	track	long_term	8	65ENznU4hwrR04whyJboxr
309	the_real_wjdhollow	1668156740	track	long_term	9	0fIffclhgJC5h8AdMMVvkp
310	the_real_wjdhollow	1668156740	track	long_term	10	7trx783SvnHhKkmgSSTIFJ
311	the_real_wjdhollow	1668156740	track	long_term	11	4rc2WNOt2w8BHfQjBC8PO0
312	the_real_wjdhollow	1668156740	track	long_term	12	7HNpXPaTcX5CoNBjTAEWBr
313	the_real_wjdhollow	1668156740	track	long_term	13	2XU0oxnq2qxCpomAAuJY8K
314	the_real_wjdhollow	1668156740	track	long_term	14	61bwFjzXGG1x2aZsANdLyl
315	the_real_wjdhollow	1668156740	track	long_term	15	0nbXyq5TXYPCO7pr3N8S4I
316	the_real_wjdhollow	1668156740	track	long_term	16	4jM6Tl8062cc9gTJgTZTpx
317	the_real_wjdhollow	1668156740	track	long_term	17	6vECYJHxYmm3Ydt3fF01pE
318	the_real_wjdhollow	1668156740	track	long_term	18	2SY8qCm2nwl2JK3BBOhBrl
319	the_real_wjdhollow	1668156740	track	long_term	19	7aiClxsDWFRQ0Kzk5KI5ku
320	the_real_wjdhollow	1668156740	track	long_term	20	7fBv7CLKzipRk6EC6TWHOB
321	the_real_wjdhollow	1668156740	track	long_term	21	1z4xjDLLWJgG48Bn8OCxZv
322	the_real_wjdhollow	1668156740	track	long_term	22	02kDW379Yfd5PzW5A6vuGt
323	the_real_wjdhollow	1668156740	track	long_term	23	4fuPFCrsnZ85emMfL52CKp
324	the_real_wjdhollow	1668156740	track	long_term	24	2Z8WuEywRWYTKe1NybPQEW
325	the_real_wjdhollow	1668156740	track	long_term	25	5OFEJMirg4NPz7G1zgXDYu
326	the_real_wjdhollow	1668156740	track	long_term	26	6PQ88X9TkUIAUIZJHW2upE
327	the_real_wjdhollow	1668156740	track	long_term	27	2eel5Us5RHsvtBNPnFT5E1
328	the_real_wjdhollow	1668156740	track	long_term	28	6i0V12jOa3mr6uu4WYhUBr
329	the_real_wjdhollow	1668156740	track	long_term	29	3NWTRZ0A8xKlBP1qgNftql
330	the_real_wjdhollow	1668156740	track	long_term	30	19gEmPjfqSZT0ulDRfjl0m
331	the_real_wjdhollow	1668156740	track	long_term	31	78JKJfKsqgeBDBF58gv1SF
332	the_real_wjdhollow	1668156740	track	long_term	32	367HmvU5MpsWZdAJ3QbGlZ
333	the_real_wjdhollow	1668156740	track	long_term	33	0wzruvvN7f5wu39aFcjTMw
334	the_real_wjdhollow	1668156740	track	long_term	34	3p9x4bK5bwmgXE6POMvOp0
335	the_real_wjdhollow	1668156740	track	long_term	35	6bnF93Rx87YqUBLSgjiMU8
336	the_real_wjdhollow	1668156740	track	long_term	36	4EFy48vEJNG3xQf5Er4scn
337	the_real_wjdhollow	1668156740	track	long_term	37	37ZvpHeZKazqOnLfAGm9nb
338	the_real_wjdhollow	1668156740	track	long_term	38	6ORqU0bHbVCRjXm9AjyHyZ
339	the_real_wjdhollow	1668156740	track	long_term	39	2fwz9mBaELJCzXuEEEe35Y
340	the_real_wjdhollow	1668156740	track	long_term	40	11CiPQqnR8j7nsfZVMpboM
341	the_real_wjdhollow	1668156740	track	long_term	41	5wfllwdjglyQislkskYLBv
342	the_real_wjdhollow	1668156740	track	long_term	42	0VjIjW4GlUZAMYd2vXMi3b
343	the_real_wjdhollow	1668156740	track	long_term	43	22VdIZQfgXJea34mQxlt81
344	the_real_wjdhollow	1668156740	track	long_term	44	5rfT032kGmLvbxZzfHlu5D
345	the_real_wjdhollow	1668156740	track	long_term	45	5mpLcXEsk3jjzLFGuNKk5I
346	the_real_wjdhollow	1668156740	track	long_term	46	16ro1is6DmDKkarlJMBbzV
347	the_real_wjdhollow	1668156740	track	long_term	47	0yhGTljYYHyP7phuxoKWiJ
348	the_real_wjdhollow	1668156740	track	long_term	48	2QbGvQssb0VLLS4x5NOmyJ
349	the_real_wjdhollow	1668156740	track	long_term	49	7vaFuClNKe02pjKYbXEJ46
350	the_real_wjdhollow	1668156740	track	long_term	50	6L89mwZXSOwYl76YXfX13s
351	the_real_wjdhollow	1668156740	track	medium_term	1	0z5oHDjD9vMsck14zoAQOc
352	the_real_wjdhollow	1668156740	track	medium_term	2	0KV4Ax6L10oSTWqC8607K4
353	the_real_wjdhollow	1668156740	track	medium_term	3	6myUpr3GDR80Dg3zqNTmmG
354	the_real_wjdhollow	1668156740	track	medium_term	4	5CFJRZRq6sdKKtRwNPWbYv
355	the_real_wjdhollow	1668156740	track	medium_term	5	7CUkeiG7QtB7tPU9f8SANS
356	the_real_wjdhollow	1668156740	track	medium_term	6	1xzUQMiCoY5pdego0pHMeV
357	the_real_wjdhollow	1668156740	track	medium_term	7	3ImnbJHoSy5uUhC0ydBVI9
358	the_real_wjdhollow	1668156740	track	medium_term	8	39Yp9wwQiSRIDOvrVg7mbk
359	the_real_wjdhollow	1668156740	track	medium_term	9	5V5BHmvpylV0nSc2Yu2Mu4
360	the_real_wjdhollow	1668156740	track	medium_term	10	40mjsnRjCpycdUw3xhS20g
361	the_real_wjdhollow	1668156740	track	medium_term	11	4jM6Tl8062cc9gTJgTZTpx
362	the_real_wjdhollow	1668156740	track	medium_term	12	30KctD1WsHKTIYczXjip5a
363	the_real_wjdhollow	1668156740	track	medium_term	13	4IIuCotvqijraSdnVLaFnM
364	the_real_wjdhollow	1668156740	track	medium_term	14	6LyAwkJsHlW7RQ8S1cYAtM
365	the_real_wjdhollow	1668156740	track	medium_term	15	6gBFPUFcJLzWGx4lenP6h2
366	the_real_wjdhollow	1668156740	track	medium_term	16	3mRlFZHUyvJbPTlkzg4LyJ
367	the_real_wjdhollow	1668156740	track	medium_term	17	5B3b5qszWCl22HlzitMh7x
368	the_real_wjdhollow	1668156740	track	medium_term	18	1tX1GK4bLfoS9oDIIbhYAv
369	the_real_wjdhollow	1668156740	track	medium_term	19	4nuAslShoN77tq12fzwjUq
370	the_real_wjdhollow	1668156740	track	medium_term	20	4xSY7Pxe3bveG1WOIIcYdr
371	the_real_wjdhollow	1668156740	track	medium_term	21	0fIffclhgJC5h8AdMMVvkp
372	the_real_wjdhollow	1668156740	track	medium_term	22	0IH3D0P8OrQFs6ajcqbm0R
373	the_real_wjdhollow	1668156740	track	medium_term	23	46M2hXnaQpueG7vSvgVtVH
374	the_real_wjdhollow	1668156740	track	medium_term	24	6AomCkEOQUODCYzQwH4SWC
375	the_real_wjdhollow	1668156740	track	medium_term	25	2cYqizR4lgvp4Qu6IQ3qGN
376	the_real_wjdhollow	1668156740	track	medium_term	26	2p23H2gdnWEiGUEymqarpJ
377	the_real_wjdhollow	1668156740	track	medium_term	27	3eekarcy7kvN4yt5ZFzltW
378	the_real_wjdhollow	1668156740	track	medium_term	28	7ycWLEP1GsNjVvcjawXz3z
379	the_real_wjdhollow	1668156740	track	medium_term	29	1ZM8toCOlnfBKJdvR8GqUq
380	the_real_wjdhollow	1668156740	track	medium_term	30	14eDzYfNRuqs1kf7zfIFJW
381	the_real_wjdhollow	1668156740	track	medium_term	31	1dQtt3K8GyPmH7ZD1LJ2ox
382	the_real_wjdhollow	1668156740	track	medium_term	32	24jP9hAAauSG4IH5zGji8a
383	the_real_wjdhollow	1668156740	track	medium_term	33	2Guz1b911CbpG8L92cnglI
384	the_real_wjdhollow	1668156740	track	medium_term	34	5OFEJMirg4NPz7G1zgXDYu
385	the_real_wjdhollow	1668156740	track	medium_term	35	2MLuFz9Y3Vg3PF0Yf93M5c
386	the_real_wjdhollow	1668156740	track	medium_term	36	1x5ihkusmVWsQWtvSCtW9q
387	the_real_wjdhollow	1668156740	track	medium_term	37	0XLQyCwYu8dhhzWAKSs3wr
388	the_real_wjdhollow	1668156740	track	medium_term	38	1fewSx2d5KIZ04wsooEBOz
389	the_real_wjdhollow	1668156740	track	medium_term	39	1tzTiTLSRisnQiOnhgAdtF
390	the_real_wjdhollow	1668156740	track	medium_term	40	1wAdcYWWPbcqiUcum9brWw
391	the_real_wjdhollow	1668156740	track	medium_term	41	2dy2C0StZ3yiEeb0Aoolcn
392	the_real_wjdhollow	1668156740	track	medium_term	42	3WKrSWltDbNcY5M3haaFxQ
393	the_real_wjdhollow	1668156740	track	medium_term	43	4FF4q2qyOsFhRavZ0bdVXT
394	the_real_wjdhollow	1668156740	track	medium_term	44	1vvBUZseJ7fwYPX1NedOLd
395	the_real_wjdhollow	1668156740	track	medium_term	45	4FeBA1bxkUae1aDsplsmrv
396	the_real_wjdhollow	1668156740	track	medium_term	46	5SWnsxjhdcEDc7LJjq9UHk
397	the_real_wjdhollow	1668156740	track	medium_term	47	643PW82aBMUa1FiWi5VQY7
398	the_real_wjdhollow	1668156740	track	medium_term	48	367HmvU5MpsWZdAJ3QbGlZ
399	the_real_wjdhollow	1668156740	track	medium_term	49	6dLAFNEb2ufM0OjhPpMbFY
400	the_real_wjdhollow	1668156740	track	medium_term	50	05BnyatUof9QNcvTXzdtW4
401	the_real_wjdhollow	1668156740	track	short_term	1	0XLQyCwYu8dhhzWAKSs3wr
402	the_real_wjdhollow	1668156740	track	short_term	2	4Amw1lKBUbmaanUTGzv77U
403	the_real_wjdhollow	1668156740	track	short_term	3	0G88ZH0qqBCBbtrHnEDqrn
404	the_real_wjdhollow	1668156740	track	short_term	4	7lzfMZak2HjNPXXSxksjPB
405	the_real_wjdhollow	1668156740	track	short_term	5	02a8cGumnKuEPgoCzmalJp
406	the_real_wjdhollow	1668156740	track	short_term	6	1EIWddhCtay8sMJeu58lvm
407	the_real_wjdhollow	1668156740	track	short_term	7	1Hn0iEB1FPfJzJPK49qVtH
408	the_real_wjdhollow	1668156740	track	short_term	8	2xmOKduEJr0OwXim7ngrGG
409	the_real_wjdhollow	1668156740	track	short_term	9	4RXnp2ZTi0CyetuM6xTcjg
410	the_real_wjdhollow	1668156740	track	short_term	10	4cy68Rp4tdkCVoo8lj30F5
411	the_real_wjdhollow	1668156740	track	short_term	11	4q8CVsKQcAeNZ3RguQjmTU
412	the_real_wjdhollow	1668156740	track	short_term	12	5B3b5qszWCl22HlzitMh7x
413	the_real_wjdhollow	1668156740	track	short_term	13	7eiI2R22MxDNVLN7S9VqVH
414	the_real_wjdhollow	1668156740	track	short_term	14	7z8F1kHqUvh8jA4hztNeU8
415	the_real_wjdhollow	1668156740	track	short_term	15	0z5oHDjD9vMsck14zoAQOc
416	the_real_wjdhollow	1668156740	track	short_term	16	5DPASDOoVakOcD8EIhb46T
417	the_real_wjdhollow	1668156740	track	short_term	17	6Sm4XdGI7GhHG7sjVcVrI2
418	the_real_wjdhollow	1668156740	track	short_term	18	044fQ35cLbMVwta0KyN5dM
419	the_real_wjdhollow	1668156740	track	short_term	19	2BvDFQOl4JieEGK2cgKOey
420	the_real_wjdhollow	1668156740	track	short_term	20	3QKJELWORZZ7rUZDWeMWSA
421	the_real_wjdhollow	1668156740	track	short_term	21	3zcBNmJH6ToRCI0WNEIuES
422	the_real_wjdhollow	1668156740	track	short_term	22	4nuAslShoN77tq12fzwjUq
423	the_real_wjdhollow	1668156740	track	short_term	23	50c0knPGjaJAuE4hRg28Qq
424	the_real_wjdhollow	1668156740	track	short_term	24	5CFJRZRq6sdKKtRwNPWbYv
425	the_real_wjdhollow	1668156740	track	short_term	25	5JuWx9sV8TbtIMhiiPVbnz
426	the_real_wjdhollow	1668156740	track	short_term	26	5YctcwZCRMxlIHDpTuqKOE
427	the_real_wjdhollow	1668156740	track	short_term	27	6gBFPUFcJLzWGx4lenP6h2
428	the_real_wjdhollow	1668156740	track	short_term	28	6myUpr3GDR80Dg3zqNTmmG
429	the_real_wjdhollow	1668156740	track	short_term	29	6sKopGG4r21ObTE8V6pD6x
430	the_real_wjdhollow	1668156740	track	short_term	30	78BnUN9YVNWCZ3cqPDOpvp
431	the_real_wjdhollow	1668156740	track	short_term	31	78I8jaChZbPu72bIGGPMKk
432	the_real_wjdhollow	1668156740	track	short_term	32	7kdyc52WSOnaYetBSS4mE5
433	the_real_wjdhollow	1668156740	track	short_term	33	5Ikos3uiBfPYAf7EZfz8t3
434	the_real_wjdhollow	1668156740	track	short_term	34	1M1B2Bk0EsaSmgkac8EGZb
435	the_real_wjdhollow	1668156740	track	short_term	35	1x5ihkusmVWsQWtvSCtW9q
436	the_real_wjdhollow	1668156740	track	short_term	36	1xzUQMiCoY5pdego0pHMeV
437	the_real_wjdhollow	1668156740	track	short_term	37	1zkUmmdxUJbMw52fVEjWUN
438	the_real_wjdhollow	1668156740	track	short_term	38	2wL88cvKXUOfHuYVd62hji
439	the_real_wjdhollow	1668156740	track	short_term	39	3Y9wdXMh6sNt9fUwUqTqb7
440	the_real_wjdhollow	1668156740	track	short_term	40	43HM6P2yX7ls3q92qrkhL4
441	the_real_wjdhollow	1668156740	track	short_term	41	6S9lcjREUTU4Yv5y7oMcv2
442	the_real_wjdhollow	1668156740	track	short_term	42	0z1o5L7HJx562xZSATcIpY
443	the_real_wjdhollow	1668156740	track	short_term	43	1O5pf5R8xvppS2pD03HVy5
444	the_real_wjdhollow	1668156740	track	short_term	44	20I1Mickm2w7qGxk7uzOKr
445	the_real_wjdhollow	1668156740	track	short_term	45	4PmJRTntkZRVG6kiVljmlA
446	the_real_wjdhollow	1668156740	track	short_term	46	4mn5HdatHKN7iFGDes9G8i
447	the_real_wjdhollow	1668156740	track	short_term	47	5RfZC411UVifpYPOmzfgyl
448	the_real_wjdhollow	1668156740	track	short_term	48	7cEfPAbju7glmdAgT4e1AU
449	the_real_wjdhollow	1668156740	track	short_term	49	0JL9TZip7mL7iwC5EOkALS
450	the_real_wjdhollow	1668156740	track	short_term	50	0Nkp56EKreoWMYxpXJqUNZ
451	the_real_wjdhollow	1668156998	artist	long_term	1	4hz8tIajF2INpgM0qzPJz2
452	the_real_wjdhollow	1668156998	artist	long_term	2	68kEuyFKyqrdQQLLsmiatm
453	the_real_wjdhollow	1668156998	artist	long_term	3	0EdvGhlC1FkGItLOWQzG4J
454	the_real_wjdhollow	1668156998	artist	long_term	4	1Xyo4u8uXC1ZmMpatF05PJ
455	the_real_wjdhollow	1668156998	artist	long_term	5	6PfSUFtkMVoDkx4MQkzOi3
456	the_real_wjdhollow	1668156998	artist	long_term	6	0fA0VVWsXO9YnASrzqfmYu
457	the_real_wjdhollow	1668156998	artist	long_term	7	5wFXmYsg3KFJ8BDsQudJ4f
458	the_real_wjdhollow	1668156998	artist	long_term	8	0YrtvWJMgSdVrk3SfNjTbx
459	the_real_wjdhollow	1668156998	artist	long_term	9	5IcR3N7QB1j6KBL8eImZ8m
460	the_real_wjdhollow	1668156998	artist	long_term	10	246dkjvS1zLTtiykXe5h60
461	the_real_wjdhollow	1668156998	artist	long_term	11	2ooIqOf4X2uz4mMptXCtie
462	the_real_wjdhollow	1668156998	artist	long_term	12	25uiPmTg16RbhZWAqwLBy5
463	the_real_wjdhollow	1668156998	artist	long_term	13	1hzfo8twXdOegF3xireCYs
464	the_real_wjdhollow	1668156998	artist	long_term	14	4r63FhuTkUYltbVAg5TQnk
465	the_real_wjdhollow	1668156998	artist	long_term	15	26T3LtbuGT1Fu9m0eRq5X3
466	the_real_wjdhollow	1668156998	artist	long_term	16	64KEffDW9EtZ1y2vBYgq8T
467	the_real_wjdhollow	1668156998	artist	long_term	17	4kI8Ie27vjvonwaB2ePh8T
468	the_real_wjdhollow	1668156998	artist	long_term	18	24XtlMhEMNdi822vi0MhY1
469	the_real_wjdhollow	1668156998	artist	long_term	19	3YQKmKGau1PzlVlkL1iodx
470	the_real_wjdhollow	1668156998	artist	long_term	20	1yAwtBaoHLEDWAnWR87hBT
471	the_real_wjdhollow	1668156998	artist	long_term	21	360IAlyVv4PCEVjgyMZrxK
472	the_real_wjdhollow	1668156998	artist	long_term	22	15UsOTVnJzReFVN1VCnxy4
473	the_real_wjdhollow	1668156998	artist	long_term	23	5cj0lLjcoR7YOSnhnX0Po5
474	the_real_wjdhollow	1668156998	artist	long_term	24	1vCWHaC5f2uS3yhpwWbIA6
475	the_real_wjdhollow	1668156998	artist	long_term	25	6qqNVTkY8uBg9cP3Jd7DAH
476	the_real_wjdhollow	1668156998	artist	long_term	26	5yV1qdnmxyIYiSFB02wpDj
477	the_real_wjdhollow	1668156998	artist	long_term	27	41rVuRHYAiH7ltBTHVR9We
478	the_real_wjdhollow	1668156998	artist	long_term	28	13ubrt8QOOCPljQ2FL1Kca
479	the_real_wjdhollow	1668156998	artist	long_term	29	2kGBy2WHvF0VdZyqiVCkDT
480	the_real_wjdhollow	1668156998	artist	long_term	30	0EeQBlQJFiAfJeVN2vT9s0
481	the_real_wjdhollow	1668156998	artist	long_term	31	0jNDKefhfSbLR9sFvcPLHo
482	the_real_wjdhollow	1668156998	artist	long_term	32	18hl4QMrybIXbkGi2BzXcf
483	the_real_wjdhollow	1668156998	artist	long_term	33	0H39MdGGX6dbnnQPt6NQkZ
484	the_real_wjdhollow	1668156998	artist	long_term	34	7boQqq2hUcz9kHcQOecG4j
485	the_real_wjdhollow	1668156998	artist	long_term	35	3XHO7cRUPCLOr6jwp8vsx5
486	the_real_wjdhollow	1668156998	artist	long_term	36	5BvJzeQpmsdsFp4HGUYUEx
487	the_real_wjdhollow	1668156998	artist	long_term	37	0dlDsD7y6ccmDm8tuWCU6F
488	the_real_wjdhollow	1668156998	artist	long_term	38	4MCBfE4596Uoi2O4DtmEMz
489	the_real_wjdhollow	1668156998	artist	long_term	39	2EhUXeszBQRApbBmTOXlKU
490	the_real_wjdhollow	1668156998	artist	long_term	40	4V8LLVI7PbaPR0K2TGSxFF
491	the_real_wjdhollow	1668156998	artist	long_term	41	6eUKZXaKkcviH0Ku9w2n3V
492	the_real_wjdhollow	1668156998	artist	long_term	42	0XSqX2PB3C5dTMv7SZaxSm
493	the_real_wjdhollow	1668156998	artist	long_term	43	30U8fYtiNpeA5KH6H87QUV
494	the_real_wjdhollow	1668156998	artist	long_term	44	3TVXtAsR1Inumwj472S9r4
495	the_real_wjdhollow	1668156998	artist	long_term	45	0SwO7SWeDHJijQ3XNS7xEE
496	the_real_wjdhollow	1668156998	artist	long_term	46	0Y5tJX1MQlPlqiwlOH1tJY
497	the_real_wjdhollow	1668156998	artist	long_term	47	3AA28KZvwAUcZuOKwyblJQ
498	the_real_wjdhollow	1668156998	artist	long_term	48	4LLpKhyESsyAXpc4laK94U
499	the_real_wjdhollow	1668156998	artist	long_term	49	6QRlkjrHz5A62mqeNZz7t3
500	the_real_wjdhollow	1668156998	artist	long_term	50	5r4anprO9Hg9CBlmdkwFdE
\.


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.tracks (track_id, artist_id, album_id, name, popularity) FROM stdin;
1Kjw0LwdniCWran4PxJqPQ	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Kerosene!	56
1I40L32fTSSkBkPeArX9Ul	65dGLGjkw3UbddUg2GKQoZ	68HLpLmCtvFKUqwQpUCqwn	Time Moves Slow	1
5fBjPtOxhgdpU6LNWLyVHv	4lujUKeO6nQAJXpq37Epn7	6wYeJwJU9Y4fuLQVfGyJk9	Mad About You	59
4FE9SgxcOoCNuGnaaU8TXz	6ltzsmQQbmdoHHbLZ4ZN25	2oiJM8vFGpxrtGtFfJWhJv	When the Night is Over	59
4FF4q2qyOsFhRavZ0bdVXT	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	Passenger Seat	49
0qprlw0jfsW4H9cG0FFE0Z	0bzfPKdbXL5ezYW2z3UGQj	0qxsfpy2VU0i4eDR9RTaAU	Cold Little Heart	64
3jp7Ryj1sX3riA7NQaVlLd	3M4ThdJR28z9eSMcQHAZ5G	6R6pjR9ocMYuqSuNx5e4mg	Whistle For The Choir	50
2I88NEWpKrAPZuapXNV5G6	30DhU7BDmF4PH0JVhu8ZRg	2ICdqEf91Kc9FwdlLtB748	Belong to You (feat. 6LACK)	62
6YZQx90VEuzf0lRY9TYh7j	360IAlyVv4PCEVjgyMZrxK	3fUHDbd0oujqAerhHZjdsj	Get You - Recorded at Spotify Studios NYC	46
54b8qPFqYqIndfdxiLApea	34jw2BbxjoYalTp8cJFCPv	56dfEbntfVTMCxjrjggL1e	Alone	74
3sTN90bIP2cJ1783ctHykO	5Q81rlcTFh3k6DQJXPdsot	0NBTBo1qrg554sAj79nEqD	Love$ick (feat. A$AP Rocky)	73
2P3SLxeQHPqh8qKB6gtJY2	2YZyLoL8N0Wb9xBt1NhZWg	3DGQ1iZ9XKUQxAUWjfC34w	Poetic Justice	72
474uVhyGgK5MtY9gMcDgGl	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	It's Called: Freefall	75
16ro1is6DmDKkarlJMBbzV	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	When It Lands	60
4frLb7nWtsz2ymBE6k2GRP	1Xyo4u8uXC1ZmMpatF05PJ	0P3oVJBFOv3TDXlYRhGL7s	Earned It (Fifty Shades Of Grey)	74
2G2YzndIA6jeWFPBXhUjh5	7CyeXFnOrfC1N6z4naIpgo	3vLFWR3fLqfY82WGvaLuyV	Be My Baby	67
5jZ1Z2GFTf2gwmFc3qiUxs	55VydwMyCuGcavwPuhutPL	57d5dFo7oN2yUyGfSKPrRv	The Taste of Ink	66
5vyt44455ipNNVSYq8fYY7	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Fever Pitch	55
1OFKUn2VLafrHj7ybnap0Q	08ct2eZF5lUPdJpHwNKWof	5AYmpTfdv1OoASUJ5rZB7K	Only Wanna Be with You	69
21oJ1K99GBJrE2GVQGVjA0	30DhU7BDmF4PH0JVhu8ZRg	2ICdqEf91Kc9FwdlLtB748	Frozen	61
1LzNfuep1bnAUR9skqdHCK	37w38cCSGgKLdayTRjna4W	5K18gTgac0q6Jma5HkV1vA	Fade Into You	78
748yv6bb3l3CcKS45a6SZ8	4bthk9UfsYUYdcFyqxmSUU	2HyJKdwnnaM156kvcPDwr8	Head Over Heels	68
6NvRxjfYkkT2SpirAlmsjH	4pejUc4iciQfgdX6OKulQn	58HZZpS0wxJKwGjoerg0mk	No One Knows	66
0hJS3EHWC4uL9sJ52ErpoN	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Hide	57
1ZaNp6b4cY3zcrciagi7td	7qKoy46vPnmIxKCN6ewBG4	0xAjncT0noqLbBH6iT4HjH	Cigarette Lighter Love Song - Live	14
1qQSRy9DjrGh3jtsSCU6B1	1eClJfHLoDI4rZe5HxzBFv	7cuwWzS0oiApEt2fpKafkX	Never Tear Us Apart	63
3s8MBOMdUi5Vol77qq8KJJ	2iul6etLF5hjjpxo43rzz7	05kYWbiEVwGcd2Y2wolwWz	Wolf Like Me ft. Shovels & Rope	0
4j3GWI86JvSaF0BLdmgcfF	73sIBHcqh3Z3NyqHKZ7FOL	15k99o4mZJ9mfpQGIOrZ45	Summertime Magic	62
4f8Mh5wuWHOsfXtzjrJB3t	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	I THINK	72
6VojZJpMyuKClbwyilWlQj	3oDbviiivRWhXwIE8hxkVV	2ninxvLuYGCb6H92qTaSFZ	Wouldn't It Be Nice	58
1TDdYSYLIXMJ4EiKO6ZCYk	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Mission to Mars	58
1RbOObDFn7GOseR1w529Zj	6loBF9iQdE11WSX29fNKqY	1V8qUSg1WAHf3dCrVYdJ5Z	Things Can Only Get Better	56
0Hw6SCrtU9pFCjgAONpnGZ	7guDJrEfX3qb6FEbdPA5qi	0qnHA4SDco9mPuWGzDqVDK	Uptight (Everything's Alright)	58
0S29RwGLJutn4qnFJQL13n	0YHgnSkV3S5mvSSCTRWDi5	511e7X2zYDqPWQGADatYz2	Georgia Law Man	44
5SCB7L1alKg7ZEeSw7Sq9f	57bUPid8xztkieZfS7OlEV	7vNmiLEdMqJYUlPxSx2zgg	I Hear A Symphony	49
3aN2V18W3EiW7eg5tHALpF	0X380XXQSNBYuleKzav5UO	4uiVwLbTzE6VMkXpaDAwB8	We're In This Together	56
5hVghJ4KaYES3BFUATCYn0	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	EARFQUAKE	80
6fc51JZVE0Yijdi6RuoLFv	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Painkillers	65
3zJ5RDG0bLQAV2rntFgUtb	0bzfPKdbXL5ezYW2z3UGQj	1yIqauTni1V7l7djYAKSsZ	You Ain't The Problem	53
6iGU74CwXuT4XVepjc9Emf	3oDbviiivRWhXwIE8hxkVV	6GphKx2QAPRoVGWE9D7ou8	God Only Knows - Mono / 1997 Remastered	67
7wdzLe2Gsx1RGqbvYZHASz	2YZyLoL8N0Wb9xBt1NhZWg	51C65YqHrDODM1hD5FEL5x	i	64
3imS277wRbz1CFoDySgTff	5eIbEEQnDM8yuDVB0bimSP	7GpuEZzRrPT4IGiEuWaBzy	Light Me Up	46
3mT1AONeTJDi1k8vH8pA2L	3pkmfqaBNsMqnXus05PNfP	6XBKxM9rbzyOBP6gpE0qhd	I've Been Thinking	0
7Cu2COdH93MnuireuKNiS3	20wkVLutqVOYrc0kxFs7rA	4uP43hIpmEEDuW7aOfiU2C	Streetcar	67
7JmPqImeW3kLoYVNBA9v11	1mFX1QlezK1lNPKQJkhwWb	1bTjSqotSDtUjcwFfukTQP	If It Isn't Love	57
2aCKBrLn7rbhStk5k4FwnF	7guDJrEfX3qb6FEbdPA5qi	6thSjE17RxW8tJFtLyXA3B	I Was Made To Love Her	54
0vJvCnuxXL2BCSRa1ZoeNl	0VbDAlm2KUlKI5UhXRBKWp	5wpZhWqsoXKBcVwvcEtCvv	Electric Feel	0
1zkkvSLk5Nh4uoyKWwuie9	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Holy War	51
62wdQ5CInFr7cjISqrr46f	7KGqvFukcZRbQ7YFsYrgPa	4v9R5sk4HQ0X1krbEis34P	Baby	54
3iVp14VoAsAZkIdgQoRRAb	6PEMFpe3PTOksdV4ZXUpbE	0K3FiXt6ekJTWaUku3LpHL	Livvin	0
63k361zOGEhmvgzBdzzSGP	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Sunshine	61
04M3DsiMNyn8s5XQJrW5sL	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Cold Love	56
5rfT032kGmLvbxZzfHlu5D	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	In the Aeroplane Over the Sea	65
5zzWx7oJ9zBmv76uFaFeYR	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Counting Cards	47
2pA4ip3VIEVcIa3qE02oAX	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	10,000 Emerald Pools	62
1k7aPYyAnNTjVbjw1YDNp1	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Moody Orange	49
41xaZ4WLlKD95U5PknoJrV	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Matchbox	49
33vFhGNZa44VJ0I21AOGYe	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Recktify	45
03v70ZBxmcPX3RWAZMzqaW	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Clouds	61
1RzgWAFlI6KOenjOxJYcH0	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Possum Queen	46
2OeL43EXwaC205Xr1da1qJ	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Polite Company	49
5CU1bbfY1wUPm7fU255Dhf	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	King of Carrot Flowers Pt. 1	60
0dqJjKKxuKD5Dt3QH2n4CG	1MIe1z4RdqLqHSJsb7EBMm	0y3tRiTDYzj5IuQb0Kk86x	Hands Down	55
5C90m8eM6GJR2SACiLAWHo	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Wasted	57
4Fc62OkXYtEOjMmaSyJoQY	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Run	46
244QS6446wyO1UfVTWlOlR	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Maze	48
5L7IgwUPhir2FJftGNXJDW	4hz8tIajF2INpgM0qzPJz2	15RYnRTIMHrCB6X3HjK2mC	Heart	61
35mL8keNDi2VLHrFXZCgJR	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Shameful Company	48
50bmpfgcV29ouRVDfr5wOc	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Lady Lie	59
5IRdIQNIZzVqE4XyBylkvd	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	American Shoes	45
5do7Ql6G8N03fY6G9Y08Ec	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Goodnight Chicago	57
0ZAbupc7jAQpG9IxojQ3s3	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Cocaine Jesus	71
6MDijuuArPJv1vbp7K1x3f	4l1cKWYW591xnwEGxpUg3J	3pWJFrSX6apPzt4inM4zXt	Genghis Khan	60
0b2vqB7QNT4z8nnaYqbuel	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I Don’t Know How I Survive	54
47KDDZgFiX1w6RFOuLXsSn	1fZpYWNWdL5Z3wrDtISFUH	6gtu2oXhmDQN8TAsWimZbj	Tomorrow	67
3LcjZGk0GBlPRe5XhYVGgM	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Caramelo Duro (feat. Kali Uchis)	51
37ZvpHeZKazqOnLfAGm9nb	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	All's Well That Ends	61
0JXXNGljqupsJaZsgSbMZV	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	Sure Thing	80
3banchOoe2giyRK0jaO1c7	0AkmSuTOzM2pNCIOSP8ziv	7kb2GfJGvn8Gr0LCGBSQjZ	Hell and You	56
27AG99NmWMFLRoyZMMPNW2	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	Two-Headed Boy	53
7trx783SvnHhKkmgSSTIFJ	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	First Class	64
7l5j3FapCyr6HxUgoAynM2	3dv4Q4q3LWOnbLJnC6GgTY	5CPwacWmIAaA5DLUq7EHUC	Gap in the Clouds	56
5VA4Ispp52EA1sOqzMz3Av	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	All I Want Is You (feat. J. Cole)	73
7qHoVZ6076OGx18G6W5vQ9	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Bare Bones	48
4hv7GT5g9qNnrxlocsOSYt	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Anointed	40
4PFiLGx8jAzcAJxwPLUeZ9	60df5JBRRPcnSpsIMxxwQm	3YKQkIPHtWGuvkBeVNIMhg	Cigarettes and Coffee	59
1ULovMYbbglXIn9TQzMsKz	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	King of Carrot Flowers Pts. 2 & 3	50
4isk4UYRcmslphcTq61xUg	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	Quickie	54
5WoaF1B5XIEnWfmb5NZikf	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Sky Walker (feat. Travis Scott)	73
7sf0tmuGZlHXUWpi9dQqcw	360IAlyVv4PCEVjgyMZrxK	7ezeSBh9E63ijDAxn8Ke4P	Cadillac	33
5p0bEz7DNsULez2X9yrNGa	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Pepper	52
1dxXQuExRVu77xF1r5YtRF	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Roman Candles	53
3Pu3IChaAoa5EjgUBv5F6x	3JaAGmSTpJK35DqWrDUzBz	3PsFboiPeObjAc6gbQHt54	Ballroom Blitz	65
0wejso6CHHEEqvTD3f3gBz	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Rand McNally	51
23od4rorIdhvYeLL7YqP9n	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Foxglove Through The Clearcut	51
2I3ZdIFXnRn1PSAdMC4w71	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Wheat Like Waves	48
5eKfpH2dQ7FltCqb7LWEGJ	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Alien	45
7Cva2EgJougx6O6M5xgWAq	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Here to Forever	61
7KR5uycb8gfQYRl1MTL8aB	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I Miss Strangers	49
7xjbn0bhs7zx7E1s0lCqT3	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Asphalt Meadows	55
72dIN8F7D5ydB3auSqNi84	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Silence	59
4oB0d8H93GtllDkoHNuLIN	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Mistake	40
0vF9RAGwgYtfO1Aajwb7et	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Moth	44
10fiZCExnOMqElSX952WZI	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	Lead, SD	38
1AR58rtcLziNnRHTCmCywd	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I’ll Never Give Up On You	47
3Cx9j78Z0NE6jYwBWvvV3P	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	Waiting For My Ruca	54
3EytfC22ikoXM921cJbejn	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Gold	54
3s5N94NsDYcOqgi7cSakv6	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Wolf	39
4J6JARDGkdc1fqLEflP94Z	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Fragments From the Decade	47
4ZTl5GUAmO49b2cf6jovqx	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Grocery	39
5avF5IwDg2v1QCxPvX9Fru	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Parts	37
4TIJ7zSBNejpoIPaWpWRKc	7lzordPuZEXxwt9aoVZYmG	2FZNWUmgRoP8uJZBaHJdfj	Rebel Yell	73
56KqaFSGTb7ifpt16t5Y1N	3RGLhK1IP9jnYFH4BRFJBS	1ZH5g1RDq3GY1OvyD0w0s2	Rock the Casbah - Remastered	71
21YxK0klhpfLW8budkJaMF	33EUXrFKGjpUSGacqEHhU4	2jnV6ytZOmt71iEC5xHEYz	Lust For Life	65
29iwiYD3KVWBKxe31nGjEL	2CVBumuL5KyztqCyo7CETY	02OIGj20Ltaa8rN8mKsHBT	Jet Boy Jet Girl	37
3YZa4IzxK2UtEKTvdTgsi8	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Suffragette City - 2012 Remaster	61
5El6bpLd8nYPsvWgZLdHio	5aBEGOeWQCJfptic9xyaAb	440zYLMcBZhHc93WSGKDKo	Go! - Club Mix	41
7xENAAODeE2hKzdWFI6YaB	0fA0VVWsXO9YnASrzqfmYu	4aW4iDepQUl5ZCHd1Gli68	Entergalactic Theme	63
0WQiDwKJclirSYG9v5tayI	3yY2gUcIsjMr8hjo51PoJ8	5Y0p2XCgRRIjna91aQE8q7	There Is a Light That Never Goes Out - 2011 Remaster	79
0ncGfTV06HogJIgn2Ujjgb	4wYk01oPJNfaEssVFL46oQ	2K2u7usRIF03pywk6qxGlM	Waterfalls	40
14z3RzUHeZQgtpOlSYvmZD	0Zy4ncr8h1jd7Nzr9946fD	2qcwXvluk9iFwNNg4eDBXm	Love Like Blood	48
0VjIjW4GlUZAMYd2vXMi3b	1Xyo4u8uXC1ZmMpatF05PJ	4yP0hdKOZPNshxUOjY0cZj	Blinding Lights	90
1cKHdTo9u0ZymJdPGSh6nq	1Xyo4u8uXC1ZmMpatF05PJ	4qZBW3f2Q8y0k1A84d4iAO	I Was Never There	89
7MXVkk9YMctZqd1Srtv4MB	1Xyo4u8uXC1ZmMpatF05PJ	2ODvWsOgouMbaA5xf0RkJe	Starboy	89
09mEdoA6zrmBPgTEN5qXmN	1Xyo4u8uXC1ZmMpatF05PJ	4qZBW3f2Q8y0k1A84d4iAO	Call Out My Name	88
5QO79kh1waicV47BqGRL3g	1Xyo4u8uXC1ZmMpatF05PJ	4yP0hdKOZPNshxUOjY0cZj	Save Your Tears	88
2LBqCSwhJGcFQeTHMVGwy3	1Xyo4u8uXC1ZmMpatF05PJ	4AdZV63ycxFLF6Hcol0QnB	Die For You	86
7fBv7CLKzipRk6EC6TWHOB	1Xyo4u8uXC1ZmMpatF05PJ	0P3oVJBFOv3TDXlYRhGL7s	The Hills	86
2vXKRlJBXyOcvZYTdNeckS	3hteYQFiMFbJY7wS0xDymP	0JA38Ekhsv43y2lBj5GQkQ	Lost in the Fire (feat. The Weeknd)	84
5gDWsRxpJ2lZAffh5p7K0w	1Xyo4u8uXC1ZmMpatF05PJ	4AdZV63ycxFLF6Hcol0QnB	Stargirl Interlude	82
1oFAF1hdPOickyHgbuRjyX	1Xyo4u8uXC1ZmMpatF05PJ	4ZyeHIgdujClXSjC2cSqSb	Save Your Tears (Remix) (with Ariana Grande) - Bonus Track	81
1wtOxkiel43cVs0Yux5Q4h	06HL4z0CvFAxyc27GXpf02	151w1FgRZfnKZA9FEcg9Z3	Snow On The Beach (feat. Lana Del Rey)	91
1Ist6PR2BZR3n2z2Y5R6S1	00FQb4jTyendYWaN8pK0wa	0Dt3FbpMQwjoT5KNAw0IXR	Summertime Sadness	74
2nMeu6UenVvwUktBCpLMK9	00FQb4jTyendYWaN8pK0wa	1D92WOHWUI2AGQCCdplcXL	Young And Beautiful	82
0Oqc0kKFsQ6MhFOLBNZIGX	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Doin' Time	81
1NZs6n6hl8UuMaX0UC0YTz	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	Brooklyn Baby	81
5Y6nVaayzitvsD5F7nr3DV	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	West Coast	80
3lG6OtGDsYAOALxEmubQQm	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Happiness is a butterfly	77
2mdEsXPu8ZmkHRRtAdC09e	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Cinnamon Girl	76
1KuVEZR4xuQVNr1KkanAV4	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	The Other Woman	76
3RIgHHpnFKj5Rni1shokDj	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Norman fucking Rockwell	76
1eUGmzzvahJjOSWgDHuRlv	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	Girl With The Tattoo Enter.lewd	78
22pjmqZq2oTZtEThEt66Zn	5fMUXHkw8R8eOP2RNVYEZX	5pdR4YX2zWMXotdF034UYY	Don't Forget My Love	63
25cUhiAod71TIQSNicOaW3	360IAlyVv4PCEVjgyMZrxK	21XMv0TCsnhWPt7MNVvkzD	Adorn	68
1m8WpLYXEiNVZchsWEcCSy	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Come Through and Chill (feat. J. Cole & Salaam Remi)	68
3lB0GMiI5KxDbTOG8V3bOx	360IAlyVv4PCEVjgyMZrxK	4sJXyIfwduIWFISb4iCq2f	waves - Tame Impala Remix	65
6xTU6B6nFwKKTSZ9ySXS80	23fqKkggKUBHNkbKtXEls4	47oyrKaeobswT4T8zyaxdM	Remind Me to Forget	61
5ctk3VJoHoURSiwkCJn2bf	360IAlyVv4PCEVjgyMZrxK	21XMv0TCsnhWPt7MNVvkzD	How Many Drinks?	64
0HsGh7cboYz6cVMIyFrQ8j	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Devil Like Me	66
6vyFAHVKIsp3pdyhlOKMAz	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	All That and More (Sailboat)	62
1wQhpsuVJFxrvESjqUvlkt	4hz8tIajF2INpgM0qzPJz2	1YBO4zKTVcNxP1VREsBc3h	Work Out	60
7KA4W4McWYRpgf0fWsJZWB	4V8LLVI7PbaPR0K2TGSxFF	2nkto6YNI4rUYTLqEwWJ3o	See You Again (feat. Kali Uchis)	84
0fv2KH6hac06J86hBUTcSf	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	NEW MAGIC WAND	82
5TxRUOsGeWeRl3xOML59Ai	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	ARE WE STILL FRIENDS?	80
3jHdKaLCkuNEkWcLVmQPCX	4V8LLVI7PbaPR0K2TGSxFF	5iUwaD3wFVwfaAfs9Z0eCh	BEST INTEREST	79
3S68RFe1lsdCdTMPIMJM3X	2RdwBSPQiwcmiDo9kixcl8	4YV8SurDnk8sctOOZzYtbH	Cash In Cash Out	78
1hz7SRTGUNAtIQ46qiNv2p	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	GONE, GONE / THANK YOU	77
5B0kgjHULYJhAQkK5XsMoC	4V8LLVI7PbaPR0K2TGSxFF	45ba6QAtNrdv6Ke4MFOKk9	WUSYANAME (feat. Youngboy Never Broke Again & Ty Dolla $ign)	76
3EG9FJ0ToLfgnc1IG2Z1wz	4V8LLVI7PbaPR0K2TGSxFF	45ba6QAtNrdv6Ke4MFOKk9	SWEET / I THOUGHT YOU WANTED TO DANCE (feat. Brent Faiyaz & Fana Hues)	75
0SA0mMXWh23raZ6xzOCU2V	4V8LLVI7PbaPR0K2TGSxFF	5dbCm8qaCdWnNdVyi3urUO	She	74
2a5qaGUrVHWAIrh0xmTADM	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	neve give up	53
3x8IsQzb1KhPPo6zNGzzL1	4lujUKeO6nQAJXpq37Epn7	2jGQieA1EggldcxFAiQHjJ	Lay Down	51
6GXbpne1EKdVlYhFazWFs4	4lujUKeO6nQAJXpq37Epn7	6wYeJwJU9Y4fuLQVfGyJk9	O Me O My	51
3mslSmibP6M7u9RQEOZ2Zh	4lujUKeO6nQAJXpq37Epn7	014KjVEwCWxN2hWFYsUWNB	bend yr ear	51
6E39NM14yu6A6uFjuiQfZt	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	belladonna	48
7e1DF2fp2NP2zHlEClZP2z	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	bbbaby	48
6J4et4u2ECB9AH2QC9B5tg	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	hey rose	46
4SMHL36a0GQKh8ZuE33cby	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	about her. again.	46
2YSgnpegXNXgk8UxgG8znT	4kI8Ie27vjvonwaB2ePh8T	4VzzEviJGYUtAeSsJlI9QB	Number One (feat. Richie Havens & Son Little)	42
7KX65PC1UZuImsUInThbav	0bzfPKdbXL5ezYW2z3UGQj	55A6d8TOuiAs6zDiKj2c3A	Cold Little Heart - Radio Edit	69
46EuzanXhKwIc7755wLAvS	0bzfPKdbXL5ezYW2z3UGQj	79VDAdjzMMGoftIbw5feYN	Home Again	52
7oOEFDLSQscl0uGulnIEmG	0bzfPKdbXL5ezYW2z3UGQj	0qxsfpy2VU0i4eDR9RTaAU	Love & Hate	63
0f2zcrhhHT59aIGQvRlTZ1	0bzfPKdbXL5ezYW2z3UGQj	0qxsfpy2VU0i4eDR9RTaAU	One More Night	60
1WS1Q9G8vj0gPN2aOkZ80A	2dBj3prW7gP9bCCOIQeDUf	0rEbmIQjHTKzKraH4UqiDy	Aquamarine (feat. Michael Kiwanuka)	56
2LUTN2pDXUplYlc7WjE1Mm	0bzfPKdbXL5ezYW2z3UGQj	5qmEF78Uq9CjwIgvKQe7WG	Money (with Tom Misch)	55
5j5RHCFkS5TFLbQRUJ65HH	0bzfPKdbXL5ezYW2z3UGQj	0QJHIPjOnmwYuduAcNaQ5m	Beautiful Life - Edit	54
3aLq93pLZHx25jcFhfbEee	0bzfPKdbXL5ezYW2z3UGQj	1yIqauTni1V7l7djYAKSsZ	Solid Ground	54
7qcXUzPwoxSBFxjTbNrV0B	5wFXmYsg3KFJ8BDsQudJ4f	5pCfjopxazLdvmLae6My9w	The Gold - Phoebe Bridgers Version	72
4G9aoDV0KAsAYqTEKY53BF	5wFXmYsg3KFJ8BDsQudJ4f	3mD3TH55C4q6H5ObfJw4w6	I Know How To Speak	54
2i8fcnTT5iItxMNwa8mfr3	5wFXmYsg3KFJ8BDsQudJ4f	3GJ7F5BNIZjY5fhiu8ui4B	Telepath	53
5P4zryS2epwU5j5fkmwO8Z	0oL26Dn9y761yfJgNb3vfu	4gFsfMVkEduaEMfQIlNEqn	In My Head	52
5S67wnJOMjuySVEu4ssCof	0e9H8oaYYRCKFXOVv848nt	1RHlOUoinOK5WZconLM6lp	Forest Whitaker	50
5qVVPptGHVCPMci6NCbLCq	5wFXmYsg3KFJ8BDsQudJ4f	0QgLeJOCYZN6V9kUTlgNHu	The Gold - Nick Waterhouse Remix	48
1fOc4Kf82a6J1C9gS5sE0d	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Changes	61
0PbOwOT7vjiO0NiI8D31XH	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	Heart of Gold	60
7a5xvCgoD8qFEQmO8Jjvtf	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	The World (Is Going Up in Flames)	60
0LHm5xYhzH6ZfmTVJ6LWpR	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	No Time for Dreaming	57
4ml0940tmn92PzmkSb2lwU	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	Stay Away	56
6ZWDOwh9OO57DaO0ROHIHO	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Good to Be Back Home	53
2aWr9QRr0pSmYFH04zngiP	462T0buQ5ScBUQCRpodDRf	3rimYQyKq7BatxuUoPIBrb	Strictly Reserved for You	50
3F4WWA3JqsX2VmvqHywxEA	462T0buQ5ScBUQCRpodDRf	3rimYQyKq7BatxuUoPIBrb	Where Do We Go From Here	50
2dDR1wNf50GYrWohFnS3Pv	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	How Long	50
5nMZwcaQcQCONoiHmov5YT	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Nobody But You	48
3kZC0ZmFWrEHdUCmUqlvgZ	0YrtvWJMgSdVrk3SfNjTbx	1NFGnxmeIEBakre4DvLaJq	I Will Follow You into the Dark	65
5yc59J3MR3tVDPTOgwgRI5	0YrtvWJMgSdVrk3SfNjTbx	1NFGnxmeIEBakre4DvLaJq	Soul Meets Body	60
6LNwTodkmxsc2dKRJWQr6y	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	A Lack of Color	57
0PTYTZvNNtlvdOwWRYrbfC	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	The Sound of Settling	56
0DoACS30GwIY6qaFjCMMUz	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	Transatlanticism	55
0hgEsoAu23ap8V5GFX9Y3i	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	Title and Registration	55
1crbFuCkGL4kXnAGd63RXq	0YrtvWJMgSdVrk3SfNjTbx	1NFGnxmeIEBakre4DvLaJq	Crooked Teeth	55
6p8ZhmQS4fia0j93S2M3Fj	0YrtvWJMgSdVrk3SfNjTbx	3stEKyV4hKU1G5yXtmDOaN	Waterfalls	54
0QZ5yyl6B6utIWkxeBDxQN	6ltzsmQQbmdoHHbLZ4ZN25	3yoNZlqerJnsnMN5EDwwBS	The Night We Met	78
4yyg2J2uXOjCtCyT64984C	6ltzsmQQbmdoHHbLZ4ZN25	2ZDjruwuzzzT8JMJRXvLtl	Ends of the Earth	68
5JVlz4JCy3cv8pZB12sKJL	6ltzsmQQbmdoHHbLZ4ZN25	3HHHK8lGDgB9wwGXd0za9o	The Night We Met (feat. Phoebe Bridgers)	56
1bqrRn1pJWowNLA5N9L6uW	6ltzsmQQbmdoHHbLZ4ZN25	3yoNZlqerJnsnMN5EDwwBS	Meet Me in the Woods	63
7xQg5QTx8eiQnsxEnfynPh	6ltzsmQQbmdoHHbLZ4ZN25	5xiePX6kXj5ZsmUsqIqzeD	I Lied (with Allison Ponthier)	62
6gdCb962lq0Xdg7ypVLuLt	6ltzsmQQbmdoHHbLZ4ZN25	3oTpxylhyTiGLaZ8IRjJQB	Harvest Moon - Recorded at Spotify Studios NYC	59
0zCckv4tx3KzJ5GGTRbbLf	6ltzsmQQbmdoHHbLZ4ZN25	2ZDjruwuzzzT8JMJRXvLtl	She Lit a Fire	58
0JfpIwZfcRwDzD6GRYzfKN	6ltzsmQQbmdoHHbLZ4ZN25	5xiePX6kXj5ZsmUsqIqzeD	Love Me Like You Used To	58
4UGoW08gaqIEWNTam1UNen	6ltzsmQQbmdoHHbLZ4ZN25	3yoNZlqerJnsnMN5EDwwBS	Love Like Ghosts	57
02VBYrHfVwfEWXk5DXyf0T	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Leave The Door Open	83
3xVZYkcuWalGudeKl861wb	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Smokin Out The Window	78
1l4iQsOZ5sOXZPMQLvouaB	5p7f24Rk5HkUZsaS3BLG5F	0152qvGv0mmX2vU36Rocng	Coast (feat. Anderson .Paak)	77
7jvCeWOSnJs2N3spqobWnO	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Skate	72
3MlQPB0wJuopo3NTZGlMpI	6PEMFpe3PTOksdV4ZXUpbE	1o8zUe3QYHV42SHSsg6ffu	Where I Go (feat. H.E.R.)	71
3jiKUMXqwEodB7gVv1RMZU	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	After Last Night (with Thundercat & Bootsy Collins)	69
3a6FcTyvSf0ED3VXeH3PJ5	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Fly As Me	65
2JUQ7mV1AHk2owXLydmN4Z	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Love's Train	60
2K6vUau7bnZUamjbRSOOvJ	0du5cEVh5yTK9QJze8zA0C	4VZ7jhV0wHpoNPCB7Vmiml	777	65
276zciJ7Fg7Jk6Ta6QuLkp	3jK9MiCrA42lLAdMGUZpwa	4VFG1DOuTeDMBjBLZT7hCK	Come Down	63
3hhbDnFUb2bicI2df6VurK	3qnGvpP8Yth1AqSBMqON5x	21KIagsx1ZvYcv0sVkEAWv	River	73
24ntSW3QVJzR79lHAAOTaY	2mVVjNmdjXZZDvhgQWiakk	4HFO9PDRxsdbcegkcNhxgz	Texas Sun	72
3V0nnQhqvbE3JmiDdnzQFQ	55fhWPvDiMpLnE4ZzNXZyW	3tRmxSQyoyXXwcVDcUFQic	July (feat. Leon Bridges)	72
1Omt5bfz1tZUCqd26HxbS0	3qnGvpP8Yth1AqSBMqON5x	7J9fifadXb0PPSBWXctbi8	Beyond	72
65GbQI9VDTs7vo6MJL2iJA	3qnGvpP8Yth1AqSBMqON5x	21KIagsx1ZvYcv0sVkEAWv	Coming Home	68
3dvXRk7TZ929m21p49RR5P	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	Mariella	66
2DccHqTquzubziHAPZRdct	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	B-Side	65
1EUOby36hEzSkTVVKRAWQP	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	Chocolate Hills	62
7FxzgizJRGTQ3fxUqfvljg	3qnGvpP8Yth1AqSBMqON5x	7J9fifadXb0PPSBWXctbi8	Bad Bad News	62
7pnVHbcqbmP7LA1ey3ydvu	2mVVjNmdjXZZDvhgQWiakk	4HFO9PDRxsdbcegkcNhxgz	Midnight	62
3zBhihYUHBmGd2bcQIobrF	60df5JBRRPcnSpsIMxxwQm	03HMOcANauhLD0WNrMkmLU	(Sittin' On) the Dock of the Bay	75
1aj4GXfmEYXfdVZohCpNKu	60df5JBRRPcnSpsIMxxwQm	2BFOk5b8jjm2xmsbx7qXq3	Stand by Me	67
7FXuCkl1kfxwS5icDjTwbM	60df5JBRRPcnSpsIMxxwQm	3mdKPgJ2hyDF9ToznWuCn1	Hard to Handle	63
4skknrc3sJqaPTtUr2cwFq	60df5JBRRPcnSpsIMxxwQm	2BFOk5b8jjm2xmsbx7qXq3	These Arms of Mine	63
36AlMHDBFwSsD3FQOy1R81	60df5JBRRPcnSpsIMxxwQm	25uNcuL4dAoV62eKmr8Q0Y	Try a Little Tenderness	63
5zQyqgNXKzhifkivumzxDS	60df5JBRRPcnSpsIMxxwQm	68BCjMsHX4Gf11BJSkjwGz	My Girl	60
4pdLyulbYLCrPmDzWWeJIZ	60df5JBRRPcnSpsIMxxwQm	68BCjMsHX4Gf11BJSkjwGz	I've Been Loving You Too Long	59
16dz1n3ctolQbuZPtvHVqH	60df5JBRRPcnSpsIMxxwQm	5K3FfkoIozJuEOhiwOm5SR	Love Man	57
3p6keDkfLYYpuAdvv1Ktsh	60df5JBRRPcnSpsIMxxwQm	5YYP98SsNmRZ8CgoFKifSz	That's How Strong My Love Is	55
7ycWLEP1GsNjVvcjawXz3z	13ubrt8QOOCPljQ2FL1Kca	3MATDdrpHmQCmuOcozZjDa	Praise The Lord (Da Shine) (feat. Skepta)	81
2aPTvyE09vUCRwVvj0I8WK	13ubrt8QOOCPljQ2FL1Kca	3AlyvIIMZyT5LjWFeK5LSl	Sundress	77
2N3U8uTYhjX2KwGT0pf5x0	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Everyday (feat. Rod Stewart, Miguel & Mark Ronson)	76
4X5f3vT8MRuXF68pfjNte5	13ubrt8QOOCPljQ2FL1Kca	6rzMufuu8sLkIizM4q9c7J	F**kin' Problems (feat. Drake, 2 Chainz & Kendrick Lamar)	75
7zjEyeBsaw9gV0jofJLfOM	50co4Is1HCEo8bhOyUWKpn	7IKkHmEk4It4cRdOYanyvW	Livin It Up (with Post Malone & A$AP Rocky)	73
4S7YHmlWwfwArgd8LfSPud	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	L$D	73
1jzIJcHCXneHw7ojC6LXiF	4V8LLVI7PbaPR0K2TGSxFF	02KFVEA5tnY0YnypmWY1tz	Potato Salad	71
2gAGWaK4wvt2xrFUlR4mK8	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Jukebox Joints (feat. Joe Fox & Kanye West)	71
1j6kDJttn6wbVyMaM42Nxm	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Lord Pretty Flacko Jodye 2 (LPFJ2)	70
1AqemxWsT0iGg5Lvkm16Bt	13ubrt8QOOCPljQ2FL1Kca	3MATDdrpHmQCmuOcozZjDa	Fukk Sleep (feat. FKA twigs)	68
7KXjTSCq5nL1LoYtL7XAwS	2YZyLoL8N0Wb9xBt1NhZWg	4eLPsYPBmXABThSJ821sqY	HUMBLE.	83
3GCdLUSnKSMJhs4Tj6CV3s	2YZyLoL8N0Wb9xBt1NhZWg	3pLdWdkj83EYfDN6H2N8MR	All The Stars (with SZA)	82
0fX4oNGBWO3dSGUZcVdVV2	2YZyLoL8N0Wb9xBt1NhZWg	79ONNoS4M9tfIA1mYLBYVX	N95	82
6PGoSes0D9eUDeeAafB2As	2YZyLoL8N0Wb9xBt1NhZWg	4eLPsYPBmXABThSJ821sqY	LOVE. FEAT. ZACARI.	82
2g6tReTlM2Akp41g0HaeXN	2YZyLoL8N0Wb9xBt1NhZWg	79ONNoS4M9tfIA1mYLBYVX	Die Hard	80
6IZvVAP7VPPnsGX6bvgkqg	2YZyLoL8N0Wb9xBt1NhZWg	4eLPsYPBmXABThSJ821sqY	PRIDE.	80
2HbKqm4o0w5wEeEFXm2sD4	2YZyLoL8N0Wb9xBt1NhZWg	6PBZN8cbwkqm1ERj2BGXJ1	Money Trees	79
3iVcZ5G6tvkXZkZKlMpIUs	2YZyLoL8N0Wb9xBt1NhZWg	7ycBtnsMtyVbbwTfJwRjSP	Alright	79
6HZILIRieu8S0iqY8kIKhj	2YZyLoL8N0Wb9xBt1NhZWg	4eLPsYPBmXABThSJ821sqY	DNA.	79
3QFInJAm9eyaho5vBzxInN	5SXuuuRpukkTvsLuUknva1	3r46DPIQeBQbjvjjV5mXGg	family ties (with Kendrick Lamar)	78
0P2vjYoUjjHBeYArlQtRmf	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Floating Features	51
60JTA6msKu6uFlpvK8Tynn	6QRlkjrHz5A62mqeNZz7t3	3B2xgIcoHjm1HdHYDydoUu	Sure As Spring	44
1ZUTRq6PQhYfHJk3qeP7FR	6QRlkjrHz5A62mqeNZz7t3	1b42c8tkc0fLhiLprU1jiX	I Can't Speak	39
3Gb1M4i5UlDauEnaLJF2HT	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	Watching Cartoons	37
3AIt9LB3C7Jz99OnvVjbyv	6QRlkjrHz5A62mqeNZz7t3	1kSTHq1yseNNxYpM48o3ry	Endless Afternoon	36
4viHP6kRmImqmVGQjE8sks	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Don't Leave Me on the Earth	36
20OiuevLsmNprmh6wZKljU	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	The Pines	35
2kkJY0ENKaDX5Np8fjyYLM	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Loose Teeth	35
0J0UZpA2Ivp4qaXe3QzCrT	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	In the Country	34
1uSkFxzLIEtObyJtROqbnl	6QRlkjrHz5A62mqeNZz7t3	3B2xgIcoHjm1HdHYDydoUu	Call Me in the Day	34
0xFiDbmCNEcs8TE9hToHpa	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	For DOOM	44
0V6QNE31BWyMuiKlvDRnE9	5CuU6SRJjbbZL926nSGGxX	1VDnqZVFSg0xVF104kaIix	(How Could Anybody) Feel at Home	43
41t7RkFBjaEFoGvr29QhYL	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	79th and Stony Island	42
7fjLBPTsQrbkV2WRedi2bw	5CuU6SRJjbbZL926nSGGxX	7BlWNRjwKnLrf7yf0VdSvg	Ziggy Starfish (Anxiety Raps) [feat. Gold Panda]	41
1pHKJodnA1bOXyWj981Tmx	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	I'll Fight You	39
08rUqqyHYLORJvK6pqiUOM	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	CD Only Bonus Track	36
46lQe6895zxB3HRP6YPbnl	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	Multi-Game Arcade Cabinet	36
36iXvmiL3tsJX0QfhVZkhb	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	The Song with the Secret Name	36
4eJpFVLqB3SVzciiTdK82L	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	Circuit City	36
09u4JUpXt3LrZmqnW92GSk	5CuU6SRJjbbZL926nSGGxX	7qlmxswkArGiRuCJtuW7sz	Microfiche	35
1WBSFlSLyOZnSa8fj7a5yC	6pmxr66tMAePxzOLfjGNcX	71udkw2yxFqNK4SNSYcCce	Nantes	61
7H0UxIN751StFi2tznmHlg	6pmxr66tMAePxzOLfjGNcX	4yP7cyoeE3F6EyJPZ9v47V	Postcards from Italy	57
5loVmc3MmtYGsTw12eDgcU	6pmxr66tMAePxzOLfjGNcX	26G7PfSLTyLiIcITVl7GAK	Elephant Gun	56
2bxQP85JNU11CQV4KXCnau	6pmxr66tMAePxzOLfjGNcX	7HYptJX2aQJPWbxXviXLwQ	Santa Fe	55
1dD6UAnqCJotTyU1bhCnDQ	6pmxr66tMAePxzOLfjGNcX	6iAOkTDFRiWHVNNUjBqIxT	No No No	52
1xRzpBiy7nmgP0oVmnseNF	6pmxr66tMAePxzOLfjGNcX	6iAOkTDFRiWHVNNUjBqIxT	Perth	51
3XHtGQBlfMHfKcXdTX7Mt0	6pmxr66tMAePxzOLfjGNcX	26G7PfSLTyLiIcITVl7GAK	Fisher Island Sound	50
56llQt0PCV67SUpmOTBLDs	6pmxr66tMAePxzOLfjGNcX	6iAOkTDFRiWHVNNUjBqIxT	Gibraltar	49
13NiyfKg0aELrTWvgVL7eH	6pmxr66tMAePxzOLfjGNcX	26G7PfSLTyLiIcITVl7GAK	Fyodor Dormant	44
3rWZv4pUVvPkQLYm3ItGDv	6pmxr66tMAePxzOLfjGNcX	45RV070mrplPB5gMO6Q136	Gallipoli	47
3n69hLUdIsSa1WlRmjMZlW	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Breezeblocks	71
4iEOVEULZRvmzYSZY2ViKN	3XHO7cRUPCLOr6jwp8vsx5	4oktVvRuO1In9B7Hz0xm0a	Left Hand Free	66
4tmwiN9YU7xMjh2hoqcVuI	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Taro	54
7DdXf9x75iEVCHWfoRwRuR	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Fitzpleasure	58
3xqxETvPg43KWP0HOGiOmu	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Something Good	55
3aA5fk4c6a7e5HM4rJqkSF	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Matilda	51
1o22EcqsCANhwYdaNOSdwS	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Tessellate	56
3i4ColsuZEvjeLz63m0jPt	3XHO7cRUPCLOr6jwp8vsx5	5ogYKSRRlVAgMzv09HFeIn	U&ME	54
6neF3KiuooS7xcTtj18PRL	1Tp7C6LzxZe9Mix6rn4zbI	4Tg1YeHrSMEUVsGiYfkSm3	Surefire - Gus alt-j Remix	56
0pCTr2E9CtulIwNprituKi	3XHO7cRUPCLOr6jwp8vsx5	6k3vC8nep1BfqAIJ81L6OL	Ms	55
4iJyoBOLtHqaGxP12qzhQI	1uNFoZAHBGtllmzznpCI3s	5dGWwsZ9iB2Xc3UKR0gif2	Peaches (feat. Daniel Caesar & Giveon)	84
7zFXmv6vqI4qOt4yGf3jYZ	20wkVLutqVOYrc0kxFs7rA	3xybjP7r2VsWzwvDQipdM0	Get You (feat. Kali Uchis)	79
1RMJOxR6GRPsBHL8qeC2ux	20wkVLutqVOYrc0kxFs7rA	3xybjP7r2VsWzwvDQipdM0	Best Part (feat. H.E.R.)	79
1boXOL0ua7N2iCOUVI1p9F	20wkVLutqVOYrc0kxFs7rA	5qfhZ5YkZ4LhEUbYgjrWt6	Japanese Denim	77
3uouaAVXpQR3X8RYkJyitQ	20wkVLutqVOYrc0kxFs7rA	4mvxoogQn8p84Wz17zTHnJ	CYANIDE	71
7jhxagwOk9y1HC5ciRfmkQ	5FxD8fkQZ6KcsSYupDVoSO	5z7TD11Qh81Gbf52hd5zAv	Invincible (feat. Daniel Caesar)	69
5uXO1sjZ7VbNKexKaFRna3	20wkVLutqVOYrc0kxFs7rA	2kdNEYAPZlAoMaIzYQWM8U	Please Do Not Lean (feat. BADBADNOTGOOD)	68
23c9gmiiv7RCu7twft0Mym	20wkVLutqVOYrc0kxFs7rA	15M9pZ8gsdoN67yLjyQ039	Who Hurt You?	68
59acp1OhcvxwVBwQJBYKuX	20wkVLutqVOYrc0kxFs7rA	3xybjP7r2VsWzwvDQipdM0	Loose	66
6d4FWjx72iuRWzn1HwywLK	6eU0jV2eEZ8XTM7EmlguK6	4KJGypBUe7ANibtri1msUe	Colors	65
2LTah3NcoIJI9WHJW3VIlC	6eU0jV2eEZ8XTM7EmlguK6	4KJGypBUe7ANibtri1msUe	Black Moon Rising	53
4j5x8nURU1SNMFvVxcJj65	6eU0jV2eEZ8XTM7EmlguK6	4KJGypBUe7ANibtri1msUe	Fire	53
03Yo5FRYVfTB2EuiyOmHLe	6eU0jV2eEZ8XTM7EmlguK6	4KJGypBUe7ANibtri1msUe	Know You Better	50
25yl3A22f7gtJ5p5jfpuNn	6eU0jV2eEZ8XTM7EmlguK6	2opeT2znafgBMJS9q3nlwg	OCT 33 - A COLORS SHOW	50
6Vjch0N0MK9NZ5piuLZHv1	6eU0jV2eEZ8XTM7EmlguK6	71iDfOWbiVriNL3FnD6fFJ	Fast Car	38
7GatRcyMDn5qX61851iS6i	6eU0jV2eEZ8XTM7EmlguK6	4KJGypBUe7ANibtri1msUe	Touch The Sky	48
6bZ9xnCsvwUacb29fbJ4xc	6eU0jV2eEZ8XTM7EmlguK6	7BEA5emJl0yTMC9XBDJCcm	Colors - Live In Studio	46
6fGZAk8pyUwKw7E1Eoepkz	6eU0jV2eEZ8XTM7EmlguK6	7BEA5emJl0yTMC9XBDJCcm	Ain't No Love In The Heart of The City	46
4YKSJHezbvr4e0026rz8Zo	6eU0jV2eEZ8XTM7EmlguK6	4KJGypBUe7ANibtri1msUe	OCT 33	45
3xKsf9qdS1CyvXSMEid6g8	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Pink + White	84
3GZD6HmiNUhxXYf8Gch723	2h93pZq0e7k5yf4dywlkpM	392p3shh2jkxUxY2VHvlH8	Lost	84
4osgfFTICMkcGbbigdsa53	2h93pZq0e7k5yf4dywlkpM	3RYdEXhGHojkTILUdtnRVJ	Novacane	80
2ZWlPOoWh0626oTaHrnl2a	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Ivy	80
7eqoqGkKwgOaWNNHx90uEZ	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Nights	78
4S4Mfvv03M1cHgIOJcbUCL	2h93pZq0e7k5yf4dywlkpM	71VX8yv9T2hNIYVZJVUWVp	In My Room	78
6Nle9hKrkL1wQpwNfEkxjh	2h93pZq0e7k5yf4dywlkpM	6OGzmhzHcjf0uN9j7dYvZH	Chanel	77
2LMkwUfqC6S6s6qDVlEuzV	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	White Ferrari	77
7DfFc7a6Rwfi3YQMRbDMau	2h93pZq0e7k5yf4dywlkpM	392p3shh2jkxUxY2VHvlH8	Thinkin Bout You	77
5GUYJTQap5F3RDQiCOJhrS	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Self Control	75
3vvnpqqg7Jbi2c2aOn6GHt	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Everything's Sweet	55
7zJHwxabKK5TqW7xrKEC73	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Are You Coming with Me?	51
4s8uPDOuyjoO6Rmn7Armjc	1zXCFUgH6FWS0iCiCKsH55	3XQya9tCptDZRNFU90qBiL	Euphoria	45
1G9pU58ocxSyaBTOfDE15F	1zXCFUgH6FWS0iCiCKsH55	4jWRGEF8uP4vadXsot9SwK	Drowning in the XXX	45
1dc7H76rkWGymUigYxQ4hp	1zXCFUgH6FWS0iCiCKsH55	6wRjGQayCybNhsUiTJdXcc	Chokin'	45
0hVU7w5aEVjqYVbMcnp1CS	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	My Soul Is Lemonade	43
4O4A5zbsLjBtN6Xsi2jLRt	1zXCFUgH6FWS0iCiCKsH55	1954USRP58YPbatjFxSphC	Megaphone	43
67mBvvGurWeq8ILhG2Zyj5	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Imagination	41
6ErgLGql7HUEVbkQQJbjJt	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Motor Mouth	41
1uX4eg17USq3HclX45P8Kf	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Show Them Who It Made You	40
0iizrCBnUUJuAwCPJaWWY0	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Suede	59
6QdcmLnJLkOhfN2y9KKt7k	17Zu03OgBVxgLxWmRUyNOJ	0YePXgGfk39Rd1OWgqFKRS	itkanbe[sonice]	56
5mtfHX4VyY5D81WMaOHgHV	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	What More Can I Say	54
02sagHhK9h0nODtzjF33yP	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Lyk Dis	52
5lYXMlzWEc8uDbMd1v0V35	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Scared Money	48
08VNThwlDByBAaZUNZj1aS	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Get Bigger / Do U Luv	47
2XHouWEiXbXB7m50ybUG8h	6PEMFpe3PTOksdV4ZXUpbE	3JdE3RuYy67anCwXisf6ml	Droogs	46
4UoOaaxDdx9ndmdg3mbc83	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Another Time	44
4xSQLj346ynlX8vopebWTQ	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Link Up	44
2n0U2OG5d6TuW5mKx7YrC0	3z6Gk257P9jNcZbBXJNX5i	5t0lQDPLF22wmWCtSZkIVv	Two Birds	72
341863z079BT4EFPiSw9DP	3z6Gk257P9jNcZbBXJNX5i	5L6RSDUhfwNAU87Pafcobr	The Call	59
6GskIhdM6TN6EkPgeSjVfW	3z6Gk257P9jNcZbBXJNX5i	0ssMZRCnobXKQXjQ2R5A5a	Fidelity	50
2bbhyUWJ5VjdfI3P4PRLu2	3z6Gk257P9jNcZbBXJNX5i	0ssMZRCnobXKQXjQ2R5A5a	Samson	48
4yVixayMpxm2MUGOePA192	0epOFNiUfyON9EYx7Tpr6V	1JS6yTcVopsE6ROReK30ik	Modern Girls & Old Fashion Men	53
6zJms3MX11Qu1IKF44LoRW	3z6Gk257P9jNcZbBXJNX5i	0HeAK5QnrTRrksc2WuTYgy	Us	51
1vDMGBzqLJWZC5UzePDURw	3z6Gk257P9jNcZbBXJNX5i	5QOP3w3rOF5TBYgzjGep5Y	You've Got Time	48
0N9WhEz6DiBDvBxa6uJCTY	3z6Gk257P9jNcZbBXJNX5i	5t0lQDPLF22wmWCtSZkIVv	Eet	48
1fq4k7G5kYqUvKIuEmFAAo	3z6Gk257P9jNcZbBXJNX5i	5AgsHUKFxr5DApRCmulIqJ	Dear Theodosia (feat. Ben Folds)	48
6uA9lKAYHcBLhxb5KZYygj	3z6Gk257P9jNcZbBXJNX5i	0ssMZRCnobXKQXjQ2R5A5a	On the Radio	36
2K2M0TcglCRLLpFOzKeFZA	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	Sunshine Of Your Love	70
3Xls4cNOwy01dtrNXb1inG	74oJ4qxwOZvX6oSsu1DGnw	0zrtTZC7yY2TOEhnbJzSb9	White Room	68
47bXIv24jthL4vzZy3j7CY	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	Strange Brew	60
62nYkaIBesfvQSSwTjPnYS	74oJ4qxwOZvX6oSsu1DGnw	6iyKqDoL9pRSHUsDBYemlB	I Feel Free	57
6PUabSMXmPnZna361Wwmf7	74oJ4qxwOZvX6oSsu1DGnw	0zrtTZC7yY2TOEhnbJzSb9	Crossroads - Live	56
0GxV3poTM7Z7fKSUqy5qFw	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	Tales Of Brave Ulysses	55
3oaSvU9VBBmyfPA4lbibQM	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	Outside Woman Blues	53
08xsXR637CEqbxJmpFcuSA	74oJ4qxwOZvX6oSsu1DGnw	2tVc8PhqDSRkpgiGOw7Ukb	Badge	52
2JbS4ZDBIUcXavA9mfb2nC	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	SWLABR	49
2uxsnsH0XzOBZkMrSFVmll	74oJ4qxwOZvX6oSsu1DGnw	0zrtTZC7yY2TOEhnbJzSb9	Born Under A Bad Sign	46
7zxikeAavSLQVGocbK2nau	0XSqX2PB3C5dTMv7SZaxSm	6ZeO3WNF2Gti8ZQnXog5SQ	I'll Believe in Anything	49
6aAhBncpJcB0gJCKobVsrI	0XSqX2PB3C5dTMv7SZaxSm	0SGIIeSYwykTlnqfp3WjIN	Fine Young Cannibals	42
3lvt2HbhH4wApvt05BfDkB	0XSqX2PB3C5dTMv7SZaxSm	6ZeO3WNF2Gti8ZQnXog5SQ	Modern World	39
3LDd0iCbcOrNT2iTQjtHx4	0XSqX2PB3C5dTMv7SZaxSm	6ZeO3WNF2Gti8ZQnXog5SQ	Shine a Light	38
6ZwdMyNfYEejW0ADt7pZy8	0XSqX2PB3C5dTMv7SZaxSm	6ZeO3WNF2Gti8ZQnXog5SQ	You Are a Runner and I Am My Father's Son	37
4kj7eh4GVbTMQOzItZtA9X	0XSqX2PB3C5dTMv7SZaxSm	6ZeO3WNF2Gti8ZQnXog5SQ	Dear Sons and Daughters of Hungry Ghosts	33
4HSaCZopbqkyAKrr3neDFL	0XSqX2PB3C5dTMv7SZaxSm	48daTpxQYkfcylr2N7PuUV	You're Dreaming	32
0TK9GvIvCsQ9MK2ot0qDpT	0XSqX2PB3C5dTMv7SZaxSm	48daTpxQYkfcylr2N7PuUV	Lazarus Online	32
0BCY1jYJREuo3jnqIOqSTI	0XSqX2PB3C5dTMv7SZaxSm	6ZeO3WNF2Gti8ZQnXog5SQ	Grounds for Divorce	31
3wJqhhpTF7mFXgZUWuxhya	0XSqX2PB3C5dTMv7SZaxSm	6ZeO3WNF2Gti8ZQnXog5SQ	This Heart's on Fire	31
0ofHAoxe9vBkTCp2UQIavz	08GQAI4eElDnROBrJRGE0X	0BwWUstDMUbgq2NYONRqlu	Dreams - 2004 Remaster	82
5e9TFTbltYBg2xThimr0rU	08GQAI4eElDnROBrJRGE0X	0BwWUstDMUbgq2NYONRqlu	The Chain - 2004 Remaster	79
254bXAqt3zP6P50BdQvEsq	08GQAI4eElDnROBrJRGE0X	4AsXQ17Arq1cUVoa9dKJ3F	Everywhere - 2017 Remaster	77
5ihS6UUlyQAfmp48eSkxuQ	08GQAI4eElDnROBrJRGE0X	5VIQ3VaAoRKOEpJ0fewdvo	Landslide	76
07GvNcU1WdyZJq3XxP0kZa	08GQAI4eElDnROBrJRGE0X	1bt6q2SruMsBtcerNVtpZB	Go Your Own Way - 2004 Remaster	76
4bEb3KE4mSKlTFjtWJQBqO	08GQAI4eElDnROBrJRGE0X	1bt6q2SruMsBtcerNVtpZB	Don't Stop - 2004 Remaster	72
05oETzWbd4SI33qK2gbJfR	08GQAI4eElDnROBrJRGE0X	5VIQ3VaAoRKOEpJ0fewdvo	Rhiannon	72
19Ym5Sg0YyOCa6ao21bdoG	08GQAI4eElDnROBrJRGE0X	0LfM3PGkXE6KvJEE1HkOnz	Gypsy	71
4CoSCPlKNrWli7E5kFtbcl	08GQAI4eElDnROBrJRGE0X	4AsXQ17Arq1cUVoa9dKJ3F	Little Lies - 2017 Remaster	71
19Shlms2uTnOjIUg50TXzd	08GQAI4eElDnROBrJRGE0X	0BwWUstDMUbgq2NYONRqlu	Never Going Back Again - 2004 Remaster	70
68Dni7IE4VyPkTOH9mRWHr	6l3HvQ5sa6mXTsMTB19rO5	0UMMIkurRUmkruZ3KGBLtG	No Role Modelz	87
4tqcoej1zPvwePZCzuAjJd	6l3HvQ5sa6mXTsMTB19rO5	0UMMIkurRUmkruZ3KGBLtG	Wet Dreamz	83
0Fs9cdPDhptWEDJmiCbkEW	6l3HvQ5sa6mXTsMTB19rO5	5FP9keIJnlSCKnkdVOf623	She Knows (feat. Amber Coffman & Cults)	81
2JvzF1RMd7lE3KmFlsyZD8	6l3HvQ5sa6mXTsMTB19rO5	3XzSOIE6zGLliuqsVGLmUc	MIDDLE CHILD	80
2wAJTrFhCnQyNSD3oUgTZO	6l3HvQ5sa6mXTsMTB19rO5	0fhmJYVhW0e4i33pCLPA5i	Work Out	80
5W8jRrZ6tWrTrqnKRtIQBf	6l3HvQ5sa6mXTsMTB19rO5	4JAvwK4APPArjIsOdGoJXX	p r i d e . i s . t h e . d e v i l (with Lil Baby)	77
1D3z6HTiQsNmZxjl7F7eoG	6l3HvQ5sa6mXTsMTB19rO5	4JAvwK4APPArjIsOdGoJXX	m y . l i f e (with 21 Savage & Morray)	77
2uwnP6tZVVmTovzX5ELooy	6l3HvQ5sa6mXTsMTB19rO5	5FP9keIJnlSCKnkdVOf623	Power Trip (feat. Miguel)	77
2e3Ea0o24lReQFR4FA7yXH	6l3HvQ5sa6mXTsMTB19rO5	0UMMIkurRUmkruZ3KGBLtG	Love Yourz	75
6tZ3b7ik1QDXFAZlXib0YZ	6l3HvQ5sa6mXTsMTB19rO5	4Wv5UAieM1LDEYVq5WmqDd	Kevin’s Heart	74
2Srd8Jgif3kc6ou6Z4pSYJ	6RZUqkomCmb8zCRqc9eznB	4wxoPjHSYFYurNyKaEiZNT	Every You Every Me	51
0uYVJ8z5kgMayMNPJA6Cz9	6RZUqkomCmb8zCRqc9eznB	7kTsa1wUFrahJJf1cJEOpZ	Running Up That Hill	64
2yYASbXnAV71CLbNY1HCWf	6RZUqkomCmb8zCRqc9eznB	2toHnQWm3IbSocaWGYi9J4	The Bitter End	48
0AATuEhrQtGDevnhq9Nx2k	6RZUqkomCmb8zCRqc9eznB	2toHnQWm3IbSocaWGYi9J4	Special Needs	59
32F0zqsDgqpIEYApk2b8sr	6RZUqkomCmb8zCRqc9eznB	4wxoPjHSYFYurNyKaEiZNT	Pure Morning	47
7pmahAnqScI4MjbQiZZqei	6RZUqkomCmb8zCRqc9eznB	2toHnQWm3IbSocaWGYi9J4	This Picture	40
6Vkn98iI3sfATzdacZ307z	6RZUqkomCmb8zCRqc9eznB	4rIT7o85FQB2KfTMMT4Pj0	Song to Say Goodbye	56
54s0TZeheZOxoVFxxmB3wA	6RZUqkomCmb8zCRqc9eznB	19upQOw6eZRsGUGqGe6zF1	Beautiful James	35
0W6QtgkxPNJ7simo1UcBIr	6RZUqkomCmb8zCRqc9eznB	0PhJJToPch4jCjrfQjyarw	Special K	55
7jxR5vYnUhwE6niPPyzR4V	6RZUqkomCmb8zCRqc9eznB	19upQOw6eZRsGUGqGe6zF1	Try Better Next Time	32
39Yp9wwQiSRIDOvrVg7mbk	2PaZWGu5T5nHjY2xxAkFsT	7q6zjWaLw8bN5nYiBWjrus	THE SCOTTS	76
2ncLdwTd8qzkxiJjlbiOgC	0fA0VVWsXO9YnASrzqfmYu	0InO6eGRL47KErEYEoc2rP	Mr. Rager	72
5PX4uS1LqlWEPL69phPVQQ	0fA0VVWsXO9YnASrzqfmYu	38MFjDPIDJFfLF7IVpe1rv	Pursuit Of Happiness - Extended Steve Aoki Remix	74
6MtKObWYda2qnNIpJI21uD	0fA0VVWsXO9YnASrzqfmYu	2S8AWAM0nxyFy66YnUfIs3	Pursuit Of Happiness (Nightmare)	70
30KctD1WsHKTIYczXjip5a	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Tequila Shots	72
5wfllwdjglyQislkskYLBv	0fA0VVWsXO9YnASrzqfmYu	2S8AWAM0nxyFy66YnUfIs3	Day 'N' Nite (nightmare)	71
5XFoaqV1Z8XaLJidchVWhh	0fA0VVWsXO9YnASrzqfmYu	19ZYOtXGdqGpeeDS9SJccD	love.	71
6XkuklKiHYVTlVvWlTgQYP	0fA0VVWsXO9YnASrzqfmYu	08eM9GRdr5BCCHNqS3Wwud	Erase Me - Main	71
5CFJRZRq6sdKKtRwNPWbYv	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Show Out (with Skepta & Pop Smoke)	70
5OIz27S6SQOJtweneBd6QP	0fA0VVWsXO9YnASrzqfmYu	4aW4iDepQUl5ZCHd1Gli68	Do What I Want	70
3diqzmavbWJdQiIuIbvoWt	6ZK2nrW8aCTg8Bid7I7N10	6CL2rdgPpUEXwWsNjexAZ5	Flatlands	50
6dfWiUc39g9BjD01irYviR	6ZK2nrW8aCTg8Bid7I7N10	1nnenAgIzIipcodyg879Vx	16 Psyche	47
0ImjeKKMwhUNJwVe4JXEDy	6ZK2nrW8aCTg8Bid7I7N10	4rpm9Ez8nfVsQvNmHDbgyp	Feral Love	46
0Mg797QegnaC7LIRVU0WYh	0erhjm5MwzWpFRFuorXLT2	0lfEFhkPJdimjfkEIjRfZg	Be Free	43
4qGchgaW78B1Z9kmF9lt2w	6ZK2nrW8aCTg8Bid7I7N10	3Lm4wFlCjymVuRKZ0Z6X94	Anhedonia	43
4xTfQPuQR1VulbeAn63cgX	6ZK2nrW8aCTg8Bid7I7N10	4rpm9Ez8nfVsQvNmHDbgyp	House of Metal	42
0Fs7jajFWWfBcC4Mox3m7p	6ZK2nrW8aCTg8Bid7I7N10	6bpgmfwTWBLxT7VuS1phjL	Deranged for Rock & Roll	41
020Ur4viDDscjoH9IvpHRE	6ZK2nrW8aCTg8Bid7I7N10	1nnenAgIzIipcodyg879Vx	Vex	41
76nPiuy1rkMFQqWDFaScP4	6ZK2nrW8aCTg8Bid7I7N10	7L7IKHnLWh6gIIYNDnZtQ8	Oui Oui Marie	39
0aFXE1GU6jYnz8MkKyArZw	6ZK2nrW8aCTg8Bid7I7N10	1nnenAgIzIipcodyg879Vx	The Culling	38
6W9rbkBueZQrwuzO24GHZ2	6TVVIyd0fsRDGg6WzHKyTP	3nZHH9trTO9xrV1XrW18cW	Witchoo	59
6kle4XS7gyiUIb0tmsyCf4	6TVVIyd0fsRDGg6WzHKyTP	3idaZ1PVAh5zF50jEipyEq	Is It Any Wonder?	58
5ZK62nSchTamBy8F6HIZov	6TVVIyd0fsRDGg6WzHKyTP	7FU0CDJvPwKDWRXtHYcsoY	Sea Gets Hotter	57
6KNV6L3b7beomEUnzWgw0X	6TVVIyd0fsRDGg6WzHKyTP	3nZHH9trTO9xrV1XrW18cW	Ride or Die	57
3XITcXbaKS08ardf8ahKqM	6TVVIyd0fsRDGg6WzHKyTP	1X0ZHwPLIpROo8arjBErDY	Cruisin to the Park	56
5Dxv2JoDim8FfyUzCbOqvQ	6TVVIyd0fsRDGg6WzHKyTP	3nZHH9trTO9xrV1XrW18cW	The Way That I Do	54
0jecTSpHjOy5CyqEdfod5c	6TVVIyd0fsRDGg6WzHKyTP	7FU0CDJvPwKDWRXtHYcsoY	Don’t You Know	54
4bQhGIHwo1ZpixP9MudUbV	6TVVIyd0fsRDGg6WzHKyTP	3nZHH9trTO9xrV1XrW18cW	Love Will Work It Out	52
1m6FCJ4TWoqCz2ubKdep0Z	6TVVIyd0fsRDGg6WzHKyTP	7FU0CDJvPwKDWRXtHYcsoY	Long Way Home	51
59FqreVbI6rLyFaxIUnAEg	6TVVIyd0fsRDGg6WzHKyTP	7FU0CDJvPwKDWRXtHYcsoY	Circles	51
5Gr3F9wpvAJ6jxjMKMhUvp	6tkrcmVfWoHC4WOhE7IDyq	6JaAs0LDI0AyrZhhx3kRJz	September Doves	49
1s26EtMcz12WYu7CyETg8w	6tkrcmVfWoHC4WOhE7IDyq	3xT7V16ZrX4TE7dWUQVesx	Carry On	44
6c4i2FZ8Ul9O7BriSjkH2k	6tkrcmVfWoHC4WOhE7IDyq	5hXIEmgAMoi1ZfFrRiq9Jj	War Inside of Me	42
7JG2ctxDwLvqT799vKFvWv	6tkrcmVfWoHC4WOhE7IDyq	5hXIEmgAMoi1ZfFrRiq9Jj	Terrible and True	42
5Ff4k65YPPlQjzZEr2a0oU	6tkrcmVfWoHC4WOhE7IDyq	6JaAs0LDI0AyrZhhx3kRJz	One Shot to Wake	41
1xqRfUNinqusubH9EnyQM8	6tkrcmVfWoHC4WOhE7IDyq	3xT7V16ZrX4TE7dWUQVesx	When I Went Down to Georgia	40
6MoVJYJzWDFtSJr4VqaFvN	6tkrcmVfWoHC4WOhE7IDyq	6JaAs0LDI0AyrZhhx3kRJz	Hell's Canyon	40
6UyWIB10XzRIfkKTBtiJCl	6tkrcmVfWoHC4WOhE7IDyq	5hXIEmgAMoi1ZfFrRiq9Jj	Bring Back Someday	39
07a6JUWUqw0EMKdhLvZQqS	6tkrcmVfWoHC4WOhE7IDyq	09UCMpTfN3XjdOAaEVRrUE	The Mountain	39
3SR15t0DS0T5K7jDtp31dh	6tkrcmVfWoHC4WOhE7IDyq	1MGJxZLXW7eDKyAvQYQrqa	Wyoming	37
13jJmDyFCslJf1rpJJGFsg	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Siin	39
14nAUobNnAo4nSJjXbQofp	600GgDUq9kzGJgNIrVsWfz	5mALDiU9ZL2klZNCrZPuwi	Angel Eyes	37
1jkdnGOfeWDMVUqX2xXxsw	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	I Got the Moves	36
6RyC5X1YGBBvNP0vKYYuvI	600GgDUq9kzGJgNIrVsWfz	7n2zrl9YRGAFsHpgCoAhXQ	Nice	35
3Xt9sp779WQWqLYPVbLU0q	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Sweetest Talk	35
5pU3F1qCcnYi6EAsEh9dvU	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Detroit Baby	31
2iZPHjqqRTnEspcty3sx2d	600GgDUq9kzGJgNIrVsWfz	5mALDiU9ZL2klZNCrZPuwi	Come My Habibi	26
7voNFu2PSUXeWbFYHYz5Kj	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Let Me In	26
6f0OgGA8oU8anD99LKvX0Z	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Far from Right	23
5RVO5uHpeQVveseIWQRfvI	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Tomboy	21
6hleUCx3E4gB2urwRvx1QT	2jgPkn6LuUazBoBk6vvjh5	6XqM4NINcx3oc7NhOUKxXp	Time of the Season - Mono Version	64
4Wzt8Dm4xpO3LjWDecP4bA	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	She's Not There	61
49TIT8O6KR9rdfgVBwdbac	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	Summertime	53
560OsnDa7tpsK2B0krVlOP	2jgPkn6LuUazBoBk6vvjh5	6XqM4NINcx3oc7NhOUKxXp	This Will Be Our Year	53
69GPTeIbtyU1Vd1NPYX95k	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	The Way I Feel Inside	50
5AxeiXkrfb2e4PsZ02CSyC	2jgPkn6LuUazBoBk6vvjh5	2ig7JTatcliu92WgxJKcxj	Tell Her No	49
7p1fSjOvkphYCqxJupK8Et	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	What More Can I Do	48
5Q08lzb2Uj4X9VVDGmUebR	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	Can't Nobody Love You	45
1SnTzsiSyLSbdO0DHVIZOw	2jgPkn6LuUazBoBk6vvjh5	6XqM4NINcx3oc7NhOUKxXp	Care Of Cell 44	44
2tv1TH489D5jYz96DeGwT3	2jgPkn6LuUazBoBk6vvjh5	76v4YlZ9Cbh984zti9Q8rp	Going Out Of My Head	42
0bIGNGUqgpB82sAksxonkZ	74ASZWbe4lXaubB36ztrGX	5OlEEw6gIk32eMhOqRlfGu	My Back Pages - Live at Madison Square Garden, New York, NY - October 1992	54
73uAQw29X3mrO1taWZaOvm	6v8FB84lnmJs434UJf2Mrm	3LIMxY8oQG9c70DWKe0iHN	Journey Through the Past	52
285vxuRky8WKTIrNP332sl	6v8FB84lnmJs434UJf2Mrm	31rLr6NpNw9wggFD4QGfhD	The Needle and The Damage Done - Live at John F. Kennedy Stadium, 13th July 1985	46
1HipTbE3pVedq6OGGjxhWj	6v8FB84lnmJs434UJf2Mrm	5OlEEw6gIk32eMhOqRlfGu	All Along the Watchtower - Live at Madison Square Garden, New York, NY - October 1992	45
7kwliM8TCIwdAXBXX0LJXd	6v8FB84lnmJs434UJf2Mrm	31rLr6NpNw9wggFD4QGfhD	Nothing Is Perfect - Live at John F. Kennedy Stadium, 13th July 1985	42
4Z65ex2SD2OblueL5FjRPT	5M0lbkGluOPXLeFjApw8r8	1AWbIu7wKGqsL7be4NlEyY	Campfire (with DRAM & Neil Young)	40
5T1mYdPKZjnpD8n6HLt2W5	6v8FB84lnmJs434UJf2Mrm	0zwNzImUq6DykNGghNGffs	Mr. Soul	39
3gXMNdXzS4KkS8DQJbXxdN	6v8FB84lnmJs434UJf2Mrm	15t7NAV9KXOtPo7HefS39H	Four Strong Winds - Live at Live 8, Molson Park, Barrie, 2nd July 2005	39
0yooAzGi7j1BFEQmJHXDbc	6v8FB84lnmJs434UJf2Mrm	5OlEEw6gIk32eMhOqRlfGu	Just Like Tom Thumb's Blues - Live at Madison Square Garden, New York, NY - October 1992	34
6pPrIe2PQWqwq0CHGcjYVq	7nqSDaZKccpnUqjzedyZF4	4ErXAsdor9LnNuLW4xyzRI	Needle and the Damage Done	32
1pJsmr01tzKnFfjeCvzcdc	3QTDHixorJelOLxoxcjqGx	6r5e7Kryn9PUFiwofr19K0	Nothing Even Matters	66
0wY9rA9fJkuESyYm9uzVK5	3QTDHixorJelOLxoxcjqGx	5zdFKRmlSDwAMZ5NFVGbx9	D'Evils	64
5ibTi2YwtvbB1bTOv2I93d	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	John Redcorn	64
4sFzG7iUlyPmuyASCkre9A	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	Hair Down (feat. Kendrick Lamar)	62
0hZIaQMGqu41dozEwqVa1b	3QTDHixorJelOLxoxcjqGx	2rMvlXjrgjenPKNBK6ze0q	Satisfaction	60
5LKzqs734Xs528hqK8bGS1	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	You Can't Save Me	60
4bxr2sOVZSLjIN7tQx53ir	3QTDHixorJelOLxoxcjqGx	6rdfmpRVrUn1B7Q8rSCHZj	Life Is Good (feat. Scribz Riley)	60
3Ku9kSWtDQPC8bSWpHR7z0	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	That's Why I Love You (feat. Sabrina Claudio)	58
33fgHbTXA4hVRriK2W1khx	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	The Recipe	57
3J5fFQ0PxfKQU5putEvUoM	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	New Sky (feat. Kadhja Bonet)	56
5YixskhSGNwmqjUrG0DTEY	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Romanticist	60
2wiV5iKq5F5A0KUee4OrlK	0qu422H5MOoQxGjd4IzHbS	1YbSlMGiAAaTfR9Kk9HNxk	Limerence	60
46LX0sSwIU4GFLcj23ZfMA	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Gospel For A New Century	55
0FqkI0vR3Z28v6GSudbKXj	3rWZHrfrsPBxVy692yAIxF	0oMXn0MNLNyvB4iJPZXOuV	Perfectly Not Close To Me (ft. Yves Tumor)	55
4sbsJMnW6k7TuLhVmodlFx	0qu422H5MOoQxGjd4IzHbS	3A290H1hI6mUv3uxGDrLlr	God Is a Circle	55
4chSRXrdadYm2ujaCyP3Cf	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Super Stars	53
3pihS07XVQEavaS9n7kObt	0qu422H5MOoQxGjd4IzHbS	1IpYZkYoYCjXTYMDEW8Ksk	Licking An Orchid	50
6Ucrht7JfguIXoa4hF9Leo	0qu422H5MOoQxGjd4IzHbS	2julo3Z5rNzSod7DoEuTz7	Secrecy Is Incredibly Important To The Both of Them	48
6DJdXo8oT7kTA9mYpvpJRk	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Strawberry Privilege	48
51rPRW8NjxZoWPPjnRGzHw	3ycxRkcZ67ALN3GQJ57Vig	2wqG59dVVQlJaxoO7N0LJt	Tadow	74
0bkTdkWwGk3OGFX0afD3Wj	3ycxRkcZ67ALN3GQJ57Vig	1S0yIZRDiFmqCQyTIEV175	Mystery Lady	69
6zWU7YALeEDMcPGhKKZJhV	3ycxRkcZ67ALN3GQJ57Vig	5DxMTCWwHlaz4Hx1og50xL	Navajo	66
6T3Ebo7EOh8cUOyE4OhFpp	5Vuvs6Py2JRU7WiFDVsI7J	3myUd2MqJKr3rfUrAf41Us	Good & Plenty - Remix	63
1xTYy3K3hiTcoZfoD7culn	3ycxRkcZ67ALN3GQJ57Vig	0jKDicrmgUCTSNGRYXffXm	Say You Want Me	61
5tkR9JkBj3Ueeo8W4k8IZD	3ycxRkcZ67ALN3GQJ57Vig	2wqG59dVVQlJaxoO7N0LJt	Queen Tings	60
5z2XleKRbvbiytGucM5v2D	3ycxRkcZ67ALN3GQJ57Vig	45IpQ6F0GYcas0yFGMzvac	Flight 99	60
1VAKnb1btGrQXcVZVSRkPe	7E2ioKxoxI2J94tUkIx6As	53FhNZMrcBim6Ec9mp8ifl	Good & Plenty	58
0QUbiLQySWPq5Lh3f7A9bN	0cGUm45nv7Z6M6qdXYQGTX	6ROLwnmW9pOioLned0DaP3	Hate The Club (feat. Masego)	57
5KaIIT6ijzJvlZPPiJby36	3ycxRkcZ67ALN3GQJ57Vig	2wqG59dVVQlJaxoO7N0LJt	Prone	57
64DpBZj4IlDFzCwxTq7azl	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	Holland, 1945	58
0n97PkKoTpnp5L343TMAgB	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	Communist Daughter	52
41WcmdweTbIJAc8tiOR6xw	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	Oh Comely	49
5Rim1zEhBbmeKUPaMhDMh9	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	Ghost	47
7BSadtswKNAyWfiuHZNeih	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	The Fool	47
4gD68gReo8iXcV9FeRTyQL	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	Two-Headed Boy Pt. 2	47
2QjOHCTQ1Jl3zawyYOpxh6	77SW9BnxLY8rJ0RciFqkHh	4xkM0BwLM9H2IUcbYzpcBI	Sweater Weather	92
5E30LdtzQTGqRvNd7l6kG5	77SW9BnxLY8rJ0RciFqkHh	18iFxjZugvKhuNNMbLjZJF	Daddy Issues	86
2K7xn816oNHJZ0aVqdQsha	77SW9BnxLY8rJ0RciFqkHh	0ODLCdHBFVvKwJGeSfd1jy	Softcore	85
7zwn1eykZtZ5LODrf7c0tS	77SW9BnxLY8rJ0RciFqkHh	0ODLCdHBFVvKwJGeSfd1jy	You Get Me So High	82
2xql0pid3EUwW38AsywxhV	77SW9BnxLY8rJ0RciFqkHh	0ODLCdHBFVvKwJGeSfd1jy	Reflections	79
2u0CelO5c81XS7z3dGpHbS	77SW9BnxLY8rJ0RciFqkHh	18iFxjZugvKhuNNMbLjZJF	The Beach	77
7brQHA2CgQpcMBiOlfiXYb	77SW9BnxLY8rJ0RciFqkHh	4xkM0BwLM9H2IUcbYzpcBI	Afraid	76
0VF7YLIxSQKyNiFL3X6MmN	77SW9BnxLY8rJ0RciFqkHh	2JyArayVlT6t3MVWLLdSwZ	Stargazing	74
5Q6fh8OEhBYepJaORz9lxe	77SW9BnxLY8rJ0RciFqkHh	6vdbDPGQbJMCHyZhz9z6GS	Daddy Issues (Remix) feat. Syd	74
7IL8PSVwLOJxqYne6azxQv	77SW9BnxLY8rJ0RciFqkHh	4uNgt1uQs6wZRm4giB3shX	Pretty Boy	74
1wJCQOm2LmQVTfO0d2Ax87	5NYEE4kgrEZPlM3DxUsTyc	6wKzNT7iuR06KiXJBTpkuV	Let's Have A Satanic Orgy	49
3VAIsHnHts4Q50xC0U389K	5NYEE4kgrEZPlM3DxUsTyc	0lFpGD5pdC8Ofbs1MvS0Pg	Satan's a Woman	43
4QdF1Ph72wZ9yWmK8TsDnJ	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	Lucifer, My Love	42
0Xpwy9bUKl1vKBAL55rdSk	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	The Devil (Didn't Make Me Do It)	41
2nHrv8WYddyiom6o7xbE6d	5NYEE4kgrEZPlM3DxUsTyc	5KbpmB5vJUBpHKpy9j2AYa	Babalon	40
0mUs7SDoJPWCgNv0Tmdg97	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	Sex Magick	40
3kp9ibchTs1RKlXnxlmooG	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	I'm Wicked	39
7zcDDM8zY0icYDU2r90JRo	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	I Know How to Hex You	39
3HOJK8zgaNqcK0HuTrdL4s	5NYEE4kgrEZPlM3DxUsTyc	4fynbs9l2M5gcBvHMqYGfa	I Am a Witch	39
1yTjpC27Sbdn5gcNeQF2qU	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	Let's Hang Together	35
5O7M9Ef0F5orV3UNJ4URNx	2pAajGWerK3ghwToNWFENS	2gUufHW7CcgULEywXTQHk4	Conditions Of My Parole	55
69GE6yPZZldvqtgBHrKXxg	2pAajGWerK3ghwToNWFENS	5dKl1Mg0MWV7m4Yhu76b9F	The Humbling River	54
6vX3f406IBBmI6mAHLARGa	2pAajGWerK3ghwToNWFENS	6yDwA52kX9NSG21aNTWAuW	Momma Sed	51
57ULv0uC3dyWCxqh8AtOh8	2pAajGWerK3ghwToNWFENS	6MyJhSzVSOravLjL5hpFMk	The Remedy	51
6WpBbL2UkFz4QQNpQuG9qD	2pAajGWerK3ghwToNWFENS	5dKl1Mg0MWV7m4Yhu76b9F	Potions - Deliverance Mix	51
5RVMaBTIAr8PM2keeeZlnZ	2pAajGWerK3ghwToNWFENS	2gUufHW7CcgULEywXTQHk4	Green Valley	48
7oF9EZknm2mlqJeiS5FlKt	2pAajGWerK3ghwToNWFENS	67tFctzjZBBPEU0E8QJwUp	The Mission - M Is For Milla Mix	47
2pw4svMKO3dMCbagNki1MG	2pAajGWerK3ghwToNWFENS	6SZJfUHQDgW9GVXr3mmQIT	Dear Brother	47
3KaDyCGZ4sRvtDDjJ0IUyW	2pAajGWerK3ghwToNWFENS	64tP0vzCmjHKKJY3PnoLZM	Rev 22:20 - Don't Shoot The Messenger Version	47
2q93bHAeQ1X3mpJbldnVzK	2pAajGWerK3ghwToNWFENS	4eYJzO460ZGaEFNJ4YCizR	Bullet Train To Iowa	46
5wCVLW9qMtIY9IkBeyYnh6	75dQReiBOHN37fQgWQrIAJ	0ORZb7kyr8aaP2LpL3mhuY	When Am I Gonna Lose You	62
7LZN7FkxHZk6maiN6NdI2i	75dQReiBOHN37fQgWQrIAJ	2qiPY1CqHGexT4yWrQ5uX0	Dark Days	60
6ZMYbLF33jIECoG2MClauD	75dQReiBOHN37fQgWQrIAJ	4DZlJSUZnQUFMv4nW6Ijgv	Dark Days [Feat. Sylvan Esso]	57
5AKYyNPYhumqKeOMhdEgQO	75dQReiBOHN37fQgWQrIAJ	5OWYHfYE5Pf06BEkSLPV2W	I Saw You Close Your Eyes	55
3fIblK7WOWpnT39WIjP8tD	75dQReiBOHN37fQgWQrIAJ	6xfQHjndhrWjgENyEK0z7x	Just Before The Morning	55
53I7CviVHhNYEKth717RLG	75dQReiBOHN37fQgWQrIAJ	2qiPY1CqHGexT4yWrQ5uX0	Coins	52
44DnIGEvTlhDkGv3xLSDcp	75dQReiBOHN37fQgWQrIAJ	2cIpJDijNEoHv88jJKwDID	Wide Eyes	52
0BVZY0wh4lUICV71haiBR4	75dQReiBOHN37fQgWQrIAJ	5M50Jray1eYGOW5gkTzUjT	Desert Snow	52
1lTlQGQzaZoNX8SDNqYtUi	75dQReiBOHN37fQgWQrIAJ	1Zmq4tEgCSyTkud2ahysrq	Ceilings	50
6D5ALH11CwnnUaVqyyGmUS	75dQReiBOHN37fQgWQrIAJ	2WedBViHbzk10PflnQhNOg	Right Down The Line	50
63T7DJ1AFDD6Bn8VzG6JE8	22bE4uQ6baNwSHPVcDxLCe	72qrnM4yUNMDDlWiqKc8iY	Paint It, Black	80
6H3kDe7CGoWYBabAeVWGiD	22bE4uQ6baNwSHPVcDxLCe	4l4u9e9jSbotSXNjYfOugy	Gimme Shelter	76
7HKez549fwJQDzx3zLjHKC	22bE4uQ6baNwSHPVcDxLCe	15XNBzVWARPMlu0sEbfBjJ	Start Me Up - Remastered 2009	76
2PzU4IB8Dr6mxV3lHuaG34	22bE4uQ6baNwSHPVcDxLCe	2Q5MwpTmtjscaS34mJFXQQ	(I Can't Get No) Satisfaction - Mono Version	75
1Ud6moTC0KyXMq1Oxfien0	22bE4uQ6baNwSHPVcDxLCe	6OHri5qNxwCdVSdyCslspd	Sympathy For The Devil - 50th Anniversary Edition	73
77oU2rjC5XbjQfNe3bD6so	22bE4uQ6baNwSHPVcDxLCe	1Jv2AqzhgsduUik2p4k3cS	Beast Of Burden - Remastered 1994	72
1GcVa4jFySlun4jLSuMhiq	22bE4uQ6baNwSHPVcDxLCe	6iVOz2hudE6dv5Yrcsw2c9	Angie	71
3hJLKtTpgct9Y9wKww0BiR	22bE4uQ6baNwSHPVcDxLCe	1Jv2AqzhgsduUik2p4k3cS	Miss You - Remastered	68
52dm9op3rbfAkc1LGXgipW	22bE4uQ6baNwSHPVcDxLCe	29m6DinzdaD0OPqWKGyMdz	Wild Horses - 2009 Mix	68
6lFZbCc7pn6Lme1NP7qQqQ	22bE4uQ6baNwSHPVcDxLCe	4l4u9e9jSbotSXNjYfOugy	You Can't Always Get What You Want	67
54X78diSLoUDI3joC2bjMz	5a2EaR3hamoenG9rDuVn8j	7nXJ5k4XgRj5OLg9m8V3zc	Purple Rain	74
62LJFaYihsdVrrkgUOJC05	5a2EaR3hamoenG9rDuVn8j	54DjkEN3wdCQgfCTZ9WjdB	Kiss	72
51H2y6YrNNXcy3dfc3qSbA	5a2EaR3hamoenG9rDuVn8j	7nXJ5k4XgRj5OLg9m8V3zc	When Doves Cry	69
2I1W3hcSsPIsEJfD69pHrW	5a2EaR3hamoenG9rDuVn8j	27SA4Pkelh2pbwbVEORPOM	Raspberry Beret	64
0QeI79sp1vS8L3JgpEO7mD	5a2EaR3hamoenG9rDuVn8j	7nXJ5k4XgRj5OLg9m8V3zc	Let's Go Crazy	65
2QSUyofqpGDCo026OPiTBQ	5a2EaR3hamoenG9rDuVn8j	34MHuXONazzgSxI0cThpAg	1999 - 2019 Remaster	58
0aPaGIX2QIMAH5SMp0VEMe	5a2EaR3hamoenG9rDuVn8j	7JdnQ7zCfqETcLgS94d3ks	The Most Beautiful Girl In the World	60
6fBwVe6udYdnRqwqo06if8	5a2EaR3hamoenG9rDuVn8j	7nXJ5k4XgRj5OLg9m8V3zc	I Would Die 4 U	59
2XLAzm8bMDSI7MhbRW8nVj	5a2EaR3hamoenG9rDuVn8j	0j711DtV8bOSMZRCbphtPC	I Wanna Be Your Lover	55
4N1dFbXmRng8qJ3KdJrbLr	5a2EaR3hamoenG9rDuVn8j	2EHUlDJaTyvn0gAvVfUlcY	Little Red Corvette - 7" Edit - 2019 Remaster	56
51c94ac31swyDQj9B3Lzs3	6Ghvu1VvMGScGpOUJBAHNH	5LEXck3kfixFaA3CqVE7bC	Change (In the House of Flies)	76
1158ckiB5S4cpsdYHDB9IF	6Ghvu1VvMGScGpOUJBAHNH	7o4UsmV37Sg5It2Eb7vHzu	My Own Summer (Shove It)	75
4Uiw0Sl9yskBaC6P4DcdVD	6Ghvu1VvMGScGpOUJBAHNH	7o4UsmV37Sg5It2Eb7vHzu	Be Quiet and Drive (Far Away)	75
1EryAkZ0VHstC6haIxVBiE	6Ghvu1VvMGScGpOUJBAHNH	1GjjBpY2iDwSQs5bykQI5e	Sextape	74
70L6nHORQsblY813yNqUR3	6Ghvu1VvMGScGpOUJBAHNH	4ilqDlqD37nilewk9x8tyZ	Cherry Waves	73
4FEr6dIdH6EqLKR0jB560J	6Ghvu1VvMGScGpOUJBAHNH	4PIVdqvL1Rc7T7Vfsr8n8Q	Rosemary	72
4cLdpErILMO8Db8pQVAVcZ	6Ghvu1VvMGScGpOUJBAHNH	7o4UsmV37Sg5It2Eb7vHzu	Mascara	70
6DoXuH326aAYEN8CnlLmhP	6Ghvu1VvMGScGpOUJBAHNH	30YN03R4Bjl8Qwz8wPRoXG	7 Words	67
3Fwe3XoPOiyWUPYdBKMTqV	6Ghvu1VvMGScGpOUJBAHNH	7o4UsmV37Sg5It2Eb7vHzu	Around the Fur	66
2jSJm3Gv6GLxduWLenmjKS	6Ghvu1VvMGScGpOUJBAHNH	5LEXck3kfixFaA3CqVE7bC	Digital Bath	66
2GiJYvgVaD2HtM8GqD9EgQ	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Electric Love	80
4AewKenHXKBt643p473xCk	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	American Money	66
1Dr5JexwA15wmKe7Y7maA9	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Past Lives	63
00Ci0EXS4fNPnkTbS6wkOh	1KP6TWI40m7p3QBTU6u2xo	2Y81I8p6wKD13rSgp9aujA	Electric Love - Oliver Remix	57
62ZXL1CWLJDiDWUZUhfLfU	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Dopamine	56
2CzXAeABCmbEB52ZziuMsH	1KP6TWI40m7p3QBTU6u2xo	46Mmmgl5yZhchLWhEef7gA	Seeing Stars	54
03YZnK3XQWKpvo9TyNZzXf	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	The Emotion	53
4JEhFF1J95HoXuuXkyxMyS	1KP6TWI40m7p3QBTU6u2xo	0mzh0tCNFhxE2mSWxB4ufh	Blue Madonna	52
5rwQGBi5mdmU7dqNM7x9Oo	4n0gvapwYbRpzU5Ov68B6P	3BEUHeIQ39AlivVvDkwzNW	Love You So	56
00XrSeoUJusUuWvqd08lyF	4n0gvapwYbRpzU5Ov68B6P	7DP9LpHXZ4Ak560LIqDsFT	I’ll Be Loving You	44
16zn1yeH0Ia8JJJZh1fe1P	4n0gvapwYbRpzU5Ov68B6P	1RCFd3FwvpOMk0PzShzN5A	Alone Again	35
1ZXZQqS5hNvnKvhK8Q6Vz3	4n0gvapwYbRpzU5Ov68B6P	4NVwqWBq007KCMjfIPu3Bu	I'll Never Belong	35
5kMxNkoBH6XZfmfIqWmkHo	4n0gvapwYbRpzU5Ov68B6P	4NVwqWBq007KCMjfIPu3Bu	Zombies	33
5vWqMMqif5Vm1e1TK8NgbY	4n0gvapwYbRpzU5Ov68B6P	4NVwqWBq007KCMjfIPu3Bu	Why Don't You Lie?	30
5WENROwBwUlSPqfP6qiuBv	4n0gvapwYbRpzU5Ov68B6P	0UpIQtXECkZpGtBh0szbNT	Going Down	30
777LjHoW3blYhduQVUrCPk	4n0gvapwYbRpzU5Ov68B6P	6Ap1PVkQ93MHggcPjQ0vuE	Fishfight	30
6Vt3tMlZpK4jJV6QcD1CZK	4n0gvapwYbRpzU5Ov68B6P	7DP9LpHXZ4Ak560LIqDsFT	Lonely Boy	29
0DbvxgPkYpy5auMoE19Pvh	4n0gvapwYbRpzU5Ov68B6P	7DP9LpHXZ4Ak560LIqDsFT	Invisible Girl	29
403vzOZN0tETDpvFipkNIL	4uSftVc3FPWe6RJuMZNEe9	2xQ1WHVV0MdVSRkpND5P51	Sisyphus	59
7ko94TOP3vONuYqHLH6zpe	4uSftVc3FPWe6RJuMZNEe9	2NAQ55IP8e5YH9sasQDuCJ	I felt a Funeral, in my Brain [feat. Phoebe Bridgers]	59
7oChm7YC5PS1NvEkRCgswG	4uSftVc3FPWe6RJuMZNEe9	2xQ1WHVV0MdVSRkpND5P51	Manifest	55
5fMZ4cDsfhxR7gnFdtrWCy	4uSftVc3FPWe6RJuMZNEe9	6TqAnRWjGY3ztfajmS0HSG	Roma Fade	54
2OYmCSVGmN5vXuG5dX5LKY	4uSftVc3FPWe6RJuMZNEe9	6TqAnRWjGY3ztfajmS0HSG	Are You Serious	53
0H4b4uRUjtSjI91UYA2zSz	4uSftVc3FPWe6RJuMZNEe9	3Q5tb3gLGSe5JxeEEnTysE	Make a Picture	52
3v6NuKeDbFbaq1lNjw3XtR	4uSftVc3FPWe6RJuMZNEe9	1XBBNeT50E40fWKY5SOvb5	Pulaski at Night	51
1oMorGwgReaTZ46f3rbqAs	4uSftVc3FPWe6RJuMZNEe9	6mBVlPWGqKYGGTVsSxPWPW	Tenuousness	50
0lWLMR456FAFjlLIEBLzWf	4uSftVc3FPWe6RJuMZNEe9	2xQ1WHVV0MdVSRkpND5P51	Bloodless	48
2dAzuxEnwjHmYN1K5bAZDC	4uSftVc3FPWe6RJuMZNEe9	6TqAnRWjGY3ztfajmS0HSG	Capsized	48
3TfTZ3fGLYtR1azsY8iEp4	6AWdGez5g1jxpfl9XD4wI3	1k3MYSTe3zls106XkVRhuW	CIGARETTES	60
5TidpShGz6Jxsbx8fzKDlC	6AWdGez5g1jxpfl9XD4wI3	1k3MYSTe3zls106XkVRhuW	WISH YOU WELL	53
62LFFIgexF6K6FgT7F3iGO	6AWdGez5g1jxpfl9XD4wI3	1k3MYSTe3zls106XkVRhuW	NATURALLY	46
1INuxWCWyhe19KD0b2ndxe	6AWdGez5g1jxpfl9XD4wI3	4wq7cDPGDhVcvg2vUsn4Wk	Took You Seriously	44
7xMfEa2LiJEecDg90ux5Se	6AWdGez5g1jxpfl9XD4wI3	1k3MYSTe3zls106XkVRhuW	ENEMIES	43
1nynzV70VzfWjcCX9u64QV	6AWdGez5g1jxpfl9XD4wI3	0UMK3JacVsx29KjQuvBWcL	Reset	40
0Eet41iyLiVDtBmLp447pA	6AWdGez5g1jxpfl9XD4wI3	1k3MYSTe3zls106XkVRhuW	FREE	39
0C42kuXV8DNlXzJTIUNFFE	6AWdGez5g1jxpfl9XD4wI3	0UMK3JacVsx29KjQuvBWcL	If I Jump	37
2VZDujZxmIDhW1G2sPsKqQ	6AWdGez5g1jxpfl9XD4wI3	2VmrjWEPK3PZ4WOkz4v65p	Romeo	37
2JbNx2R6LaF2dZ2CYA1kDV	6AWdGez5g1jxpfl9XD4wI3	1jkGweRc6Ek8tqoBNW8snj	Happening	35
2XvpMAHHUVuKodlo7BKqpv	7HeVXdOdMhLslVputGTZFQ	79bRQkpKURXEnggeLVVxFq	Demon Host	43
3kpRgTtMnArQ5Gay0JxElf	7HeVXdOdMhLslVputGTZFQ	2U1BUKvsYIkUik7xEhAP0C	Hot Dreams	42
0AwLsPPWgYkib7HCrayqwy	7HeVXdOdMhLslVputGTZFQ	2U1BUKvsYIkUik7xEhAP0C	Run From Me	41
14lFMWrwM30Q8FiijmxWVz	7HeVXdOdMhLslVputGTZFQ	2tWkGlUTyWZcVsqryi8U1q	Bad Ritual	41
7BT2BsgZZffGmiENrzxCzy	7HeVXdOdMhLslVputGTZFQ	1peaWfJtqMtLmqKK79Cpxu	Magic Arrow	39
5Y8IMaCAPl996kjC4uo9Tx	7HeVXdOdMhLslVputGTZFQ	49I6QGpLjGJYC9WlyMEPhG	Velvet Gloves & Spit	38
2rsswxxShjBqoEj7dbr4Sb	7HeVXdOdMhLslVputGTZFQ	49I6QGpLjGJYC9WlyMEPhG	Grifting	37
3rly0zvX18j9J00wh5bs5S	7HeVXdOdMhLslVputGTZFQ	5xINyvUV0bHyJxBdFTT8xI	Dissociation	36
0s5VgEWaorOXCP0XdgTGXM	6CWTBjOJK75cTE8Xv8u1kj	4hTlbmXBvgkbvOmvKJFVP3	Homage	35
4lzPv33jwjnTJ7b2LMAmpG	7HeVXdOdMhLslVputGTZFQ	7lWcFkeeWhnaEFJygxwvg9	Like a Mountain	34
2NF8A7C6tICScdRaZ0BrEe	4AKwRarlmsUlLjIwt38NLw	7fJMKBNqYWhvWDs560x6nn	Katchi - Ofenbach vs. Nick Waterhouse	62
09uXepY9uC1cUlvZ6kbOy6	0V7uVrIYr4FwFvUN9S4kYr	1gzWphTk6PqMZ5qWbVaBk4	Katchi	42
3JlInp87C2VJ86UUrXkTM0	0V7uVrIYr4FwFvUN9S4kYr	1gzWphTk6PqMZ5qWbVaBk4	La Turnaround	40
0yfxzBChrAXXoUKuUvSgzm	0V7uVrIYr4FwFvUN9S4kYr	1NVwXCp6SlwgEnZ27QN1cP	Dead Room	38
3CI8Y7vvCYUKo8kjZteCrz	0V7uVrIYr4FwFvUN9S4kYr	1e1FoOAXam30VAJJb4q4Zk	Thought & Act	37
6naEBVsSQonTSqTOsquBA9	0V7uVrIYr4FwFvUN9S4kYr	2ttSZFH721F5dC6fbZznTb	Monterey	37
501jsSXfxhgClQe4UDrofk	0V7uVrIYr4FwFvUN9S4kYr	1e1FoOAXam30VAJJb4q4Zk	I Feel an Urge Coming On	36
5mqop2IekTZWc2hRE7NpmW	0V7uVrIYr4FwFvUN9S4kYr	1e1FoOAXam30VAJJb4q4Zk	Song for Winners	36
1Zi74xhSWk5R13oGceGsfm	0V7uVrIYr4FwFvUN9S4kYr	0PHH7ZnpTBkek9iQtGNBno	Place Names	33
7N15WWy12QAMpGAh6QMAej	6hnWRPzGGKiapVX1UCdEAC	2Dpw2XUAsBvuNdNLarNzz8	(What A) Wonderful World	61
0KOE1hat4SIer491XKk4Pa	6hnWRPzGGKiapVX1UCdEAC	2NFd4ApYFitFtJhGTSfDdP	A Change Is Gonna Come	66
5EoYc5wvRYOtkudLfrjsL1	6hnWRPzGGKiapVX1UCdEAC	2Dpw2XUAsBvuNdNLarNzz8	Bring It On Home to Me	62
7FS541dJh3iQAEXEZoDhE6	6hnWRPzGGKiapVX1UCdEAC	406RCIvK6uh49XviqAI6kY	Twistin' the Night Away	61
6e6Kxot9nHyZ4I8GgmGKII	6hnWRPzGGKiapVX1UCdEAC	1rEYwOdpVc2W39d0uxf0va	Nothing Can Change This Love	60
5z8DiKSG4EwxmO6gUi12rZ	6hnWRPzGGKiapVX1UCdEAC	2NFd4ApYFitFtJhGTSfDdP	Another Saturday Night	57
24lvdbt9pS7DFEjhEWSl49	6hnWRPzGGKiapVX1UCdEAC	0cvF6655OPZeLDYeU8UqL6	You Send Me	55
4UcxTnA6C5vCW79PIZ38Vx	6hnWRPzGGKiapVX1UCdEAC	2NFd4ApYFitFtJhGTSfDdP	Good Times	54
7uIaBPSTlBaAQr1asfZ3B4	6hnWRPzGGKiapVX1UCdEAC	1rEYwOdpVc2W39d0uxf0va	I Wish You Love	54
7v1858htfU0srTDwhxeka8	6hnWRPzGGKiapVX1UCdEAC	40y4Rm3Oum1bQlzIxZpVPq	Chain Gang	53
3RznzRnsl8mzP63l4AF2M7	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	Dream Sweet in Sea Major	64
0AFydkgl5Creero3gNjqvF	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	Murders	62
7qLs0IyUn6TrqgMzQ33SdH	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	Introduction to the Snow	59
2aDk1KkyB7ieSwwEDXCHJg	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	The Mind Electric	57
0L7MpEwFgZRP5rFdXOYaRT	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	Labyrinth	53
5YsZ99OX1aOyppre3Zwhnp	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	Stranded Lullaby	52
19siCk4vlsMuzQmLTwi5yt	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	Isle Unto Thyself	51
5ELOH7ea3ZkSeWTMIpWGDv	2FRXiAz5Uz78LLLSwEUhLt	1ltMZOvl4Mcnl0J1eh1t7e	Variations on a Cloud	50
5djzvjJY39rwAQaHgpPR02	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	White Ball	50
3C5CcBXFEldHfgwDe62zWI	2FRXiAz5Uz78LLLSwEUhLt	1CbtBQqibzdxhmpiLD7vzN	Black Rainbows	48
0ewrI06EIDMGXvgJxuyF3U	1fZpYWNWdL5Z3wrDtISFUH	1Sq6MrxVCTezf62YzsbzED	Dearly Departed (feat. Esmé Patterson)	62
2NAOqvZIf7onZ4kDLU560I	1fZpYWNWdL5Z3wrDtISFUH	5JcW9l6CD3JJbn7DbJrrkh	Ready or Not (feat. Sierra Ferrell)	61
1Yxbxg5R6dQcYmOdjvlXP0	1fZpYWNWdL5Z3wrDtISFUH	3JsZjfjVa95IMuZ50eX7BU	Roll The Bones - Audiotree Live Version	58
6INaSJ4clfZ8pvXSGZQnJ7	1M3BVQ36cqPQix8lQNCh4K	3UHGDyigOGGTj4DyTanLxV	Unknown Legend	53
5lJ1NMNz6ymwdaL9aejm8e	1fZpYWNWdL5Z3wrDtISFUH	1Sq6MrxVCTezf62YzsbzED	Family and Genus	51
77OBKDqQD0tvocHP5AXDDV	1fZpYWNWdL5Z3wrDtISFUH	788jxnxEP2HC7pmIrBu8St	A World So Full of Love	51
5wDkzGnw8nsQUbgMryKWBl	1fZpYWNWdL5Z3wrDtISFUH	3JsZjfjVa95IMuZ50eX7BU	Late July - Audiotree Live Version	48
3HUCTp20rxqMnCtdyU7JgU	1fZpYWNWdL5Z3wrDtISFUH	5ZetO1qY0okdczkZzAQEBL	If Not For You (Demo)	48
5a2yG11mx2vNBcOo6UMIel	1fZpYWNWdL5Z3wrDtISFUH	6gujv1pAaPxIvDbv1hYq18	Built To Roam	47
2UODQhPzz51lssoMPOlfy5	7ITd48RbLVpUfheE7B86o2	3hd8GiXOy4KUTxVDVUDT5F	Don't Carry It All	53
721tATaNQPPGSuC3dYEI3h	7ITd48RbLVpUfheE7B86o2	4qvFBtRrwbSgoH3nyVlTCp	Sons & Daughters	50
7IxWqdG1zG0gaAFYq2q0Iy	7ITd48RbLVpUfheE7B86o2	3hd8GiXOy4KUTxVDVUDT5F	Down By The Water	50
0IwXp8V7wgFCIthRh2z8Ot	7ITd48RbLVpUfheE7B86o2	4qvFBtRrwbSgoH3nyVlTCp	The Crane Wife 3	49
221bl0jrSfJ1LMgUw36zRJ	7ITd48RbLVpUfheE7B86o2	4qvFBtRrwbSgoH3nyVlTCp	O Valencia!	48
2GRbFpacyEnbA3Mk7KcfM4	7ITd48RbLVpUfheE7B86o2	51OgvNl5EtB6iNevPXxiCc	Here I Dreamt I Was an Architect	48
5eltlS3CM4xGNkL6VhpTDm	7ITd48RbLVpUfheE7B86o2	1ofGOFzgt22AGMi9yQIOMq	The Mariner's Revenge Song	48
1bvERTuePaoVjQ3NpJq9aH	7ITd48RbLVpUfheE7B86o2	3hd8GiXOy4KUTxVDVUDT5F	June Hymn	47
38psZM2gA6UWA7rqqgOjGL	7ITd48RbLVpUfheE7B86o2	2aCFve5jvcVkJ9JFcNeHc6	Severed	47
5QTKgUArMLt1JzM2JXlYCN	7ITd48RbLVpUfheE7B86o2	4yngOTPwtS3iypFBwU5qqR	The Rake's Song	45
2hnMS47jN0etwvFPzYk11f	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Santeria	76
3B4q6KbHbGV51HO3GznBFF	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	What I Got	72
4eamJr2k9YDH8j58RSTmSc	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Doin' Time	66
2PdIo7ewQPuAsP99LVg9uy	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Wrong Way	65
4paJ10JPNCyOaLtz2cY928	0EdvGhlC1FkGItLOWQzG4J	02VqlfUtNMogzTh1lckGOF	Badfish	65
0Jur3mZsQba3vqSpcmsOPm	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	Smoke Two Joints	62
2JKlf0IYz5oWsT3OCLyjpO	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Caress Me Down	59
0vtJ9Dq53hfXE3KyP1yPni	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	40oz. To Freedom	58
7FLQo89iaS5gf2hnIEW7P9	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	Date Rape	57
3kGt9uxpJzKTxwp2uJHrU5	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Same In The End	57
2lwwrWVKdf3LR9lbbhnr6R	1yAwtBaoHLEDWAnWR87hBT	0TGTGuc2vXv6ZECoAf52N0	Float On	72
0Fe3WxeO6lZZxj7ytvbDUh	1yAwtBaoHLEDWAnWR87hBT	2lXBCL76UL5PCPbfAqKBkz	Dashboard	61
5vtRk4rYxiy4cj95cmJ5Ma	1yAwtBaoHLEDWAnWR87hBT	3PTktNuj2FItJr8afuiieo	Dramamine	58
4asjU3sDnn3002bTJIg2vZ	1yAwtBaoHLEDWAnWR87hBT	2lXBCL76UL5PCPbfAqKBkz	Missed the Boat	57
5op53ANI4exiWqFHKuwWxd	1yAwtBaoHLEDWAnWR87hBT	0TGTGuc2vXv6ZECoAf52N0	The World At Large	56
5jJ69cMDMC0aeWPjZo6VP2	1yAwtBaoHLEDWAnWR87hBT	6iKqPv9C5oU29LR82N8lJf	Lampshades on Fire	55
4ToYlykhwpW98KtMIGnWQK	1yAwtBaoHLEDWAnWR87hBT	0TGTGuc2vXv6ZECoAf52N0	Ocean Breathes Salty	55
1pPqVrG2RCHXx81Aw4xp99	1yAwtBaoHLEDWAnWR87hBT	5SbcupirEParczvqqyUPXL	Gravity Rides Everything	53
5EsM3rVaMDRsOXJq7oe3tY	1yAwtBaoHLEDWAnWR87hBT	5mvHTVy1iUIkAflIufoOpj	Polar Opposites	51
7Gi8kaILAUgjYqgdee9410	1yAwtBaoHLEDWAnWR87hBT	5SbcupirEParczvqqyUPXL	3rd Planet	50
113bLFbp3F9MVN0w2KJ1ma	6LufpoVlIYKQCu9Gjpk8B7	1xwNW7Q1daqJ8LNgymY04y	How Long Do I Have to Wait for You?	67
46qpQWRt75ZlVPLtlwQvty	6LufpoVlIYKQCu9Gjpk8B7	5AaBCtOPHVJMYcDyLgu5BD	Nobody's Baby	63
4inbFqrP4CS3Ig99dIwfQ1	6LufpoVlIYKQCu9Gjpk8B7	5AaBCtOPHVJMYcDyLgu5BD	Tell Me	60
30lSYnB1aJjmxuJFXhJuhD	6LufpoVlIYKQCu9Gjpk8B7	1xwNW7Q1daqJ8LNgymY04y	How Do I Let a Good Man Down?	60
5RlLg00cYLUNOBo1edu51Z	6LufpoVlIYKQCu9Gjpk8B7	5AaBCtOPHVJMYcDyLgu5BD	Be Easy	59
1lDrb5N8RmfD1USPQYPpUu	6LufpoVlIYKQCu9Gjpk8B7	4FZCwaWGcFqd2CBiJUcHnx	Better Things	58
0THjXAVqAVDyIcihu1FKL8	6LufpoVlIYKQCu9Gjpk8B7	6aihw9128hBziSMwsKncpT	Midnight Rider	57
69YW4FrGpsjzt9lr517bUz	6LufpoVlIYKQCu9Gjpk8B7	5AaBCtOPHVJMYcDyLgu5BD	100 Days, 100 Nights	56
1fEUMHp0jSNrZfzINtXCq6	6LufpoVlIYKQCu9Gjpk8B7	6HsAPYyRSAmzyNeBZJMC4q	Making Up and Breaking Up (And Making Up and Breaking Up Over Again)	53
6oobvM9iZY1OF18kC36llz	6LufpoVlIYKQCu9Gjpk8B7	6dQ4PANge8QXfOywlHNd2J	Come and Be a Winner	52
0Z57YWES04xGh3AImDz6Qr	2kGBy2WHvF0VdZyqiVCkDT	75614DWrksimeV4oXUhaYP	Real Love Baby	66
77RNVzAVwqWiZrZuWqMV2i	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	Nancy From Now On	59
3O30ywyRk6EKT68sBvVqOP	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	Hollywood Forever Cemetery Sings	58
7qqrGV5WpQnMKqVTsDZd9J	00FQb4jTyendYWaN8pK0wa	3hL6ZIcwV6zUfqRiPLPBLJ	Buddy's Rendezvous	56
7ydJaSdC8Au68eYgspNznY	2kGBy2WHvF0VdZyqiVCkDT	2tfg6zi5pwuYeQ0IHYnOBz	Goodbye Mr. Blue	55
3wfF0Nw234zHY1vdIWIc2g	2kGBy2WHvF0VdZyqiVCkDT	4vTEFCLgDEgKIQXTrsmS6F	Chateau Lobby #4 (in C for Two Virgins)	55
2gUwnJ5cpl40TSlqmjfqAC	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	I'm Writing a Novel	51
0rGB4l2BHJhL4C1s8w6jZG	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	O I Long to Feel Your Arms Around Me	49
5AHYDez7G9xD3CIReL88yU	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	Funtimes in Babylon	48
5jLMFDMUkGpzIgPF2sxWkB	2kGBy2WHvF0VdZyqiVCkDT	4vTEFCLgDEgKIQXTrsmS6F	I Love You, Honeybear	47
7Jh1bpe76CNTCgdgAdBw4Z	0oSGxfWSnnOXhD2fKuz2Gy	4I5zzKYd2SKDgZ9DRf5LVk	Heroes - 2017 Remaster	76
0pQskrTITgmCMyr85tb9qq	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Starman - 2012 Remaster	76
2EC9IJj7g0mN1Q5VrZkiYY	0oSGxfWSnnOXhD2fKuz2Gy	72mfhbEsMtXR6s7v9UhKe3	Rebel Rebel - 2016 Remaster	72
72Z17vmmeQKAg8bptWvpVG	0oSGxfWSnnOXhD2fKuz2Gy	1ay9Z4R5ZYI2TY7WiDhNYQ	Space Oddity - 2015 Remaster	71
3ZE3wv8V3w2T2f7nOCjV0N	0oSGxfWSnnOXhD2fKuz2Gy	6fQElzBNTiEMGdIeY0hy5l	Life on Mars? - 2015 Remaster	70
3ix6K4wZY29bCujrSznwFZ	0oSGxfWSnnOXhD2fKuz2Gy	4NwG11AsDJluT732lSjMrV	Let's Dance - 2018 Remaster	70
6mib3N4E8PZHAGQ3xy7bho	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Moonage Daydream - 2012 Remaster	68
0LrwgdLsFaWh9VXIjBRe8t	0oSGxfWSnnOXhD2fKuz2Gy	6fQElzBNTiEMGdIeY0hy5l	Changes - 2015 Remaster	68
3gxEZXUjrNbl3TlSrTGbR5	0oSGxfWSnnOXhD2fKuz2Gy	4NwG11AsDJluT732lSjMrV	Modern Love - 2018 Remaster	68
5IyL3XOaRPpTgxVjRIAxXU	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Ziggy Stardust - 2012 Remaster	65
4uQ7wYsuL0DryknoDc11Hk	68kEuyFKyqrdQQLLsmiatm	4Csoz10NhNJOrCTUoPBdUD	Norf Norf	64
3Vj8RQkFwOmDvUrwu6MtQZ	68kEuyFKyqrdQQLLsmiatm	09VyQ2zwUx0EBKTJNBUZv1	Yo Love - From "Queen & Slim: The Soundtrack"	63
0lqAn1YfFVQ3SdoF7tRZO2	68kEuyFKyqrdQQLLsmiatm	2G549zeda2XNICgLmU0pNW	THE BEACH	63
5OFEJMirg4NPz7G1zgXDYu	68kEuyFKyqrdQQLLsmiatm	2suR5CCbtL2Wq8ShFo8rFr	ARE YOU WITH THAT?	63
1jhdCONafFj1hzJsPvZx27	68kEuyFKyqrdQQLLsmiatm	2G549zeda2XNICgLmU0pNW	WHEN SPARKS FLY	60
7uX3gufAoBVqKVoD3dBLLD	6qqNVTkY8uBg9cP3Jd7DAH	6eQpKhYCtvD0TwXQVHsgC2	&burn (with Vince Staples)	59
7pBsquIkbED6W6uSQJGbkn	68kEuyFKyqrdQQLLsmiatm	35s58BRTGAEWztPo9WqCIs	Home	58
6eL1ncVDtQHgSm3E288TS7	68kEuyFKyqrdQQLLsmiatm	5h3WJG0aZjNOrayFu3MhCS	Big Fish	57
7jN5Abri3a1crehbnlWa1F	68kEuyFKyqrdQQLLsmiatm	2G549zeda2XNICgLmU0pNW	MAGIC	56
7bUcBztfGqO7cSI2gMZeCI	68kEuyFKyqrdQQLLsmiatm	3pLdWdkj83EYfDN6H2N8MR	Opps (with Yugen Blakrok)	56
6vECYJHxYmm3Ydt3fF01pE	1hzfo8twXdOegF3xireCYs	5D20ZzsNB377xbshIFP9Nb	Stolen Dance	73
3GXgrEjBjonrQrPEEi13yU	1hzfo8twXdOegF3xireCYs	3anT3sq943fma4yCM5FhvG	Synchronize	62
7HNpXPaTcX5CoNBjTAEWBr	1hzfo8twXdOegF3xireCYs	5D20ZzsNB377xbshIFP9Nb	Down By The River	56
5mpLcXEsk3jjzLFGuNKk5I	1hzfo8twXdOegF3xireCYs	5D20ZzsNB377xbshIFP9Nb	Flashed Junk Mind	61
35iR1qzexmbcUSgA01S4gI	1hzfo8twXdOegF3xireCYs	707cK3j40hIquI15sOcYXP	Colorado	60
0RtXNY1EREFz5sO94TIHM9	1hzfo8twXdOegF3xireCYs	3anT3sq943fma4yCM5FhvG	Troubled Man	59
2zR85boqjMOKPygjdDbGbC	1hzfo8twXdOegF3xireCYs	62rE0W1Vy1v48FTO9hxPzx	Unknown Song	62
6XWsIlOw94W4lT5Xu0MdRf	1hzfo8twXdOegF3xireCYs	3anT3sq943fma4yCM5FhvG	Table for Two	61
0ZYok0WAPtc97pzHuDwW1f	1hzfo8twXdOegF3xireCYs	3anT3sq943fma4yCM5FhvG	As It Was	61
1X6Kmaa2Yq70vF0cIQ6V0f	1hzfo8twXdOegF3xireCYs	707cK3j40hIquI15sOcYXP	Save Your Tears	59
3HOXNIj8NjlgjQiBd3YVIi	251UrhgNbMr15NLzQ2KyKq	72YUTJrAuTuSHSVrgixbor	Yellow Eyes	60
40DGtj95w54IDSbA7BWn3o	251UrhgNbMr15NLzQ2KyKq	26n1VRHY8iKUGgRneKSOud	Olivia	56
6H96yLcXFKuBYTFEEi4Vl2	251UrhgNbMr15NLzQ2KyKq	26n1VRHY8iKUGgRneKSOud	Willy's Song	54
5aXYNj2v1ut661U0HLT6fP	251UrhgNbMr15NLzQ2KyKq	72YUTJrAuTuSHSVrgixbor	Mr. Rodriguez	51
3BkBTso1LQicQOkU1ga0xY	251UrhgNbMr15NLzQ2KyKq	43sgLebubxZtXox2i0QiVA	Without Me	50
6FR7CxgunBBN1jYJxsX8uZ	251UrhgNbMr15NLzQ2KyKq	2JZRyLhDpddo6XUwtb2ZJA	Bad Things	48
1Wi0vXVg2cAXmfkrHwoQx4	251UrhgNbMr15NLzQ2KyKq	3FoDNOhHqVS1c9mw6NJW3T	Small Worlds	48
1b3UY0WcVkxQvPDGo7T36s	251UrhgNbMr15NLzQ2KyKq	43sgLebubxZtXox2i0QiVA	Angeline	43
6lzjz4VBXtloniJwMXWicE	251UrhgNbMr15NLzQ2KyKq	43sgLebubxZtXox2i0QiVA	Let It All Go, Man	43
58qolKVzSJM0o4SblVgzPL	251UrhgNbMr15NLzQ2KyKq	2JZRyLhDpddo6XUwtb2ZJA	The Mtn Song	43
5KDNFlHAdDJ84fhK27c35X	4DFhHyjvGYa9wxdHUjtDkc	0GeWd0yUKXHbCXVag1mJvO	Judith	66
6CqYhhUPJORx1vvdTNc8jv	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	The Outsider	63
5kHkaBN8OEQlmXfQkACxSt	4DFhHyjvGYa9wxdHUjtDkc	0GeWd0yUKXHbCXVag1mJvO	3 Libras	61
7gDVjl5fEw2OPAtjbW4LzR	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	Weak And Powerless	60
27msmgcdSRniJHfocEf6EH	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	Pet	59
4XDBEoD6QFnzDY5oMmNVXN	4DFhHyjvGYa9wxdHUjtDkc	0GeWd0yUKXHbCXVag1mJvO	The Hollow	57
7slyp653Si99N4yQcJ2E9T	4DFhHyjvGYa9wxdHUjtDkc	2UAin9VEGxiZRfe9Q7SKg4	Passive	56
6lvNLD1XRU5paMwWH0RGRI	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	The Noose	54
47HJ7biEuVZxoPkauczu2R	4DFhHyjvGYa9wxdHUjtDkc	0GeWd0yUKXHbCXVag1mJvO	Magdalena	53
6tgTTBaIf0tO6lvDhoXfMg	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	Blue	52
0zO8ctW0UiuOefR87OeJOZ	5IcR3N7QB1j6KBL8eImZ8m	7Et3bSTLLqdABO1qCxUplS	Collard Greens	76
5SsR3wtCOafDmZgvIdRhSm	5IcR3N7QB1j6KBL8eImZ8m	7Et3bSTLLqdABO1qCxUplS	Man Of The Year	70
29gsi1zZrZxdStACmTQB0Z	5IcR3N7QB1j6KBL8eImZ8m	7Et3bSTLLqdABO1qCxUplS	Studio	67
4LmAnpjlhWTahvRkYR8xJa	5IcR3N7QB1j6KBL8eImZ8m	3pLdWdkj83EYfDN6H2N8MR	X (with 2 Chainz & Saudi)	65
6tByydPskASjm9jTPkNQq0	5IcR3N7QB1j6KBL8eImZ8m	3UTp6spxkyTdvsmJDPfb7n	Numb Numb Juice	64
6BKAKoo7J2vwJGZJs5dhGD	5IcR3N7QB1j6KBL8eImZ8m	3UTp6spxkyTdvsmJDPfb7n	CrasH	64
0IH3D0P8OrQFs6ajcqbm0R	5IcR3N7QB1j6KBL8eImZ8m	3UTp6spxkyTdvsmJDPfb7n	Dangerous (feat. Kid Cudi)	61
2yJ9GVCLMmzBBfQAnfzlwr	5IcR3N7QB1j6KBL8eImZ8m	0YbpATCIng8Fz2JrfHmEf7	THat Part	61
4NN6N5TxBO5k9uqu0W4gfQ	5IcR3N7QB1j6KBL8eImZ8m	3UTp6spxkyTdvsmJDPfb7n	Floating (feat. 21 Savage)	61
2kfpH2OAAdpk5J3JaraAIh	5IcR3N7QB1j6KBL8eImZ8m	1C1mvUxPYGzTqVpXu6vOLf	Hands On The Wheel	59
0BMzC3hYff1zj2MsllexiU	3D4qYDvoPn5cQxtBm4oseo	5mlCtfr6NLphHzAaXIuXz4	January 1979	46
2v4kQsvlTPEYOIyJkytzGH	3D4qYDvoPn5cQxtBm4oseo	4yItCYzksCSiB8RcUsAdSg	In A Sweater Poorly Knit	43
4SenxwCmSCIXfklUvmXyNc	3D4qYDvoPn5cQxtBm4oseo	1NAKevr9Io1J3isYJFtUiH	The Fox, The Crow And The Cookie	40
3NMFdFi82kdYIAuM7RoLNA	3D4qYDvoPn5cQxtBm4oseo	4yItCYzksCSiB8RcUsAdSg	Messes Of Men	39
2ppb1P4Ca7mFUay8seG0V2	3D4qYDvoPn5cQxtBm4oseo	0wFPFHvi467fdOlBKTVJRY	Julia (or, ‘Holy to the LORD’ on the Bells of Horses)	37
0iCmSNHh2SaJPa6G3Mx105	3D4qYDvoPn5cQxtBm4oseo	1NAKevr9Io1J3isYJFtUiH	Every Thought A Thought Of You	37
6FciQamZ49aqlmn06yJjYx	3D4qYDvoPn5cQxtBm4oseo	5mlCtfr6NLphHzAaXIuXz4	Torches Together	35
5IOjHxhDVsW9hCebpWIjkq	3D4qYDvoPn5cQxtBm4oseo	4yItCYzksCSiB8RcUsAdSg	Wolf Am I! (And Shadow)	34
4IDOe60g0rR3hQqpAluLgN	3D4qYDvoPn5cQxtBm4oseo	1NAKevr9Io1J3isYJFtUiH	The King Beetle On A Coconut Estate	33
24gpcyxzfyE8DI89FXFHLh	3D4qYDvoPn5cQxtBm4oseo	2rErxidCuRG9OAFv2WPMKA	Bullet To Binary	33
6Vi3zrYtd2n53YUiYLTnNC	3tJ9PkBOrG7hFkHeNM2tbw	7lFxuWjTe0JxXka9tjzGXm	Vem meu amor	48
0Xt2ZJpiBRYnExG0k2Zk9b	7dzq55YG3wjViqexDwiycQ	0BGtZFqDInZuJJvJa8jChx	Faraó Divindade Do Egito / Ladeira Do Pelô / Doce Obsessão - Ao Vivo	45
1wHNSciCOxqs4dft2EWrIC	3qvcCP2J0fWi0m0uQDUf6r	2hC2wtKkPe5Jdkx8g2IJPe	SOFRENDO FEITO UM LOUCO - SUMMER VERSION	44
7c60MUlDMw6ZI1Ft4LxLBY	3tJ9PkBOrG7hFkHeNM2tbw	7lFxuWjTe0JxXka9tjzGXm	Deusa do amor - Ao vivo	43
4zW2uJshw0MqCjlLlW7T51	0BHm7qbh3ENxvXzkQAG7MP	38e5jYSDDCkTEKFYy5IGss	Tudum Remix	41
3vdevXZtf1T08rQubQcwY4	3tJ9PkBOrG7hFkHeNM2tbw	5haiFJR9CxVYTS3MpZX1NQ	I Miss Her	35
1uJKTRjp5WxzrWwfElOZDp	3tJ9PkBOrG7hFkHeNM2tbw	4RPiOtWQymIOwQhazukSAu	Várias Queixas	40
2gVRDshVuLTKslwTequSO1	3tJ9PkBOrG7hFkHeNM2tbw	7bY4SH61zQPK4bnffxu64P	Requebra - Ao vivo	38
632pAox1NgFyiubpHzps90	3tJ9PkBOrG7hFkHeNM2tbw	4Pjo3KsaX35V2VHKER39T2	Madagáscar olodum	21
42zb6MpkTpMhuV3C3OeFXK	3tJ9PkBOrG7hFkHeNM2tbw	06Atso1IAfXUpWakHGZdjh	Requebra	21
3mtIUX9LrCpIUiAAv9SD4a	2ApaG60P4r0yhBoDCGD8YG	6KMdn9HDIqcBPaaok0K34K	Between the Bars	60
5AMrnF761nziCWUfjBgRUI	2ApaG60P4r0yhBoDCGD8YG	1zOxlHQGGV6EH7n4OIFTyh	Waltz #2 (XO)	59
2uwN3PDudlRkAKE3wA0OqJ	2ApaG60P4r0yhBoDCGD8YG	6KMdn9HDIqcBPaaok0K34K	Angeles	54
3XtkcPHbYX0BImTQLlbSVN	2ApaG60P4r0yhBoDCGD8YG	6KMdn9HDIqcBPaaok0K34K	Say Yes	57
4xfAVJL8R7mVYbDk8a9xOY	2ApaG60P4r0yhBoDCGD8YG	7DC0pE943VR5tAKIvQXHts	Somebody That I Used To Know	56
6WuRo5MdVrpKCl6lkKIAlp	2ApaG60P4r0yhBoDCGD8YG	60C4r1YwIxsliktUL6eXfw	Needle In The Hay	53
1Q0sk7b7PAGjgC3R5zyuWt	2ApaG60P4r0yhBoDCGD8YG	1zOxlHQGGV6EH7n4OIFTyh	Pitseleh	53
4zetUxeSCCDwrr1jJT0SuD	2ApaG60P4r0yhBoDCGD8YG	3uLHeL4d8aILBRlfpWNPYM	Miss Misery	53
3nkdVXnH4xC6f3YZS0C8pC	2ApaG60P4r0yhBoDCGD8YG	7DC0pE943VR5tAKIvQXHts	Everything Reminds Me Of Her	53
6tPiCU4LFsXUQPRIykOAnl	2ApaG60P4r0yhBoDCGD8YG	7DC0pE943VR5tAKIvQXHts	Son Of Sam	52
14246VCxRDGZHqlMlqWSz4	20qISvAhX20dpIbOOzGK3q	1tiCHRx9AI11hfcLmkGEXT	Wave Gods	60
5taqLrLouA4vCjM7ZQpEtW	4RnBFZRiMLRyZy0AzzTg2C	6cx4GVNs03Pu4ZczRnWiLd	ooh la la (feat. Greg Nice & DJ Premier)	57
1NfIOF8pH2auEaGq4roP2I	4xRYI6VqpkE3UwrDrAZL8L	0RTHMVF27KRMHIGnF7iLru	Vinyl Days (feat. DJ Premier)	50
3rSiXFJlhhhy36761mj9js	6GEykX11lQqp92UVOQQCC7	3YQRfcAxfqX4KJt4o0yCTm	The Root of All (feat. Slick Rick & Lil Wayne)	49
5UcJZVvqgX9dnjq161bGQ4	3s7WzrEs4FkNObqj4WyfQm	0L9rBwT5kUeKlwg7HOqwUU	Times Is Rough	42
5Wt2UAS92w2ZyDqX2dOEBg	165ZgPlLkK7bf5bDoFc6Sb	5mi7FKaWE5CtcOjdyxScA7	Getcha Groove On - Dirt Road Mix	46
34rwJDeFgvZXd9KtiBkQKI	6GEykX11lQqp92UVOQQCC7	3YQRfcAxfqX4KJt4o0yCTm	Beat Breaks (feat. Nas)	45
04jxZHjzLOknmIJSgjefyZ	6GEykX11lQqp92UVOQQCC7	4mLRYZaEEXZn5Ze3gxqtsf	Headlines (feat. Westside Gunn, Conway & Benny)	45
0lRhj7HyP2KObeyFPUOPRA	6GEykX11lQqp92UVOQQCC7	2PXyfq0RX8BpA1NfOhnFaJ	Our Streets (feat. A$AP Ferg) (feat. A$AP Ferg)	45
3TPvrMAd1hbPRXuHCRX0Pl	4nvFFLtv7ZqoTr83387uK4	6SFd0NeIrUfZoqCSjoFpe8	AEAO	44
6PuoZT4kgw5DrUEdnQ6e01	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	This Must Be The Place	64
7rNnqDOzc3Qoom2VhIyuxx	1anAI9P9iSzc9qzLv6AtHZ	31t6VcIOZ3WqsSH2F9Zcy0	Funky Galileo	42
0aPX1AXz8Tp51Nak6B04ij	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	Friends	56
3YSefJ4OGYCIHNVowuSx7O	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	Fat Lady	52
0tN5MAdqjjhYS4HE2JnfzJ	1anAI9P9iSzc9qzLv6AtHZ	25gXJ8YPQpkC9fUEF5Wxlt	Warm Animal	51
7dW6aiHZG0A8xApW0Xg40G	1anAI9P9iSzc9qzLv6AtHZ	31t6VcIOZ3WqsSH2F9Zcy0	Lonely One	46
1wDBglPaH5ehDDNiNWCHp0	1anAI9P9iSzc9qzLv6AtHZ	31t6VcIOZ3WqsSH2F9Zcy0	California High	48
7c0AtG5G1kbVUrBYxREGXv	1anAI9P9iSzc9qzLv6AtHZ	22rxIV4YCzp5LpFPDt95Kc	The Caller	48
0CNJyQiyzYxbsuMGTQlria	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	Giants	47
56L8kmwn2EkIJjTJ5vMlpD	1anAI9P9iSzc9qzLv6AtHZ	31t6VcIOZ3WqsSH2F9Zcy0	Peaceful In My Mind	40
1FvDJ9KGxcqwv1utyPL3JZ	3yY2gUcIsjMr8hjo51PoJ8	6cI1XoZsOhkyrCwtuI70CN	This Charming Man - 2011 Remaster	76
1xaTREM89RbIxkcjlpf4Uw	3yY2gUcIsjMr8hjo51PoJ8	1j57Q5ntVi7crpibb0h4sv	Heaven Knows I'm Miserable Now - 2011 Remaster	75
6LUGvXEAK8WxIBYK43uoTb	3yY2gUcIsjMr8hjo51PoJ8	45StnugV9WQMQwk4rRoTy8	Back to the Old House - 2011 Remaster	72
1YrnDTqvcnUKxAIeXyaEmU	3yY2gUcIsjMr8hjo51PoJ8	1j57Q5ntVi7crpibb0h4sv	How Soon Is Now? - 2011 Remaster	70
6BrMEbPSSj55nQhkgf6DnE	3yY2gUcIsjMr8hjo51PoJ8	1j57Q5ntVi7crpibb0h4sv	Please, Please, Please, Let Me Get What I Want - 2011 Remaster	69
69Kzq3FMkDwiSFBQzRckFD	3yY2gUcIsjMr8hjo51PoJ8	1j57Q5ntVi7crpibb0h4sv	This Night Has Opened My Eyes - 2011 Remaster	69
2OErSh4oVVAUll0vHxdr6p	3yY2gUcIsjMr8hjo51PoJ8	5Y0p2XCgRRIjna91aQE8q7	Bigmouth Strikes Again - 2011 Remaster	69
3M2bD9SMYnJIPdrTKUnBd3	3yY2gUcIsjMr8hjo51PoJ8	5Y0p2XCgRRIjna91aQE8q7	I Know It's Over - 2011 Remaster	66
64D3dzWyj0GpQT1AHx4kbK	3yY2gUcIsjMr8hjo51PoJ8	45StnugV9WQMQwk4rRoTy8	Panic - 2011 Remaster	64
48EjSdYh8wz2gBxxqzrsLe	2auiVi8sUZo17dLy1HwrTU	3Yko2SxDk4hc6fncIBQlcM	Cranes in the Sky	64
6IAgarq2wDeYzpsY2Kx0Hw	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Almeda	63
7yvdp8dqmxExSJwT2fn6Xq	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Binz	62
6GCIYIWUBSLontW6divqsw	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Stay Flo	61
22DHmfJa31hKpc2Lg0gVBV	2auiVi8sUZo17dLy1HwrTU	3Yko2SxDk4hc6fncIBQlcM	Mad (feat. Lil Wayne)	55
0deHsjyrgcKGMZzIuvawq3	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Dreams	54
5hR0wTnydz6lmErOV4c0sp	2auiVi8sUZo17dLy1HwrTU	6VCjvboIlNJ3N881Xja6ng	Losing You	44
688iitLNSV6Iik1QESqvth	2auiVi8sUZo17dLy1HwrTU	3Yko2SxDk4hc6fncIBQlcM	Rise	52
2TyCAfhwu5tRqFW8VnGMIL	2auiVi8sUZo17dLy1HwrTU	3Yko2SxDk4hc6fncIBQlcM	Don't Touch My Hair (feat. Sampha)	52
4o8Rk1YzdkTxsSEXd3YhAK	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Sound of Rain	51
7wCmS9TTVUcIhRalDYFgPy	6zvul52xwTWzilBZl6BUbT	50j4Wm1b9hLpSpPIA39Vp9	Where Is My Mind? - Remastered	78
4IvZLDtwBHmBmwgDIUbuwa	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Here Comes Your Man	69
0p5eZCY0R7uNCZS1YDtIYI	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Hey	68
3NfqN997u9A3YAAafgzhIa	6zvul52xwTWzilBZl6BUbT	5F9YYEKDxenkRpyuovdqZe	All I Think About Now	64
6BT7qiDY4A5tOyklohjQuW	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Monkey Gone to Heaven	63
5cy5IStIn7OSHDEIgXeDyq	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Debaser	63
7oDDV1cal0M0RIjr4HuuJ9	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Gouge Away	62
16EKGMPGE3f6X3p18CjtkB	6zvul52xwTWzilBZl6BUbT	1EzLdeSngJNnzM94BHBtK2	The Thing	60
51Z2IzJvLCnZaIpBV0IYRr	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Wave Of Mutilation	59
4lSqfVzoGBmBGnBZrSrKOJ	6zvul52xwTWzilBZl6BUbT	0BK1LxNNcaNUtAqTBQAOR8	Ana	57
2Gzg7PlsNS1XunWQFJBVt9	1nGqKVGfPPiVgxMdx8hYOI	3a7wlGYi97AWoOBZxgjp77	Junk Food Chimney	55
0vmxiz1Zx3OP8C5CjfhIXK	1nGqKVGfPPiVgxMdx8hYOI	51BUgK2KdAD7Jtm4nIbKdO	I Love You Too	45
4nIVHPwEXljxt1D8hxEXgO	1nGqKVGfPPiVgxMdx8hYOI	17udU4Qibj6l4h0HWNd0EO	Let's Move to Vietnam	44
5yqEdgJawICKIDA5cQZBOn	1nGqKVGfPPiVgxMdx8hYOI	17udU4Qibj6l4h0HWNd0EO	Don't Just Sit Here and Drink Yourself to Death	44
5jKBxNnQEs2gOtQkyBJF2z	1nGqKVGfPPiVgxMdx8hYOI	17udU4Qibj6l4h0HWNd0EO	They Think We're Stupid	40
0Qdti49fC0gs6nhWjEWXGp	1nGqKVGfPPiVgxMdx8hYOI	3a7wlGYi97AWoOBZxgjp77	May the Road	37
1Qc9iyuYBNMvlooaz4GRfN	1nGqKVGfPPiVgxMdx8hYOI	51kJncbEEq7mLs3J8C2dII	his first and last sounds	36
0EYe1EIFXb5Ob9hgDtCj0w	1nGqKVGfPPiVgxMdx8hYOI	3a7wlGYi97AWoOBZxgjp77	Goat's Milk	36
6ixvtEJ8wDs6Rg41ttIVqa	1nGqKVGfPPiVgxMdx8hYOI	6ZsUkdYEqcFuVVfqsnPLSK	The 5-Year Binge	35
3P2q1CHk8hVmu1IXjr8Us4	1nGqKVGfPPiVgxMdx8hYOI	3a7wlGYi97AWoOBZxgjp77	Pick a Place and Read	35
34iOH7LY3vme5rQxsVILZ4	432R46LaYsJZV2Gmc4jUV5	0u0CJa9zwFbGSU8JWQYS5G	Love Will Tear Us Apart - 2020 Remaster	69
5fbQCQt91LsVgXusFS0CCD	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	Disorder - 2007 Remaster	68
4ZuC5MfGjRQs3pZtPxqMYP	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	Shadowplay - 2007 Remaster	58
0rcLhYRihks3t4lFPtHhQV	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	She's Lost Control - 2007 Remaster	57
1Bq65xKgu0kjSUMUlfWyPl	432R46LaYsJZV2Gmc4jUV5	51BKPr5L8cGZGk9bl9Jf5L	Transmission - 2020 Digital Remaster	57
58vvxoXqQicDlUFJHfOuEs	432R46LaYsJZV2Gmc4jUV5	2KPhpTUihx9KRWRwBtpTeJ	Warsaw - 2010 Remaster	53
3iMq9V0Ece9ubjWAYVcMwj	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	Interzone - 2007 Remaster	53
5EabbLQZbdhCqG6aK9PFLU	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	New Dawn Fades - 2007 Remaster	53
7k42ztYdHyKWrKrENxwjkV	432R46LaYsJZV2Gmc4jUV5	5bXAysvuhQbyWllgYuahwt	Atmosphere - 2020 Digital Remaster	52
4lmYkAt0bgbNW2BhMXLWpa	432R46LaYsJZV2Gmc4jUV5	2KPhpTUihx9KRWRwBtpTeJ	Digital - 2010 Remaster	45
2Y3x5VcEAxLNmVHxQOE0jB	1PryMSya1JnSAlcwYawCxp	0X9oLn2APMvGOIsogM1TSp	Queens Highway	64
5nqd51nD2UACz5JQ83v878	1PryMSya1JnSAlcwYawCxp	54XBNTrXWfYgYhPbWVRLpX	There's a New Day Coming	56
1bZH8L8V2m454tdcSPEIl7	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	The Traitor	56
1xDeDsNoBNyBidVQKPnWXE	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	Home Again	52
18OzYEBhFuusiRbvkhf6Zl	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	Make the Road By Walking	50
4evkhyjgx4eLgyvujGWSTc	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	The Contender	46
4EGhtRnsa6DoGImFOzVzLd	1PryMSya1JnSAlcwYawCxp	1MY3VMNUb73QNJhZB92uGB	Every Day a Dream	44
5aqR0sE4AVaycHGVVjoZmx	1PryMSya1JnSAlcwYawCxp	1MY3VMNUb73QNJhZB92uGB	Lights Out	44
74gBEukHVsGBlEdYWiwLWK	1PryMSya1JnSAlcwYawCxp	0X9oLn2APMvGOIsogM1TSp	Midnight Morning	42
5ggyTMSZovcl1Pg79uZTN5	1PryMSya1JnSAlcwYawCxp	1MY3VMNUb73QNJhZB92uGB	The Crossing	40
25z7NYgTEt6MiA5qExNSH2	2bToe6WyGvADJftreuXh2K	02j4VRhJ7MKK0Jf3FtBBsD	Never Be Another You	55
1emxi7e5EWFsJmwSKTuUDH	2bToe6WyGvADJftreuXh2K	7ElHdWPD6YbkbltJQgCiDc	Honey Dove	54
6iNHWlOLt4NuDi9iSvtznO	2bToe6WyGvADJftreuXh2K	7ElHdWPD6YbkbltJQgCiDc	Ladies	53
2axJJQBO4KbFsx0Twvb8mn	2bToe6WyGvADJftreuXh2K	6sPPhqjKQHveRVqR6Ijf8s	It Rains Love	47
5ZmpzweHaXXOa1lndt3vDj	2bToe6WyGvADJftreuXh2K	1mtrVXhx0JBuv53GqqJbiG	Wish You Were Here (Instrumental)	32
2vroaTJq214LCxTtRGzrFf	2bToe6WyGvADJftreuXh2K	2uKHclIQ4IphYCgJyKfSCe	Thinking About You	46
6eFsavqVXRlyeSnlX75pc4	2bToe6WyGvADJftreuXh2K	2uKHclIQ4IphYCgJyKfSCe	Regenerate	43
6Tn9J7LOj5CuytqzORpkrz	2bToe6WyGvADJftreuXh2K	6sPPhqjKQHveRVqR6Ijf8s	Blessed with the Best	42
2mGWmvIIvs7jKEXxyh7Wfb	2bToe6WyGvADJftreuXh2K	3u38Zm1pGlCrGZSsUk2396	All I Need	39
6gZkoHTufo7bTuMHFyppWv	2bToe6WyGvADJftreuXh2K	1mtrVXhx0JBuv53GqqJbiG	You're the Kind of Girl (Instrumental)	38
39shmbIHICJ2Wxnk1fPSdz	3RGLhK1IP9jnYFH4BRFJBS	1ZH5g1RDq3GY1OvyD0w0s2	Should I Stay or Should I Go - Remastered	79
5jzma6gCzYtKB1DbEwFZKH	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	London Calling - Remastered	71
6ITuEsxEy2qPhqMowdDAeI	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	Train in Vain (Stand by Me) - Remastered	65
5dAxeuDkIkpa6wZpMOuG9i	3RGLhK1IP9jnYFH4BRFJBS	26zldGZFvob9Lj0kXZ6v7u	I Fought the Law	61
0jnFDxgNhS156vu6roUVco	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	The Guns of Brixton - Remastered	59
72boGlgSwUK01n44O2tOCv	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	Lost in the Supermarket - Remastered	59
6IMlcKjsIM3l3yXWykTa3y	3RGLhK1IP9jnYFH4BRFJBS	49kzgMsxHU5CTeb2XmFHjo	Police & Thieves - Remastered	56
7FYkZkF9fog6WS818wJnhl	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	Brand New Cadillac - Remastered	55
2ax1vei61BzRGsEn6ckEdL	3RGLhK1IP9jnYFH4BRFJBS	1ZH5g1RDq3GY1OvyD0w0s2	Straight to Hell - Remastered	55
0elCmyfISzkP5tAYTVuYjS	7FKTg75ADVMZgY3P9ZMRtH	7iTm9yZznLHb1GBOVm5IB1	August	63
2BedHMJWiW5CuiTd2wza1u	7FKTg75ADVMZgY3P9ZMRtH	1gu4P2JcclHD1BvDXx2pqq	Sad Disco	56
2JXiyD1zucGdFmnTeYb5Ry	7FKTg75ADVMZgY3P9ZMRtH	6uGsmECvPd2VoQI5OfnSPL	August (Acoustic)	56
2BIfG6wL1t5wk1KixoK2BV	7FKTg75ADVMZgY3P9ZMRtH	6tM8YvhhXemdO5xjsmS8Ro	Chicago	54
21lfQ6cXJF15ubyPLB6qHz	7FKTg75ADVMZgY3P9ZMRtH	6tM8YvhhXemdO5xjsmS8Ro	Vanilla	53
7r5elbHLaVama2WsDQpDp6	7FKTg75ADVMZgY3P9ZMRtH	7iTm9yZznLHb1GBOVm5IB1	Hippies	51
2rpbbxk3EtstH1flOZcvVd	7FKTg75ADVMZgY3P9ZMRtH	3GSahG4letshmP6jWif5rh	Churches	48
3FRJFImdfX5NSY3QH3jI4u	7FKTg75ADVMZgY3P9ZMRtH	4cZhiGqIqqqlHxWOC9r7Jp	Glistening	46
2gxYpg3ruB8p9DFWvnTHNX	7FKTg75ADVMZgY3P9ZMRtH	7iTm9yZznLHb1GBOVm5IB1	Six Below	46
0cUGSqx7MfnjiVwDzpYdYo	7FKTg75ADVMZgY3P9ZMRtH	1gu4P2JcclHD1BvDXx2pqq	Whales	46
4dneV7C1yDt9UtyxrQY375	7bu3H8JO7d0UbMoVzbo70s	7gPql7GFpBMOxeO80vMMsC	Boys Don't Cry - Single Version	65
263aNAQCeFSWipk896byo6	7bu3H8JO7d0UbMoVzbo70s	3x1CmNdXWU0DzpTZXFFRZu	Friday I'm in Love	68
76GlO5H5RT6g7y0gev86Nk	7bu3H8JO7d0UbMoVzbo70s	37Q22g0n9PzBLX6lNddrIa	Just like Heaven	68
7ABE6G4uQxbNtYgVrpBBPA	7bu3H8JO7d0UbMoVzbo70s	6HhpmJekzDCRu2K64ZbWqw	Close to Me - 2006 Remaster	61
07CyrZF9eVd02zzIse7tZA	7bu3H8JO7d0UbMoVzbo70s	4Uq47onfCEj5en94jpHovk	In Between Days - 2006 Remaster	59
0X5C4WjQNubRysTkHOubz3	7bu3H8JO7d0UbMoVzbo70s	6vQB3ZBxnQPP3jQcGV2qzg	Lovesong - 2010 Remaster	62
4d4oXk7O2lEhZ83ivV93li	7bu3H8JO7d0UbMoVzbo70s	6vQB3ZBxnQPP3jQcGV2qzg	Lullaby - 2010 Remaster	55
3O4TPMOgChXOerSdB5WENH	7bu3H8JO7d0UbMoVzbo70s	1T7A6Dt7KktX7pOw4I4Jzj	A Forest - 2006 Remaster	55
5rzr3lYGJiw3OXEg8imWgH	7bu3H8JO7d0UbMoVzbo70s	6fFTxlpJPGQbO3CbVz9MOS	The Lovecats	50
1tuwC1Ob5vnYZhvg3zyzJg	7bu3H8JO7d0UbMoVzbo70s	6vQB3ZBxnQPP3jQcGV2qzg	Pictures of You - 2010 Remaster	56
6Zz846CtUmQGP5z4F7sccA	0oL26Dn9y761yfJgNb3vfu	7nqQxq17r4eUTqsDAdrL6v	Misery	56
6zvpLxTrTKDzdeQ9OLshpQ	0oL26Dn9y761yfJgNb3vfu	2ZwK8x38X6dRgBTZNSACVU	Let Down	54
29WtjZlOl5MbzC3lhllMNv	0oL26Dn9y761yfJgNb3vfu	3LuBghNdV7Z1WSiN53P9OI	Nineties	54
72tFZO4vGmXJvjG62rnpWI	0oL26Dn9y761yfJgNb3vfu	20k8V0vHdLxnkTaJjXGcFE	The Other Way	51
3NsIAWbfXNKbwC0UfvzyrK	0oL26Dn9y761yfJgNb3vfu	67DyTWAldohmwTvFvJCJpQ	East Chicago, IN	48
2C93EaiXnfll8oL9TWqQTA	0oL26Dn9y761yfJgNb3vfu	3akwfKkhkypQRsK18KURaA	Better	47
1f8G4jvkONnLMxJMx7V2Ck	0oL26Dn9y761yfJgNb3vfu	2p70Xer2HAT9Ro0qiBVHOc	Stay Out Of It	47
2DPTXclMay45uBj9bKEq9B	0oL26Dn9y761yfJgNb3vfu	1fOUybYJNec1lhpwWIln83	Ohio Forever	44
0njZM9hISA7MaO01hvZKXZ	0oL26Dn9y761yfJgNb3vfu	0vgdTFqVOzRDO2r9JXACsZ	Reds	39
5s1Qv9rWyU2f941kH0lqnS	0MVp3LuNho9Hk6Q1owsWwt	7a00isM0AXaDU9VFb7MOfA	Devil Dressed in Blue	36
0KAlzEswdQxSP9oRJ7uuJG	0MVp3LuNho9Hk6Q1owsWwt	7iu0ZqtMGYifxPNnL9h7UX	Right Ahead, You Sailor!	34
4pfQLkCEKxD9Z40ijuNG9N	0MVp3LuNho9Hk6Q1owsWwt	7iu0ZqtMGYifxPNnL9h7UX	Love, Come And Save Me	34
1tnUY4PC2ToRWtsU5eZsvv	0MVp3LuNho9Hk6Q1owsWwt	7a00isM0AXaDU9VFb7MOfA	Oh No, I Tried	32
5O8CVNL7n2Ybvyks4j4vyN	0MVp3LuNho9Hk6Q1owsWwt	6mCotg8AmjUM3ViiEyoeew	We Were Made Out of Lightning	31
2Ryo7zxOVxGQnSM0ohTkC4	0MVp3LuNho9Hk6Q1owsWwt	7a00isM0AXaDU9VFb7MOfA	I Was a Cage	30
3BVx9YuGzTg9azhlhdK9PA	0MVp3LuNho9Hk6Q1owsWwt	6mCotg8AmjUM3ViiEyoeew	Blame	29
1J1UJMBMu8alNXRVJiPCbe	0MVp3LuNho9Hk6Q1owsWwt	7a00isM0AXaDU9VFb7MOfA	I Am a Vampire	28
0mHmf1gKE8s360PJzbFXY3	0MVp3LuNho9Hk6Q1owsWwt	6mCotg8AmjUM3ViiEyoeew	When I Met Death	27
2PXi4bCUVYjt9wpHonanEH	0MVp3LuNho9Hk6Q1owsWwt	6mCotg8AmjUM3ViiEyoeew	I Wait for You	24
29SyMC0plk6qw8NMF7lfRL	1SQRv42e4PjEYfPhS0Tk9E	08G3mGQXuHItbbsFAz50gJ	You Really Got Me	71
4ZKgPZ9d4V5WW6H2s4qMD3	1SQRv42e4PjEYfPhS0Tk9E	70kpGi2o0I7NY4DfwIN2p0	Lola - 2020 Stereo Remaster	68
78JmElAFmrPNhLjovDR9Jm	1SQRv42e4PjEYfPhS0Tk9E	08G3mGQXuHItbbsFAz50gJ	All Day and All of the Night	66
0DQqzCHlPyKQXfF8uL01SI	1SQRv42e4PjEYfPhS0Tk9E	6nkmtyFpZHm7piIFJgsxxa	Sunny Afternoon	64
5nrmGFJ87crVoJF5xdRqwn	1SQRv42e4PjEYfPhS0Tk9E	5ktMgVAJtsv4HagfFliWpR	Waterloo Sunset	63
5e3isD5st7PGYzSJuoRSIV	1SQRv42e4PjEYfPhS0Tk9E	73anEcke1iGiFLxWhXnco8	A Well Respected Man	58
1LH9QyMF3YIqYRoVsoXihB	1SQRv42e4PjEYfPhS0Tk9E	70kpGi2o0I7NY4DfwIN2p0	Strangers - 2020 Stereo Remaster	55
6UTxpt4Fn0cRBZlki1dRFq	1SQRv42e4PjEYfPhS0Tk9E	1WprYNkzlwjeBzByXIZARq	Lola - Live at Providence Civic Center, September 1979	53
0aGkeYwsDGqtsjzOQnmVAB	1SQRv42e4PjEYfPhS0Tk9E	3sccYVndePjnjJHpfVsOoU	Supersonic Rocket Ship	52
0cTwMCvozZBj8jCq6o27nk	1SQRv42e4PjEYfPhS0Tk9E	7aKN7yS7Z9mDtPioRPmcqX	Come Dancing	51
1CS7Sd1u5tWkstBhpssyjP	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Take Me to Church	76
46nvQpUDsxpS08UTFOeKTA	0xRXCcSX89eobfrshSVdyu	27rVuwJ0g0eKRpnvEhQl3G	Tell It To My Heart	74
57V4uc2b2diZ4RPHXWecb9	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Like Real People Do	70
3JtVtwLYCy9WXcHLQyzRnl	2FXC3k01G6Gw61bmprjgqS	5aO7IZl8KxtyCeke37Jvk4	Swan Upon Leda	70
1yTTMcUhL7rtz08Dsgb7Qb	6WY7D3jk8zTrHtmkqqo5GI	6HzebUNgGlzC1AMBwHGIkH	The Bones - with Hozier	69
2DNXgvkyv35vTWvdgjs7qn	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Someone New	67
5Apvsk0suoivI1H8CmBglv	2FXC3k01G6Gw61bmprjgqS	2c7gFThUYyo2t6ogAgIYNw	Almost (Sweet Music)	67
1C042FLYy7rP3MfnkOcnha	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Cherry Wine - Live	67
37zuIvk4KBkAxxLJsxJaHq	2FXC3k01G6Gw61bmprjgqS	2c7gFThUYyo2t6ogAgIYNw	Would That I	67
5TgEJ62DOzBpGxZ7WRsrqb	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Work Song	66
6qNuZL98ZSFOzIuG5zJrAj	0v6gOfGBclTSGu6agfXb23	2IpHSccHdJGTncaiuSKBjI	Eye Of The Tiger	43
4nVfmii8T3OKMm8zRBPCiO	0v6gOfGBclTSGu6agfXb23	5X27E81cePL9bNER4QEjmO	Don't Haunt This Place	41
0qA28TWVwPoIf8GuFO7O1V	0v6gOfGBclTSGu6agfXb23	5X27E81cePL9bNER4QEjmO	Frank, AB	38
1tErORKj41UML6EhV2g63R	0v6gOfGBclTSGu6agfXb23	0yuaRX2zpvhm3lq6cppVRI	Brother	35
4Vcs4KDTuIs1ogt2i6T2aG	0v6gOfGBclTSGu6agfXb23	0yuaRX2zpvhm3lq6cppVRI	White Lights	27
0EwnZr3b2hDTjnciMacmaA	0v6gOfGBclTSGu6agfXb23	5X27E81cePL9bNER4QEjmO	In The Summertime	35
703ov0hqV8reMGlX7dIpUv	0v6gOfGBclTSGu6agfXb23	0yuaRX2zpvhm3lq6cppVRI	Bad Luck Again	28
6NcVekIpjSmZQjj7Odk3d2	0v6gOfGBclTSGu6agfXb23	0yuaRX2zpvhm3lq6cppVRI	Alright	32
1ST1bodYfLasETDkH67ZrR	0v6gOfGBclTSGu6agfXb23	4txZYOVE0XqRYVzvcMGXdK	Tornado '87	29
3TU3qRbVu8jSv6IrfY0FoV	0v6gOfGBclTSGu6agfXb23	5X27E81cePL9bNER4QEjmO	The Ballad Of The RAA	31
6hHc7Pks7wtBIW8Z6A0iFq	0yNLKJebCb8Aueb54LYya3	6iHuSGy6pq4tNGFV3ZVPtl	Blue Monday	71
3PQEaRs2JEwtk79IqbQYt1	0yNLKJebCb8Aueb54LYya3	2ODAEaYlqS88SU4ZZu1bI6	Blue Monday '88 - 2015 Remaster	53
6wVViUl2xSRoDK2T7dMZbR	0yNLKJebCb8Aueb54LYya3	0PSWY4XyjTWppfBb0tBtqu	Bizarre Love Triangle	65
2EEinN4Zk8MUv4OQuLsTBj	0yNLKJebCb8Aueb54LYya3	6NTrwu1XJ56jBPx7HMksbZ	Age of Consent - 2015 Remaster	65
32TKQVwtSGCHIqmbmaNdFj	0yNLKJebCb8Aueb54LYya3	2DI73ocB6x1ExxoJbT4QI8	Dreams Never End - 2015 Remaster	59
1UVll7jjUlqSGxCZ6uXVaD	0yNLKJebCb8Aueb54LYya3	7mIOgbore2HTzdh2ZyS4rH	Regret - 2015 Remaster	57
5CRPGdCSOfstyTVK9Ja5EQ	0yNLKJebCb8Aueb54LYya3	6iHuSGy6pq4tNGFV3ZVPtl	Ceremony	55
4fpxnJGDWFxjGvLJOqPPt8	0yNLKJebCb8Aueb54LYya3	6iHuSGy6pq4tNGFV3ZVPtl	True Faith	55
7j5Q3zhjvpQvMeoPSZwdsa	0yNLKJebCb8Aueb54LYya3	6iHuSGy6pq4tNGFV3ZVPtl	Temptation	54
0F0imGVd7KnvQPkBmVtPo9	0yNLKJebCb8Aueb54LYya3	6NTrwu1XJ56jBPx7HMksbZ	Leave Me Alone - 2015 Remaster	53
7MbVZOLSUloG4J3nH3Tnos	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Surefire	36
3C3KF3yVvF7iIsGxkmr6VB	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Take Some Time	35
3o5K1YmFz9i9KluRGJusd1	1Tp7C6LzxZe9Mix6rn4zbI	62C9L1UCLOvvlu7Jb2FRRE	Rubble To Rubble	57
6hokBBgD7caSiEXJxPmryn	1Tp7C6LzxZe9Mix6rn4zbI	62C9L1UCLOvvlu7Jb2FRRE	Wheat	53
3cHo4JYNEprRGPtunpABIK	1Tp7C6LzxZe9Mix6rn4zbI	02ib3HsTaZRxvPnSV3w4vC	Surefire - Piano	53
7JsrgtynTsvDBuzUJ82o89	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Head Right	27
564vp2eEPOegtvHjnkhnhs	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Help Me Down	27
65LAG4XH7Oq0mZhFdPYqO4	1Tp7C6LzxZe9Mix6rn4zbI	62C9L1UCLOvvlu7Jb2FRRE	Morning Light	50
2De9pbFUgiS2tSG9xxzMNY	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Stranger	23
3TTVgqpcMhzeymFY0OJ4Ia	2oqwwcM17wrP9hBD25zKSR	02ikKnPQUJEz3pJ80yTnKS	Wave(s)	53
4kK14radw0XfwxJDPt9tnP	2oqwwcM17wrP9hBD25zKSR	7BKGTpCWDwTCeHnlLFcfLJ	Painting (Masterpiece)	51
7GQFqo7uDoOkTXrVBpARME	2oqwwcM17wrP9hBD25zKSR	0f6br7CLoGXr5WhM4ZS23K	The Ceiling	47
4WBXTnzVmz3Thn76w3rYUR	2oqwwcM17wrP9hBD25zKSR	7BKGTpCWDwTCeHnlLFcfLJ	Live That Long	47
5DOadSIDaKFwUPcbcbDv5J	2oqwwcM17wrP9hBD25zKSR	7BKGTpCWDwTCeHnlLFcfLJ	Loud(y)	46
2Aj1tRbhbsBWVOMVgcO9pR	2oqwwcM17wrP9hBD25zKSR	7BKGTpCWDwTCeHnlLFcfLJ	Tap Water Drinking	44
4g5MorMCNI2aOwEBSov4RT	2oqwwcM17wrP9hBD25zKSR	7BKGTpCWDwTCeHnlLFcfLJ	Malt Liquor	44
1PBp3M4Dh1TO0D6kgL8GqA	2oqwwcM17wrP9hBD25zKSR	7BKGTpCWDwTCeHnlLFcfLJ	Such Small Scenes	43
28nC2aXXUqvQCT3XeJs5Yd	2oqwwcM17wrP9hBD25zKSR	7BKGTpCWDwTCeHnlLFcfLJ	14 Faces	41
6IexNWMbsvI5x0T0CQX3yT	2oqwwcM17wrP9hBD25zKSR	7BKGTpCWDwTCeHnlLFcfLJ	Puerto Cabezas, NI	40
79MMMdYL00iwKVHBSAUkLY	4BFMTELQyWJU1SwqcXMBm3	0Z1Y5L90NjqUD351YUQWdA	I Wanna Be Your Dog - 2019 Remaster	58
00sydAz6PeOxYzwG1dRIPi	4BFMTELQyWJU1SwqcXMBm3	6mxbG8KrOTZIxlP4gzaliM	Search and Destroy - Iggy Pop Mix	52
2ukIOcbkpWR5pjDtCRHCcX	4BFMTELQyWJU1SwqcXMBm3	2jIzYmu0kYyj2NeO9p5Sx5	Louie Louie - Remastered Studio	49
3NpnrlBcEwRIgBs8tUrhyb	4BFMTELQyWJU1SwqcXMBm3	3FTcomSFg2zWSqWLRgBYpv	Down on the Street - 2005 Remaster	48
74CcP6fDBFdH8Xjo2F6Nb4	4BFMTELQyWJU1SwqcXMBm3	6vHqopioDuXtXTDoJhQZls	Gimme Danger - Bowie Mix	47
4bscUDqkO6soLEFXMr22ji	4BFMTELQyWJU1SwqcXMBm3	0Z1Y5L90NjqUD351YUQWdA	1969 - 2019 Remaster	41
6hAOC89VqirgFxREaQoGDQ	4BFMTELQyWJU1SwqcXMBm3	0Z1Y5L90NjqUD351YUQWdA	No Fun - 2019 Remaster	40
406huHGjSj2bz0cnoeGI8j	4BFMTELQyWJU1SwqcXMBm3	5S38cTeAWT2aqlArzdWbuc	My Idea Of Fun	39
21xrImrAULwa0VT8n4BJoA	4BFMTELQyWJU1SwqcXMBm3	5qhXaVIC5BdE4a5Kq1FMZG	Dirt	39
4giZRI3pgupzawIJXLx7T9	4BFMTELQyWJU1SwqcXMBm3	5qhXaVIC5BdE4a5Kq1FMZG	Loose	39
1uWp3OTBE1pryDJ4igGD1q	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	Get Down	58
7k6Ia6hsrweMKk1LiObkC9	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	Good Right Now	47
43Rh4q9wWgIEETAt0F2zCu	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	Life Is Suffering	47
7EDmkAQSnaGYk0ZoXbqvIM	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	God of Death	46
37eZez9K3jcLUha0byAI4m	7foyQbi7GKriLiv1GPVEwt	7waoPlopLlOLdZnY6PkW5S	Friends, Lovers, Ex-Lovers: Whatever	44
0epaptkWK7BHkHJheQJtZ4	7foyQbi7GKriLiv1GPVEwt	5BMjWYvNyJDfdW5Gzfyc21	Jah Werx	44
0Vc56o8yGFp7Sm2z62lGQA	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	Summertime	42
4FMeyMuT6Rk1B34v0AzV9q	7foyQbi7GKriLiv1GPVEwt	5BMjWYvNyJDfdW5Gzfyc21	Cosmic Cowboy	40
5n6BdIWBSpkfjZ29JP7WzK	7foyQbi7GKriLiv1GPVEwt	07Lss95oyQ0H0UP5i87G0A	If I Was	40
4mOmMccRWthpaUtjPhiQm8	7foyQbi7GKriLiv1GPVEwt	752tNJJGYbjlnFfSZBO9ju	Weather Balloons [Feat. Frances Cone]	39
7jIAttgQTpLDoNtykIQXjH	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Blister In The Sun	70
5fj76kVAnqRKKhAw5d06jj	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Kiss Off	56
7mVoBnU3mxV5Q6n4DmOv6K	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Gone Daddy Gone	54
61QW3AcU1jm5ttPOn8eZhn	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Add It Up	54
21F39lpBdWHu5aRy68V8xj	0rpMdBzQXf7aYRnu5fDBJy	1P29pi4JtRPZfpMPnEhCLS	American Music	50
7ccurrFI92e3hBtU02WgTL	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Good Feeling	46
4sxVoAf7uvxCSgTCRNDohP	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Please Do Not Go	46
6jcYInRCmQcUdRVjm4kRoh	0rpMdBzQXf7aYRnu5fDBJy	69BYin03rGTRdyDChYBxfr	Color Me Once	45
1kqBAV3R35lVIRvhYmSI6s	0rpMdBzQXf7aYRnu5fDBJy	2nb3J8l5RKHOU3R4oTQP9u	Country Death Song	42
2vU1H8XKsK6bUff94gTorE	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Prove My Love	40
1i6N76fftMZhijOzFQ5ZtL	2x9SpqnPi8rlE9pjHBwmSC	5eqcF7pWzHgWpGdEmHgeSN	Psycho Killer - 2005 Remaster	78
6aBUnkXuCEQQHAlTokv9or	2x9SpqnPi8rlE9pjHBwmSC	4sLCQxMRfn3gAHrBNZtbTH	This Must Be the Place (Naive Melody) - 2005 Remaster	70
38Ngied9rBORlAbLYNCl4k	2x9SpqnPi8rlE9pjHBwmSC	3AQgdwMNCiN7awXch5fAaG	Once in a Lifetime - 2005 Remaster	67
2VNfJpwdEQBLyXajaa6LWT	2x9SpqnPi8rlE9pjHBwmSC	1invpprZoPxP2H3CfGgSfJ	Burning Down the House	64
5gS8whHdcpbkdz0qonQZF8	2x9SpqnPi8rlE9pjHBwmSC	7IMqoztesjFDgyeibke8Jz	Road to Nowhere	54
5JwK7v6XhG0YgqDuCgzOy8	2x9SpqnPi8rlE9pjHBwmSC	7IMqoztesjFDgyeibke8Jz	And She Was	59
7CqleiaEqHVazV19P532X9	2x9SpqnPi8rlE9pjHBwmSC	5dVZpNJraoqCo3BssinMoo	Life During Wartime - 2005 Remaster	57
1oV1tu8utgHQjLJsEK9sVl	2x9SpqnPi8rlE9pjHBwmSC	01RJdKvXyz515O37itqMIJ	Take Me to the River - 2005 Remaster	57
1Tr4K5MU5XYE44umXGDndd	2x9SpqnPi8rlE9pjHBwmSC	1JvXxLsm0PxlGH4LXzqMGq	Once in a Lifetime	55
3yO1OjqT59JyjHaQZcCYDX	2x9SpqnPi8rlE9pjHBwmSC	4sLCQxMRfn3gAHrBNZtbTH	Burning Down the House - 2005 Remaster	55
2tznHmp70DxMyr2XhWLOW0	26T3LtbuGT1Fu9m0eRq5X3	4EK8gtQfdVsmDTji7gBFlz	Cigarette Daydreams	78
3Pzh926pXggbMe2ZpXyMV7	26T3LtbuGT1Fu9m0eRq5X3	7H814Cg8HV0qpoMheYbhNn	Ain't No Rest for the Wicked	74
4sebUbjqbcgDSwG6PbSGI0	26T3LtbuGT1Fu9m0eRq5X3	4EK8gtQfdVsmDTji7gBFlz	Come a Little Closer	73
5n0CTysih20NYdT2S0Wpe8	26T3LtbuGT1Fu9m0eRq5X3	0nW0w37lrQ87k7PLZvC4qJ	Trouble	71
1Q3t9fWvHUXKsMmpD2XpUu	26T3LtbuGT1Fu9m0eRq5X3	0nW0w37lrQ87k7PLZvC4qJ	Cold Cold Cold	68
1KuVdyg8d6NlRhbpHxg5UF	26T3LtbuGT1Fu9m0eRq5X3	2VuZJsJBPLwg9BeQFQle8G	Social Cues	65
0tkBOcK7oRVXQJY97zzSvr	26T3LtbuGT1Fu9m0eRq5X3	4EK8gtQfdVsmDTji7gBFlz	Telescope	64
4Y6GIje3GErVRIq1Ff5BJq	26T3LtbuGT1Fu9m0eRq5X3	2VuZJsJBPLwg9BeQFQle8G	Black Madonna	63
5r5Lj2MkgwQJz6TaBdL865	26T3LtbuGT1Fu9m0eRq5X3	4EK8gtQfdVsmDTji7gBFlz	Spiderhead	62
4dpEYOPcmHNfvERbiajp3G	26T3LtbuGT1Fu9m0eRq5X3	0nW0w37lrQ87k7PLZvC4qJ	Sweetie Little Jean	62
0NslHuacjxQYfUTOW3HCIV	4LG4Bs1Gadht7TCrMytQUO	5XmhHMj5LZLWo32aA6ntKE	New Slang - 2021 Remaster	69
47TQjzeG4KI0XWWb0wkbri	4LG4Bs1Gadht7TCrMytQUO	4Tm0dXi3s3aSAqng2DACHr	Australia	62
48bo7uexDvAThcRDvEB2W7	4LG4Bs1Gadht7TCrMytQUO	4ZTcGoOrNro2aCAStXEjZi	Simple Song	60
1d1Uc9yNUMvUb0RbakGDt0	4LG4Bs1Gadht7TCrMytQUO	5XmhHMj5LZLWo32aA6ntKE	Caring Is Creepy - 2021 Remaster	56
3Bz3lj6E9VFBk1Wj1hC8vw	4LG4Bs1Gadht7TCrMytQUO	4Tm0dXi3s3aSAqng2DACHr	Sleeping Lessons	55
3NPiFBw3mA9qbJfo0nhk6X	4LG4Bs1Gadht7TCrMytQUO	4Tm0dXi3s3aSAqng2DACHr	Phantom Limb	54
6Q0ah7m011fAcNTFJBjQGI	4LG4Bs1Gadht7TCrMytQUO	05APAIA6c0Qf7QtFQYZAKm	Gone for Good	54
4Omfr1OV4e0eaLcPe5JFRa	4LG4Bs1Gadht7TCrMytQUO	5XmhHMj5LZLWo32aA6ntKE	The Past and Pending - 2021 Remaster	52
6WBNQSfB047hAZ7tusGhqB	4LG4Bs1Gadht7TCrMytQUO	05APAIA6c0Qf7QtFQYZAKm	So Says I	50
4RMoPuik89bh3vHz2IUaku	4LG4Bs1Gadht7TCrMytQUO	4Tm0dXi3s3aSAqng2DACHr	Turn On Me	48
5Z0MrFDEIDB075We9w9276	4fXkvh05wFhuH77MfD4m9o	6BN0KczNzSrfmKoQzd6lMS	Call Me	61
2eM4Ew20VXdjBhm6a6Cs9l	4fXkvh05wFhuH77MfD4m9o	2fRc3TJSXKXGFdnmcm17p2	Flow with It (You Got Me Feeling Like)	57
4lhhYqzREcts4uOOqWHjRJ	4fXkvh05wFhuH77MfD4m9o	4EN9bVE0g7gUvQlNdPrUhL	Apollo	57
1NwyJs8dFvkV5cvvehav7s	4fXkvh05wFhuH77MfD4m9o	6BN0KczNzSrfmKoQzd6lMS	Half the City	51
59s5vTB8LNV4tyZPp9HM3f	4fXkvh05wFhuH77MfD4m9o	4EN9bVE0g7gUvQlNdPrUhL	GotItBad	49
26icLILupXJtsQq5EtZdwn	4fXkvh05wFhuH77MfD4m9o	2fRc3TJSXKXGFdnmcm17p2	Is It Me	49
3ItddtEzeCE37ScY8o3Tbg	4fXkvh05wFhuH77MfD4m9o	6BN0KczNzSrfmKoQzd6lMS	Like a Mighty River	48
2rNVmfuyXAfmvZfg8O9D92	4fXkvh05wFhuH77MfD4m9o	6BN0KczNzSrfmKoQzd6lMS	Grass Is Greener	47
2z6qRBkf6jjWUuzLA9CXO0	4fXkvh05wFhuH77MfD4m9o	36YdveJJhT49E0blTQODsS	A Change Is Gonna Come (feat. Lizzo) - Live at SXSW 2013	46
26Vcf2qFrnaa0pFJkGFh61	4fXkvh05wFhuH77MfD4m9o	2fRc3TJSXKXGFdnmcm17p2	Sanctify	46
3cXQrWACMWmJTQaQUoqLMj	6Xa4nbrSTfbioA4lLShbjh	2WmO2kiYt1UsAHOcApQ9cm	Shaky in the Knees	59
3WV1rfVVexVVvCP06BaaKX	6Xa4nbrSTfbioA4lLShbjh	23vRh5kKySeeZ7InWfcOlY	In My Arms (feat. Jamie N Commons)	51
4yb3ikgJkgBNTSkGm2Lvhz	6Xa4nbrSTfbioA4lLShbjh	6R6Xy2gwyTO6GS1Cs4K1cI	Waking Up The Giants	50
43a41kwTMZClWCLTONiaqm	6Xa4nbrSTfbioA4lLShbjh	6R6Xy2gwyTO6GS1Cs4K1cI	Bob Marley	49
4HSzQXLeBD9fV6U4RVDHg9	6Xa4nbrSTfbioA4lLShbjh	6R6Xy2gwyTO6GS1Cs4K1cI	The Struggle	48
2yTjzLPyPgLSfBGHgwCRr6	6Xa4nbrSTfbioA4lLShbjh	2WmO2kiYt1UsAHOcApQ9cm	Spoonful	48
6P0dI2yAf2cmg4UrCcStwE	6Xa4nbrSTfbioA4lLShbjh	6R6Xy2gwyTO6GS1Cs4K1cI	Waiting For You	47
472mFdP6wkHO6xzKn5F4et	6Xa4nbrSTfbioA4lLShbjh	6R6Xy2gwyTO6GS1Cs4K1cI	Troublemaker	47
24kirWnsEEyGgbl2NuhSVz	6Xa4nbrSTfbioA4lLShbjh	2oyXZsUW2bwtLdoRcSsFq9	Endless Summer	47
7rbxwTq9AK7a6jvEU1Gvsz	6Xa4nbrSTfbioA4lLShbjh	6R6Xy2gwyTO6GS1Cs4K1cI	Bounty On My Head	46
7lIiKyRg4KumhJ4xf5VTFt	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	In the Night	52
6NgoSSG4H4LyMQGbHulkcm	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Hot Shot	51
2X1D6fTtA76LsJh5JxB9c8	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Big Wheel	51
0S9zKOWiIwsR9Vla8NVYJd	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Sunshine (You're Blowin' My Cool)	36
5Wl6Nt74mR9RYy7R7GOWNa	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Gonna Make Time	34
2KaRGgJ1qMsFOOWvUL7aD2	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Look Closer (Can't You See the Signs?)	27
723j4ubztPUgRKvQfflQNy	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Dear Mr. Teddy	26
2VHbTftHVMguJfRpi5lsSt	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Another Love Like Mine	26
6XYVdHPqfmmoOPWZk46EAP	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Blah Blah Blah Blah Blah Blah Blah	22
4VSubATiLD4126APjXmQcD	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	If Only	14
11607FzqoipskTsXrwEHnJ	1nJvji2KIlWSseXRSlNYsC	4xwx0x7k6c5VuThz5qVqmV	Sunday Morning	64
11VwZwNF29HrqwalYUMitb	1nJvji2KIlWSseXRSlNYsC	2HOf3Nb44Us8U9oEtKLSrX	Pale Blue Eyes	63
3PG7BAJG9WkmNOJOlc4uAo	1nJvji2KIlWSseXRSlNYsC	4xwx0x7k6c5VuThz5qVqmV	Femme Fatale	63
4PINSJIlBWsnVeveicq1S8	1nJvji2KIlWSseXRSlNYsC	4xwx0x7k6c5VuThz5qVqmV	I'll Be Your Mirror	61
6cA1usDL8nTHeSgFewQat3	1nJvji2KIlWSseXRSlNYsC	2HOf3Nb44Us8U9oEtKLSrX	After Hours	59
0i19MAZbyn8uTir7FprXId	1nJvji2KIlWSseXRSlNYsC	2ny1rPsLOoKNFZhMLubMrs	Oh! Sweet Nuthin' - 2015 Remaster	59
3cw3Z7mS55gd3NUjh4k0bL	1nJvji2KIlWSseXRSlNYsC	2ny1rPsLOoKNFZhMLubMrs	Sweet Jane - Full Length Version; 2015 Remaster	57
1o6DclZHw0HomxXEQR1ijX	1nJvji2KIlWSseXRSlNYsC	2ny1rPsLOoKNFZhMLubMrs	Rock & Roll - Full Length Version; 2015 Remaster	57
3fElupNRLRJ0tbUDahPrAb	1nJvji2KIlWSseXRSlNYsC	4xwx0x7k6c5VuThz5qVqmV	I'm Waiting For The Man	56
29engDqjmMr3VLqMm0c0WE	1nJvji2KIlWSseXRSlNYsC	4xwx0x7k6c5VuThz5qVqmV	Venus In Furs	56
4gsR34XSIE2fUY4odwZqym	32Ko3nL0210QAt14S3Rs4Y	4BrJEabBSw59bwSjKZl25p	Seventeen	64
56PgQIFxAvXcEtXNYrsB0w	32Ko3nL0210QAt14S3Rs4Y	0C0Oq2jJhJ4Rs6IwgCe0Ob	I Don't Know	59
0H6hMpN8zxZT3ToOelM5Cl	32Ko3nL0210QAt14S3Rs4Y	7HxeuvcM84U4sWEtOSlePG	Snow White	57
41oqThgUF4yiNz77TazXtl	32Ko3nL0210QAt14S3Rs4Y	6uR4bPGGdQHDphbyubK9zc	Now & Then	56
03rZ4jEeqvKjrqdRHPZmpp	32Ko3nL0210QAt14S3Rs4Y	0dsp6TeaD2da6UvQy4CZ2C	Change	55
4ulOJhLqbDeBFEbYVX6yjG	32Ko3nL0210QAt14S3Rs4Y	4cGpiQWYOPtHRB3mQLDWCC	Human Condition	54
2oBzsiZT8qmlovYS1FMf06	32Ko3nL0210QAt14S3Rs4Y	6a9bsIUvtXmqj6HaEOIAq3	Better Off	51
1EmUW3D8vAfp2miQJTMupc	32Ko3nL0210QAt14S3Rs4Y	7HxeuvcM84U4sWEtOSlePG	What Goes Around	48
3dJSC3yIV69Afxvme5qf5d	32Ko3nL0210QAt14S3Rs4Y	2HatDWFqyd2cFNHX7wX7Yp	Drifty	45
4UDBvtxDnUjzVu0HopFsZ8	32Ko3nL0210QAt14S3Rs4Y	5RkPNFjpGpN5KiTRpTRjzv	High Beam	43
70LcF31zb1H0PyJoS1Sx1r	4Z8W4fKeB5YxbusRsdQVPb	3gBVdu4a1MMJVMy6vwPEb8	Creep	84
10nyNJ6zNy2YVYLrcwLccB	4Z8W4fKeB5YxbusRsdQVPb	6dVIqQ8qmQ5GBnJ9shOYGE	No Surprises	81
63OQupATfueTdZMWTxW03A	4Z8W4fKeB5YxbusRsdQVPb	6dVIqQ8qmQ5GBnJ9shOYGE	Karma Police	75
2a1iMaoWQ5MnvLFBDv4qkf	4Z8W4fKeB5YxbusRsdQVPb	35UJLpClj5EDrhpNIi4DFg	High and Dry	74
0z1o5L7HJx562xZSATcIpY	4Z8W4fKeB5YxbusRsdQVPb	6dVIqQ8qmQ5GBnJ9shOYGE	Exit Music (For A Film)	72
73CKjW3vsUXRpy3NnX4H7F	4Z8W4fKeB5YxbusRsdQVPb	35UJLpClj5EDrhpNIi4DFg	Fake Plastic Trees	71
4wajJ1o7jWIg62YqpkHC7S	4Z8W4fKeB5YxbusRsdQVPb	5vkqYmiPBYLaalcmjujWxK	Weird Fishes/ Arpeggi	70
1dyTcli07c77mtQK3ahUZR	4Z8W4fKeB5YxbusRsdQVPb	35UJLpClj5EDrhpNIi4DFg	Just	70
0YJ9FWWHn9EfnN0lHwbzvV	4Z8W4fKeB5YxbusRsdQVPb	5vkqYmiPBYLaalcmjujWxK	Jigsaw Falling Into Place	69
6LgJvl0Xdtc73RJ1mmpotq	4Z8W4fKeB5YxbusRsdQVPb	6dVIqQ8qmQ5GBnJ9shOYGE	Paranoid Android	69
2H30WL3exSctlDC9GyRbD4	48vDIufGC8ujPuBiTxY8dm	6cmFNl8lllA6BGc7SKLy3y	Live Well	67
2DkZisoN9h1dLa8Sn5sx0n	48vDIufGC8ujPuBiTxY8dm	6cmFNl8lllA6BGc7SKLy3y	Bitter	62
3Rl26h1HiMCV0HFHHVb2IM	48vDIufGC8ujPuBiTxY8dm	2gnr57XaEBXSDlfbkowBP8	Heaven Up There	55
23uCHFc7xcQWgXh2oelMOe	48vDIufGC8ujPuBiTxY8dm	6cmFNl8lllA6BGc7SKLy3y	Have Faith	52
5Zejf0AVF45ZXdcePeghId	48vDIufGC8ujPuBiTxY8dm	5KSXwOfUJeKRkTr43FppCM	Never Said It Was Easy	51
4Yv6i6vsR5RoSsuTX8Anr3	48vDIufGC8ujPuBiTxY8dm	5KSXwOfUJeKRkTr43FppCM	Lover (Don't Let Me Down)	51
3RQA5wzKg5MFqoRJytmYEN	48vDIufGC8ujPuBiTxY8dm	50lmuZTx1lNcNFjY2cr3HB	Lost in the Night	50
1UsXMQwIzCKSk6oIdRE5Jc	48vDIufGC8ujPuBiTxY8dm	0LyecvMmiD3grsZtkEQQJM	Veins	50
6wimdClggXbqamkhOsyRQ9	48vDIufGC8ujPuBiTxY8dm	50lmuZTx1lNcNFjY2cr3HB	I Want What You Got	49
3SJI20YW5l5Ri1etVIx1Vo	48vDIufGC8ujPuBiTxY8dm	6cmFNl8lllA6BGc7SKLy3y	Holy Smoke	49
1ceeCjdsXB1PRoUQ5EKvZj	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	I'll Take the Long Road	42
34Yd2MzccdIpLaGEWdL4I4	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	What Have You Done	40
7MR20mD5bWffs5yNmtmvnK	4zsrUnozu6zRlVELQezaBn	57mOAqbdhcMncLg0rjaY7w	Sinner	26
6x6xL8nI9uj94pd4cUyiHB	4zsrUnozu6zRlVELQezaBn	4WlxosPPabfbXUJ1w9gpKc	You Gotta Move	19
3igY2JZg3xnyuZIEaZAE2Q	4zsrUnozu6zRlVELQezaBn	57mOAqbdhcMncLg0rjaY7w	Everybody Knows (River Song)	18
2XdlLaMNZKmh8bqA4yK7pO	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	What More Can I Do?	17
1sOaZDQR1VSJZqxkD55ZtP	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	By Your Side	17
0Kj3JOdo5iWJcOic035iNs	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	Lift My Burdens	15
7grHWewXZi12Qn941ePu4A	4zsrUnozu6zRlVELQezaBn	57mOAqbdhcMncLg0rjaY7w	Movin'	14
339AymorMFeh9GvJahQvnq	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	Am I Asking Too Much?	13
7CUkeiG7QtB7tPU9f8SANS	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	hand crushed by a mallet	61
734xplxSpoW22U5OeeZcr8	68kEuyFKyqrdQQLLsmiatm	4Csoz10NhNJOrCTUoPBdUD	Señorita	44
65ENznU4hwrR04whyJboxr	5vSQUyT33qxr1xAX2Tkf3A	7Amrg2WughWQXMEmUfjhl3	All Nite (feat. Vince Staples)	41
0fIffclhgJC5h8AdMMVvkp	0eDvMgVFoNV3TpwtrVCoTj	6d1vGZsr6Uy3h9IigBpPAf	Welcome To The Party	71
4rc2WNOt2w8BHfQjBC8PO0	6guC9FqvlVboSKTI77NG2k	75Z98z7kl42oWcT0UvtO6e	We Own The Night	63
2XU0oxnq2qxCpomAAuJY8K	2NjfBq1NflQcKSeiDooVjY	0UywfDKYlyiu1b38DRrzYD	Dance Monkey	77
61bwFjzXGG1x2aZsANdLyl	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	money machine	64
0nbXyq5TXYPCO7pr3N8S4I	757aE44tKEUQEqRuT6GnEB	52u4anZbHd6UInnmHRFzba	The Box	80
4jM6Tl8062cc9gTJgTZTpx	6XyY86QOPPrYVGvF9ch6wz	0kJJubTbpBWH9dwHmRl4qR	One Step Closer - 100 gecs Reanimation	49
2SY8qCm2nwl2JK3BBOhBrl	422qjlzkDtxmaeeOLhnE6A	2LlKseD9In6F377qHat4uZ	HOLE	22
7aiClxsDWFRQ0Kzk5KI5ku	2cFrymmkijnjDg9SS92EPM	37CqAwxTungNxKpIK5vSgE	hot girl bummer	6
1z4xjDLLWJgG48Bn8OCxZv	1rCIEwPp5OnXW0ornlSsRl	3Oj8FdHcV6kAiOVWfkqRaA	Help I'm Alive	0
02kDW379Yfd5PzW5A6vuGt	6MPCFvOQv5cIGfw3jODMF0	1pFaEu56zqpzSviJc3htZN	Lemonade	74
4fuPFCrsnZ85emMfL52CKp	4sQNUQjOYj9rV2sdfJ8laS	4Z3RHSVpMYdXciM5wo638s	Knock Knock	51
2Z8WuEywRWYTKe1NybPQEW	3YQKmKGau1PzlVlkL1iodx	3cQO7jp5S9qLBoIVtbkSM1	Ride	81
6PQ88X9TkUIAUIZJHW2upE	6eUKZXaKkcviH0Ku9w2n3V	01NhUvviMytvV12pmJiDZH	Bad Habits	21
2eel5Us5RHsvtBNPnFT5E1	0EdvGhlC1FkGItLOWQzG4J	0yZuUc5poB8rtqkbmA0APm	Pool Shark - Acoustic Version	35
6i0V12jOa3mr6uu4WYhUBr	3YQKmKGau1PzlVlkL1iodx	3J8W9AOjQhnBLCX33m3atT	Heathens	81
3NWTRZ0A8xKlBP1qgNftql	7GN9PivdemQRKjDt4z5Zv8	69g3CtOVg98TPOwqmI2K7Q	Special Affair	61
19gEmPjfqSZT0ulDRfjl0m	34Y0ldeyUv7jBvukWOGASO	5ptl9Sheh9eWaogxFOZ3PV	Hot N*gga	72
78JKJfKsqgeBDBF58gv1SF	5IcR3N7QB1j6KBL8eImZ8m	6Xz8eKy8TeAyzwGr8QSOAS	Hands on the Wheel (feat. Asap Rocky)	61
367HmvU5MpsWZdAJ3QbGlZ	4LLpKhyESsyAXpc4laK94U	5SKnXCvB4fcGSZu32o3LRY	Polo Jeans (feat. Earl Sweatshirt)	56
0wzruvvN7f5wu39aFcjTMw	2kGBy2WHvF0VdZyqiVCkDT	1BOfOlZo9Nzx7SmYAucY9t	Hollywood Forever Cemetery Sings	0
3p9x4bK5bwmgXE6POMvOp0	7gjAu1qr5C2grXeQFFOGeh	14JU5SskmcyckE5I8PY6lv	Constant Conversations	46
6bnF93Rx87YqUBLSgjiMU8	1Xyo4u8uXC1ZmMpatF05PJ	4yP0hdKOZPNshxUOjY0cZj	Heartless	79
4EFy48vEJNG3xQf5Er4scn	3PfyosblIBaNJNH88MUkgM	7jBYJQJTLhKJVADOtpN2q0	Drifting	41
6ORqU0bHbVCRjXm9AjyHyZ	7oPftvlwr6VrsViSDV7fJY	3x2uer6Xh0d5rF8toWpRDA	Good Riddance (Time of Your Life)	76
2fwz9mBaELJCzXuEEEe35Y	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	745 sticky	47
11CiPQqnR8j7nsfZVMpboM	0EdvGhlC1FkGItLOWQzG4J	0yZuUc5poB8rtqkbmA0APm	Cisco Kid	45
22VdIZQfgXJea34mQxlt81	1Xyo4u8uXC1ZmMpatF05PJ	0P3oVJBFOv3TDXlYRhGL7s	Can't Feel My Face	81
0yhGTljYYHyP7phuxoKWiJ	738wLrAtLtCtFOLvQBXOXp	6Ax8Neb7dEif3KUlJwj2P8	Get Free	54
2QbGvQssb0VLLS4x5NOmyJ	6fxyWrfmjcbj5d12gXeiNV	6PkSBdx19zarn4ae1D08gA	RICKY	63
7vaFuClNKe02pjKYbXEJ46	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	xXXi_wud_nvrstøp_ÜXXx	48
6L89mwZXSOwYl76YXfX13s	7oPftvlwr6VrsViSDV7fJY	4uG8q3GPuWHQlRbswMIRS6	Basket Case	80
0z5oHDjD9vMsck14zoAQOc	21dooacK2WGBB5amYvKyfM	1pPpRk6AF8EL19sgm2MkSD	What I Please (feat. Denzel Curry)	52
0KV4Ax6L10oSTWqC8607K4	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	São Bento Grande	21
6myUpr3GDR80Dg3zqNTmmG	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Another Day	59
1xzUQMiCoY5pdego0pHMeV	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	She Knows This	58
3ImnbJHoSy5uUhC0ydBVI9	1r59KUMNZRw0M8FDnrHq0o	6YnEvQjRcWyAAxm7dXNEfs	Come Check This	59
5V5BHmvpylV0nSc2Yu2Mu4	0dlDsD7y6ccmDm8tuWCU6F	41kOXEHM7PivRjZj4WX2Dl	All Alone	73
40mjsnRjCpycdUw3xhS20g	7A8S43ryYdbWpJKeHRZRcq	1Sf8GsXG32t0jNrX11xqWx	GATTI	75
4IIuCotvqijraSdnVLaFnM	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Beautiful Trip	49
6LyAwkJsHlW7RQ8S1cYAtM	0iEtIxbK0KxaSlF7G42ZOp	3IO8IPjwXuzPJnoaqkwYrj	Overdue (with Travis Scott)	75
6gBFPUFcJLzWGx4lenP6h2	0Y5tJX1MQlPlqiwlOH1tJY	42WVQWuf1teDysXiOupIZt	goosebumps	83
3mRlFZHUyvJbPTlkzg4LyJ	0H39MdGGX6dbnnQPt6NQkZ	6SInUyQqx0RZaVTSEioHkD	Roses	61
5B3b5qszWCl22HlzitMh7x	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Seu Tempo	19
1tX1GK4bLfoS9oDIIbhYAv	5m9PQtVJ9ZZVWgb3t2nTMN	4kN9CRrkFvXfiadphIZhwX	Keep Riding Me	54
4nuAslShoN77tq12fzwjUq	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Sad People	63
4xSY7Pxe3bveG1WOIIcYdr	4RKYu5o9e1MSd5eq3SYr9I	4STLPZr5CqrG9yHUvXP665	4loko	42
46M2hXnaQpueG7vSvgVtVH	0dlDsD7y6ccmDm8tuWCU6F	4KvTJJPmcAd1XJaO3UrARG	GTG	76
6AomCkEOQUODCYzQwH4SWC	5dHt1vcEm9qb8fCyLcB3HL	6bI4IQKBcLX0KsTjQ9NR97	Floor Seats	61
2cYqizR4lgvp4Qu6IQ3qGN	0Y5tJX1MQlPlqiwlOH1tJY	41GuZcammIkupMPKH2OJ6I	BUTTERFLY EFFECT	78
2p23H2gdnWEiGUEymqarpJ	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Jura de Vingança - Ao Vivo	25
3eekarcy7kvN4yt5ZFzltW	0Y5tJX1MQlPlqiwlOH1tJY	2uDTi1PlpSpvAv7IRAoAEU	HIGHEST IN THE ROOM	81
1ZM8toCOlnfBKJdvR8GqUq	0ONHkAv9pCAFxb0zJwDNTy	6o38CdD7CUlZDCFhjZYLDH	Rock N Roll (feat. Kanye West & Kid Cudi)	63
14eDzYfNRuqs1kf7zfIFJW	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	E Mirê Mirê - Ao Vivo	25
1dQtt3K8GyPmH7ZD1LJ2ox	7kA4sEagpoNK91I7wr9tYr	2HFagfqzSWiinz9jqcj4Q2	Hit List	43
24jP9hAAauSG4IH5zGji8a	0H39MdGGX6dbnnQPt6NQkZ	3FmLXejluSVOx2Gm8waHFs	Roses	27
2Guz1b911CbpG8L92cnglI	1SImpQO0GbjRgvlwCcCtFo	6TyPSzd5rA2rQ9yLJJ1Gg2	Your Guardian Angel	65
2MLuFz9Y3Vg3PF0Yf93M5c	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	800 db cloud	50
1x5ihkusmVWsQWtvSCtW9q	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	O Que é Ser Bom	15
0XLQyCwYu8dhhzWAKSs3wr	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	Paranauê / Corridos Regional	18
1fewSx2d5KIZ04wsooEBOz	0iEtIxbK0KxaSlF7G42ZOp	3IO8IPjwXuzPJnoaqkwYrj	Space Cadet (feat. Gunna)	80
1tzTiTLSRisnQiOnhgAdtF	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Lembranca do Mestre	14
1wAdcYWWPbcqiUcum9brWw	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Luta e Dança	7
2dy2C0StZ3yiEeb0Aoolcn	5CCwRZC6euC8Odo6y9X8jr	4xeVBTBwaVNQhUdIRC4G9s	Bang Bang	53
3WKrSWltDbNcY5M3haaFxQ	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Pedir o Axe Ii	9
1vvBUZseJ7fwYPX1NedOLd	0dlDsD7y6ccmDm8tuWCU6F	2SUBknzxng0iqBpKT9vzns	Cha Cha	71
4FeBA1bxkUae1aDsplsmrv	6PfSUFtkMVoDkx4MQkzOi3	0qnExDZfz0kVeBjixPsyjS	gec 2 Ü (Remix) [feat. Dorian Electra]	37
5SWnsxjhdcEDc7LJjq9UHk	1URnnhqYAYcrqrcwql10ft	6wTyGUWGCilBFZ837k5aRi	Runnin	79
643PW82aBMUa1FiWi5VQY7	13ubrt8QOOCPljQ2FL1Kca	3zOkSAbg9o7gQ3yXtZhx5v	Babushka Boi	66
6dLAFNEb2ufM0OjhPpMbFY	6PfSUFtkMVoDkx4MQkzOi3	0qnExDZfz0kVeBjixPsyjS	gecgecgec (Remix) [feat. Lil West and Tony Velour]	37
05BnyatUof9QNcvTXzdtW4	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Atirei Mas Nao Matei - Ao Vivo	23
4Amw1lKBUbmaanUTGzv77U	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	Marinheiro Só	29
0G88ZH0qqBCBbtrHnEDqrn	7HGNYPmbDrMkylWqeFCOIQ	49cBF5iGpJ7nx6EAR8BLga	Triste Bahia	19
7lzfMZak2HjNPXXSxksjPB	3qZ2n5keOAat1SoF6bHwmb	1SYy6QlPiObmtHW2PqpZWu	Camarão Que Dorme a Onda Leva	61
02a8cGumnKuEPgoCzmalJp	7HGNYPmbDrMkylWqeFCOIQ	4HCs1WxdaCTb8S1TlgUG9C	Sozinho - Ao Vivo	62
1EIWddhCtay8sMJeu58lvm	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	A Hora É Essa / Um Dia na Senzala	23
1Hn0iEB1FPfJzJPK49qVtH	7HGNYPmbDrMkylWqeFCOIQ	49cBF5iGpJ7nx6EAR8BLga	Mora Na Filosofia	20
2xmOKduEJr0OwXim7ngrGG	1AldSIJ8ANuZVbjKIhpKKq	2MQvu0dayEtaR5Y2uxX056	Axé	19
4RXnp2ZTi0CyetuM6xTcjg	4kEcRrHPFKoSlsHIhuCN2f	3fAptQHHbsV4bHHNjcGDG0	Malandragem	27
4cy68Rp4tdkCVoo8lj30F5	1AldSIJ8ANuZVbjKIhpKKq	3kUdjvoJpl53A2BLu56OvA	Chico Parauê	19
4q8CVsKQcAeNZ3RguQjmTU	1AldSIJ8ANuZVbjKIhpKKq	6FdbVYfwhJjaUOzYB7J9Uj	Iemanjá Rainha do Mar	19
7eiI2R22MxDNVLN7S9VqVH	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	Puxada de Rede	20
7z8F1kHqUvh8jA4hztNeU8	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	Eu Já Vivo Enjoado / Corridos de Angola	18
5DPASDOoVakOcD8EIhb46T	1MXZ0hsGic96dWRDKwAwdr	0imwCieoxougGmptrN1WAx	High Right Now (feat. Wiz Khalifa) - Remix	65
6Sm4XdGI7GhHG7sjVcVrI2	1AldSIJ8ANuZVbjKIhpKKq	6FdbVYfwhJjaUOzYB7J9Uj	Capoeira Não Pode Parar	12
044fQ35cLbMVwta0KyN5dM	7HGNYPmbDrMkylWqeFCOIQ	1EggMJbrddGeSyNjDzDRMI	Samba E Amor	40
2BvDFQOl4JieEGK2cgKOey	7oEkUINVIj1Nr3Wnj8tzqr	3eXCgCBM4BS6H83xmxKdL6	Andar com fé	59
3QKJELWORZZ7rUZDWeMWSA	5rX2c1zow6hCph8PnnU3kF	6haDxdERWK3rdVCGc2jr8E	Água de Beber	62
3zcBNmJH6ToRCI0WNEIuES	7oEkUINVIj1Nr3Wnj8tzqr	5tPEQtkCVKj17B9RlxDIKC	Esperando na janela	58
50c0knPGjaJAuE4hRg28Qq	1b8kpp4DUwt1hWaxTiWQhD	5NnAoeNFYhB4ypfoEX8e6H	Quando Você Olha Pra Ela	54
5JuWx9sV8TbtIMhiiPVbnz	7HGNYPmbDrMkylWqeFCOIQ	1EggMJbrddGeSyNjDzDRMI	Qualquer Coisa	45
5YctcwZCRMxlIHDpTuqKOE	1b8kpp4DUwt1hWaxTiWQhD	5Tk4wmf1IgEPPq36yD4G7Z	Baby - Ao Vivo	57
6sKopGG4r21ObTE8V6pD6x	1b8kpp4DUwt1hWaxTiWQhD	1Vjf7xPNvBhqKnAR4rAXR2	Força Estranha	55
78BnUN9YVNWCZ3cqPDOpvp	1AldSIJ8ANuZVbjKIhpKKq	3TCEm1O6JANZ1H55BPZ48L	Aqui pra Ele	4
78I8jaChZbPu72bIGGPMKk	1b8kpp4DUwt1hWaxTiWQhD	4jY3KTb8z9OZiIM92pTuNe	Lágrimas Negras	53
7kdyc52WSOnaYetBSS4mE5	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Brilha o Mundo	16
5Ikos3uiBfPYAf7EZfz8t3	2FW6Zt8gyIF7Fb7O3TGxnE	1wG4O32OX2POpj77Cstqk7	Sonho Meu	60
1M1B2Bk0EsaSmgkac8EGZb	1AldSIJ8ANuZVbjKIhpKKq	3TCEm1O6JANZ1H55BPZ48L	Extasiado	2
1zkUmmdxUJbMw52fVEjWUN	1AldSIJ8ANuZVbjKIhpKKq	3TCEm1O6JANZ1H55BPZ48L	Cristal	3
2wL88cvKXUOfHuYVd62hji	7oEkUINVIj1Nr3Wnj8tzqr	3qoUU8sm4eBT5POFHQSl5L	Palco	53
3Y9wdXMh6sNt9fUwUqTqb7	5bUj39bg0zEbRzjUEISMG9	1FpzNqDbugk77xUj0qOrtQ	Twisted Nerve	55
43HM6P2yX7ls3q92qrkhL4	1AldSIJ8ANuZVbjKIhpKKq	3TCEm1O6JANZ1H55BPZ48L	Pimenta	2
6S9lcjREUTU4Yv5y7oMcv2	5MZqcO35TJh5QXaFmvXmUy	1FpzNqDbugk77xUj0qOrtQ	Woo Hoo	45
1O5pf5R8xvppS2pD03HVy5	0Mz5XE0kb1GBnbLQm2VbcO	5gK2l2LgWY0BA4p9uy27z6	May-December	39
20I1Mickm2w7qGxk7uzOKr	0av074qUwLn5eyzwqoq3xh	7gkngZkZ51RJBzWUkU8uZ4	Graffiti on a High School Wall	40
4PmJRTntkZRVG6kiVljmlA	0oXFsuB6XBuDTsXJgplR7k	1v3KoZERdNZ6ddhseotXzx	Raoui	24
4mn5HdatHKN7iFGDes9G8i	2PmIyxmEFsNfQJjEifPDZC	1VGVJdmvOSRK2w9RKXk18A	Who's Ready for Tomorrow	77
5RfZC411UVifpYPOmzfgyl	0oXFsuB6XBuDTsXJgplR7k	1v3KoZERdNZ6ddhseotXzx	Hayati	5
7cEfPAbju7glmdAgT4e1AU	7HGNYPmbDrMkylWqeFCOIQ	64JvR5shy7j04mTiX0wfNp	Cajuína - Remixed Original Album	54
0JL9TZip7mL7iwC5EOkALS	3Rq3YOF9YG9YfCWD4D56RZ	5FrjDW96mCYw9ECc74c637	Lady Brown (feat. Cise Starr from CYNE)	58
0Nkp56EKreoWMYxpXJqUNZ	23cC3RI0hgD5sWmXKPAJuG	1uGIwfw9F1lR7TDDukbNyQ	Wandering Ways	53
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.users (user_id, display_name, profile_photo) FROM stdin;
12163992542	Batty Brulée	https://scontent-ord5-1.xx.fbcdn.net/v/t1.18169-1/16831043_1799099963690897_4632021165186679885_n.jpg?stp=dst-jpg_p320x320&_nc_cat=100&ccb=1-7&_nc_sid=0c64ff&_nc_ohc=CBY9uZLsSIMAX_31x44&_nc_ht=scontent-ord5-1.xx&edm=AP4hL3IEAAAA&oh=00_AfAdFYcmvUWrVkvpmnzoqWpDPI-b1_-2fufBuMYIeIJhGQ&oe=63954C54
the_real_wjdhollow	the_real_wjdhollow	https://i.scdn.co/image/ab6775700000ee85d1872696f7133856770fdc4c
\.


--
-- Name: artists_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cnicosia
--

SELECT pg_catalog.setval('public.artists_genres_id_seq', 163, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cnicosia
--

SELECT pg_catalog.setval('public.items_id_seq', 500, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- Name: artists_genres artists_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_pkey PRIMARY KEY (id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (track_id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (track_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: albums albums_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- Name: artists_genres artists_genres_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- Name: artists_genres artists_genres_genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres
    ADD CONSTRAINT artists_genres_genre_fkey FOREIGN KEY (genre) REFERENCES public.genres(genre);


--
-- Name: features features_track_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.tracks(track_id);


--
-- Name: items items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: tracks tracks_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- Name: tracks tracks_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id);


--
-- PostgreSQL database dump complete
--

