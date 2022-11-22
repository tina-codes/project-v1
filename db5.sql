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
-- Name: friends; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.friends (
    friend_id integer NOT NULL,
    f1_id character varying(30),
    f2_id character varying(30)
);


ALTER TABLE public.friends OWNER TO cnicosia;

--
-- Name: friends_friend_id_seq; Type: SEQUENCE; Schema: public; Owner: cnicosia
--

CREATE SEQUENCE public.friends_friend_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friends_friend_id_seq OWNER TO cnicosia;

--
-- Name: friends_friend_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cnicosia
--

ALTER SEQUENCE public.friends_friend_id_seq OWNED BY public.friends.friend_id;


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
    profile_photo character varying,
    created integer NOT NULL,
    last_login integer NOT NULL
);


ALTER TABLE public.users OWNER TO cnicosia;

--
-- Name: artists_genres id; Type: DEFAULT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.artists_genres ALTER COLUMN id SET DEFAULT nextval('public.artists_genres_id_seq'::regclass);


--
-- Name: friends friend_id; Type: DEFAULT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.friends ALTER COLUMN friend_id SET DEFAULT nextval('public.friends_friend_id_seq'::regclass);


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
1ZH5g1RDq3GY1OvyD0w0s2	3RGLhK1IP9jnYFH4BRFJBS	Combat Rock (Remastered)	1982	https://i.scdn.co/image/ab67616d0000b27325a4df452a3c42ccc2e9288b
48D1hRORqJq52qsnUYZX56	0oSGxfWSnnOXhD2fKuz2Gy	The Rise and Fall of Ziggy Stardust and the Spiders from Mars (2012 Remaster)	1972	https://i.scdn.co/image/ab67616d0000b273c41f4e1133b0e6c5fcf58680
2FZNWUmgRoP8uJZBaHJdfj	7lzordPuZEXxwt9aoVZYmG	Rebel Yell	1983	https://i.scdn.co/image/ab67616d0000b273ea07dca8b4ca808c1e5b17fb
2jnV6ytZOmt71iEC5xHEYz	33EUXrFKGjpUSGacqEHhU4	Lust For Life	1977	https://i.scdn.co/image/ab67616d0000b2734aa5f679427e35409a06f225
02OIGj20Ltaa8rN8mKsHBT	2CVBumuL5KyztqCyo7CETY	Jet Boy	1978	https://i.scdn.co/image/ab67616d0000b27360b02c400bf170f44f8c75d9
440zYLMcBZhHc93WSGKDKo	5aBEGOeWQCJfptic9xyaAb	Everything!	1984	https://i.scdn.co/image/ab67616d0000b273768d2a36068dd1adcaa1f31b
3gz1CZk5wFg2inBuUWDa8x	2ZfogSsOWP4mVfEqfpLXCt	Starfish	1988	https://i.scdn.co/image/ab67616d0000b2734b75b4c598bbf7c852d3b3fe
1K4t7Jv7DuolDWnFLxKxkd	3gdbcIdNypBsYNu3iiCjtN	Wild Planet	1980	https://i.scdn.co/image/ab67616d0000b273b58eccb715f3e9af608dec26
7bDSKEP1qhybTrrLhXw1D3	0rpMdBzQXf7aYRnu5fDBJy	Add It Up (1981-1993)	1993	https://i.scdn.co/image/ab67616d0000b273b66f42e3ea8fc573cb576883
5Y0p2XCgRRIjna91aQE8q7	3yY2gUcIsjMr8hjo51PoJ8	The Queen Is Dead	1986	https://i.scdn.co/image/ab67616d0000b273ada101c2e9e97feb8fae37a9
2qcwXvluk9iFwNNg4eDBXm	0Zy4ncr8h1jd7Nzr9946fD	Night Time	1985	https://i.scdn.co/image/ab67616d0000b2736a0553ce3c8ed791ef923887
0UHxylrPIp6GtS7EJlfwRU	2to6ZW4W0XOZZsztSErr0b	텔 미 썸딩 Original Motion Picture Soundtrack	2013	https://i.scdn.co/image/ab67616d0000b2731c645c5d77965301276531a7
5Tpor3YZBVEJ9tWD5L31mH	3fhOTtm0LBJ3Ojn4hIljLo	Siren	1975	https://i.scdn.co/image/ab67616d0000b27362568953d4c4141c140df9ba
3MANoCcmaHWeXSuWiO3iVo	4BFMTELQyWJU1SwqcXMBm3	The Stooges	1969	https://i.scdn.co/image/ab67616d0000b273a7d2baa04a56c87de579db69
3nD9Oab8M4sCLNmqmwSOdA	4JfFdF9Row7UXtdsKtT6tc	Let My People Go	2005	https://i.scdn.co/image/ab67616d0000b2733d0128eee321aae2467aec37
0vuwlanMPucXrYMGnOjhYL	0EdvGhlC1FkGItLOWQzG4J	40oz. To Freedom	1992	https://i.scdn.co/image/ab67616d0000b273d77299e3d29f44495cd7fbcb
4yP0hdKOZPNshxUOjY0cZj	1Xyo4u8uXC1ZmMpatF05PJ	After Hours	2020	https://i.scdn.co/image/ab67616d0000b2738863bc11d2aa12b54f5aeb36
4qZBW3f2Q8y0k1A84d4iAO	1Xyo4u8uXC1ZmMpatF05PJ	My Dear Melancholy,	2018	https://i.scdn.co/image/ab67616d0000b2731f6a2a40bb692936879db730
2ODvWsOgouMbaA5xf0RkJe	1Xyo4u8uXC1ZmMpatF05PJ	Starboy	2016	https://i.scdn.co/image/ab67616d0000b2734718e2b124f79258be7bc452
4AdZV63ycxFLF6Hcol0QnB	1Xyo4u8uXC1ZmMpatF05PJ	Starboy	2016	https://i.scdn.co/image/ab67616d0000b273a048415db06a5b6fa7ec4e1a
0JA38Ekhsv43y2lBj5GQkQ	3hteYQFiMFbJY7wS0xDymP	Hyperion	2019	https://i.scdn.co/image/ab67616d0000b273011a2f51fe757fafe13a0c2e
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
3q44ueZD50lWp4BXm0GDcE	5wFXmYsg3KFJ8BDsQudJ4f	No Rule	2022	https://i.scdn.co/image/ab67616d0000b2735f351a814bf3bdb55522f531
1RHlOUoinOK5WZconLM6lp	0e9H8oaYYRCKFXOVv848nt	II	2012	https://i.scdn.co/image/ab67616d0000b27309757116183d1d28472dfcd1
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
3tRmxSQyoyXXwcVDcUFQic	55fhWPvDiMpLnE4ZzNXZyW	July (feat. Leon Bridges)	2019	https://i.scdn.co/image/ab67616d0000b273acebb58ea70a6e5ff1c4d261
4HFO9PDRxsdbcegkcNhxgz	2mVVjNmdjXZZDvhgQWiakk	Texas Sun	2020	https://i.scdn.co/image/ab67616d0000b273ff26bd277274b27f249cc638
7J9fifadXb0PPSBWXctbi8	3qnGvpP8Yth1AqSBMqON5x	Good Thing	2018	https://i.scdn.co/image/ab67616d0000b273a47ee7a49c53ccdcb38dc874
2Xs9xSBhvyo8F6daRc1npu	2mVVjNmdjXZZDvhgQWiakk	Texas Moon	2022	https://i.scdn.co/image/ab67616d0000b27328e12bc569f20d9f8ebff84c
03HMOcANauhLD0WNrMkmLU	60df5JBRRPcnSpsIMxxwQm	The Dock of the Bay (Mono)	1968	https://i.scdn.co/image/ab67616d0000b27313a5da9563c438059afa7ad4
2BFOk5b8jjm2xmsbx7qXq3	60df5JBRRPcnSpsIMxxwQm	Pain in My Heart	1964	https://i.scdn.co/image/ab67616d0000b273cd404b5ae961b29d83f17c1f
3mdKPgJ2hyDF9ToznWuCn1	60df5JBRRPcnSpsIMxxwQm	Dock of the Bay Sessions	2018	https://i.scdn.co/image/ab67616d0000b273dec4d47f98dc7f1cccbcf6f7
25uNcuL4dAoV62eKmr8Q0Y	60df5JBRRPcnSpsIMxxwQm	Complete & Unbelievable: The Otis Redding Dictionary of Soul	1966	https://i.scdn.co/image/ab67616d0000b273ffffe932598090498459b77c
68BCjMsHX4Gf11BJSkjwGz	60df5JBRRPcnSpsIMxxwQm	Otis Blue: Otis Redding Sings Soul (Collector's Edition)	1965	https://i.scdn.co/image/ab67616d0000b27309cdd247bd06fb04470aa4b8
004EYz2DQttcGvyTQGDmLp	60df5JBRRPcnSpsIMxxwQm	Merry Christmas Baby / White Christmas	1968	https://i.scdn.co/image/ab67616d0000b27345713a34053456e3a375511e
5K3FfkoIozJuEOhiwOm5SR	60df5JBRRPcnSpsIMxxwQm	Love Man	1969	https://i.scdn.co/image/ab67616d0000b273a9ccf78623346eacd99a5cb6
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
6wRjGQayCybNhsUiTJdXcc	1zXCFUgH6FWS0iCiCKsH55	Chokin' & Wicked	2021	https://i.scdn.co/image/ab67616d0000b2734129358b74c9b12dff8e4426
4jWRGEF8uP4vadXsot9SwK	1zXCFUgH6FWS0iCiCKsH55	Drowning in the XXX	2021	https://i.scdn.co/image/ab67616d0000b273839ff29348a49923e7a8e90f
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
0PhJJToPch4jCjrfQjyarw	6RZUqkomCmb8zCRqc9eznB	Black Market Music	2000	https://i.scdn.co/image/ab67616d0000b27393deba59f323074beff846ff
19upQOw6eZRsGUGqGe6zF1	6RZUqkomCmb8zCRqc9eznB	Never Let Me Go	2022	https://i.scdn.co/image/ab67616d0000b2730c8a0bd4dbdd57692580ebb7
7q6zjWaLw8bN5nYiBWjrus	2PaZWGu5T5nHjY2xxAkFsT	THE SCOTTS	2020	https://i.scdn.co/image/ab67616d0000b27311d6f8c713ef93a9bb64ddfe
0InO6eGRL47KErEYEoc2rP	0fA0VVWsXO9YnASrzqfmYu	Man On The Moon II: The Legend Of Mr. Rager	2010	https://i.scdn.co/image/ab67616d0000b2735a750965d0ad3f11cac34628
38MFjDPIDJFfLF7IVpe1rv	0fA0VVWsXO9YnASrzqfmYu	Pursuit Of Happiness [Extended Steve Aoki Remix (Explicit)]	2012	https://i.scdn.co/image/ab67616d0000b273fe7908b7666690bf4e83ce14
2S8AWAM0nxyFy66YnUfIs3	0fA0VVWsXO9YnASrzqfmYu	Man On The Moon: The End Of Day (Deluxe)	2009	https://i.scdn.co/image/ab67616d0000b273a487deeecb334b6619489d74
64nbgEEIcY4g1ElVLONJ0w	0fA0VVWsXO9YnASrzqfmYu	Man On The Moon III: The Chosen	2020	https://i.scdn.co/image/ab67616d0000b2739bf7698a1737bc7c2e4a14f3
19ZYOtXGdqGpeeDS9SJccD	0fA0VVWsXO9YnASrzqfmYu	The Boy Who Flew To The Moon (Vol. 1)	2022	https://i.scdn.co/image/ab67616d0000b273ef3b5a279ee075749b67e0a7
08eM9GRdr5BCCHNqS3Wwud	0fA0VVWsXO9YnASrzqfmYu	Man On The Moon II: The Legend Of Mr. Rager	2010	https://i.scdn.co/image/ab67616d0000b27359e842b6a3566a141f27f815
4aW4iDepQUl5ZCHd1Gli68	0fA0VVWsXO9YnASrzqfmYu	Entergalactic	2022	https://i.scdn.co/image/ab67616d0000b27371cecf4c653a4bad539da13d
6CL2rdgPpUEXwWsNjexAZ5	6ZK2nrW8aCTg8Bid7I7N10	Unknown Rooms: A Collection of Acoustic Songs	2012	https://i.scdn.co/image/ab67616d0000b273d8a8886714a9acb17f5e721d
1nnenAgIzIipcodyg879Vx	6ZK2nrW8aCTg8Bid7I7N10	Hiss Spun	2017	https://i.scdn.co/image/ab67616d0000b2735c0c56da48597a58cba6f7b5
4rpm9Ez8nfVsQvNmHDbgyp	6ZK2nrW8aCTg8Bid7I7N10	Pain Is Beauty	2013	https://i.scdn.co/image/ab67616d0000b2735af1139fdb81e5b88ae3fffd
0lfEFhkPJdimjfkEIjRfZg	0erhjm5MwzWpFRFuorXLT2	Sing More Songs Together...	2014	https://i.scdn.co/image/ab67616d0000b2733cf65808636c5ad4914a1c8d
3Lm4wFlCjymVuRKZ0Z6X94	6ZK2nrW8aCTg8Bid7I7N10	Anhedonia	2021	https://i.scdn.co/image/ab67616d0000b273afea2d268509f9bb20e62c08
6bpgmfwTWBLxT7VuS1phjL	6ZK2nrW8aCTg8Bid7I7N10	Birth of Violence	2019	https://i.scdn.co/image/ab67616d0000b273a351e05ddf1b29a412fa2c2b
7L7IKHnLWh6gIIYNDnZtQ8	6ZK2nrW8aCTg8Bid7I7N10	Oui Oui Marie (From the Original Motion Picture "X")	2022	https://i.scdn.co/image/ab67616d0000b273abef86e564bb02d46d52bd41
6GKPfddXwFKV5pmJANiIBx	6ZK2nrW8aCTg8Bid7I7N10	Sing Songs Together...	2013	https://i.scdn.co/image/ab67616d0000b27311c868533e5b1c97751f61d7
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
31rLr6NpNw9wggFD4QGfhD	6v8FB84lnmJs434UJf2Mrm	Neil Young at Live Aid (Live at John F. Kennedy Stadium, 13th July 1985)	2018	https://i.scdn.co/image/ab67616d0000b2735171b7ace22c5e9bd6925b3e
1AWbIu7wKGqsL7be4NlEyY	5M0lbkGluOPXLeFjApw8r8	Campfire (with DRAM & Neil Young) [From Bright: The Album]	2017	https://i.scdn.co/image/ab67616d0000b273526bfde28e823ee55229ae20
15t7NAV9KXOtPo7HefS39H	6v8FB84lnmJs434UJf2Mrm	Live 8 (Live, July 2005)	2005	https://i.scdn.co/image/ab67616d0000b273df64c5a536d673d865b6d417
0zwNzImUq6DykNGghNGffs	6v8FB84lnmJs434UJf2Mrm	Greatest Classic Hits	2022	https://i.scdn.co/image/ab67616d0000b273506e7a2b8204c583e35c7267
4ErXAsdor9LnNuLW4xyzRI	7nqSDaZKccpnUqjzedyZF4	Dead Tracks, Vol. 2	2019	https://i.scdn.co/image/ab67616d0000b273a1d62f9cc9a04c58f5470b8f
6r5e7Kryn9PUFiwofr19K0	3QTDHixorJelOLxoxcjqGx	Nothing Even Matters	2022	https://i.scdn.co/image/ab67616d0000b27302bb0c2402a6c95905572851
5zdFKRmlSDwAMZ5NFVGbx9	3QTDHixorJelOLxoxcjqGx	November	2018	https://i.scdn.co/image/ab67616d0000b2736892023452c99d13a58c7647
5zUDvKAyEKkrhYLWJJWGPQ	3QTDHixorJelOLxoxcjqGx	Chasing Summer	2019	https://i.scdn.co/image/ab67616d0000b273bbee5481e94a03f4fd26fac4
2rMvlXjrgjenPKNBK6ze0q	3QTDHixorJelOLxoxcjqGx	Satisfaction	2022	https://i.scdn.co/image/ab67616d0000b2732c3b34c1a8ec7bf920bcd097
6rdfmpRVrUn1B7Q8rSCHZj	3QTDHixorJelOLxoxcjqGx	Life Is Good (feat. Scribz Riley)	2022	https://i.scdn.co/image/ab67616d0000b2731eb2ec82ec94ded09faeef4a
1YbSlMGiAAaTfR9Kk9HNxk	0qu422H5MOoQxGjd4IzHbS	Mono No Aware	2017	https://i.scdn.co/image/ab67616d0000b2735eef4a5a0481a08f2cf993c3
3A290H1hI6mUv3uxGDrLlr	0qu422H5MOoQxGjd4IzHbS	God Is a Circle	2022	https://i.scdn.co/image/ab67616d0000b2733fca270016babbe02dec8f27
0oMXn0MNLNyvB4iJPZXOuV	3rWZHrfrsPBxVy692yAIxF	<COPINGMECHANISM>	2022	https://i.scdn.co/image/ab67616d0000b2734979d551303fc09a92dc59e2
1IpYZkYoYCjXTYMDEW8Ksk	0qu422H5MOoQxGjd4IzHbS	Safe In The Hands of Love	2018	https://i.scdn.co/image/ab67616d0000b273f5533d680fa116232aa10cbc
2julo3Z5rNzSod7DoEuTz7	0qu422H5MOoQxGjd4IzHbS	The Asymptotical World EP	2021	https://i.scdn.co/image/ab67616d0000b2733cb460f372c84a76dda0001d
2wqG59dVVQlJaxoO7N0LJt	3ycxRkcZ67ALN3GQJ57Vig	Lady Lady	2018	https://i.scdn.co/image/ab67616d0000b273f1814f1b76df2fa196e4f45e
1S0yIZRDiFmqCQyTIEV175	3ycxRkcZ67ALN3GQJ57Vig	Studying Abroad: Extended Stay	2020	https://i.scdn.co/image/ab67616d0000b273472da7a855e1446b36bcb83b
5DxMTCWwHlaz4Hx1og50xL	3ycxRkcZ67ALN3GQJ57Vig	Navajo	2017	https://i.scdn.co/image/ab67616d0000b27328f137f2d8bda3ddd5d045cf
0jKDicrmgUCTSNGRYXffXm	3ycxRkcZ67ALN3GQJ57Vig	Say You Want Me	2022	https://i.scdn.co/image/ab67616d0000b2733c94dda877e3e932283f37a4
3myUd2MqJKr3rfUrAf41Us	5Vuvs6Py2JRU7WiFDVsI7J	Good & Plenty (Remix)	2021	https://i.scdn.co/image/ab67616d0000b273f3b85f8964b3d2949cc24327
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
0ORZb7kyr8aaP2LpL3mhuY	75dQReiBOHN37fQgWQrIAJ	Violet Street	2019	https://i.scdn.co/image/ab67616d0000b273daf19ee32be2d4917c266b09
2qiPY1CqHGexT4yWrQ5uX0	75dQReiBOHN37fQgWQrIAJ	Sunlit Youth	2016	https://i.scdn.co/image/ab67616d0000b2731b7b6f5cc146a35bfb545d82
4DZlJSUZnQUFMv4nW6Ijgv	75dQReiBOHN37fQgWQrIAJ	Dark Days [Feat. Sylvan Esso]	2020	https://i.scdn.co/image/ab67616d0000b273d37160b8c64ec946bc4377cc
5OWYHfYE5Pf06BEkSLPV2W	75dQReiBOHN37fQgWQrIAJ	I Saw You Close Your Eyes	2017	https://i.scdn.co/image/ab67616d0000b2734938af96a9ff8e8908ff2c03
6xfQHjndhrWjgENyEK0z7x	75dQReiBOHN37fQgWQrIAJ	Just Before The Morning	2022	https://i.scdn.co/image/ab67616d0000b2732c97d5f81245b803825e39e6
2cIpJDijNEoHv88jJKwDID	75dQReiBOHN37fQgWQrIAJ	Gorilla Manor	2010	https://i.scdn.co/image/ab67616d0000b2734203f138ac5fed176cfd6bf9
5M50Jray1eYGOW5gkTzUjT	75dQReiBOHN37fQgWQrIAJ	Desert Snow / Hourglass	2022	https://i.scdn.co/image/ab67616d0000b2732640490a2d392eca6f6790f1
1Zmq4tEgCSyTkud2ahysrq	75dQReiBOHN37fQgWQrIAJ	Hummingbird	2013	https://i.scdn.co/image/ab67616d0000b27312843952346aaa03f1f67970
2WedBViHbzk10PflnQhNOg	75dQReiBOHN37fQgWQrIAJ	Music From The Pen Gala 1983	2021	https://i.scdn.co/image/ab67616d0000b27337d7eeeb72ed2ae4430b670b
2gUufHW7CcgULEywXTQHk4	2pAajGWerK3ghwToNWFENS	Conditions Of My Parole	2011	https://i.scdn.co/image/ab67616d0000b273c63aeb02e90010db90f7dead
5dKl1Mg0MWV7m4Yhu76b9F	2pAajGWerK3ghwToNWFENS	C Is For (Please Insert Sophomoric Genitalia Reference Here)	2009	https://i.scdn.co/image/ab67616d0000b273143386236cdd8bfec16fbc19
6yDwA52kX9NSG21aNTWAuW	2pAajGWerK3ghwToNWFENS	V Is For Vagina (Deluxe)	2007	https://i.scdn.co/image/ab67616d0000b2733f55e66734c050f72b96250f
6MyJhSzVSOravLjL5hpFMk	2pAajGWerK3ghwToNWFENS	Money Shot	2015	https://i.scdn.co/image/ab67616d0000b273fb4f3561a4cd7f7aaef9ca7f
67tFctzjZBBPEU0E8QJwUp	2pAajGWerK3ghwToNWFENS	Sound Into Blood Into Wine	2010	https://i.scdn.co/image/ab67616d0000b273b4a494f199635fcc89ca4046
6SZJfUHQDgW9GVXr3mmQIT	2pAajGWerK3ghwToNWFENS	Donkey Punch The Night	2013	https://i.scdn.co/image/ab67616d0000b2731a090569b265995773d3d12f
64tP0vzCmjHKKJY3PnoLZM	2pAajGWerK3ghwToNWFENS	Don't Shoot The Messenger	2007	https://i.scdn.co/image/ab67616d0000b27386cb1c0cc5329165fc412dcd
4eYJzO460ZGaEFNJ4YCizR	2pAajGWerK3ghwToNWFENS	Existential Reckoning	2020	https://i.scdn.co/image/ab67616d0000b273ee7a2c484f036dad15aa9a27
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
1peaWfJtqMtLmqKK79Cpxu	7HeVXdOdMhLslVputGTZFQ	Timber Timbre	2009	https://i.scdn.co/image/ab67616d0000b273491194f0fea2ddb08367e44d
2tWkGlUTyWZcVsqryi8U1q	7HeVXdOdMhLslVputGTZFQ	Creep On Creepin' On	2011	https://i.scdn.co/image/ab67616d0000b273d4e5892341fbc81751662d3b
49I6QGpLjGJYC9WlyMEPhG	7HeVXdOdMhLslVputGTZFQ	Sincerely, Future Pollution	2017	https://i.scdn.co/image/ab67616d0000b273f69a5e14a18f784fad63c42a
5xINyvUV0bHyJxBdFTT8xI	7HeVXdOdMhLslVputGTZFQ	Dissociation Tapes, Volume 1	2021	https://i.scdn.co/image/ab67616d0000b273ae460712b0eebc55493b83e6
4hTlbmXBvgkbvOmvKJFVP3	6CWTBjOJK75cTE8Xv8u1kj	Arts & Crafts: X	2013	https://i.scdn.co/image/ab67616d0000b273fe1358f9a10061d2e9c2ddef
7lWcFkeeWhnaEFJygxwvg9	7HeVXdOdMhLslVputGTZFQ	Medicinals	2007	https://i.scdn.co/image/ab67616d0000b273a4fd8e96a7237975d4996b66
7fJMKBNqYWhvWDs560x6nn	4AKwRarlmsUlLjIwt38NLw	Katchi (Ofenbach vs. Nick Waterhouse)	2017	https://i.scdn.co/image/ab67616d0000b273ea926e8fceb6e4f411144a8f
0QgLeJOCYZN6V9kUTlgNHu	5wFXmYsg3KFJ8BDsQudJ4f	The Gold (Nick Waterhouse Remix)	2017	https://i.scdn.co/image/ab67616d0000b273f7b82d970070a270a1cd06d6
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
4I5zzKYd2SKDgZ9DRf5LVk	0oSGxfWSnnOXhD2fKuz2Gy	"Heroes" (2017 Remaster)	1977	https://i.scdn.co/image/ab67616d0000b273204f41d52743c6a9efd62985
72mfhbEsMtXR6s7v9UhKe3	0oSGxfWSnnOXhD2fKuz2Gy	Diamond Dogs (2016 Remaster)	1974	https://i.scdn.co/image/ab67616d0000b273ad22c83a6e1567f8453c32b3
1ay9Z4R5ZYI2TY7WiDhNYQ	0oSGxfWSnnOXhD2fKuz2Gy	David Bowie (aka Space Oddity) [2015 Remaster]	1969	https://i.scdn.co/image/ab67616d0000b2733395f3e809dfbc2b1101d464
6fQElzBNTiEMGdIeY0hy5l	0oSGxfWSnnOXhD2fKuz2Gy	Hunky Dory (2015 Remaster)	1971	https://i.scdn.co/image/ab67616d0000b273e464904cc3fed2b40fc55120
4NwG11AsDJluT732lSjMrV	0oSGxfWSnnOXhD2fKuz2Gy	Let's Dance (2018 Remaster)	1983	https://i.scdn.co/image/ab67616d0000b273db0917ddd4139153bc1d1a1a
75614DWrksimeV4oXUhaYP	2kGBy2WHvF0VdZyqiVCkDT	Real Love Baby	2016	https://i.scdn.co/image/ab67616d0000b273ae421754a904f1a5178ebb33
2CXVonfqGwTQu8dgr2qkNS	2kGBy2WHvF0VdZyqiVCkDT	Fear Fun	2012	https://i.scdn.co/image/ab67616d0000b273d5a452acd98e9f820ba1d11c
3hL6ZIcwV6zUfqRiPLPBLJ	00FQb4jTyendYWaN8pK0wa	Buddy's Rendezvous	2022	https://i.scdn.co/image/ab67616d0000b273c210a1bace4b8731308775a9
4vTEFCLgDEgKIQXTrsmS6F	2kGBy2WHvF0VdZyqiVCkDT	I Love You, Honeybear	2015	https://i.scdn.co/image/ab67616d0000b2731c483b9ccbabc97c8835fc94
2tfg6zi5pwuYeQ0IHYnOBz	2kGBy2WHvF0VdZyqiVCkDT	Chloë and the Next 20th Century	2022	https://i.scdn.co/image/ab67616d0000b273f3fbf687c0fa8a10140a8e2a
4Csoz10NhNJOrCTUoPBdUD	68kEuyFKyqrdQQLLsmiatm	Summertime '06	2015	https://i.scdn.co/image/ab67616d0000b27386f51d101637fd4dc59fc32a
2G549zeda2XNICgLmU0pNW	68kEuyFKyqrdQQLLsmiatm	RAMONA PARK BROKE MY HEART	2022	https://i.scdn.co/image/ab67616d0000b2739fd6f55c35811d79d01f94ef
09VyQ2zwUx0EBKTJNBUZv1	68kEuyFKyqrdQQLLsmiatm	Yo Love (From "Queen & Slim: The Soundtrack")	2019	https://i.scdn.co/image/ab67616d0000b273aac370232c213219c3c9d47c
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
11R59ESDiW114ngszKUkyH	251UrhgNbMr15NLzQ2KyKq	If I Were A Butterfly	2022	https://i.scdn.co/image/ab67616d0000b2735da660c233b7cc4f47bdb87a
6cI1XoZsOhkyrCwtuI70CN	3yY2gUcIsjMr8hjo51PoJ8	The Smiths	1984	https://i.scdn.co/image/ab67616d0000b273a09b231129ab1cb1a6efc57f
1j57Q5ntVi7crpibb0h4sv	3yY2gUcIsjMr8hjo51PoJ8	Hatful of Hollow	1984	https://i.scdn.co/image/ab67616d0000b273786b44c75ebf915866523f5b
45StnugV9WQMQwk4rRoTy8	3yY2gUcIsjMr8hjo51PoJ8	Louder Than Bombs	1987	https://i.scdn.co/image/ab67616d0000b273ed3953f8af1f764a146b7583
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
5mi7FKaWE5CtcOjdyxScA7	165ZgPlLkK7bf5bDoFc6Sb	Chocolate Starfish And The Hot Dog Flavored Water	2000	https://i.scdn.co/image/ab67616d0000b2734a31b146c7cf07705d912efe
0L9rBwT5kUeKlwg7HOqwUU	3s7WzrEs4FkNObqj4WyfQm	Long Live DJ Shay	2022	https://i.scdn.co/image/ab67616d0000b273287f3ce80f21b0d0eaeda5d5
2PXyfq0RX8BpA1NfOhnFaJ	6GEykX11lQqp92UVOQQCC7	Our Streets (feat. A$AP Ferg) (feat. A$AP Ferg)	2017	https://i.scdn.co/image/ab67616d0000b2739c8f80bb92d5a4289109a8df
4mLRYZaEEXZn5Ze3gxqtsf	6GEykX11lQqp92UVOQQCC7	Headlines (feat. Westside Gunn, Conway & Benny)	2019	https://i.scdn.co/image/ab67616d0000b273da019b592a2e98188cea6875
6SFd0NeIrUfZoqCSjoFpe8	4nvFFLtv7ZqoTr83387uK4	A Giant Step	2014	https://i.scdn.co/image/ab67616d0000b273bfa3b54c5b632d077ad792c7
0Ojio25IPzIrw1rUmgrhrG	0rpMdBzQXf7aYRnu5fDBJy	Violent Femmes	1983	https://i.scdn.co/image/ab67616d0000b27354096a7f898de0233d76f626
1P29pi4JtRPZfpMPnEhCLS	0rpMdBzQXf7aYRnu5fDBJy	Why Do Birds Sing?	1991	https://i.scdn.co/image/ab67616d0000b2732e9a7873e05ab5d2ccf8ed29
69BYin03rGTRdyDChYBxfr	0rpMdBzQXf7aYRnu5fDBJy	Permanent Record: The Very Best Of The Violent Femmes	2005	https://i.scdn.co/image/ab67616d0000b2739a2825f07be644ff8bced40a
2nb3J8l5RKHOU3R4oTQP9u	0rpMdBzQXf7aYRnu5fDBJy	Hallowed Ground	1984	https://i.scdn.co/image/ab67616d0000b273cce256033cf7efe78a7f6cbe
7EfgATnOllXJ96s4sSdzei	1anAI9P9iSzc9qzLv6AtHZ	Sure Sure	2018	https://i.scdn.co/image/ab67616d0000b273140791666d7a1b2c899ed946
31t6VcIOZ3WqsSH2F9Zcy0	1anAI9P9iSzc9qzLv6AtHZ	Spirit Mission	2022	https://i.scdn.co/image/ab67616d0000b2731f2af841a559bc01448905ef
25gXJ8YPQpkC9fUEF5Wxlt	1anAI9P9iSzc9qzLv6AtHZ	What's It Like?	2019	https://i.scdn.co/image/ab67616d0000b2733367807e50d5163ecc0ccb16
22rxIV4YCzp5LpFPDt95Kc	1anAI9P9iSzc9qzLv6AtHZ	Songs from 2014	2016	https://i.scdn.co/image/ab67616d0000b27384e7e4beb620014e8a71ed08
3Yko2SxDk4hc6fncIBQlcM	2auiVi8sUZo17dLy1HwrTU	A Seat at the Table	2016	https://i.scdn.co/image/ab67616d0000b2731c4540d0ecafaa45305aa5a0
4WF4HvVT7VjGnVjxjoCR6w	2auiVi8sUZo17dLy1HwrTU	When I Get Home	2019	https://i.scdn.co/image/ab67616d0000b273b1150f77ae2fbf0d5b4715fc
6VCjvboIlNJ3N881Xja6ng	2auiVi8sUZo17dLy1HwrTU	Losing You	2012	https://i.scdn.co/image/ab67616d0000b2734c6a71f3fc50ec1fce3f8f28
50j4Wm1b9hLpSpPIA39Vp9	6zvul52xwTWzilBZl6BUbT	Surfer Rosa	1988	https://i.scdn.co/image/ab67616d0000b273626ad9bb7d5f84c59652b161
0DQyTVcDhK9wm0f6RaErWO	6zvul52xwTWzilBZl6BUbT	Doolittle	1989	https://i.scdn.co/image/ab67616d0000b273cafe9404f872e4c0e91a8cc8
5F9YYEKDxenkRpyuovdqZe	6zvul52xwTWzilBZl6BUbT	Head Carrier	2016	https://i.scdn.co/image/ab67616d0000b273e420e17950e1432fa2aea4d1
1EzLdeSngJNnzM94BHBtK2	6zvul52xwTWzilBZl6BUbT	Velouria	1990	https://i.scdn.co/image/ab67616d0000b273f7dd685b5f8e4fa01d22d7b8
0BK1LxNNcaNUtAqTBQAOR8	6zvul52xwTWzilBZl6BUbT	Bossanova	1990	https://i.scdn.co/image/ab67616d0000b273344db70acb6e01f66fc9b3df
6FCzvataOZh68j8OKzOt9a	3RGLhK1IP9jnYFH4BRFJBS	London Calling (Remastered)	1979	https://i.scdn.co/image/ab67616d0000b273cd9d8bc9ef04014b6e90e182
26zldGZFvob9Lj0kXZ6v7u	3RGLhK1IP9jnYFH4BRFJBS	The Cost of Living - EP	2013	https://i.scdn.co/image/ab67616d0000b2733f0dae4c4a881a0ebb714920
49kzgMsxHU5CTeb2XmFHjo	3RGLhK1IP9jnYFH4BRFJBS	The Clash (Remastered)	1977	https://i.scdn.co/image/ab67616d0000b27346db502388d44edb43ebb261
02j4VRhJ7MKK0Jf3FtBBsD	2bToe6WyGvADJftreuXh2K	Special Night	2016	https://i.scdn.co/image/ab67616d0000b273918cd232ff0ae6b148bd48f3
7ElHdWPD6YbkbltJQgCiDc	2bToe6WyGvADJftreuXh2K	My World	2009	https://i.scdn.co/image/ab67616d0000b2735c3ca0a711ccc10f37950046
6sPPhqjKQHveRVqR6Ijf8s	2bToe6WyGvADJftreuXh2K	It Rains Love	2019	https://i.scdn.co/image/ab67616d0000b273eeb714dd5f7e70889154b586
1mtrVXhx0JBuv53GqqJbiG	2bToe6WyGvADJftreuXh2K	Faithful Man (Instrumentals)	2012	https://i.scdn.co/image/ab67616d0000b27389fae2760a5cfc1a2a289df8
2uKHclIQ4IphYCgJyKfSCe	2bToe6WyGvADJftreuXh2K	Big Crown Vaults Vol. 1 - Lee Fields & The Expressions	2020	https://i.scdn.co/image/ab67616d0000b273040c25691559f0c6c70c65fa
3u38Zm1pGlCrGZSsUk2396	2bToe6WyGvADJftreuXh2K	Emma Jean	2014	https://i.scdn.co/image/ab67616d0000b2732789845d006a9fcaf36dc644
0u0CJa9zwFbGSU8JWQYS5G	432R46LaYsJZV2Gmc4jUV5	Love Will Tear Us Apart	1980	https://i.scdn.co/image/ab67616d0000b2731e0fdc2906851e29d09320c3
33qkK1brpt6t8unIpeM2Oy	432R46LaYsJZV2Gmc4jUV5	Unknown Pleasures (Collector's Edition)	1979	https://i.scdn.co/image/ab67616d0000b27316eb1e685e6bd37ab3228de6
51BKPr5L8cGZGk9bl9Jf5L	432R46LaYsJZV2Gmc4jUV5	Transmission	1979	https://i.scdn.co/image/ab67616d0000b273c5d8dac0b019953e2e00151e
2KPhpTUihx9KRWRwBtpTeJ	432R46LaYsJZV2Gmc4jUV5	Substance	2010	https://i.scdn.co/image/ab67616d0000b273a1d7fb161ce10fbd09b08183
5bXAysvuhQbyWllgYuahwt	432R46LaYsJZV2Gmc4jUV5	Atmosphere	1980	https://i.scdn.co/image/ab67616d0000b27374d7ecc4658fe88970feaa7a
0X9oLn2APMvGOIsogM1TSp	1PryMSya1JnSAlcwYawCxp	The Exciting Sounds of Menahan Street Band	2021	https://i.scdn.co/image/ab67616d0000b2733caa41a592b491dda9b9a817
54XBNTrXWfYgYhPbWVRLpX	1PryMSya1JnSAlcwYawCxp	There's a New Day Coming / Tommy Don't	2019	https://i.scdn.co/image/ab67616d0000b2731ae13baf1f76a2fc91f501c0
6wdxaAC6P7f6w05QadHFcB	1PryMSya1JnSAlcwYawCxp	Make the Road By Walking	2008	https://i.scdn.co/image/ab67616d0000b273eebefe17779f3c57284e3c35
1MY3VMNUb73QNJhZB92uGB	1PryMSya1JnSAlcwYawCxp	The Crossing	2012	https://i.scdn.co/image/ab67616d0000b273acc8a2d86203636c7899a7a7
3a7wlGYi97AWoOBZxgjp77	1nGqKVGfPPiVgxMdx8hYOI	Don't All Look Up At Once	2013	https://i.scdn.co/image/ab67616d0000b273c9ff850c99c602b5491115ee
51BUgK2KdAD7Jtm4nIbKdO	1nGqKVGfPPiVgxMdx8hYOI	This Way to Oblivion	2020	https://i.scdn.co/image/ab67616d0000b2732d6ff637b5ebbf106fdb367b
17udU4Qibj6l4h0HWNd0EO	1nGqKVGfPPiVgxMdx8hYOI	Farewell Griffin	2017	https://i.scdn.co/image/ab67616d0000b2738bdddf11bcd58e7396be0dd5
51kJncbEEq7mLs3J8C2dII	1nGqKVGfPPiVgxMdx8hYOI	his first and last sounds	2022	https://i.scdn.co/image/ab67616d0000b2732df5310c55777fb1e8ac2331
6ZsUkdYEqcFuVVfqsnPLSK	1nGqKVGfPPiVgxMdx8hYOI	Ezra Bell	2018	https://i.scdn.co/image/ab67616d0000b2734f095ff02b2a1bb8fd70b26b
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
7nqQxq17r4eUTqsDAdrL6v	0oL26Dn9y761yfJgNb3vfu	Misery	2019	https://i.scdn.co/image/ab67616d0000b273079f0dfcc05d7cd097a2b73a
2ZwK8x38X6dRgBTZNSACVU	0oL26Dn9y761yfJgNb3vfu	Let Down	2020	https://i.scdn.co/image/ab67616d0000b27364311e10169adb0beaa6af96
3LuBghNdV7Z1WSiN53P9OI	0oL26Dn9y761yfJgNb3vfu	Nineties	2016	https://i.scdn.co/image/ab67616d0000b2735a98cee63a9f3cd6e858473d
20k8V0vHdLxnkTaJjXGcFE	0oL26Dn9y761yfJgNb3vfu	The Other Way	2022	https://i.scdn.co/image/ab67616d0000b2731fbbbd14385e99c7d7e80275
2p70Xer2HAT9Ro0qiBVHOc	0oL26Dn9y761yfJgNb3vfu	Stay Out Of It	2022	https://i.scdn.co/image/ab67616d0000b273886e6904fcd9c7df27f97f6b
67DyTWAldohmwTvFvJCJpQ	0oL26Dn9y761yfJgNb3vfu	Midland	2018	https://i.scdn.co/image/ab67616d0000b273a9a88c392c85282d39e64fde
3akwfKkhkypQRsK18KURaA	0oL26Dn9y761yfJgNb3vfu	Everything Will Be Ok Eventually	2021	https://i.scdn.co/image/ab67616d0000b2737abac2f82e3fe9ab600c4c46
1fOUybYJNec1lhpwWIln83	0oL26Dn9y761yfJgNb3vfu	Anniversary II	2021	https://i.scdn.co/image/ab67616d0000b273873ab76befb072412a8e21a8
0bwOZcIDnfGPTDN6CGkA1D	0oL26Dn9y761yfJgNb3vfu	Snow in Montana	2022	https://i.scdn.co/image/ab67616d0000b273653679ec9d5d4ebb5236cc12
0Z1Y5L90NjqUD351YUQWdA	4BFMTELQyWJU1SwqcXMBm3	The Stooges	1969	https://i.scdn.co/image/ab67616d0000b273002d4aa00a80e1be587cef7e
6mxbG8KrOTZIxlP4gzaliM	4BFMTELQyWJU1SwqcXMBm3	Raw Power	1973	https://i.scdn.co/image/ab67616d0000b2738bced1064027c32db4b01f6e
2jIzYmu0kYyj2NeO9p5Sx5	4BFMTELQyWJU1SwqcXMBm3	Heavy Liquid 'The Album'	2017	https://i.scdn.co/image/ab67616d0000b273c7b636d481ce3ce4dba51690
3FTcomSFg2zWSqWLRgBYpv	4BFMTELQyWJU1SwqcXMBm3	Fun House (Deluxe Edition)	1970	https://i.scdn.co/image/ab67616d0000b27313aa419336db598eb2674b1a
6vHqopioDuXtXTDoJhQZls	4BFMTELQyWJU1SwqcXMBm3	Raw Power (Legacy Edition)	1973	https://i.scdn.co/image/ab67616d0000b27392f5a11ecdc254e9169cf1ca
5qhXaVIC5BdE4a5Kq1FMZG	4BFMTELQyWJU1SwqcXMBm3	Funhouse	1970	https://i.scdn.co/image/ab67616d0000b2732c7d41ae194ef7aaaba3fee3
5S38cTeAWT2aqlArzdWbuc	4BFMTELQyWJU1SwqcXMBm3	The Weirdness	2007	https://i.scdn.co/image/ab67616d0000b273a1734be2bdf36e58b58df7b2
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
6BN0KczNzSrfmKoQzd6lMS	4fXkvh05wFhuH77MfD4m9o	Half The City	2014	https://i.scdn.co/image/ab67616d0000b273793d44aad3d0c0158d517c15
2fRc3TJSXKXGFdnmcm17p2	4fXkvh05wFhuH77MfD4m9o	Sea of Noise	2016	https://i.scdn.co/image/ab67616d0000b2733aab37beee0e9198e3c324e7
4EN9bVE0g7gUvQlNdPrUhL	4fXkvh05wFhuH77MfD4m9o	Young Sick Camellia	2018	https://i.scdn.co/image/ab67616d0000b273aff0f524411824c03ab57302
36YdveJJhT49E0blTQODsS	4fXkvh05wFhuH77MfD4m9o	Spotify Sessions (Live at SXSW 2014)	2014	https://i.scdn.co/image/ab67616d0000b2730cd990475f5d5ee748f91144
5eqcF7pWzHgWpGdEmHgeSN	2x9SpqnPi8rlE9pjHBwmSC	Talking Heads '77 (Deluxe Version)	1977	https://i.scdn.co/image/ab67616d0000b273e71708b667804f6241dd1a59
4sLCQxMRfn3gAHrBNZtbTH	2x9SpqnPi8rlE9pjHBwmSC	Speaking in Tongues (Deluxe Version)	1983	https://i.scdn.co/image/ab67616d0000b273e35e2e2a4bfa8a30a78fc532
3AQgdwMNCiN7awXch5fAaG	2x9SpqnPi8rlE9pjHBwmSC	Remain in Light (Deluxe Version)	1980	https://i.scdn.co/image/ab67616d0000b273e56fa8c916dc6ce419dcf557
1invpprZoPxP2H3CfGgSfJ	2x9SpqnPi8rlE9pjHBwmSC	Burning Down the House / I Get Wild / Wild Gravity	1983	https://i.scdn.co/image/ab67616d0000b273ee320a29df2f19c3d900b83d
7IMqoztesjFDgyeibke8Jz	2x9SpqnPi8rlE9pjHBwmSC	Little Creatures	1985	https://i.scdn.co/image/ab67616d0000b273ffc1aa3a9e2d29a2d940ae31
5dVZpNJraoqCo3BssinMoo	2x9SpqnPi8rlE9pjHBwmSC	Fear of Music (Deluxe Version)	1979	https://i.scdn.co/image/ab67616d0000b2738365f74aa622b1b86962c8dd
01RJdKvXyz515O37itqMIJ	2x9SpqnPi8rlE9pjHBwmSC	More Songs About Buildings and Food (Deluxe Version)	1978	https://i.scdn.co/image/ab67616d0000b273b7307213fae24e3fbcbe46aa
1JvXxLsm0PxlGH4LXzqMGq	2x9SpqnPi8rlE9pjHBwmSC	Remain in Light	1980	https://i.scdn.co/image/ab67616d0000b273f9e2d82b9969defab2105859
5XmhHMj5LZLWo32aA6ntKE	4LG4Bs1Gadht7TCrMytQUO	Oh, Inverted World (20th Anniversary Remaster)	2001	https://i.scdn.co/image/ab67616d0000b2734205b816277c7f9dba098d28
4Tm0dXi3s3aSAqng2DACHr	4LG4Bs1Gadht7TCrMytQUO	Wincing The Night Away	2007	https://i.scdn.co/image/ab67616d0000b273c4d77bad843dfae691cca473
4ZTcGoOrNro2aCAStXEjZi	4LG4Bs1Gadht7TCrMytQUO	Port Of Morrow	2012	https://i.scdn.co/image/ab67616d0000b273b95a7b881ceea7ae051f86a3
05APAIA6c0Qf7QtFQYZAKm	4LG4Bs1Gadht7TCrMytQUO	Chutes Too Narrow	2003	https://i.scdn.co/image/ab67616d0000b2735c11dcb47cfa23d259df8904
4jPnb0rdxEawWMlO8RfzJP	1Tp7C6LzxZe9Mix6rn4zbI	Wilderado	2021	https://i.scdn.co/image/ab67616d0000b2735e445f9349b6ddc2cfea65bb
62C9L1UCLOvvlu7Jb2FRRE	1Tp7C6LzxZe9Mix6rn4zbI	Latigo EP	2017	https://i.scdn.co/image/ab67616d0000b2735c4db02f033002ce161dc0d5
02ib3HsTaZRxvPnSV3w4vC	1Tp7C6LzxZe9Mix6rn4zbI	Surefire (Piano)	2020	https://i.scdn.co/image/ab67616d0000b2736267136b31b622f9d58d15ae
1dSQSvPzdvdoOe8jYTrZk4	1Tp7C6LzxZe9Mix6rn4zbI	Favors EP (Acoustic)	2018	https://i.scdn.co/image/ab67616d0000b273798a52c23fb296b1d30cedb5
4zDxvE6VjZfELyXA13kLmn	7foyQbi7GKriLiv1GPVEwt	Time in the Sun	2021	https://i.scdn.co/image/ab67616d0000b273b8fd5833ff07658d59009851
5BMjWYvNyJDfdW5Gzfyc21	7foyQbi7GKriLiv1GPVEwt	& I'm Fine Today	2017	https://i.scdn.co/image/ab67616d0000b2734b20d20b18fbabdb699a7aba
7waoPlopLlOLdZnY6PkW5S	7foyQbi7GKriLiv1GPVEwt	Susto	2014	https://i.scdn.co/image/ab67616d0000b2739effb26dd0d5a22d400067a0
07Lss95oyQ0H0UP5i87G0A	7foyQbi7GKriLiv1GPVEwt	Ever Since I Lost My Mind	2019	https://i.scdn.co/image/ab67616d0000b2734155a6e6c0029afae4cb5b36
752tNJJGYbjlnFfSZBO9ju	7foyQbi7GKriLiv1GPVEwt	Weather Balloons [Feat. Frances Cone]	2019	https://i.scdn.co/image/ab67616d0000b2736354c8293366d9cd0d71335f
5TJvbSps6D0gy3DHqeb8FP	6m4tJuf67jwVSvMP34hrck	Look Closer	2015	https://i.scdn.co/image/ab67616d0000b2732e5dff1708f7a0a08c7134aa
4xwx0x7k6c5VuThz5qVqmV	1nJvji2KIlWSseXRSlNYsC	The Velvet Underground & Nico 45th Anniversary	1967	https://i.scdn.co/image/ab67616d0000b27398260c528e6eec9dd431c1d7
2HOf3Nb44Us8U9oEtKLSrX	1nJvji2KIlWSseXRSlNYsC	The Velvet Underground (45th Anniversary)	1969	https://i.scdn.co/image/ab67616d0000b2739a2c40b6a1af4a92aac991c5
2ny1rPsLOoKNFZhMLubMrs	1nJvji2KIlWSseXRSlNYsC	Loaded: Re-Loaded 45th Anniversary Edition	1970	https://i.scdn.co/image/ab67616d0000b273a6d589272dca67a07a00c8a8
4BrJEabBSw59bwSjKZl25p	32Ko3nL0210QAt14S3Rs4Y	Seventeen	2016	https://i.scdn.co/image/ab67616d0000b273ea18068c00c9780c65415c6a
7HxeuvcM84U4sWEtOSlePG	32Ko3nL0210QAt14S3Rs4Y	win'20	2020	https://i.scdn.co/image/ab67616d0000b2734b3973fe57b73ffaab463c15
0C0Oq2jJhJ4Rs6IwgCe0Ob	32Ko3nL0210QAt14S3Rs4Y	I Don't Know	2020	https://i.scdn.co/image/ab67616d0000b2739aea6e6ddcfd574556a96ff8
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
7tZbEknszSim0Ug0Zv3pxf	4zsrUnozu6zRlVELQezaBn	What Have You Done, My Brother?	2009	https://i.scdn.co/image/ab67616d0000b273fb5ff8376c7bc2f70ecb8af8
57mOAqbdhcMncLg0rjaY7w	4zsrUnozu6zRlVELQezaBn	Cold World	2014	https://i.scdn.co/image/ab67616d0000b273e278a1b6b7b239aa15ba2360
4WlxosPPabfbXUJ1w9gpKc	4zsrUnozu6zRlVELQezaBn	Daptone Gold, Vol. II	2015	https://i.scdn.co/image/ab67616d0000b273f8f92cacf69e7e1001c66b08
6C9WzlQANeoD0GW5B41YJt	00tVTdpEhQQw1bqdu8RCx2	Agents Of Fortune	1976	https://i.scdn.co/image/ab67616d0000b2733ac318439ae56ce048d7bf5d
7v4kEpVtppoMm80m43lGzt	00tVTdpEhQQw1bqdu8RCx2	Fire of Unknown Origin	1981	https://i.scdn.co/image/ab67616d0000b2736895da04b237964b95c2a166
105oUsR7H8AJNELy43XF3w	00tVTdpEhQQw1bqdu8RCx2	Spectres	1977	https://i.scdn.co/image/ab67616d0000b2735e045d1e56f161d40c9acf8d
6xxUsZyckaV0shjOJ0cVpf	00tVTdpEhQQw1bqdu8RCx2	Blue Oyster Cult	1972	https://i.scdn.co/image/ab67616d0000b273a63fc9073db1233ea6c7ae74
0QWjK3wGoCug92yQIeBdxu	00tVTdpEhQQw1bqdu8RCx2	Shaun White Snowboarding: Official Soundtrack	2008	https://i.scdn.co/image/ab67616d0000b273a491440a3688f01c9f3b5062
0cs4Eli5HS6BomzJ9yfrAw	00tVTdpEhQQw1bqdu8RCx2	Secret Treaties	1974	https://i.scdn.co/image/ab67616d0000b273407eab7e6414b8782345a4db
35RIka08weHJaKXqn4ZEHI	00tVTdpEhQQw1bqdu8RCx2	Cult Classic (Remastered)	1994	https://i.scdn.co/image/ab67616d0000b273d5971805ff808a34c4fcf8fa
7jQs5baTMHitYnJJX6JJMU	00tVTdpEhQQw1bqdu8RCx2	The Revolution By Night	1983	https://i.scdn.co/image/ab67616d0000b2735437de9255abe9fc9ecf5291
1Kw0H84LL5YuP37Kh8lbzY	0vqkz1b2qBkoYrGMj2CUWq	Fly Me To The Moon	1969	https://i.scdn.co/image/ab67616d0000b2738521692e95d60d4ba9331fe9
7eVKCG0KD8FCvIlx8E1pBG	0vqkz1b2qBkoYrGMj2CUWq	Midnight Mover: The Bobby Womack Story	1993	https://i.scdn.co/image/ab67616d0000b273a70b89929f67316f0fa4426b
3b4FRQBIqULkm6vudUXkcS	0vqkz1b2qBkoYrGMj2CUWq	The Poet	2021	https://i.scdn.co/image/ab67616d0000b273f26bf182b667df204ed7cd46
6szJ4kcqwQvLfXN5IqV9T4	0vqkz1b2qBkoYrGMj2CUWq	Understanding	1972	https://i.scdn.co/image/ab67616d0000b2739281f2f3a709aa505d920b38
5RavdrN0me6xkp4okXQWNI	0vqkz1b2qBkoYrGMj2CUWq	Dayglo Reflection (Orchestral Version)	2022	https://i.scdn.co/image/ab67616d0000b2730f8d08099050413931d5bdcc
1d0vqL31qzWAWB8cxyfvuP	0vqkz1b2qBkoYrGMj2CUWq	The Bravest Man in the Universe	2012	https://i.scdn.co/image/ab67616d0000b2734753e9132706ec06c9f7cbfa
6aBN9OWwAcB49LWlI95ekd	0vqkz1b2qBkoYrGMj2CUWq	The Best Of Bobby Womack - The Soul Years	2008	https://i.scdn.co/image/ab67616d0000b2730005beaf2189c4687ca1e060
2EwoYRFQRJqw7BTVG6GlTw	2AV6XDIs32ofIJhkkDevjm	Move on Up	1970	https://i.scdn.co/image/ab67616d0000b273b97b45e7885537d42ed46cdf
3tgJmEz0R0ZsRSrpwafp4R	2AV6XDIs32ofIJhkkDevjm	Curtis (Expanded Edition)	1970	https://i.scdn.co/image/ab67616d0000b273775a6bee6c704ec29aec00f4
5QuvlU7nCUZZJauMvhlWR4	2AV6XDIs32ofIJhkkDevjm	Superfly: Deluxe 25th Anniversary Edition	1972	https://i.scdn.co/image/ab67616d0000b273177fea3fc7f8075fdb40f167
5ljIGCRRvS48V4ADzPGav2	2AV6XDIs32ofIJhkkDevjm	Superfly (O.S.T.)	1972	https://i.scdn.co/image/ab67616d0000b27307b7db689327e99ad5602d57
4M8Zce860gRCdyv1hXOK32	2AV6XDIs32ofIJhkkDevjm	New World Order	1997	https://i.scdn.co/image/ab67616d0000b2739f5f805c003810a4d32544b5
3Jm5rknuSOa0tTFDLpJbCg	2AV6XDIs32ofIJhkkDevjm	There's No Place Like America Today	1975	https://i.scdn.co/image/ab67616d0000b273b5938a2da18fbb6184daf6e2
7tIqCuFn9DqkHE1lRj9C6L	2AV6XDIs32ofIJhkkDevjm	Roots	1971	https://i.scdn.co/image/ab67616d0000b273dfc5f5aa3a2e1fb1cc3eeb55
4Pv7m8D82A1Xun7xNCKZjJ	2FXC3k01G6Gw61bmprjgqS	Hozier (Expanded Edition)	2014	https://i.scdn.co/image/ab67616d0000b2734ca68d59a4a29c856a4a39c2
27rVuwJ0g0eKRpnvEhQl3G	0xRXCcSX89eobfrshSVdyu	Tell It To My Heart	2021	https://i.scdn.co/image/ab67616d0000b273a97f3fad25245a1453b1b3b2
6HzebUNgGlzC1AMBwHGIkH	6WY7D3jk8zTrHtmkqqo5GI	The Bones (with Hozier)	2019	https://i.scdn.co/image/ab67616d0000b27323a1cd02bc99c6e8ad9ed0df
5aO7IZl8KxtyCeke37Jvk4	2FXC3k01G6Gw61bmprjgqS	Swan Upon Leda	2022	https://i.scdn.co/image/ab67616d0000b273b53427fe60e7ae869ba9b1a1
2c7gFThUYyo2t6ogAgIYNw	2FXC3k01G6Gw61bmprjgqS	Wasteland, Baby!	2019	https://i.scdn.co/image/ab67616d0000b2735795e01c151ba5a8ce4bd295
4vqaqoTEbNyeeSHJA6KpdM	2g3PKH7Z1Ofn5oGR6oDjLy	Here Are the Sonics	1965	https://i.scdn.co/image/ab67616d0000b2733b8f9c148e9eead1143c78e6
3FeFoMQnGxb8D9FKkCC5ES	2g3PKH7Z1Ofn5oGR6oDjLy	The Sonics Boom	2013	https://i.scdn.co/image/ab67616d0000b273493af4d76e3fdbf61f58c307
5joOZaTA1gkFmw0eLM8ASR	2g3PKH7Z1Ofn5oGR6oDjLy	Maintaining My Cool	1991	https://i.scdn.co/image/ab67616d0000b273dd5ec60c23158c063f54ebdf
2EmUijeHFyILSHUC2kzxXv	2g3PKH7Z1Ofn5oGR6oDjLy	Introducing The Sonics	2011	https://i.scdn.co/image/ab67616d0000b27360d60f7060028564336037b5
2P1FIwA6kUTaacKrKoKl1o	2g3PKH7Z1Ofn5oGR6oDjLy	This Is the Sonics	2015	https://i.scdn.co/image/ab67616d0000b2733e4a69451a62e04fd71d7d27
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
0XJiBmyMDELqCXwZUaG3Rf	6kDMoHTcBICPILP2aclPWZ	Frengers: Not Quite Friends But Not Quite Strangers	2003	https://i.scdn.co/image/ab67616d0000b273ec58fb8535dc6c4f5a06780e
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
41GuZcammIkupMPKH2OJ6I	0Y5tJX1MQlPlqiwlOH1tJY	ASTROWORLD	2018	https://i.scdn.co/image/ab67616d0000b273072e9faef2ef7b6db63834a3
4KvTJJPmcAd1XJaO3UrARG	0dlDsD7y6ccmDm8tuWCU6F	GTG	2018	https://i.scdn.co/image/ab67616d0000b273f67a8d19b2c7130f0437887b
6bI4IQKBcLX0KsTjQ9NR97	5dHt1vcEm9qb8fCyLcB3HL	Floor Seats	2019	https://i.scdn.co/image/ab67616d0000b27380dacac510e9d085a591f981
5olInc6PT2TULCztcT0Csl	18hl4QMrybIXbkGi2BzXcf	O Alto do Cruzeiro e no Quintal da Minha Casa (Ao Vivo)	2022	https://i.scdn.co/image/ab67616d0000b273a489f894b3329d6181b906a5
3FmLXejluSVOx2Gm8waHFs	0H39MdGGX6dbnnQPt6NQkZ	Roses	2018	https://i.scdn.co/image/ab67616d0000b2737e04e22ba618053c64e89883
2uDTi1PlpSpvAv7IRAoAEU	0Y5tJX1MQlPlqiwlOH1tJY	HIGHEST IN THE ROOM	2019	https://i.scdn.co/image/ab67616d0000b273e42b5fea4ac4c3d6328b622b
6o38CdD7CUlZDCFhjZYLDH	0ONHkAv9pCAFxb0zJwDNTy	It's Almost Dry	2022	https://i.scdn.co/image/ab67616d0000b273e27dfef438562f2ecb98a642
2HFagfqzSWiinz9jqcj4Q2	7kA4sEagpoNK91I7wr9tYr	Hit List	2020	https://i.scdn.co/image/ab67616d0000b273e21e2951c334781b69321c5f
6TyPSzd5rA2rQ9yLJJ1Gg2	1SImpQO0GbjRgvlwCcCtFo	Don't You Fake It	2006	https://i.scdn.co/image/ab67616d0000b273f98edbc89407338a90437d34
4I3EcXD4e3KcEoDJfFEZ5b	1URnnhqYAYcrqrcwql10ft	Savage Mode	2016	https://i.scdn.co/image/ab67616d0000b2732dd1ac4a61495080ef8f78ca
0MV1yCXcNNQBfwApqAVkH0	4DdkRBBYG6Yk9Ka8tdJ9BW	Without Warning	2017	https://i.scdn.co/image/ab67616d0000b2730db43130a9aaa7bae56967ed
7b1LmekvPCy9410bKFoMRS	1AldSIJ8ANuZVbjKIhpKKq	Músicas de Capoeira, Vol. 01	2003	https://i.scdn.co/image/ab67616d0000b27316e05b88b5ab8fb49f7e1782
1RmE807F6wsfWzoaxF2qWH	2EhUXeszBQRApbBmTOXlKU	Capoeira Voices Vol 1	2012	https://i.scdn.co/image/ab67616d0000b2733944d72ec889d9687ace530e
78AINSlgE7iolq1bmGfBCH	4CrK2BAeyd3DIt2M2ELPJ4	100% Capoeira - 100 Songs Of Capoeira	2013	https://i.scdn.co/image/ab67616d0000b273b9b23dcd859eac8fbff6c98f
4xeVBTBwaVNQhUdIRC4G9s	5CCwRZC6euC8Odo6y9X8jr	Bang	2021	https://i.scdn.co/image/ab67616d0000b2730b94c63fde72efeb6fd512c4
2SUBknzxng0iqBpKT9vzns	0dlDsD7y6ccmDm8tuWCU6F	Cha Cha	2019	https://i.scdn.co/image/ab67616d0000b27342ffc7773e7f4ea48e5606a8
0qnExDZfz0kVeBjixPsyjS	6PfSUFtkMVoDkx4MQkzOi3	1000 gecs and The Tree of Clues	2020	https://i.scdn.co/image/ab67616d0000b273f91a3040f0be854026ad2dd0
6wTyGUWGCilBFZ837k5aRi	1URnnhqYAYcrqrcwql10ft	SAVAGE MODE II	2020	https://i.scdn.co/image/ab67616d0000b273aa57907bf0cb2ca0c8cc74bc
3zOkSAbg9o7gQ3yXtZhx5v	13ubrt8QOOCPljQ2FL1Kca	Babushka Boi	2019	https://i.scdn.co/image/ab67616d0000b273f0af4e62df674240cc7a35f8
3zy8FiB9URB4b2yNOwMM36	6PfSUFtkMVoDkx4MQkzOi3	mememe	2021	https://i.scdn.co/image/ab67616d0000b27308ab9a6225d66cec9b947aa1
1LWmE7Dy299uuwFo8wcOPC	6PfSUFtkMVoDkx4MQkzOi3	Doritos & Fritos	2022	https://i.scdn.co/image/ab67616d0000b2734d3269002e79016a5be1316d
3HHNR44YbP7XogMVwzbodx	246dkjvS1zLTtiykXe5h60	Twelve Carat Toothache	2022	https://i.scdn.co/image/ab67616d0000b27334362676667a4322838ccc97
4g1ZRSobMefqF6nelkgibi	246dkjvS1zLTtiykXe5h60	Hollywood's Bleeding	2019	https://i.scdn.co/image/ab67616d0000b2739478c87599550dd73bfa7e02
6trNtQUgC8cgbWcqoMYkOR	246dkjvS1zLTtiykXe5h60	beerbongs & bentleys	2018	https://i.scdn.co/image/ab67616d0000b273b1c4b76e23414c9f20242268
5s0rmjP8XOPhP6HhqOhuyC	246dkjvS1zLTtiykXe5h60	Stoney (Deluxe)	2016	https://i.scdn.co/image/ab67616d0000b27355404f712deb84d0650a4b41
6R7Yy0sY9N8PNUhseegr2Q	2o5jDhtHVPhrJdv3cEQ99Z	Hot In It	2022	https://i.scdn.co/image/ab67616d0000b2731e8798f25a1997f0679b2382
5wJb3DBSoSMKYJA8TrNKi8	6DgP9otnZw5z6daOntINxp	OUT OUT (feat. Charli XCX & Saweetie)	2021	https://i.scdn.co/image/ab67616d0000b2730abb7463b44d1be6243642f4
1QqipMXWzJhr6yfcNKTp8B	25uiPmTg16RbhZWAqwLBy5	CRASH	2022	https://i.scdn.co/image/ab67616d0000b273f629eb64fd8ef76a97b154f5
5A0U5x6tAfyQaG5lnOL0fA	25uiPmTg16RbhZWAqwLBy5	Hot Girl (Bodies Bodies Bodies)	2022	https://i.scdn.co/image/ab67616d0000b2734e6ea0c72918cbbfd2376d5f
261QvR3MgGdyL2HyYIlgfd	25uiPmTg16RbhZWAqwLBy5	Vroom Vroom EP	2016	https://i.scdn.co/image/ab67616d0000b27345fefe45b11cde997046d567
2HIwUmdxEl7SeWa1ndH5wC	25uiPmTg16RbhZWAqwLBy5	Pop 2	2017	https://i.scdn.co/image/ab67616d0000b273c61a793955ac590e672eafe8
4KjlM0sPFZS7TmcgYw7pD4	2o5jDhtHVPhrJdv3cEQ99Z	Hot In It (Tiësto’s Hotter Mix)	2022	https://i.scdn.co/image/ab67616d0000b273029756c183a335434b7fd449
7n8NJkGKAl2np1bXiRn0CY	5BvJzeQpmsdsFp4HGUYUEx	Vampire Weekend	2008	https://i.scdn.co/image/ab67616d0000b273eabfe5d94aad05cb6485444b
1A3nVEWRJ8yvlPzawHI1pQ	5BvJzeQpmsdsFp4HGUYUEx	Father of the Bride	2019	https://i.scdn.co/image/ab67616d0000b273a2b1d3e73c66663c01351bcf
1GXMNFfoHF4sN7lG8gZq1j	5BvJzeQpmsdsFp4HGUYUEx	Modern Vampires of the City	2013	https://i.scdn.co/image/ab67616d0000b273654afcab578b93f29ca55a29
2ll6KONxe4F87GJku1ZZrl	0dlDsD7y6ccmDm8tuWCU6F	Freddie's Inferno	2022	https://i.scdn.co/image/ab67616d0000b27369b381d574b329409bd806e6
4WLWbEhOq5kphrWF5oEEou	0dlDsD7y6ccmDm8tuWCU6F	Suffer	2020	https://i.scdn.co/image/ab67616d0000b273ab400f73482c4eff6121adfb
43Xd3k45L0OgtJzJoQmUDD	0dlDsD7y6ccmDm8tuWCU6F	Killin' On Demand	2018	https://i.scdn.co/image/ab67616d0000b273a15ce75bd2271f6388b6645d
7pTr1AQkGqPlyZl9tS8Xg8	0dlDsD7y6ccmDm8tuWCU6F	Ditty	2019	https://i.scdn.co/image/ab67616d0000b2731b41140cbef6a9192b8e0f18
6tkjU4Umpo79wwkgPMV3nZ	4MCBfE4596Uoi2O4DtmEMz	Goodbye & Good Riddance	2018	https://i.scdn.co/image/ab67616d0000b273f7db43292a6a99b21b51d5b4
4I00tpvL54vnWy49vH5fRK	4MCBfE4596Uoi2O4DtmEMz	In My Head	2022	https://i.scdn.co/image/ab67616d0000b273fc8d508165184ba404ca8495
1btu0SV2DOI5HoFsvUd78F	4MCBfE4596Uoi2O4DtmEMz	Death Race For Love (Bonus Track Version)	2019	https://i.scdn.co/image/ab67616d0000b2738b27d35aa2c6dcf99895d664
5wi0oKiF99ZVACf6oTTsp2	4MCBfE4596Uoi2O4DtmEMz	Let Me Know (I Wonder Why Freestyle)	2019	https://i.scdn.co/image/ab67616d0000b273401ea2c7ac7ef87bd32c990f
4fN1wqKk72NNFja1oi9WEV	2EhUXeszBQRApbBmTOXlKU	Capoeira Bahia	2012	https://i.scdn.co/image/ab67616d0000b273c2701fdb7560657357a3ceb5
1XYOxycEbEE2Ce9eDwREpS	7G6BVdBZ9lTjGEH37zbxmA	Berimbau Chorou	2015	https://i.scdn.co/image/ab67616d0000b2739fb88609fea9798b7c976638
0h2knr6qpiAq0tV5ri5JMF	1vCWHaC5f2uS3yhpwWbIA6	The Days / Nights	2014	https://i.scdn.co/image/ab67616d0000b2730ae4f4d42e4a09f3a29f64ad
2H6i2CrWgXE1HookLu8Au0	1vCWHaC5f2uS3yhpwWbIA6	True	2013	https://i.scdn.co/image/ab67616d0000b273e14f11f796cef9f9a82691a7
7dqftJ3kas6D0VAdmt3k3V	1vCWHaC5f2uS3yhpwWbIA6	Stories	2015	https://i.scdn.co/image/ab67616d0000b2735393c5d3cac806092a9bc468
49cBF5iGpJ7nx6EAR8BLga	7HGNYPmbDrMkylWqeFCOIQ	Transa	1972	https://i.scdn.co/image/ab67616d0000b2738261c1838b583c714053ce76
1SYy6QlPiObmtHW2PqpZWu	3qZ2n5keOAat1SoF6bHwmb	Sambabook Zeca Pagodinho, Vol. 2	2014	https://i.scdn.co/image/ab67616d0000b273c30f8f7c317efa606ad366fd
4HCs1WxdaCTb8S1TlgUG9C	7HGNYPmbDrMkylWqeFCOIQ	Prenda Minha	1998	https://i.scdn.co/image/ab67616d0000b2732374e6c8bada807a45cc4b00
3716y3qiVChUSJv24nvCUB	09U6hmCerKcIJrixubiBjm	Poesia Acústica 11: Nada Mudou	2021	https://i.scdn.co/image/ab67616d0000b273ab2c2679ced9d3fe0ca43871
1EggMJbrddGeSyNjDzDRMI	7HGNYPmbDrMkylWqeFCOIQ	Qualquer Coisa	1975	https://i.scdn.co/image/ab67616d0000b2739a2fc7dc286a9827e98881e3
3eXCgCBM4BS6H83xmxKdL6	7oEkUINVIj1Nr3Wnj8tzqr	Um banda um	1982	https://i.scdn.co/image/ab67616d0000b273369d09bf4a3e24e2fb38e598
6haDxdERWK3rdVCGc2jr8E	5rX2c1zow6hCph8PnnU3kF	The Astrud Gilberto Album	1965	https://i.scdn.co/image/ab67616d0000b273b48a079c5273b6141af2dc35
5tPEQtkCVKj17B9RlxDIKC	7oEkUINVIj1Nr3Wnj8tzqr	As canções de eu, tu, eles	2000	https://i.scdn.co/image/ab67616d0000b273452e0fb204aa84bb56a28e94
5NnAoeNFYhB4ypfoEX8e6H	1b8kpp4DUwt1hWaxTiWQhD	Gal Estratosférica	2016	https://i.scdn.co/image/ab67616d0000b2731287784d133815e5d4e8ad0a
5Tk4wmf1IgEPPq36yD4G7Z	1b8kpp4DUwt1hWaxTiWQhD	Baby (Ao Vivo)	2020	https://i.scdn.co/image/ab67616d0000b27391b78c9a782e4f42ad2e211b
6FdbVYfwhJjaUOzYB7J9Uj	1AldSIJ8ANuZVbjKIhpKKq	Canto na Areia, Vol. 03	2007	https://i.scdn.co/image/ab67616d0000b273bdaab8b09e0dbc8536bb619c
1Vjf7xPNvBhqKnAR4rAXR2	1b8kpp4DUwt1hWaxTiWQhD	Gal Tropical	1979	https://i.scdn.co/image/ab67616d0000b273de4828d89731083b45eb1521
4jY3KTb8z9OZiIM92pTuNe	1b8kpp4DUwt1hWaxTiWQhD	Cantar	1974	https://i.scdn.co/image/ab67616d0000b2732126655adcbebe1795d59869
1wG4O32OX2POpj77Cstqk7	2FW6Zt8gyIF7Fb7O3TGxnE	Sambabook Dona Ivone Lara, Vol. 2	2015	https://i.scdn.co/image/ab67616d0000b27327d5fa9c3b826ccc22bfe945
3qoUU8sm4eBT5POFHQSl5L	7oEkUINVIj1Nr3Wnj8tzqr	Luar	1981	https://i.scdn.co/image/ab67616d0000b2730b74999dae4b5d4ea81b21a9
3TCEm1O6JANZ1H55BPZ48L	1AldSIJ8ANuZVbjKIhpKKq	Audácia	2014	https://i.scdn.co/image/ab67616d0000b273bcb4b5ab1bacca1904d541a0
5gK2l2LgWY0BA4p9uy27z6	0Mz5XE0kb1GBnbLQm2VbcO	Black On Both Sides	1999	https://i.scdn.co/image/ab67616d0000b27389b56f56323925d57b38944d
7gkngZkZ51RJBzWUkU8uZ4	0av074qUwLn5eyzwqoq3xh	The Gettin' Off Stage, Step 2	2016	https://i.scdn.co/image/ab67616d0000b27319c85251434dc2c0ed464d89
1VGVJdmvOSRK2w9RKXk18A	2PmIyxmEFsNfQJjEifPDZC	Cyberpunk 2077: Radio, Vol. 2 (Original Soundtrack)	2020	https://i.scdn.co/image/ab67616d0000b273a91a5b301baac1f46e6f30eb
64JvR5shy7j04mTiX0wfNp	7HGNYPmbDrMkylWqeFCOIQ	Cinema Transcendental	1979	https://i.scdn.co/image/ab67616d0000b2735c353a216f250a45f794870d
5FrjDW96mCYw9ECc74c637	3Rq3YOF9YG9YfCWD4D56RZ	Metaphorical Music	2003	https://i.scdn.co/image/ab67616d0000b273a1a897ee5e642da6d945bcd7
1uGIwfw9F1lR7TDDukbNyQ	23cC3RI0hgD5sWmXKPAJuG	Skyline	2019	https://i.scdn.co/image/ab67616d0000b273504b51565feda5d86c586f1c
2QTg7XF8hHMHexJLCKsqdA	1xHQO9GJIW9OXHxGBISYc5	ACT ONE (The Complete Collection)	2016	https://i.scdn.co/image/ab67616d0000b273baa831742bd280c18404dd2a
3FAK4h4t9uV4JxzESXllAU	09hVIj6vWgoCDtT03h8ZCa	The Anthology	1999	https://i.scdn.co/image/ab67616d0000b273b1ddb9f5f519e0d37bc94a53
3cM2sVPdaob0zL1rbrMyG2	1MBqzcu6aiY7GzP5BfG56T	Peines de Maures / Arc-en-ciel pour daltoniens (Instrumental Version)	2005	https://i.scdn.co/image/ab67616d0000b273d3ddd4361d835095a06a70bf
7yjltYU5q9KQKZLfI2JZEY	1WxunfiOh9Ws0uu2JoDmjL	Quarteto Jobim Morelenbaum	1999	https://i.scdn.co/image/ab67616d0000b273529e24bf8ffe6504aaa0d02c
6mpcR3BhEw39pZGVMCKS5e	4hz8tIajF2INpgM0qzPJz2	RKS! Live From Athens Georgia	2021	https://i.scdn.co/image/ab67616d0000b27367d6374ff990af9166a711d6
3xWp6y0HGsHZlXljNs7VRy	5JYtpnUKxAzXfHEYpOeeit	Samba Esquema Novo	1963	https://i.scdn.co/image/ab67616d0000b2732daa87c238a78a680511da3c
2jOgajtpXNsinBpwg2dUjH	1gIa65d5ICT2xVWiUJ3u27	Estudando o samba	1976	https://i.scdn.co/image/ab67616d0000b273e8f7f74cd3c73189250db6cf
4g9eq1iulwITLm6N0xttpW	1gIa65d5ICT2xVWiUJ3u27	Dois Momentos - Vol.1	1972	https://i.scdn.co/image/ab67616d0000b27382781108b905a976facce950
2cgr7ZBd3X3gs99433bgES	7HGNYPmbDrMkylWqeFCOIQ	Muito (Dentro Da Estrela Azulada)	1978	https://i.scdn.co/image/ab67616d0000b273433133eade52024fbef808a4
5lKlFlReHOLShQKyRv6AL9	6M2wZ9GZgrQXHCFfjv46we	Future Nostalgia	2020	https://i.scdn.co/image/ab67616d0000b273d4daf28d55fe4197ede848be
623PL2MBg50Br5dLXC9E9e	4r63FhuTkUYltbVAg5TQnk	BLAME IT ON BABY	2020	https://i.scdn.co/image/ab67616d0000b27320e08c8cc23f404d723b5647
59zpaLOByFkJhc9D5Xqna9	6i392l38cR3uBPF0DbNs7S	Quality Control: Control The Streets Volume 2	2019	https://i.scdn.co/image/ab67616d0000b273f5c547a4335523f10a802f94
1NsTSXjVNE7XmZ8PmyW0wl	4r63FhuTkUYltbVAg5TQnk	KIRK	2019	https://i.scdn.co/image/ab67616d0000b273f2b94b2fda4f08836d6371ba
6N9oICOUm4QT2YpWdKwUlu	4r63FhuTkUYltbVAg5TQnk	Ball If I Want To	2021	https://i.scdn.co/image/ab67616d0000b2735be44990ee17a572098f902a
1X4W9ApaYSS9ZsmUhIVDD3	4r63FhuTkUYltbVAg5TQnk	BETTER THAN YOU	2022	https://i.scdn.co/image/ab67616d0000b2730f8975afd519403248e96725
0O1PJ0t69iTO5yWrIeIga0	4r63FhuTkUYltbVAg5TQnk	Baby On Baby	2019	https://i.scdn.co/image/ab67616d0000b27374d72ebd51dd5781d5f83ffd
2u1Wc12FWm7X2ueUHCHxJC	4r63FhuTkUYltbVAg5TQnk	Red Light Green Light	2021	https://i.scdn.co/image/ab67616d0000b27319fc40e920401ce322487abf
6kaYDcX9dNmJE5OU71IUby	4r63FhuTkUYltbVAg5TQnk	Masterpiece	2021	https://i.scdn.co/image/ab67616d0000b2737b41da110df7023757e8f8fa
4EK8gtQfdVsmDTji7gBFlz	26T3LtbuGT1Fu9m0eRq5X3	Melophobia	2013	https://i.scdn.co/image/ab67616d0000b273fb1cb900d28642e668d77b12
7H814Cg8HV0qpoMheYbhNn	26T3LtbuGT1Fu9m0eRq5X3	Cage The Elephant (Expanded Edition)	2009	https://i.scdn.co/image/ab67616d0000b273e4800c920780ac18d4ab6730
0nW0w37lrQ87k7PLZvC4qJ	26T3LtbuGT1Fu9m0eRq5X3	Tell Me I'm Pretty	2015	https://i.scdn.co/image/ab67616d0000b273e7dd69ac32cf313fde62cbad
2VuZJsJBPLwg9BeQFQle8G	26T3LtbuGT1Fu9m0eRq5X3	Social Cues	2019	https://i.scdn.co/image/ab67616d0000b27388883701231713b18429f80b
6S5j1iJ4B4jknYDr4xOXcA	4kI8Ie27vjvonwaB2ePh8T	What, Me Worry?	2022	https://i.scdn.co/image/ab67616d0000b273d222f2409ee3d81fab57c916
6VoOCCv0bXPrTHDncJyIgF	4kI8Ie27vjvonwaB2ePh8T	Evil Friends	2013	https://i.scdn.co/image/ab67616d0000b273a1dfbbbaf24e01e0f1964d77
72uoxpSaDs7keunx3LbvrX	4kI8Ie27vjvonwaB2ePh8T	The Satanic Satanist	2009	https://i.scdn.co/image/ab67616d0000b27383c769c7afe741adeb0470b1
6wK4nx3a3x32QVfFohfjl1	4kI8Ie27vjvonwaB2ePh8T	Feel It Still (The Remixes)	2017	https://i.scdn.co/image/ab67616d0000b2731031fe2b42af3cec8bc7e238
3t5ZnNa4NdyldNHZcFhETb	24XtlMhEMNdi822vi0MhY1	Louder Now (Deluxe Edition)	2006	https://i.scdn.co/image/ab67616d0000b2737592cccc051542c3df4daa41
0gBSoXYKsE3HHZNbgMPnEg	24XtlMhEMNdi822vi0MhY1	Tell All Your Friends (Remastered)	2002	https://i.scdn.co/image/ab67616d0000b2731fc8bc00af1c877377d1dcf8
2tgx0FJj6dtx3GzTm1Jbbd	4o0pNHbyj36LPvukNqEug0	Loved You A Little (with Taking Back Sunday and Charlotte Sands)	2022	https://i.scdn.co/image/ab67616d0000b27349dc85a9b7b8472de0f8efe6
6D1rTYBev0y8ZKE5tD7OP9	24XtlMhEMNdi822vi0MhY1	Where You Want To Be	2004	https://i.scdn.co/image/ab67616d0000b273b285685a56c953c1a37bf639
3gZolcYVh9Gm1cM5t335mj	77AiFEVeAVj2ORpC85QVJs	HiROQUEST: Genesis Remixed	2022	https://i.scdn.co/image/ab67616d0000b27378ed67a1053b3ead9b89a2dd
3SBeYxkc3Ce7lanK0f3epk	64KEffDW9EtZ1y2vBYgq8T	Numb	2022	https://i.scdn.co/image/ab67616d0000b2732ff34dbc50313f8cea7b5db5
66JuK41D3LpkbX3HCTGcQk	64KEffDW9EtZ1y2vBYgq8T	Leave Before You Love Me	2021	https://i.scdn.co/image/ab67616d0000b273ae40468931087f78919b86ce
1oKYKiAwR31eJvkRwpQVrb	64KEffDW9EtZ1y2vBYgq8T	Bye Bye	2022	https://i.scdn.co/image/ab67616d0000b2734204e8bad640cf32eca876a5
78EicdHZr5XBWD7llEZ1Jh	64KEffDW9EtZ1y2vBYgq8T	Happier	2018	https://i.scdn.co/image/ab67616d0000b27304bfd5a5fd5aa6ca648f66aa
2bw00gRKNKbTFOqCkohbSh	64KEffDW9EtZ1y2vBYgq8T	Silence	2017	https://i.scdn.co/image/ab67616d0000b273f33ba583059dc2f7d08bf2b8
5gQZvWM1o8NkQndueJtZcP	0C8ZW7ezQVs4URX5aX7Kqx	Wolves	2017	https://i.scdn.co/image/ab67616d0000b273307910d4242c0d6b1fedf955
6n9DKpOxwifT5hOXtgLZSL	4MCBfE4596Uoi2O4DtmEMz	Legends Never Die	2020	https://i.scdn.co/image/ab67616d0000b2733e0698e4ae5ffb82a005aeeb
1BmxOYHjQv1dKZRr13YRZM	64KEffDW9EtZ1y2vBYgq8T	FRIENDS	2018	https://i.scdn.co/image/ab67616d0000b273569f64493ca55cd96fdee412
1eleCBhP2R8TXEDquvybwC	64KEffDW9EtZ1y2vBYgq8T	Be Kind (with Halsey)	2020	https://i.scdn.co/image/ab67616d0000b273fdf2e993e10e67396b3bf759
621cXqrTSSJi1WqDMSLmbL	3YQKmKGau1PzlVlkL1iodx	Trench	2018	https://i.scdn.co/image/ab67616d0000b273768828c6867cd0472fc84e4d
0Q5XBpCYFgUWiG9DUWyAmJ	3YQKmKGau1PzlVlkL1iodx	Scaled And Icy	2021	https://i.scdn.co/image/ab67616d0000b27320b467550945fd123e00f0a5
2r2r78NE05YjyHyVbVgqFn	3YQKmKGau1PzlVlkL1iodx	Vessel	2013	https://i.scdn.co/image/ab67616d0000b273d263500f1f97e978daa5ceb1
5VdyJkLe3yvOs0l4xXbWp0	15UsOTVnJzReFVN1VCnxy4	17	2017	https://i.scdn.co/image/ab67616d0000b273203c89bd4391468eea4cc3f5
2Ti79nwTsont5ZHfdxIzAm	15UsOTVnJzReFVN1VCnxy4	?	2018	https://i.scdn.co/image/ab67616d0000b273806c160566580d6335d1f16c
3cyyJALrHc8LawnQNFYRWL	15UsOTVnJzReFVN1VCnxy4	Look At Me!	2017	https://i.scdn.co/image/ab67616d0000b27371af28545729f60b3eca66f7
1YA0gAfV91LkDq1DODSCbc	5K4W6rqBFWDnAN6FQUkS6x	True Love	2022	https://i.scdn.co/image/ab67616d0000b273f52f6a4706fea3bde44467c3
52JymrguPgkmmwLaWIusst	2kCcBybjl3SAtIcwdWpUe3	Come Over When You're Sober, Pt. 2	2018	https://i.scdn.co/image/ab67616d0000b27355e36b0dc5b0ef008fc85319
2Q5DPv9uliinOBSdNooIe3	5cj0lLjcoR7YOSnhnX0Po5	Vegas (From the Original Motion Picture Soundtrack ELVIS)	2022	https://i.scdn.co/image/ab67616d0000b27329e2914af6e83df7e963d365
1nAQbHeOWTfQzbOoFrvndW	5cj0lLjcoR7YOSnhnX0Po5	Planet Her	2021	https://i.scdn.co/image/ab67616d0000b2734df3245f26298a1579ecc321
1MmVkhiwTH0BkNOU3nw5d3	5cj0lLjcoR7YOSnhnX0Po5	Hot Pink	2019	https://i.scdn.co/image/ab67616d0000b27382b243023b937fd579a35533
2sBB17RXTamvj7Ncps15AK	6qqNVTkY8uBg9cP3Jd7DAH	lovely (with Khalid)	2018	https://i.scdn.co/image/ab67616d0000b2738a3f0a3ca7929dea23cd274c
0JGOiO34nwfUdDrD612dOp	6qqNVTkY8uBg9cP3Jd7DAH	Happier Than Ever	2021	https://i.scdn.co/image/ab67616d0000b2732a038d3bf875d23e4aeaa84e
1YPWxMpQEC8kcOuefgXbhj	6qqNVTkY8uBg9cP3Jd7DAH	Guitar Songs	2022	https://i.scdn.co/image/ab67616d0000b2737a4781629469bb83356cd318
4i3rAwPw7Ln2YrKDusaWyT	6qqNVTkY8uBg9cP3Jd7DAH	everything i wanted	2019	https://i.scdn.co/image/ab67616d0000b273f2248cf6dad1d6c062587249
4iyJ8i3eKbez8JXDbsHIdZ	6qqNVTkY8uBg9cP3Jd7DAH	Bored	2017	https://i.scdn.co/image/ab67616d0000b273e0f2af91be409aad81bba98c
0S0KGZnfBGSIssfF54WSJh	6qqNVTkY8uBg9cP3Jd7DAH	WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?	2019	https://i.scdn.co/image/ab67616d0000b27350a3147b4edd7701a876c6ce
2kzPJWrTjVKEYWWhowXLnz	6qqNVTkY8uBg9cP3Jd7DAH	Happier Than Ever (Edit)	2021	https://i.scdn.co/image/ab67616d0000b27331aa3ebe23f59778bff800c9
7fRrTyKvE4Skh93v97gtcU	6qqNVTkY8uBg9cP3Jd7DAH	dont smile at me	2017	https://i.scdn.co/image/ab67616d0000b273a9f6c04ba168640b48aa5795
5MoaDbFw4nrm2P7Om1on3b	5yV1qdnmxyIYiSFB02wpDj	Give Up (Deluxe 10th Anniversary Edition)	2003	https://i.scdn.co/image/ab67616d0000b27300df6e340de0d67ac0dbe1a8
1BSwkKATGVCMgNuN8ve7mz	5yV1qdnmxyIYiSFB02wpDj	Give Up	2003	https://i.scdn.co/image/ab67616d0000b273df6e579914fc309b0e0bd745
24SclrXmcuFi7wwD8UZoy3	41rVuRHYAiH7ltBTHVR9We	PEW PEW	2022	https://i.scdn.co/image/ab67616d0000b27332f031480d201861848d2595
6dwrAsvDJ3qpogoK1jxzAE	41rVuRHYAiH7ltBTHVR9We	E.L.E (Extinction Level Event)	2022	https://i.scdn.co/image/ab67616d0000b2735c581c306cb702dc1eef0fe1
04ebYhavcGBpHqImHLMyml	41rVuRHYAiH7ltBTHVR9We	LUV U NEED U	2017	https://i.scdn.co/image/ab67616d0000b2735d9089762bed2d703725c27b
5QAitMOxUFNdCzmbpkdGwt	41rVuRHYAiH7ltBTHVR9We	Sober	2019	https://i.scdn.co/image/ab67616d0000b27302344d89039b345caf438be5
7DGYrxmgYPEnsnKxP78n5F	41rVuRHYAiH7ltBTHVR9We	So Long (feat. Madi)	2016	https://i.scdn.co/image/ab67616d0000b273835284d434d1408229d99d7e
6I3a9Dp8ZrsVWhbQja7xBz	66CXWjxzNUsdJxJ2JdwvnR	Side To Side (Remixes)	2017	https://i.scdn.co/image/ab67616d0000b27384151e4881d2a5f8a9b10985
2tfC2UydNyC7Y0jz6FoEKv	41rVuRHYAiH7ltBTHVR9We	All I Need (VIP)	2021	https://i.scdn.co/image/ab67616d0000b2739b57ae9304bad10d41e53b77
60nbfXLI18M2vTXVwgsdT3	41rVuRHYAiH7ltBTHVR9We	Watch Yo Back	2019	https://i.scdn.co/image/ab67616d0000b273a9542896d589ac8ba940a92c
33sPuo5hSSOvyjduFVIOtL	64KEffDW9EtZ1y2vBYgq8T	Silence (Slushii Remix)	2017	https://i.scdn.co/image/ab67616d0000b273ec883298571f36d7ba7f39f4
1OmWlObj9gAwNnTNgxBUmz	0H39MdGGX6dbnnQPt6NQkZ	While The World Was Burning	2020	https://i.scdn.co/image/ab67616d0000b273401883269b2ca70bc343a7d0
1Eoy1ADRQDviO2WX2V2vyP	0H39MdGGX6dbnnQPt6NQkZ	The Best Part of Life (Imanbek Remix)	2022	https://i.scdn.co/image/ab67616d0000b273213e6f6d7930a780810cd1cb
0ufGvePLRPce9olVIZhRyE	0H39MdGGX6dbnnQPt6NQkZ	Ghetto Lenny's Love Songs	2019	https://i.scdn.co/image/ab67616d0000b273cdb624d3049740537b9f7b50
3TrtHC3Pq5wtbbiGspOxWq	0H39MdGGX6dbnnQPt6NQkZ	The Best Part of Life	2021	https://i.scdn.co/image/ab67616d0000b273fe71b4a228f092da421125b3
552zi1M53PQAX5OH4FIdTx	3XV0lFzNs8BCTwhJTcMiBr	The Lion King: The Gift	2019	https://i.scdn.co/image/ab67616d0000b2734ccc03169b086af698178a99
6rcbbhcm8Os7EiVRHP9Aef	0EeQBlQJFiAfJeVN2vT9s0	Victory Lap	2018	https://i.scdn.co/image/ab67616d0000b273ac271e5d670e92c42bf99237
6a2c06GAsKigzV53VyzBXk	0EeQBlQJFiAfJeVN2vT9s0	Racks in the Middle (feat. Roddy Ricch and Hit-Boy)	2019	https://i.scdn.co/image/ab67616d0000b273799fa9172d18a7944a5f7cef
1C5gVWv1k7r0LxsrIL8OL8	0EeQBlQJFiAfJeVN2vT9s0	Crenshaw	2013	https://i.scdn.co/image/ab67616d0000b273e71e1a9281e91600cd8556d3
6pAP6aJ2SUmhE9VXB8bm02	0EeQBlQJFiAfJeVN2vT9s0	Slauson Boy 2	2017	https://i.scdn.co/image/ab67616d0000b273dbffe7c058602c34ccd27dca
4k2ygY7kW4n1eVtR2i0F0H	0jNDKefhfSbLR9sFvcPLHo	Light	2017	https://i.scdn.co/image/ab67616d0000b273a5c1582e2b2b087ee7862758
4Z9aZaIeSiKBVOf7v7oHCI	0jNDKefhfSbLR9sFvcPLHo	All The Highs	2022	https://i.scdn.co/image/ab67616d0000b273f7654c177892b06bf56e8bf3
5Pz41jv4xOHJzn93rhHWle	0jNDKefhfSbLR9sFvcPLHo	We Will Meet Again	2022	https://i.scdn.co/image/ab67616d0000b273dfe96e30e219186b192409bd
1fgSS7d1R3fin79TUkhuxW	0jNDKefhfSbLR9sFvcPLHo	We Rise	2015	https://i.scdn.co/image/ab67616d0000b2738d5c2b2e93cf42bf6d9337db
046wH7DEfUumC5h9ykIEkd	0jNDKefhfSbLR9sFvcPLHo	bb u ok?	2021	https://i.scdn.co/image/ab67616d0000b2738c2877b422fdee55ad880ead
3KHPqtzQKRPKup29xEQWtg	0jNDKefhfSbLR9sFvcPLHo	album1	2018	https://i.scdn.co/image/ab67616d0000b2738575368e908e229a76460564
7t6TgWkJUkrtbMtcpk7sh0	0jNDKefhfSbLR9sFvcPLHo	Honest	2020	https://i.scdn.co/image/ab67616d0000b27334b3f7d6bfcd836a3bfa4b8f
025njwSJ67gymZaZ7i3rHh	0u18Cq5stIQLUoIaULzDmA	Lines of the Broken	2017	https://i.scdn.co/image/ab67616d0000b273e44cda4043a9aefb772f689c
2Sy70AVTYlyrcRePSm4ext	7boQqq2hUcz9kHcQOecG4j	Midnight Machine Gun Rhymes And Alibis	2002	https://i.scdn.co/image/ab67616d0000b273dd60513126a13b6d57a36fd8
1OR946caqAWK0EIW49hJJW	7boQqq2hUcz9kHcQOecG4j	Gun-Mouth 4 hire Horns and Halos #2	2005	https://i.scdn.co/image/ab67616d0000b27383a32d519ca7b40a5cdc0dea
5hLV6kxqvWQdRDqlt8DT5T	7boQqq2hUcz9kHcQOecG4j	Conversation With A Devil	2003	https://i.scdn.co/image/ab67616d0000b273241f7557dab7e0225a3bf4ed
2LFMmRSOgUHxXS4QCPr4zW	7boQqq2hUcz9kHcQOecG4j	A Tale Of Two Andres	2008	https://i.scdn.co/image/ab67616d0000b273b701aac88c5a53bd072b3e38
1HG9bFZMfC6MLSEbOiI8ME	7boQqq2hUcz9kHcQOecG4j	I Hate You With A Passion	1995	https://i.scdn.co/image/ab67616d0000b2739af9a9be7f288188be0970ff
4Uvk0aRsCz0kt8IQoTTCko	4mPPxTpWqDR5rmOrTOh4nk	Bullet Symphony Horns And Halos #3	2006	https://i.scdn.co/image/ab67616d0000b2734dae6d9e7c7c81256daee245
15mPPPMuN4jpwU0NqKE2DT	7boQqq2hUcz9kHcQOecG4j	Scottie 15	2013	https://i.scdn.co/image/ab67616d0000b2737ea9619e695949fb075ff129
3T4tUhGYeRNVUGevb0wThu	6eUKZXaKkcviH0Ku9w2n3V	÷ (Deluxe)	2017	https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96
32iAEBstCjauDhyKpGjTuq	6eUKZXaKkcviH0Ku9w2n3V	=	2021	https://i.scdn.co/image/ab67616d0000b273ef24c3fdbf856340d55cfeb2
4urxMitPAkjyey14LeuWSX	4nDoRrQiYLoBzwC5BhVJzF	Familia	2022	https://i.scdn.co/image/ab67616d0000b273370ed6a9ced20874385fb147
6NoBzYmh5gUusGPCfg0pct	6eUKZXaKkcviH0Ku9w2n3V	x (Wembley Edition)	2013	https://i.scdn.co/image/ab67616d0000b273d08209944468440145f01524
2W5VVBPNkGAduaArE4sX29	6eUKZXaKkcviH0Ku9w2n3V	Celestial	2022	https://i.scdn.co/image/ab67616d0000b273c18194a4022ec44507f7b248
6kgDkAupBVRSqbJPUaTJwQ	3wcj11K77LjEY1PkEazffa	Love, Damini	2022	https://i.scdn.co/image/ab67616d0000b27312ebde47882280b814275600
3w8hDKDqyNFKwTuB2G15Sk	5r4anprO9Hg9CBlmdkwFdE	Capoeira Nagô, Vol. 2	2016	https://i.scdn.co/image/ab67616d0000b27306ca500ac2d0153dc7912275
0iyPnXukC40URPczeXVvha	5r4anprO9Hg9CBlmdkwFdE	Capoeira Nagô	2016	https://i.scdn.co/image/ab67616d0000b273680fd1051232441bdbab1c29
5V5iUFc3nj3Y92QeHzWGfH	5r4anprO9Hg9CBlmdkwFdE	Capoeira Nagô, Vol. 4	2016	https://i.scdn.co/image/ab67616d0000b273e084028bfac64eb04fae610a
2cX8LwExMxThOI19CdW8cX	5r4anprO9Hg9CBlmdkwFdE	Capoeira Nagô, Vol. 3	2016	https://i.scdn.co/image/ab67616d0000b27310ac8405c0f2e5bc497314c5
6TQ8nqw43uUOWu7Yqp58ko	6aaMZ3fcfLv4tEbmY7bjRM	The House Is Burning	2021	https://i.scdn.co/image/ab67616d0000b273ac895ae149e004dcbb6367be
6jjX8mGrsWtrpYpFhGMrg1	6aaMZ3fcfLv4tEbmY7bjRM	The Sun's Tirade	2016	https://i.scdn.co/image/ab67616d0000b273fbdec8696ff05ae19265dfa0
6JF49ixyHmOgS0Rsda2k42	6aaMZ3fcfLv4tEbmY7bjRM	Cilvia Demo	2014	https://i.scdn.co/image/ab67616d0000b273986cd6b330f7405b17a604f4
1sjsLTzS0WxitdFmqvPpUW	4yYYCSCDUTypErQMZv5iSg	Dawg House	2022	https://i.scdn.co/image/ab67616d0000b27333e1ca0d626e438db2248427
6kAQmWSprYKeBpSEVC4dxa	7hi7sNBb4AWmzHRjFCs94V	Angoleiro Sim Sinhô (Capoeira)	2009	https://i.scdn.co/image/ab67616d0000b2733af0895d597387883db18339
1pCA38N6MkLlthXtAOvZTU	04gDigrS5kc9YWfZHwBETP	JORDI (Deluxe)	2021	https://i.scdn.co/image/ab67616d0000b27386a8ab515de4b7aef28cd631
2pjfMmH52fryXVQuWTWOgP	04gDigrS5kc9YWfZHwBETP	Overexposed (Deluxe)	2012	https://i.scdn.co/image/ab67616d0000b273ce7d499847da02a9cbd1c084
2Auw0pTT6EcQdvHNimhLQI	04gDigrS5kc9YWfZHwBETP	V	2014	https://i.scdn.co/image/ab67616d0000b273442b53773d50e1b5369bb16c
5zClcGCSWj926AMjvBNSLc	04gDigrS5kc9YWfZHwBETP	Songs About Jane: 10th Anniversary Edition	2002	https://i.scdn.co/image/ab67616d0000b27392f2d790c6a97b195f66d51e
7strNUlU6xZqlVWBNUdOYv	04gDigrS5kc9YWfZHwBETP	Hands All Over	2010	https://i.scdn.co/image/ab67616d0000b273ce70cb2d7063cf869f9f1239
1rVb8baDpWBzuO7Ndc6g4v	6BIltkF2V7p0PHLtUyc7re	Era Eu Era Meu Mano, Era Meu Mano Mais Eu	2017	https://i.scdn.co/image/ab67616d0000b2739782bf68194be596d0455dc1
13XcJE12Oyc3N9g7LZFCRu	5h6l7v8Ecxw1BKVBLrjFfE	Era Eu Era Meu Mano, Era Meu Mano Mais Eu, Vol. 2 (Ao Vivo)	2021	https://i.scdn.co/image/ab67616d0000b2731509776e5c1dc5b334210ba7
0RnMuJpfEHHq0yDpSP6K48	6BIltkF2V7p0PHLtUyc7re	Quando os Berimbaus Se Encontram	2015	https://i.scdn.co/image/ab67616d0000b2735d34c8a9c5fc550541ef7f4b
7KsMCyObKQhX37pocZEUcQ	5zfEatKLDdRkgbw6sdLBAQ	Papi Chulo	2020	https://i.scdn.co/image/ab67616d0000b27396a7d5a4fc04660b07ec5769
1kiTzXHYN9CC5BfKrkjKbT	39XT9gMoNmMCOlvTTR273m	Warm (Remix)	2022	https://i.scdn.co/image/ab67616d0000b273b4ae540b8da4f40bb4d6fcd0
6c2FMAZeFKi8pui6dlZqXB	2p1fiYHYiXz9qi0JJyxBzN	Energy (Stay Far Away)	2018	https://i.scdn.co/image/ab67616d0000b2735595a4c733f6db29d4b90cb5
73rKiFhHZatrwJL0B1F6hY	3tVQdUvClmAT7URs9V3rsp	More Love, Less Ego	2022	https://i.scdn.co/image/ab67616d0000b273e944c571fca9ea470ebb5821
1OEGfToF7QbjUgyxMAnGXg	1vCWHaC5f2uS3yhpwWbIA6	Levels	2011	https://i.scdn.co/image/ab67616d0000b273ffb343926530168be4724dd4
1m3mf7xkXIwssVriaaTjOS	1vCWHaC5f2uS3yhpwWbIA6	AVĪCI (01)	2017	https://i.scdn.co/image/ab67616d0000b273a26cc58b4d64c2ece3376389
6Ad1E9vl75ZB3Ir87zwXIJ	1vCWHaC5f2uS3yhpwWbIA6	TIM	2019	https://i.scdn.co/image/ab67616d0000b273660ee24281a547103f466ff5
292ltz2MxXuFZw9FaEbaZ3	1vCWHaC5f2uS3yhpwWbIA6	I Could Be The One [Avicii vs Nicky Romero]	2012	https://i.scdn.co/image/ab67616d0000b273c37b2ce76e8cc86b6683e0a5
5MS3MvWHJ3lOZPLiMxzOU6	3TVXtAsR1Inumwj472S9r4	Her Loss	2022	https://i.scdn.co/image/ab67616d0000b27302854a7060fccc1a66a4b5ad
3cf4iSSKd8ffTncbtKljXw	3TVXtAsR1Inumwj472S9r4	Honestly, Nevermind	2022	https://i.scdn.co/image/ab67616d0000b2738dc0d801766a5aa6a33cbe37
6tE9Dnp2zInFij4jKssysL	1RyvyyTE3xzB2ZywiAwp0i	I NEVER LIKED YOU	2022	https://i.scdn.co/image/ab67616d0000b27386badd635b69aea887862214
7GjVWG39IOj4viyWplJV4H	0SwO7SWeDHJijQ3XNS7xEE	Little Dark Age	2018	https://i.scdn.co/image/ab67616d0000b273b47d309281c66820b7137f5d
6mm1Skz3JE6AXneya9Nyiv	0SwO7SWeDHJijQ3XNS7xEE	Oracular Spectacular	2007	https://i.scdn.co/image/ab67616d0000b2738b32b139981e79f2ebe005eb
3HA1Ru1gEAgaxTywkJmBOL	0SwO7SWeDHJijQ3XNS7xEE	Congratulations	2010	https://i.scdn.co/image/ab67616d0000b273a38f4c1b8f53a2f792ffb561
6AccJKWLGTkv1KVFjZW4A8	0SwO7SWeDHJijQ3XNS7xEE	Time to Pretend	2005	https://i.scdn.co/image/ab67616d0000b273b5dcb50326f2a8e22cda985a
3SpBlxme9WbeQdI9kx7KAV	3TVXtAsR1Inumwj472S9r4	Certified Lover Boy	2021	https://i.scdn.co/image/ab67616d0000b273cd945b4e3de57edd28481a3f
3SdFuYwyWoq7kuaHdTDcyD	0Y5tJX1MQlPlqiwlOH1tJY	Goosebumps (Remix)	2021	https://i.scdn.co/image/ab67616d0000b2739109b0425fb5b36284a24891
4PWBTB6NYSKQwfo79I3prg	0Y5tJX1MQlPlqiwlOH1tJY	Rodeo (Expanded Edition)	2015	https://i.scdn.co/image/ab67616d0000b2737433176f037e0ba14190c34f
0bUTHlWbkSQysoM3VsWldT	3AA28KZvwAUcZuOKwyblJQ	Demon Days	2005	https://i.scdn.co/image/ab67616d0000b27319d85a472f328a6ed9b704cf
4V9YFKLqZ5h8nQFTvDQscC	3AA28KZvwAUcZuOKwyblJQ	New Gold (feat. Tame Impala and Bootie Brown)	2022	https://i.scdn.co/image/ab67616d0000b273fda889bb57058a4a1b88edcd
2dIGnmEIy1WZIcZCFSj6i8	3AA28KZvwAUcZuOKwyblJQ	Plastic Beach	2010	https://i.scdn.co/image/ab67616d0000b273661d019f34569f79eae9e985
0YvYmLBFFwYxgI4U9KKgUm	3AA28KZvwAUcZuOKwyblJQ	Gorillaz	2001	https://i.scdn.co/image/ab67616d0000b273c73a7bb15f43bae86215934b
0NvirtaDCaZU5PAW1O5FDE	3AA28KZvwAUcZuOKwyblJQ	Humanz (Deluxe)	2017	https://i.scdn.co/image/ab67616d0000b273a5952c0e2e649f588603b743
3488fiYQcGSfkKKpr3ttCD	3AA28KZvwAUcZuOKwyblJQ	Cracker Island (feat. Thundercat)	2022	https://i.scdn.co/image/ab67616d0000b273efbba3463588a325949874d5
6WHjLRAwmnJv2cHqVZrmOt	3AA28KZvwAUcZuOKwyblJQ	Baby Queen	2022	https://i.scdn.co/image/ab67616d0000b27372c37fb80366b52f401d1419
0WzOtZBpXvWdNdH7hCJ4qo	4LLpKhyESsyAXpc4laK94U	K.I.D.S.	2010	https://i.scdn.co/image/ab67616d0000b27350570144b4a9a459406f9a3d
1XEycvgUklYgcYEUf7vbij	4LLpKhyESsyAXpc4laK94U	I Love Life, Thank You	2022	https://i.scdn.co/image/ab67616d0000b2732e8e9d480a55d914e1c5ff3b
5wtE5aLX5r7jOosmPhJhhk	4LLpKhyESsyAXpc4laK94U	Swimming	2018	https://i.scdn.co/image/ab67616d0000b273175c577a61aa13d4fb4b6534
2Tyx5dLhHYkx6zeAdVaTzN	4LLpKhyESsyAXpc4laK94U	GO:OD AM	2015	https://i.scdn.co/image/ab67616d0000b273ee0f38410382a255e4fb15f4
6f6tko6NWoH00cyFOl4VYQ	4LLpKhyESsyAXpc4laK94U	The Divine Feminine	2016	https://i.scdn.co/image/ab67616d0000b2732e92f776279eaf45d14a33fd
5sY6UIQ32GqwMLAfSNEaXb	4LLpKhyESsyAXpc4laK94U	Circles	2020	https://i.scdn.co/image/ab67616d0000b27326b7dd89810cc1a40ada642c
3fAptQHHbsV4bHHNjcGDG0	4kEcRrHPFKoSlsHIhuCN2f	Cantigas De Capu - En Las Calles De Barcelona	2017	https://i.scdn.co/image/ab67616d0000b2733495e5a7177f0454406081a4
2MQvu0dayEtaR5Y2uxX056	1AldSIJ8ANuZVbjKIhpKKq	The Best of Capoeira	2014	https://i.scdn.co/image/ab67616d0000b27326c24c43597ff16c6052ff39
3kUdjvoJpl53A2BLu56OvA	1AldSIJ8ANuZVbjKIhpKKq	Os 15 Maiores Sucessos na Capoeira	2008	https://i.scdn.co/image/ab67616d0000b2735705adb069a54c9df630b195
1nLj3uvuO1twD5Vzp1tQyh	0I11U609NiFEdpvNix7oNl	Capoeira Besouro a Força do Cantar	2007	https://i.scdn.co/image/ab67616d0000b273c7025713d46d445a2024e9e8
4UOAwKUc79FtTSK6NmRFB3	7HGNYPmbDrMkylWqeFCOIQ	Uns	1983	https://i.scdn.co/image/ab67616d0000b273212298c62a17891ea62d0b49
5ZVLLME05cmciSZz4IGcZu	1b8kpp4DUwt1hWaxTiWQhD	Gal Costa	1969	https://i.scdn.co/image/ab67616d0000b27395ce0914cbddd405600e1e12
3PlAbFQa9MEymxTgQC51wv	7HGNYPmbDrMkylWqeFCOIQ	Ofertório (Ao Vivo)	2018	https://i.scdn.co/image/ab67616d0000b273042f939bfd3b88b2adc88ae0
1xAQ6kW7DQZxTghyepHtzm	7HGNYPmbDrMkylWqeFCOIQ	Cores, Nomes	1982	https://i.scdn.co/image/ab67616d0000b273d9e9436112102a62090fbff2
2AdVzfrkaWXUMJql8MIleu	7HGNYPmbDrMkylWqeFCOIQ	Livro	1997	https://i.scdn.co/image/ab67616d0000b273e1512466d10e431d4d2cd18d
52rJNDZsccAEI4HzSgFg2c	7Im2r58zlLJIDfamqDjEE6	Sambas de Roda e Candomblés da Bahia	1969	https://i.scdn.co/image/ab67616d0000b27399e637508d4278d0a179a4c0
21qADgVDiEKEITcniQYFRW	6xQwC94a61f3bZwyl4UJXD	Capoeira "Cordão de Ouro"	1975	https://i.scdn.co/image/ab67616d0000b2738c65587da02793fa2b609569
3fzjXU2SSKero9gVMcPivX	4M5nCE77Qaxayuhp3fVn4V	The Shepherd's Dog	2007	https://i.scdn.co/image/ab67616d0000b273816243514f01ac30d0932622
5NovnTHEYZjadICACf4yPo	4M5nCE77Qaxayuhp3fVn4V	Time After Time	2016	https://i.scdn.co/image/ab67616d0000b273c399112d7620b5942f925a7f
33zayrSBdboyCyGTjtQrsw	4M5nCE77Qaxayuhp3fVn4V	Beast Epic	2017	https://i.scdn.co/image/ab67616d0000b27303a65555dc780c3a35139055
7HsQnwEa1RXoPanfrRPbb3	4M5nCE77Qaxayuhp3fVn4V	Weed Garden	2018	https://i.scdn.co/image/ab67616d0000b2731bab301202e00444b4011b2d
169vCBCFaW2na816P8Ir7m	4M5nCE77Qaxayuhp3fVn4V	Our Endless Numbered Days (Deluxe Edition)	2004	https://i.scdn.co/image/ab67616d0000b273031c73667e732e3e208a6328
6Q7WssoFXDJoqNEkn8LnWN	1EI0NtLHoh9KBziYCeN1vM	Forever Young (From NBC's Parenthood)	2015	https://i.scdn.co/image/ab67616d0000b273c46676cc07ead969d0bda59a
5tOzXq44rU4yCCVY94f6m7	4M5nCE77Qaxayuhp3fVn4V	Around the Well	2009	https://i.scdn.co/image/ab67616d0000b273d1bda10582c382a04e3e6140
0jMBAo2pk2cEE0aJ3WseMl	4M5nCE77Qaxayuhp3fVn4V	Sing Into My Mouth	2015	https://i.scdn.co/image/ab67616d0000b273bbcb4589a7819ae8a28785ac
1iGIqDBXm5HpTqHCvdc4QP	4M5nCE77Qaxayuhp3fVn4V	The Twilight Saga: Breaking Dawn - Part 1 (Original Motion Picture Soundtrack)	2011	https://i.scdn.co/image/ab67616d0000b273f01ba25235fb24f73605b9dd
22zpCX6Nb9ppOVklalvGec	2p1fiYHYiXz9qi0JJyxBzN	Ignorance is Bliss	2019	https://i.scdn.co/image/ab67616d0000b27348f2487a18a735f457404eb9
6s4vWWWxNrGcKhrOFYRZzk	2p1fiYHYiXz9qi0JJyxBzN	Konnichiwa	2016	https://i.scdn.co/image/ab67616d0000b273969de80dfcad2d496da82410
0Zp33hB1LZhbpMQCNfzeVF	3NbqBIc16CNAe5nYSmHR3p	Dimension (feat. Skepta & Rema)	2021	https://i.scdn.co/image/ab67616d0000b2738c79f932a01bdc3ee3eeed70
57XEL26edJ9dAhxH9thg20	5SKEXbgzIdRl3gQJ23CnUP	Capoeira Eletronica 2014	2007	https://i.scdn.co/image/ab67616d0000b2735d7c48f01fb27cf927810a7f
23xCA877rpNuH1YOehpm3Q	5SKEXbgzIdRl3gQJ23CnUP	Capoeira Time - 30 Songs Of Capoeira Remixed	2007	https://i.scdn.co/image/ab67616d0000b273856e1d05a82ae2ba32130ff2
34IaQdgkecjJn1XuFGb1kF	5SKEXbgzIdRl3gQJ23CnUP	Capoeira Crossfit Training	2020	https://i.scdn.co/image/ab67616d0000b273205a20f612fac930f8e892c8
1YTS3nXEQvTSKnJK8ccN0C	1cIz2h3ERs72r60yw78Deu	Lights Go Down	2021	https://i.scdn.co/image/ab67616d0000b2738b7fc74512b6270ac7c6e458
7DrcBhY34PI4wgF16iY2E5	1cIz2h3ERs72r60yw78Deu	More To Give	2021	https://i.scdn.co/image/ab67616d0000b273c732e03beb714b758f273bf3
3FGBDhlwrAPNv486sGmYSS	1cIz2h3ERs72r60yw78Deu	Exhale	2021	https://i.scdn.co/image/ab67616d0000b2738d29c446ec5e63307a6fb01e
2m9mAypAFaG33u60S6fYWJ	1cIz2h3ERs72r60yw78Deu	You'll Be There	2020	https://i.scdn.co/image/ab67616d0000b273bbab437da42e9e7537413116
073ct5hRKoMoyYgTtZ6omK	1cIz2h3ERs72r60yw78Deu	Movies	2021	https://i.scdn.co/image/ab67616d0000b2739313b2d538381fa8765eec11
5pNSuaEliVDmgJEWZoopSh	1cIz2h3ERs72r60yw78Deu	Night Bass Freshmen Vol 3	2019	https://i.scdn.co/image/ab67616d0000b273da81ee11997dd2280455ed0a
5XoxmvsEqRrsHMooW6DLyx	1cIz2h3ERs72r60yw78Deu	Comply	2022	https://i.scdn.co/image/ab67616d0000b273dc83988a4a802e8f1321e356
5r1COi4fv9t1woJqdnfz3A	1cIz2h3ERs72r60yw78Deu	Like Me	2020	https://i.scdn.co/image/ab67616d0000b273a7ac4b9f5e098838c2747101
7vNlIGuuwVCwO4YhDojVdx	1cIz2h3ERs72r60yw78Deu	Rise & Fall (VIPs)	2022	https://i.scdn.co/image/ab67616d0000b273add73f803fc65f6e302f5c2b
63P6lbTxTP2OpbC7SOrIfK	20gsENnposVs2I4rQ5kvrf	Follow Me	2021	https://i.scdn.co/image/ab67616d0000b273768c262077eb6de3cce11775
2iylTVQEMYGQ9CUgn9MAAT	1IueXOQyABrMOprrzwQJWN	You for Me	2021	https://i.scdn.co/image/ab67616d0000b273f27f159d52482679d2bf2985
6hKHpD9mnIjiJWmAunnQT8	5CCwRZC6euC8Odo6y9X8jr	Poison	2015	https://i.scdn.co/image/ab67616d0000b273fabd9e4a96acce8a3734c737
1BsVW2iNL53ZJY573fjHKK	2o5jDhtHVPhrJdv3cEQ99Z	The London Sessions	2020	https://i.scdn.co/image/ab67616d0000b273ccab17700480a3b752fd31f1
6Vn8F3hERVHYYz5RfKmsAN	5CCwRZC6euC8Odo6y9X8jr	Phoenix (Deluxe Edition)	2018	https://i.scdn.co/image/ab67616d0000b273f1b136eb0388414a8225a348
415fhs8Ft2VMFY0rWLK4BD	5CCwRZC6euC8Odo6y9X8jr	I Will Never Let You Down	2014	https://i.scdn.co/image/ab67616d0000b273bd6c207be091d0b107405b93
5pbvTLpIZB3XWRuUS9ZxHm	5pUo3fmmHT8bhCyHE52hA6	LP1	2019	https://i.scdn.co/image/ab67616d0000b273373a46efca570f83dd78313f
1Z7WbPmn7QFoJ2DrNfEehz	23fqKkggKUBHNkbKtXEls4	Carry On (from the Original Motion Picture "POKÉMON Detective Pikachu")	2019	https://i.scdn.co/image/ab67616d0000b2735c13911ce0c8e0b65c341a4c
1K9kdxE8GhOHuOnFYxoBco	1b8kpp4DUwt1hWaxTiWQhD	A Pele do Futuro	2018	https://i.scdn.co/image/ab67616d0000b273c516657936399772918ea4a7
1LpG0vjBhKLcUOcgGlPJ1a	1b8kpp4DUwt1hWaxTiWQhD	A Pele do Futuro Ao Vivo	2019	https://i.scdn.co/image/ab67616d0000b273a7883ff2a8ebe2a205dc7e55
1pvPrGENPU0yj9ocp0Zvpd	1b8kpp4DUwt1hWaxTiWQhD	Rio Revisited	1989	https://i.scdn.co/image/ab67616d0000b2737bd1bc1f39ea445ff229130b
7eSEnOlFor4HMoblLfwLXz	1b8kpp4DUwt1hWaxTiWQhD	Estratosférica Ao Vivo	2017	https://i.scdn.co/image/ab67616d0000b273c2c48392a5278489a7ddc310
3I4DmkyMBifLVwrCT3eQ82	4ERtgeBbWRkFzIz6LaFCeY	A Mark, A Mission, A Brand, A Scar	2003	https://i.scdn.co/image/ab67616d0000b273d1ac70bdf06763bc8df967e1
6HNDip6KYIQapVTDziA91U	4ERtgeBbWRkFzIz6LaFCeY	Dusk And Summer	2006	https://i.scdn.co/image/ab67616d0000b273dfd1134b89b99c40038ca953
4RV8fgalH0XgEMg4CWWDrw	4ERtgeBbWRkFzIz6LaFCeY	The Best Ones of the Best Ones	2020	https://i.scdn.co/image/ab67616d0000b273b7b6f31311c89065b413c9c6
2b6f60fUMb0wSWWyFXBLfv	4ERtgeBbWRkFzIz6LaFCeY	The Places You Have Come to Fear the Most	2001	https://i.scdn.co/image/ab67616d0000b273903283f89b44f42cafa7d716
0qByP4IV1nNHhLs3RfDrGB	4ERtgeBbWRkFzIz6LaFCeY	Crooked Shadows	2018	https://i.scdn.co/image/ab67616d0000b273c2d602f87cd6350514993637
0pPPbYqZd2Qtf5kqrQNKue	7FngGIEGgN3Iwauw1MvO4P	Reaper	2017	https://i.scdn.co/image/ab67616d0000b2733f26f51e52c3fd057890d757
7r7aUbWwuf3y0GY5ZUsQeW	4ERtgeBbWRkFzIz6LaFCeY	Alter The Ending (Deluxe)	2009	https://i.scdn.co/image/ab67616d0000b273d7339a49d05b0c4186a724cf
17z7tsbs0gZi7ASeae9saS	4ERtgeBbWRkFzIz6LaFCeY	Spotify Singles	2020	https://i.scdn.co/image/ab67616d0000b273e5f29fee7c0a5ebbf9306d97
2TEE1RnUqjfSdOK5gxuswa	70TsVY28EcEUYSGG5Yw7mp	Bittersweet (Feat. Dashboard Confessional)	2022	https://i.scdn.co/image/ab67616d0000b273245495e0161be08e4145a915
1RVXVo1puacM8aQ6hgQahi	4dM6NDYSfLcspt8GLoT5aE	Providence	2016	https://i.scdn.co/image/ab67616d0000b273ecdad1ee6d530eb965d7c51e
47C7w4o1resDhr7jvYEpxE	4NHQUGzhtTLFvgF5SZesLK	Queen Of The Clouds	2014	https://i.scdn.co/image/ab67616d0000b273edbdf62135e9112a98bffa0c
2EfibOMCoqEvr86D9dvAg8	4dM6NDYSfLcspt8GLoT5aE	Trust Nobody	2019	https://i.scdn.co/image/ab67616d0000b27301f0196c5318c6c9df6f6d9e
7qjUz8e7jzTUPLbg17J8zc	4dM6NDYSfLcspt8GLoT5aE	Waiting Too Long	2014	https://i.scdn.co/image/ab67616d0000b273dfb7832b0141798ff5e70199
3ryK3lfTB9KcFC876ykgAy	4dM6NDYSfLcspt8GLoT5aE	Options	2016	https://i.scdn.co/image/ab67616d0000b273cc236304797ed48ada1418bb
2VmLk5bAd5QjLtX7cHm594	4dM6NDYSfLcspt8GLoT5aE	The Sunny Album (Deluxe Edition)	2014	https://i.scdn.co/image/ab67616d0000b27317720116d4dc812119afa124
3xdTckJjSyCfWePM4DrTOc	4dM6NDYSfLcspt8GLoT5aE	Running Miles	2017	https://i.scdn.co/image/ab67616d0000b27319170911c1505110bb1a600c
3a6or8qwEaFtPZFhEWVOTQ	4dM6NDYSfLcspt8GLoT5aE	Wrong Time	2020	https://i.scdn.co/image/ab67616d0000b273bdc61cff45a69c03a589c953
6cbYPzA3cmYlQD0JqsOjEQ	4dM6NDYSfLcspt8GLoT5aE	Drifter	2017	https://i.scdn.co/image/ab67616d0000b273ef35c38cc9a9c5a5ca3281ac
4t8bZNqNroLlMNj8p908VL	1KEUVZo7CMTSJoM8doulOT	Shapeshifter	2016	https://i.scdn.co/image/ab67616d0000b27349ed78ae2966d6f9c5693568
6f25XUNJkOsTg5XrX32q0w	1KEUVZo7CMTSJoM8doulOT	Consciousness	2009	https://i.scdn.co/image/ab67616d0000b2734b20a04b0bfbd773e8355573
32vTTEq3dQDej4V6vdNQUd	1KEUVZo7CMTSJoM8doulOT	the loss of everything	2022	https://i.scdn.co/image/ab67616d0000b2735fd5666e74458a274037cf82
0Weyfoz5UL4BaLmqjrwY2r	1KEUVZo7CMTSJoM8doulOT	a storm is coming	2022	https://i.scdn.co/image/ab67616d0000b2734f734194945e965458046ce3
7ff2gTB2vu17vAN59nutfR	1KEUVZo7CMTSJoM8doulOT	Manifesto	2022	https://i.scdn.co/image/ab67616d0000b273223f25b43510999283156d94
35bHrnMSA8aZ0P5nemqhIp	1KEUVZo7CMTSJoM8doulOT	The Punisher: The Album	2004	https://i.scdn.co/image/ab67616d0000b27345361efb0f85789c2b3a311c
601sChSWKcqDH4qXKLWHVq	1KEUVZo7CMTSJoM8doulOT	Chemicals	2013	https://i.scdn.co/image/ab67616d0000b273f8eb9e166a2333c8a6392591
30DksLC22nJQRff9cd32Kq	67p5GMYQZOgaAfx1YyttQk	Best of Capoeira	2013	https://i.scdn.co/image/ab67616d0000b27349e5b0c001e7fa18ad1bbc96
2vAbN8GEBdXE0cX7pfOHxR	67p5GMYQZOgaAfx1YyttQk	Zum Zum Zum Capoeira Mata Um	2012	https://i.scdn.co/image/ab67616d0000b273f6d1e6520565939eb0244716
2oFrL4aAUeQI9rHyUQ48bo	67p5GMYQZOgaAfx1YyttQk	The Afro Brazilian Experience	2012	https://i.scdn.co/image/ab67616d0000b273df8652c18d499f3f62794243
6hzBCRXB9kFWZQJ7CJiUl2	6dGRShw3EqULdxZl9EEJYv	Você Não Sabe o Valor Que a Capoeira Tem! Capoeira Muzenza, Vol. 22	2016	https://i.scdn.co/image/ab67616d0000b2733def30eab5f000bfd1dabe5e
2Af5jyVN1dvDTgeQGCFeVu	6dGRShw3EqULdxZl9EEJYv	This Is Capoeira Muzenza	2017	https://i.scdn.co/image/ab67616d0000b273cdd151fb23397d2244b51dff
5yB1c8G5CYXZh3kE5Mu8I7	6dGRShw3EqULdxZl9EEJYv	O Melhor da Muzenza - 25 Anos de Sucesso No Sul Com Mestre Burguês	2017	https://i.scdn.co/image/ab67616d0000b2739b5d25ea34d2a4237ce92eb1
2jNTcuGR3TVjOr5N9pPpQk	6dGRShw3EqULdxZl9EEJYv	Eu Aprendi a Jogar Na Beira do Mar, Vol. 20	2020	https://i.scdn.co/image/ab67616d0000b273e94012cbbba2f5cc2ed63e67
7gr2DDEXceRwPDpFst30zJ	6dGRShw3EqULdxZl9EEJYv	Negro Que Veio de Angola: Capoeira Muzenza, Vol. 24	2016	https://i.scdn.co/image/ab67616d0000b273dd75ea11cdc7faf94b9ef316
3vo2sB3t9FaGIbpohfrM1J	6dGRShw3EqULdxZl9EEJYv	Capoeira Muzenza, Vol. 9	2017	https://i.scdn.co/image/ab67616d0000b27384f2e523b4f22cd34ae6bbc3
7dBoyhnlxf1DvmWxtgQPLr	7oEkUINVIj1Nr3Wnj8tzqr	Realce	1979	https://i.scdn.co/image/ab67616d0000b273e0a1e9e985f9b3a12c95250f
53eqd316Rs3te41yGRovYz	7oEkUINVIj1Nr3Wnj8tzqr	Gilberto Gil (1969)	1969	https://i.scdn.co/image/ab67616d0000b273736a08e23f212a2fea618eaa
525oSOShPTFiuHE1DIZttf	7oEkUINVIj1Nr3Wnj8tzqr	Unplugged (Ao vivo)	1994	https://i.scdn.co/image/ab67616d0000b2734fb42a9816a0a3ef8710b82d
4CzqCaWsFEzNWWugq0EfUV	7oEkUINVIj1Nr3Wnj8tzqr	Gilbertos Samba	2014	https://i.scdn.co/image/ab67616d0000b273f7254ef6041fe9fb27ae5575
0ucGkC2GM4IBycOIAw9eBj	2d9LRvQJnAXRijqIJDDs2K	É tudo pra ontem	2020	https://i.scdn.co/image/ab67616d0000b273628e3d32329d962019e154e1
6IIhhDMiY6Abab01TmzLiV	7oEkUINVIj1Nr3Wnj8tzqr	Se Eu Quiser Falar Com Deus	2019	https://i.scdn.co/image/ab67616d0000b273a2d48b5476e8b36f654ee365
3FQ9S9YvMGYzNMvXve9ulB	6qgc4bSHhzZxnJ01WDEAHt	Volume 4	2010	https://i.scdn.co/image/ab67616d0000b27321f57ce973fcc773e2ea9ce9
6p83U6vuMZYV1kkhUbyMIG	6qgc4bSHhzZxnJ01WDEAHt	As 21 Melhores	2010	https://i.scdn.co/image/ab67616d0000b27357f512881e78692829c29116
0kh4iDfosdAu9wYYCWuADE	6qgc4bSHhzZxnJ01WDEAHt	Sou Do Tempo Do Pai De Pai De Papai	2010	https://i.scdn.co/image/ab67616d0000b27393b6e935ea35e6efa0b9f0f8
5EatIo50si8CoN3ARke59W	1gIa65d5ICT2xVWiUJ3u27	Brazil Classics 4: The Best of Tom Zé	2007	https://i.scdn.co/image/ab67616d0000b2731f0672b08d4305d0aec00377
0hEDr5IFbF4mZBHffTZl61	1gIa65d5ICT2xVWiUJ3u27	Jimmy, Renda-Se/ Irene - EP	1971	https://i.scdn.co/image/ab67616d0000b273e9862569b80195899f1a6ffa
40jH4AC1hwNv8DpLqqLeK9	1gIa65d5ICT2xVWiUJ3u27	Com Defeito de Fabricação	2007	https://i.scdn.co/image/ab67616d0000b27383f15566ea067c85963be67b
3bHozwj5kK03Wk7vXyzqup	1gIa65d5ICT2xVWiUJ3u27	Tom Zé	1970	https://i.scdn.co/image/ab67616d0000b2736ccf169d40fe1e4fe90bbe64
208EfBvaP5XUYayo4jb2kA	5ZfHVIBVoMg0VjgUBU0alH	Capoeira Angola 2: Brincando na Roda	2003	https://i.scdn.co/image/ab67616d0000b273ff634f6b599e496a6b21ee8d
00R7lDfWhAQcv72jlCni1P	5ZfHVIBVoMg0VjgUBU0alH	Capoeira Angola from Salvador, Brazil	1996	https://i.scdn.co/image/ab67616d0000b273e815479e87e3e05b98e27ef4
3birV9Fqgob9yiPaz2cQ8u	5nJ5xDXFO4czh2gJ9f4wto	Capoeira Água de Menino	2008	https://i.scdn.co/image/ab67616d0000b273624fa913636494daabdef5ec
4gecrZPdDxMlVxBtpobpxr	5sEDTHJJyDEWVFx99hGSIb	Thor: Ragnarok (Original Motion Picture Soundtrack)	2017	https://i.scdn.co/image/ab67616d0000b273542b3dccd4438a7440e06f4f
5y3IHg8hVlbfbFgIUWtCeL	5sEDTHJJyDEWVFx99hGSIb	The Sims 2 (Original Soundtrack)	2005	https://i.scdn.co/image/ab67616d0000b273e360fbb82e572bb9c59e1b46
4Dq65Lwt50IB0eAKuT10nC	5sEDTHJJyDEWVFx99hGSIb	Ratchet & Clank: Rift Apart (Original Soundtrack)	2021	https://i.scdn.co/image/ab67616d0000b273da89c91341ed1a93e37c49d2
4BtGSQwvM9K67Gx9VanBFy	1K9pNfOfxZFfbEgoOmjV13	Capoeira Angola	2003	https://i.scdn.co/image/ab67616d0000b273aaa202ad9518e90f1f2e0ae5
728y0VvMcIuamGmKhDpa6X	4Lm0pUvmisUHMdoky5ch2I	7th Symphony	2010	https://i.scdn.co/image/ab67616d0000b273e82e8da82c13e70c10023e30
1rmhml18o2KDLUpYMXq6VQ	4Lm0pUvmisUHMdoky5ch2I	Worlds Collide	2007	https://i.scdn.co/image/ab67616d0000b27329e90501a1ea82739e39da5f
1rcVwAd9FXK9ONouJVeRSF	4Lm0pUvmisUHMdoky5ch2I	Worlds Collide	2007	https://i.scdn.co/image/ab67616d0000b27303f36eb693eff336f52468c0
3SZrExQkv0QGbNV9MJUna0	4Lm0pUvmisUHMdoky5ch2I	I Don't Care	2008	https://i.scdn.co/image/ab67616d0000b273f188666b7fd8ed99cd1ca6ad
3W8ep9kCGVEf5TLFtRRB2T	4Lm0pUvmisUHMdoky5ch2I	Talk To Me (feat. Lzzy Hale)	2020	https://i.scdn.co/image/ab67616d0000b273e4006fb07fcd9e2d32130026
6leqa6QQESn76w64IdN9yQ	4Lm0pUvmisUHMdoky5ch2I	Inquisition Symphony	1998	https://i.scdn.co/image/ab67616d0000b273aafd1a955eda9a0f8bbf50a1
4drZZN0HTkJzcdlPmmQyqG	2xiIXseIJcq3nG7C8fHeBj	EXPLOSIONS	2022	https://i.scdn.co/image/ab67616d0000b27391c8a7df5913c07233a99551
3slBXddUn27FSk2rOB1Uy1	3o2dn2O0FCVsWDFSh8qxgG	Angels Calling	2020	https://i.scdn.co/image/ab67616d0000b273a91e09ed0aff46d505bc3f65
2PFiZ23ZyPTcgwmXk4X6o0	1MXZ0hsGic96dWRDKwAwdr	Tommy Lee (feat. Post Malone)	2020	https://i.scdn.co/image/ab67616d0000b273e9f7839f5017f87ca7f5e4f0
0imwCieoxougGmptrN1WAx	1MXZ0hsGic96dWRDKwAwdr	High Right Now (feat. Wiz Khalifa) [Remix]	2020	https://i.scdn.co/image/ab67616d0000b2732dea10a6e67a8c1ab8b8566e
0ntJqUFZt7XQmRycj6typz	1MXZ0hsGic96dWRDKwAwdr	Stuntin' On You (feat. DaBaby)	2020	https://i.scdn.co/image/ab67616d0000b2738e58e86741db1334fcfc015a
37m9KwQ4yNWbsThepwDvAK	1MXZ0hsGic96dWRDKwAwdr	Heart Full of Rage	2019	https://i.scdn.co/image/ab67616d0000b2736a59c3251231317dfdb9cd9c
0N6FHcZaScT0eCiBNfP3qd	1MXZ0hsGic96dWRDKwAwdr	All the Smoke (feat. Gunna & Wiz Khalifa)	2020	https://i.scdn.co/image/ab67616d0000b273a9978d85a1eaab72e5178867
7oKFm1hLdLjPv9fMmmiY6h	1MXZ0hsGic96dWRDKwAwdr	Understand Me	2019	https://i.scdn.co/image/ab67616d0000b273d184716da207b90110a5c027
51XUjHEsoH2qrZs2D79gdC	1MXZ0hsGic96dWRDKwAwdr	Sex Symbol	2022	https://i.scdn.co/image/ab67616d0000b27319c802a70bfc3d0985f5cb26
4JS5yC6k5oNfbzy2FexLBU	1MXZ0hsGic96dWRDKwAwdr	Tommy Lee (feat. SAINt JHN & Post Malone) [Remix]	2020	https://i.scdn.co/image/ab67616d0000b273eca2e67b444d35b3ba00ca53
79YZv5y3Heiw4QZ6i77FTE	7mX72Bq2iXNr8fZdu23fQL	DUSK to DAWN	2021	https://i.scdn.co/image/ab67616d0000b273d95b6751341f2c295657ab59
5zSfOxsBE4yFfcbc2gRd4q	14ep6TM2JzapH5nk7vaora	The Path	2019	https://i.scdn.co/image/ab67616d0000b273924e7a7975c7f6e57c130686
3nbCR6OsvvZTYI0yXNGxFA	14ep6TM2JzapH5nk7vaora	Wattswave IV: Dreams	2018	https://i.scdn.co/image/ab67616d0000b27303c4f94168472870b35963b6
28IlwCwIt69Xh627BwUC8F	6tbLPxj1uQ6vsRQZI2YFCT	Mother	2020	https://i.scdn.co/image/ab67616d0000b27366b9bf56e2e057eed8ba6297
1JIIc6FIetBaCAzWkCSBjL	6tbLPxj1uQ6vsRQZI2YFCT	Ritual	2017	https://i.scdn.co/image/ab67616d0000b27305d9b34c8a670ec1447121c8
6yWMN087PgSimbcVmHLEwG	2yEwvVSSSUkcLeSTNyHKh8	Ænima	1996	https://i.scdn.co/image/ab67616d0000b273dce45359981d62e087a29e6f
0pC7lxDWdDQntOfCPfvbj6	14ep6TM2JzapH5nk7vaora	EXPERIENCE	2020	https://i.scdn.co/image/ab67616d0000b273f32e9617285ecf31754943ce
7xYiTrbTL57QO0bb4hXIKo	00FQb4jTyendYWaN8pK0wa	Lust For Life	2017	https://i.scdn.co/image/ab67616d0000b27395e2fd1accb339fa14878190
7jMxSZ332lLfENKNEFAd9P	6tbLPxj1uQ6vsRQZI2YFCT	Black Widow	2014	https://i.scdn.co/image/ab67616d0000b27399e85232736d3eb3adc12f22
36z4UWQiasJxyuePtCH5Ij	5HYNPEO2NNBONQkp3Mvwvc	Emoji Antique	2015	https://i.scdn.co/image/ab67616d0000b273f29a2f32a138c0158aea2150
3aTXBCkLau3VP53JXez2hB	14ep6TM2JzapH5nk7vaora	The Path	2019	https://i.scdn.co/image/ab67616d0000b2738fa394dd05d74d6082db6f66
5dR0fhE3oveLRSUMMQ3oRB	7AQzXO3NPNQsI7oNu5rC3r	Marcy Playground	1997	https://i.scdn.co/image/ab67616d0000b27337d1e5c1ca98ce1ecd754d04
1fvWYcbjuycyHpzNPH1Vfk	2yEwvVSSSUkcLeSTNyHKh8	10,000 Days	2006	https://i.scdn.co/image/ab67616d0000b273781369aabc39c792cc55604f
7acEciVtnuTzmwKptkjth5	2yEwvVSSSUkcLeSTNyHKh8	Fear Inoculum	2019	https://i.scdn.co/image/ab67616d0000b27326e6b6f666ef40b6b8365e3e
2sXJQdHykPYcRQ7xFhwzMR	1LB8qB5BPb3MHQrfkvifXU	In Color	1977	https://i.scdn.co/image/ab67616d0000b27357a0bca6d7da93cd0c551f6a
5sHvTCk793vr9EkSKcD7IT	0RqtSIYZmd4fiBKVFqyIqD	A Beautiful Lie	2005	https://i.scdn.co/image/ab67616d0000b273865b538169f199dac610b854
2JHjVEvYNVQ9FUUMB2LcMl	5KDIH2gF0VpelTqyQS7udb	Break the Cycle	2001	https://i.scdn.co/image/ab67616d0000b273437a8cfd8293ddf6d800c384
5X7aXBpPLFxNvQGlZv7Nl6	77aDWNQLrjzW7i6YBRhCbQ	Fuck Me	2017	https://i.scdn.co/image/ab67616d0000b273927479bd4ec3a2b1e39008a4
6471rrLPKqZgXQ6TqN5AgU	2MqhkhX4npxDZ62ObR5ELO	Best Of	2010	https://i.scdn.co/image/ab67616d0000b27384366df7e9b8adcb2ccf71e5
7hwhuEQT4Fp5bzwLlYZtiz	1KCSPY1glIKqW2TotWuXOR	Beautiful Trauma	2017	https://i.scdn.co/image/ab67616d0000b27300164c96548a622d34b39828
5MqyhhHbT13zsloD3uHhlQ	67ea9eGLXYMsO2eYQRui3w	Who's Next (Deluxe Edition)	1971	https://i.scdn.co/image/ab67616d0000b273fe24dcd263c08c6dd84b6e8c
1ROVEUk4lc2vD4a0IN1TWS	3TOqt5oJwL9BE2NG9MEwDa	Immortalized (Deluxe Edition)	2015	https://i.scdn.co/image/ab67616d0000b273a58c62e75b82e9c3b47d9ef3
7mTxBqXEBsSmtTOk8N6NIp	3G5WkIXbDxdNoGWHZbXDjI	T*ts Up Mask On	2020	https://i.scdn.co/image/ab67616d0000b273d210334099a3897e19d8080d
2dpS2uYlkzDsPjl3IZbNjD	1KCSPY1glIKqW2TotWuXOR	Greatest Hits...So Far!!!	2010	https://i.scdn.co/image/ab67616d0000b2730eb56329734f9400c1639359
3KHkCXWAJANXQztdpMmKt4	74eX4C98E4FCrAMl39qRsJ	Hallelujah	2016	https://i.scdn.co/image/ab67616d0000b273e0008d241f55aefb0788eadf
3yIfX4ZW0sYJyw1EMVvfWr	6CwfuxIqcltXDGjfZsMd9A	Purge The Poison (feat. Pussy Riot)	2021	https://i.scdn.co/image/ab67616d0000b2732c4d1adb95f41c7c7cf30f9d
69wjSAZXZiD2EBia3b3gxL	6zFYqv1mOsgBRQbae3JJ9e	Piano Man (Legacy Edition)	1973	https://i.scdn.co/image/ab67616d0000b273aff4aef671b2510be7c115b3
3GWdoCGEZLjrsofidLFwgV	4QM5QCHicznALtX885CnZC	Daddy AF	2019	https://i.scdn.co/image/ab67616d0000b273ca6187161cf8e97badac518f
3lFQ9ihSNR5YD0yi0yTzdC	5nGIFgo0shDenQYSE0Sn7c	The Open Door	2006	https://i.scdn.co/image/ab67616d0000b2737b8aabae10ab5bbe7c7f11c5
1cppTra3p7ByUGqNsv3Qla	5qa31A9HySw3T7MKWI9bGg	THE S(EX) TAPES	2020	https://i.scdn.co/image/ab67616d0000b273577dd278fa34655ace27f2c5
3u8UbYIIZkOtawXLDuu57l	6tbLPxj1uQ6vsRQZI2YFCT	Blood	2012	https://i.scdn.co/image/ab67616d0000b273c6aa6fca567129638c3c4355
29omXgzwHznEed7roEZgRM	3G5WkIXbDxdNoGWHZbXDjI	Don't Be A Ball Sack	2021	https://i.scdn.co/image/ab67616d0000b27355666ff71a4930784c8c1d0a
19ZUoDOWmYb59rG5p5WoSW	1AwO9pWEBSBoWdEZu28XDC	That Bad Eartha	1956	https://i.scdn.co/image/ab67616d0000b273e6e6f2ebd26cafafe82ef36d
6qb9MDR0lfsN9a2pw77uJy	4yvcSjfu4PC0CYQyLy4wSq	How To Be A Human Being	2016	https://i.scdn.co/image/ab67616d0000b273ec3d15eab5bd77027abc4b23
2FgknX5e7fJlriQtxvpLhZ	1moxjboGR7GNWYIMWsRjgG	Lungs (Deluxe Edition)	2009	https://i.scdn.co/image/ab67616d0000b2730672b0f8756ae2af86e8a5ce
0jHGiwT6YJhI1OV75cbnlW	1caBfBEapzw8z2Qz9q0OaQ	Never Gonna Learn EP	2022	https://i.scdn.co/image/ab67616d0000b273416f9e33134314ceee097c11
7xg7u99lilTCPbaRfnYuy6	0vYkHhJ48Bs3jWcvZXvOrP	Horses (Legacy Edition)	1975	https://i.scdn.co/image/ab67616d0000b273770198dcbd8d97b29e99b621
6Ymyr8aoX1jHVvrbGpyL24	1ET1wIkDmuCBC80XcTr3Sg	Thirteen Tales Of Love And Revenge	2008	https://i.scdn.co/image/ab67616d0000b273c81e8d3a686ea9d982c18330
4oWkraZHpmMWsR96zVKaOT	6tbLPxj1uQ6vsRQZI2YFCT	Blood 1983	2022	https://i.scdn.co/image/ab67616d0000b273c4b06a884cbd65ee9231c12e
4HyW5B0Xi7iY0rV6q9tlVs	7gcUMQcBkw833YqXciq0WB	NERVOUS	2021	https://i.scdn.co/image/ab67616d0000b273aee3e0efc9bb23391b2c0185
0TcP4beTgxQmREuHJ7BBY2	7x3f7c0fBanNlQwpx1255g	Françoise Hardy (Tous les garçons et les filles)	1962	https://i.scdn.co/image/ab67616d0000b2731a1679a314d4c3855881ed01
0SHpIbyBLUugMXsl3yNkUz	4iHNK0tOyZPYnBU7nGAgpQ	Emotions	1991	https://i.scdn.co/image/ab67616d0000b273cac78df6ec3c73e118a308e0
12wZUFIsldyDhaPneJX9iU	75xNYf2GU5wtQqBrd74SlY	Satanic Prostitute	2019	https://i.scdn.co/image/ab67616d0000b2731efeac1ff945f4c2cf7f4307
6RoosIKwrQCNYyAw5xidRl	49aaHxvAJ0tCh0F15OnwIl	Fiction Feels Good	2020	https://i.scdn.co/image/ab67616d0000b2736bab65bcefcc0f3690ab17ce
2ZPgzxiWsWCmCaC9jzNumu	4SdIXLzfabqU61iK7SnKAU	GAY 4 ME (feat. Lauren Sanderson)	2022	https://i.scdn.co/image/ab67616d0000b273b9136e94d7e75b27db04df91
5ErztBSKEEKJDYzmlAbOy2	6tbLPxj1uQ6vsRQZI2YFCT	The Dream	2012	https://i.scdn.co/image/ab67616d0000b273a5e8e801bac9b0ec74f799bd
5vQaqB1ZfaOW6BSEGuQ8HC	7jZMxhsB8djyIbYmoiJSTs	Ur Best Friend	2021	https://i.scdn.co/image/ab67616d0000b273063b0fabaec2d94b18ad8a74
6QeosPQpJckkW0Obir5RT8	00FQb4jTyendYWaN8pK0wa	Chemtrails Over The Country Club	2021	https://i.scdn.co/image/ab67616d0000b273ca929c6e766cb8591a286e0d
1on2vSrrLw2LJfbqSgocJ6	0cGUm45nv7Z6M6qdXYQGTX	Honey	2017	https://i.scdn.co/image/ab67616d0000b273220bf008506c760faeb85fc5
7n7QlAD8PJQswHuWW8Xdm8	3ZJxEmjYZd5VOqZ8o3aXiL	PRINCESS	2016	https://i.scdn.co/image/ab67616d0000b273445210241a384e02742ad71e
5D6nWYP4m00b3LsXYOkzir	11T0XSkxSB5KUPTe8P8BOl	BADA BING! BADA BOOM!	2019	https://i.scdn.co/image/ab67616d0000b273691853ca53c125d0161bafb3
2QFXjy3u6Bl6ctdK9FS9eF	202HZzqKvPsMHcbwnDZx7u	My Agenda	2020	https://i.scdn.co/image/ab67616d0000b273fe05d794d4ebe29f1ddfcbc8
2HtT4gawEGgOvAPUO7tiU2	4Gzfk9Lxm67nBs7E9BZjzG	Gravel & Wine	2011	https://i.scdn.co/image/ab67616d0000b273855b214e8eb9590fecfe29b2
6tjA8CqgIYfPoBMBansXBi	0Xkd9GsWwOYETVF0kPXZIG	The Best Of	2006	https://i.scdn.co/image/ab67616d0000b273eaa5ddce8183134ee57a4018
5l7whBWhClQiC0pFLpPcRi	2cAXhrWAztXGwk6r15ibW2	Love and Other Lies	2022	https://i.scdn.co/image/ab67616d0000b2736064c05b57123df634910611
600XgAY1N6sRPVczmBogiF	100sLnojEpcadRx4edEBA6	Kicker	2015	https://i.scdn.co/image/ab67616d0000b27345108945892f2bae307486e1
2AqpuNC4IqjOWfRIMOMczq	3VjZEaHXvNbCmV5jc0VfZR	Cali God	2017	https://i.scdn.co/image/ab67616d0000b273277679f7718960d6935f88ea
25eZFwT2UvVK1kxC3wMoSW	4tpUmLEVLCGFr93o8hFFIB	Greatest Hits: Blondie	2006	https://i.scdn.co/image/ab67616d0000b2734a91996f05bcfcdbc2c88e0e
4B2pV5Zds6478QOqA8yqdj	3rWZHrfrsPBxVy692yAIxF	WILLOW	2019	https://i.scdn.co/image/ab67616d0000b2733e0c22d13bc9b4044e90ab9f
5cAJxOFxRwXkCihLMQJYtl	3rWZHrfrsPBxVy692yAIxF	3	2014	https://i.scdn.co/image/ab67616d0000b2732e2e393c5933ec6db7822508
1qPnZBLqLtVw6ER90x84Wb	6tbLPxj1uQ6vsRQZI2YFCT	Beautiful Tragedy	2012	https://i.scdn.co/image/ab67616d0000b2735de395d32c067e831cc8684f
4JupbzBjFWUQVT8uQ8FF3p	6tbLPxj1uQ6vsRQZI2YFCT	Whore 1983	2022	https://i.scdn.co/image/ab67616d0000b27392028a87a877dbd5d95288d3
1aQLXLo5hr1l3l9h7EVJWM	6E8uXyNsUKeGOgRqAOcgBa	The Best Of Georgia Gibbs: The Mercury Years	1996	https://i.scdn.co/image/ab67616d0000b273f263bde11677d0a1d1832c5f
2SVRzumTLUTdoHgYNQ4Rh9	6blEmsLU25ewy8hHtgZaSL	Worldwide Torture	2020	https://i.scdn.co/image/ab67616d0000b273eea4d8ef4ad2b9b0a7f00d37
2byvabkqGEA7G4viYaoOlp	6tbLPxj1uQ6vsRQZI2YFCT	A Star-Crossed Wasteland	2010	https://i.scdn.co/image/ab67616d0000b2735da58a08b88c4077642b981f
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.artists (artist_id, name, popularity, followers, img_url) FROM stdin;
0qu422H5MOoQxGjd4IzHbS	Yves Tumor	56	258465	https://i.scdn.co/image/ab6761610000e5eb1812767b709d74a801c0e487
65dGLGjkw3UbddUg2GKQoZ	BADBADNOTGOOD	62	635669	https://i.scdn.co/image/ab6761610000e5eb61d28b161209f1ee239fdafa
4lujUKeO6nQAJXpq37Epn7	Son Little	53	136769	https://i.scdn.co/image/ab6761610000e5eb7321188756fe1f5d4b554797
6ltzsmQQbmdoHHbLZ4ZN25	Lord Huron	71	1141458	https://i.scdn.co/image/ab6761610000e5eb1d4e4e7e3c5d8fa494fc5f10
0YrtvWJMgSdVrk3SfNjTbx	Death Cab for Cutie	63	1413250	https://i.scdn.co/image/ab6761610000e5eb378adae733fc578108e3f534
0bzfPKdbXL5ezYW2z3UGQj	Michael Kiwanuka	63	1246029	https://i.scdn.co/image/ab6761610000e5eb413f9f82bd7d821ae0195d67
3M4ThdJR28z9eSMcQHAZ5G	The Fratellis	60	770047	https://i.scdn.co/image/ab6761610000e5ebd693efe23dcda7b9595e77ec
30DhU7BDmF4PH0JVhu8ZRg	Sabrina Claudio	62	1447644	https://i.scdn.co/image/ab6761610000e5eb4ed63962edc0f1817bc349fb
360IAlyVv4PCEVjgyMZrxK	Miguel	77	4269766	https://i.scdn.co/image/ab6761610000e5eb02eeb5305fa7bdd9ddca42fc
34jw2BbxjoYalTp8cJFCPv	Heart	65	2108318	https://i.scdn.co/image/1c145626e516a6817c43e7eab2b1cc3a5a9562a8
5Q81rlcTFh3k6DQJXPdsot	Mura Masa	63	626107	https://i.scdn.co/image/ab6761610000e5eb506f6e096e31255e20668074
2YZyLoL8N0Wb9xBt1NhZWg	Kendrick Lamar	87	21951636	https://i.scdn.co/image/ab6761610000e5eb437b9e2a82505b3d93ff1022
4hz8tIajF2INpgM0qzPJz2	Rainbow Kitten Surprise	67	811338	https://i.scdn.co/image/ab6761610000e5eb1b8f08f741213f04e4c3a25a
1Xyo4u8uXC1ZmMpatF05PJ	The Weeknd	93	52415704	https://i.scdn.co/image/ab6761610000e5ebb5f9e28219c169fd4b9e8379
7CyeXFnOrfC1N6z4naIpgo	The Ronettes	62	221437	https://i.scdn.co/image/ab6761610000e5ebc47897b69089f59e31817f26
55VydwMyCuGcavwPuhutPL	The Used	61	1040034	https://i.scdn.co/image/ab6761610000e5eb779c0b2354fc5392c1378290
08ct2eZF5lUPdJpHwNKWof	Hootie & The Blowfish	58	966509	https://i.scdn.co/image/ab6761610000e5eb783a64d2e0fbfdaed9114594
37w38cCSGgKLdayTRjna4W	Mazzy Star	64	802101	https://i.scdn.co/image/d14e353d562d68036916c64a13912772cf7df91c
4bthk9UfsYUYdcFyqxmSUU	Tears For Fears	72	2592013	https://i.scdn.co/image/ab6761610000e5eb42ed2cb48c231f545a5a3dad
4pejUc4iciQfgdX6OKulQn	Queens of the Stone Age	68	3089649	https://i.scdn.co/image/ab6761610000e5ebc194721f2ca5433bc78b0e74
7qKoy46vPnmIxKCN6ewBG4	Butch Walker	38	43786	https://i.scdn.co/image/ab6761610000e5eb0dc5c48012477ce1d87953c4
5wFXmYsg3KFJ8BDsQudJ4f	Manchester Orchestra	61	473736	https://i.scdn.co/image/ab6761610000e5eb3b853e76066d55089ba9581f
2ooIqOf4X2uz4mMptXCtie	Neutral Milk Hotel	55	606083	https://i.scdn.co/image/731f5f71de27c36300d2cf71a7f9cd7f389d0bf7
1KP6TWI40m7p3QBTU6u2xo	BØRNS	66	1102980	https://i.scdn.co/image/ab6761610000e5eb6308e79c621076395807b455
1MIe1z4RdqLqHSJsb7EBMm	The Greeting Committee	51	107591	https://i.scdn.co/image/ab6761610000e5eb7f25f8a78585d6b5cda70a3f
4l1cKWYW591xnwEGxpUg3J	Miike Snow	54	615352	https://i.scdn.co/image/b3944378d08ba28b16c494cc7f63703175169251
1fZpYWNWdL5Z3wrDtISFUH	Shakey Graves	58	463085	https://i.scdn.co/image/ab6761610000e5ebe4368448c8f76d21de6a5c1d
0AkmSuTOzM2pNCIOSP8ziv	Amigo the Devil	49	109817	https://i.scdn.co/image/ab6761610000e5eb757280ee844ac5714b919648
3dv4Q4q3LWOnbLJnC6GgTY	Yellow Days	52	443732	https://i.scdn.co/image/ab6761610000e5eb3a007701f172556b9e917b1e
60df5JBRRPcnSpsIMxxwQm	Otis Redding	67	2003752	https://i.scdn.co/image/4ad89c805aff0fb76b01b6b62b39e21fcd8943c3
3JaAGmSTpJK35DqWrDUzBz	Sweet	57	387408	https://i.scdn.co/image/ab6761610000e5eb29a247c0aac9cbe94bc47865
3RGLhK1IP9jnYFH4BRFJBS	The Clash	68	2416382	https://i.scdn.co/image/ab470b275daa38351810a1eb91d107ebdb821302
0oSGxfWSnnOXhD2fKuz2Gy	David Bowie	76	8688148	https://i.scdn.co/image/ab6761610000e5ebb78f77c5583ae99472dd4a49
7lzordPuZEXxwt9aoVZYmG	Billy Idol	67	1530699	https://i.scdn.co/image/ab6761610000e5ebd42c6334786bfdea92beeb5d
33EUXrFKGjpUSGacqEHhU4	Iggy Pop	62	1383960	https://i.scdn.co/image/ab6761610000e5eb21e6d14c3d8aab9887380d00
2CVBumuL5KyztqCyo7CETY	Elton Motello	20	2489	https://i.scdn.co/image/c6cd62c680a2993e07f4cd430140be441af6572e
5aBEGOeWQCJfptic9xyaAb	Tones On Tail	35	59017	https://i.scdn.co/image/ab67616d0000b273768d2a36068dd1adcaa1f31b
2ZfogSsOWP4mVfEqfpLXCt	The Church	49	194631	https://i.scdn.co/image/ab6761610000e5ebf87738dae4fe74422080fa5c
3gdbcIdNypBsYNu3iiCjtN	The B-52's	59	886307	https://i.scdn.co/image/ab6761610000e5eb85c1d77e63082caf426f6d59
0rpMdBzQXf7aYRnu5fDBJy	Violent Femmes	56	602365	https://i.scdn.co/image/ab6761610000e5ebf7100a1b5ae490f13b6b8078
3yY2gUcIsjMr8hjo51PoJ8	The Smiths	74	3643966	https://i.scdn.co/image/481b980af463122013e4578c08fb8c5cbfaed1e9
0Zy4ncr8h1jd7Nzr9946fD	Killing Joke	48	269319	https://i.scdn.co/image/ab6761610000e5ebb27c2f14d0deaac56f64c1f4
2to6ZW4W0XOZZsztSErr0b	The Bad Seeds	28	1191	https://i.scdn.co/image/ab67616d0000b273815d428841386dcb20fb6840
3fhOTtm0LBJ3Ojn4hIljLo	Roxy Music	60	842685	https://i.scdn.co/image/ab6761610000e5eb35572c81290a3e3d4a0906e3
4BFMTELQyWJU1SwqcXMBm3	The Stooges	51	535805	https://i.scdn.co/image/1d9f0cf8e6d8d51f28369eccd78dca2882fb0d83
4JfFdF9Row7UXtdsKtT6tc	Darondo	50	98341	https://i.scdn.co/image/d50f417de87096c31822c2349cb3534821ac7bec
1eClJfHLoDI4rZe5HxzBFv	INXS	68	2209697	https://i.scdn.co/image/ab6761610000e5eb9bfd44c9bd2aae22edfd99bf
2iul6etLF5hjjpxo43rzz7	Lera Lynn	42	83005	https://i.scdn.co/image/ab6761610000e5ebde10fb8cd40da4e0af316b77
73sIBHcqh3Z3NyqHKZ7FOL	Childish Gambino	77	9984941	https://i.scdn.co/image/ab6761610000e5eb3ef779aa0d271adb2b6a3ded
4V8LLVI7PbaPR0K2TGSxFF	Tyler, The Creator	83	9874817	https://i.scdn.co/image/ab6761610000e5eb8278b782cbb5a3963db88ada
3oDbviiivRWhXwIE8hxkVV	The Beach Boys	70	3869682	https://i.scdn.co/image/ab6761610000e5eb92602f233ce2295748f44603
6loBF9iQdE11WSX29fNKqY	Howard Jones	49	361466	https://i.scdn.co/image/ab6761610000e5eb93e7c004e39b91f88d1088af
7guDJrEfX3qb6FEbdPA5qi	Stevie Wonder	74	5861475	https://i.scdn.co/image/c59faacbed7aa770266bad048660810eca204108
0YHgnSkV3S5mvSSCTRWDi5	Poor Mans Poison	61	157073	https://i.scdn.co/image/ab6761610000e5eb7e8b8316444011b2555929f0
57bUPid8xztkieZfS7OlEV	The Supremes	61	1497759	https://i.scdn.co/image/5c5dc3f7b4569a7727a63a44513c7a602b72da44
0X380XXQSNBYuleKzav5UO	Nine Inch Nails	65	2168483	https://i.scdn.co/image/ab6761610000e5eb047095c90419cf2a97266f77
5eIbEEQnDM8yuDVB0bimSP	RL Grime	59	394810	https://i.scdn.co/image/ab6761610000e5eb8839d67ee5f8963a1ba5458f
3pkmfqaBNsMqnXus05PNfP	Handsome Boy Modeling School	44	127712	https://i.scdn.co/image/ab6761610000e5ebeb049e8fe237761c3ca58fcf
20wkVLutqVOYrc0kxFs7rA	Daniel Caesar	76	3571392	https://i.scdn.co/image/ab6761610000e5ebbd09edfd2babfc9fd2ba748e
1mFX1QlezK1lNPKQJkhwWb	New Edition	56	1395248	https://i.scdn.co/image/44e1b32aa085bd943fabd36678804d3fd3b8fb67
0VbDAlm2KUlKI5UhXRBKWp	Henry Green	50	59646	https://i.scdn.co/image/ab6761610000e5eb6dabc1aa79f0541b26cd1835
7KGqvFukcZRbQ7YFsYrgPa	Donnie & Joe Emerson	42	24726	https://i.scdn.co/image/ab6761610000e5eb1d8289c5a98c178330f4fc32
6PEMFpe3PTOksdV4ZXUpbE	NxWorries	57	224531	https://i.scdn.co/image/ab6761610000e5eb89fa062521347470d69ba4c2
0EdvGhlC1FkGItLOWQzG4J	Sublime	68	2364384	https://i.scdn.co/image/ab6761610000e5ebe726280500259dbdb97a8be4
00FQb4jTyendYWaN8pK0wa	Lana Del Rey	88	18665462	https://i.scdn.co/image/ab6761610000e5ebc5903678d3db18e271e42be0
462T0buQ5ScBUQCRpodDRf	Charles Bradley	56	435551	https://i.scdn.co/image/ab6761610000e5eb5b855b0ad3f90d4addabf7f2
3jK9MiCrA42lLAdMGUZpwa	Anderson .Paak	77	2251990	https://i.scdn.co/image/ab6761610000e5eb96287bd47570ff13f0c01496
3qnGvpP8Yth1AqSBMqON5x	Leon Bridges	70	1463038	https://i.scdn.co/image/ab6761610000e5ebc1493f8c442935b396753e21
13ubrt8QOOCPljQ2FL1Kca	A$AP Rocky	80	11494080	https://i.scdn.co/image/ab6761610000e5ebee452efcf24aa4124fb28d94
6QRlkjrHz5A62mqeNZz7t3	La Luz	41	68657	https://i.scdn.co/image/ab6761610000e5eb3622bf879af58458f4172ba9
5CuU6SRJjbbZL926nSGGxX	Open Mike Eagle	44	111433	https://i.scdn.co/image/ab6761610000e5eb07e639e91b9008358ff864ec
6pmxr66tMAePxzOLfjGNcX	Beirut	56	938267	https://i.scdn.co/image/ab6761610000e5eb2d8bf7cc9fdf477efeede65f
3XHO7cRUPCLOr6jwp8vsx5	alt-J	69	3074115	https://i.scdn.co/image/ab6761610000e5eb3fb5214e667e278a20878a6b
6eU0jV2eEZ8XTM7EmlguK6	Black Pumas	58	749828	https://i.scdn.co/image/ab6761610000e5eb026d3ed0a2800958c1d59f4f
2h93pZq0e7k5yf4dywlkpM	Frank Ocean	82	10199260	https://i.scdn.co/image/ab6761610000e5ebfbc3faec4a370d8393bee7f1
1zXCFUgH6FWS0iCiCKsH55	Kai Straw	48	37161	https://i.scdn.co/image/ab6761610000e5eb14e7649374fe27bf1c5a72c0
3z6Gk257P9jNcZbBXJNX5i	Regina Spektor	60	1303988	https://i.scdn.co/image/ab6761610000e5eba36a9f95d59ab791d5e897e9
74oJ4qxwOZvX6oSsu1DGnw	Cream	61	2034730	https://i.scdn.co/image/aab6a0a0e9ca2ab17460b0451e59ba507cc5802a
0XSqX2PB3C5dTMv7SZaxSm	Wolf Parade	39	151022	https://i.scdn.co/image/ab6761610000e5ebe0ee9d6c0075af4fabb763bb
08GQAI4eElDnROBrJRGE0X	Fleetwood Mac	78	8937007	https://i.scdn.co/image/ab6761610000e5eb249d55f2d68a44637905c57e
6l3HvQ5sa6mXTsMTB19rO5	J. Cole	84	18321464	https://i.scdn.co/image/ab6761610000e5ebadd503b411a712e277895c8a
6RZUqkomCmb8zCRqc9eznB	Placebo	66	1678341	https://i.scdn.co/image/ab6761610000e5ebc8b42133fea50275b77f45e2
0fA0VVWsXO9YnASrzqfmYu	Kid Cudi	81	6132766	https://i.scdn.co/image/ab6761610000e5eb876faa285687786c3d314ae0
6ZK2nrW8aCTg8Bid7I7N10	Chelsea Wolfe	49	247189	https://i.scdn.co/image/ab6761610000e5ebb4de2ca8852a45b57575bde8
6TVVIyd0fsRDGg6WzHKyTP	Durand Jones & The Indications	57	258725	https://i.scdn.co/image/ab6761610000e5ebe8611a96977e7c7a04a1fbdf
6tkrcmVfWoHC4WOhE7IDyq	Lost Dog Street Band	45	94736	https://i.scdn.co/image/ab6761610000e5eb115afe5becc81bbc6dd33d69
600GgDUq9kzGJgNIrVsWfz	Habibi	32	32600	https://i.scdn.co/image/ab6761610000e5eba5eb7686c107776ebd315b45
2jgPkn6LuUazBoBk6vvjh5	The Zombies	58	825241	https://i.scdn.co/image/ab6761610000e5eb4bbeb54a562d3de858825979
6v8FB84lnmJs434UJf2Mrm	Neil Young	60	2645287	https://i.scdn.co/image/ab6772690000c46c49b91a07c864561ba7c78ba7
3QTDHixorJelOLxoxcjqGx	SiR	63	747723	https://i.scdn.co/image/ab6761610000e5eb972a4e990fb36451db2f40f2
3ycxRkcZ67ALN3GQJ57Vig	Masego	67	1062733	https://i.scdn.co/image/ab6761610000e5eb161fef4ab6a8ff32c699d6fa
77SW9BnxLY8rJ0RciFqkHh	The Neighbourhood	83	10648300	https://i.scdn.co/image/ab6761610000e5ebdf0b5ac84376a0a4b2166816
5NYEE4kgrEZPlM3DxUsTyc	Twin Temple	42	79356	https://i.scdn.co/image/ab6761610000e5eb4cdf29c756e7fe8eb08851a2
75dQReiBOHN37fQgWQrIAJ	Local Natives	57	615558	https://i.scdn.co/image/ab6761610000e5ebf32fbcfa726d3c7e9a8b0c74
2pAajGWerK3ghwToNWFENS	Puscifer	55	561984	https://i.scdn.co/image/ab6761610000e5ebcba11fb640f2298fe3bd72de
22bE4uQ6baNwSHPVcDxLCe	The Rolling Stones	76	12305411	https://i.scdn.co/image/ab6761610000e5ebd3cb15a8570cce5a63af63d8
5a2EaR3hamoenG9rDuVn8j	Prince	69	6406927	https://i.scdn.co/image/ab6761610000e5ebeaca358712b3fe4ed9814640
6Ghvu1VvMGScGpOUJBAHNH	Deftones	75	3163535	https://i.scdn.co/image/ab6761610000e5eb4b2da0b72cab26ac518f1f0d
4n0gvapwYbRpzU5Ov68B6P	The King Khan & BBQ Show	41	74421	https://i.scdn.co/image/c52c95c28cbf57a5b9b775789799bacadb915292
4uSftVc3FPWe6RJuMZNEe9	Andrew Bird	57	533746	https://i.scdn.co/image/ab6761610000e5eb4bb6b07ebb49a29e623961f4
6AWdGez5g1jxpfl9XD4wI3	Amir Obe	48	130862	https://i.scdn.co/image/ab6761610000e5ebf2bbfca5666eb8c35f438a1f
7HeVXdOdMhLslVputGTZFQ	Timber Timbre	45	187165	https://i.scdn.co/image/ab6761610000e5eb5fc147cc9258d4f029930596
5M0lbkGluOPXLeFjApw8r8	DRAM	0	0	
0V7uVrIYr4FwFvUN9S4kYr	Nick Waterhouse	48	89627	https://i.scdn.co/image/ab6761610000e5ebe0108d02daadb928bfbbd68e
6hnWRPzGGKiapVX1UCdEAC	Sam Cooke	65	1412331	https://i.scdn.co/image/ab6761610000e5eb41aaa3a05d2ddba59454273e
2FRXiAz5Uz78LLLSwEUhLt	Miracle Musical	55	237710	https://i.scdn.co/image/ab6761610000e5eb904bf7e11545f9cb5feaf1b2
7ITd48RbLVpUfheE7B86o2	The Decemberists	53	569398	https://i.scdn.co/image/ab6761610000e5ebad12e7af41c3a1903d1273b8
1yAwtBaoHLEDWAnWR87hBT	Modest Mouse	62	1323744	https://i.scdn.co/image/ab6761610000e5eb3ff03c042ca55bcc7e7f490e
6LufpoVlIYKQCu9Gjpk8B7	Sharon Jones & The Dap-Kings	60	253499	https://i.scdn.co/image/cd0f5585d478bbb91cff3e0b723ed91c6d2046d7
2kGBy2WHvF0VdZyqiVCkDT	Father John Misty	59	709379	https://i.scdn.co/image/ab6761610000e5ebdadc30179c554ac7912f8477
68kEuyFKyqrdQQLLsmiatm	Vince Staples	67	1662000	https://i.scdn.co/image/ab6761610000e5eb53054f8bc7e0153daefe12cc
1hzfo8twXdOegF3xireCYs	Milky Chance	71	1702212	https://i.scdn.co/image/ab6761610000e5eb272b8122de18063dd387a155
251UrhgNbMr15NLzQ2KyKq	Rayland Baxter	54	146041	https://i.scdn.co/image/ab6761610000e5eb3e4fddfb76e55084bdd1479c
4DFhHyjvGYa9wxdHUjtDkc	A Perfect Circle	61	1609224	https://i.scdn.co/image/ab6761610000e5eb41472573351dfea479a4ffba
5IcR3N7QB1j6KBL8eImZ8m	ScHoolboy Q	71	4304174	https://i.scdn.co/image/ab6761610000e5ebe697a7ddf7af3a306428fa73
3D4qYDvoPn5cQxtBm4oseo	mewithoutYou	43	130348	https://i.scdn.co/image/ab6761610000e5ebe03d502190e35ac58c18d339
3tJ9PkBOrG7hFkHeNM2tbw	Olodum	45	180437	https://i.scdn.co/image/c3ef77c1c27ec33d3356ca7665b09aaf2bfe1c23
2ApaG60P4r0yhBoDCGD8YG	Elliott Smith	63	839946	https://i.scdn.co/image/ab6761610000e5eb079739b801ab3f105866b76f
6GEykX11lQqp92UVOQQCC7	DJ Premier	59	225521	https://i.scdn.co/image/ab6761610000e5eb7bbda26434643249f6228ea1
1anAI9P9iSzc9qzLv6AtHZ	Sure Sure	55	108227	https://i.scdn.co/image/ab6761610000e5eb3a2c4b388f7ababb018e4afa
2auiVi8sUZo17dLy1HwrTU	Solange	60	1848629	https://i.scdn.co/image/ab6761610000e5eb631cf0aa859e5a20e836f14f
6zvul52xwTWzilBZl6BUbT	Pixies	70	2339061	https://i.scdn.co/image/ab6761610000e5ebd0456128dd330d18e18b4715
2bToe6WyGvADJftreuXh2K	Lee Fields & The Expressions	49	139977	https://i.scdn.co/image/ab6761610000e5eb2ab0f0d7e19354bbe50c3546
432R46LaYsJZV2Gmc4jUV5	Joy Division	62	1986333	https://i.scdn.co/image/5eeddd733170399db794d2c430a8d2cde7ae1425
1PryMSya1JnSAlcwYawCxp	Menahan Street Band	59	134243	https://i.scdn.co/image/ab6761610000e5eb46dc0fd03399b8a9dfed982d
1nGqKVGfPPiVgxMdx8hYOI	Ezra Bell	44	19212	https://i.scdn.co/image/ab6761610000e5eb597927b89a95412d987c9286
7FKTg75ADVMZgY3P9ZMRtH	flipturn	54	80591	https://i.scdn.co/image/ab6761610000e5ebfc6b3360ae52cbc1768296d6
7bu3H8JO7d0UbMoVzbo70s	The Cure	74	4051376	https://i.scdn.co/image/7ca743e822b80133971ccf5c70fcbd77a4f4f508
0MVp3LuNho9Hk6Q1owsWwt	Right Away, Great Captain!	33	41233	https://i.scdn.co/image/ab6761610000e5ebb9b73c2a648759a40a7bdec8
1SQRv42e4PjEYfPhS0Tk9E	The Kinks	64	2254084	https://i.scdn.co/image/ab6761610000e5eb8f8013de1cd216cfdd7a4848
0oL26Dn9y761yfJgNb3vfu	Michigander	50	30621	https://i.scdn.co/image/ab6761610000e5eb5f78a32b18ce30b84b370e39
0v6gOfGBclTSGu6agfXb23	The Rural Alberta Advantage	41	67764	https://i.scdn.co/image/ab6761610000e5ebf2acadf50bfd1bb62669a10b
0yNLKJebCb8Aueb54LYya3	New Order	65	1799713	https://i.scdn.co/image/ab6761610000e5eba080a8e96758f416301578f9
4fXkvh05wFhuH77MfD4m9o	St. Paul & The Broken Bones	54	371746	https://i.scdn.co/image/ab6761610000e5ebd312cb24aecff2b4549b72ca
2x9SpqnPi8rlE9pjHBwmSC	Talking Heads	68	1989887	https://i.scdn.co/image/e4c5b04fce8706c87663357b1f78522a3a5c641b
4LG4Bs1Gadht7TCrMytQUO	The Shins	60	1129256	https://i.scdn.co/image/ab6761610000e5eb6c87e9e995eedad42e73dcc4
1Tp7C6LzxZe9Mix6rn4zbI	Wilderado	54	78077	https://i.scdn.co/image/ab6761610000e5eba7eb714346f5bd4e73a671b7
7foyQbi7GKriLiv1GPVEwt	Susto	49	35406	https://i.scdn.co/image/ab6761610000e5eb08465c702d6aa44e045c9300
6m4tJuf67jwVSvMP34hrck	Saun & Starr	42	8767	https://i.scdn.co/image/c0b1f5eb4a0890883235e7791561bc398af8f1a7
1nJvji2KIlWSseXRSlNYsC	The Velvet Underground	62	1613421	https://i.scdn.co/image/d69c2cf10323bf08443c7d122f3a1824a760ab57
32Ko3nL0210QAt14S3Rs4Y	Sjowgren	54	64388	https://i.scdn.co/image/ab6761610000e5eb32d5f17f02a8fb2d170c0e79
4Z8W4fKeB5YxbusRsdQVPb	Radiohead	78	7537861	https://i.scdn.co/image/ab6761610000e5eba03696716c9ee605006047fd
4zsrUnozu6zRlVELQezaBn	Naomi Shelton	29	1380	https://i.scdn.co/image/350edc3da212585098d60384bde750f274912183
00tVTdpEhQQw1bqdu8RCx2	Blue Öyster Cult	62	1322941	https://i.scdn.co/image/ab6761610000e5eba50ccc99f741a7899654bc16
0vqkz1b2qBkoYrGMj2CUWq	Bobby Womack	57	631974	https://i.scdn.co/image/ab6761610000e5eb2db6593db2598005d56a46e1
2AV6XDIs32ofIJhkkDevjm	Curtis Mayfield	58	974708	https://i.scdn.co/image/ab6761610000e5ebeea0f2f51d7969bbb4000f92
2FXC3k01G6Gw61bmprjgqS	Hozier	76	5279282	https://i.scdn.co/image/ab6761610000e5eb9ba4d95b74bacff4d5747f61
2g3PKH7Z1Ofn5oGR6oDjLy	The Sonics	42	116059	https://i.scdn.co/image/268e0f329a377e4b8a9a639ba00e1d30cf555604
3hteYQFiMFbJY7wS0xDymP	Gesaffelstein	0	0	
06HL4z0CvFAxyc27GXpf02	Taylor Swift	0	0	
5fMUXHkw8R8eOP2RNVYEZX	Diplo	0	0	
23fqKkggKUBHNkbKtXEls4	Kygo	0	0	
2RdwBSPQiwcmiDo9kixcl8	Pharrell Williams	0	0	
4kI8Ie27vjvonwaB2ePh8T	Portugal. The Man	0	0	
2dBj3prW7gP9bCCOIQeDUf	Danger Mouse	0	0	
0e9H8oaYYRCKFXOVv848nt	Bad Books	0	0	
0du5cEVh5yTK9QJze8zA0C	Bruno Mars	0	0	
5p7f24Rk5HkUZsaS3BLG5F	Hailee Steinfeld	0	0	
55fhWPvDiMpLnE4ZzNXZyW	Noah Cyrus	0	0	
2mVVjNmdjXZZDvhgQWiakk	Khruangbin	0	0	
50co4Is1HCEo8bhOyUWKpn	Young Thug	0	0	
5SXuuuRpukkTvsLuUknva1	Baby Keem	0	0	
1uNFoZAHBGtllmzznpCI3s	Justin Bieber	0	0	
5FxD8fkQZ6KcsSYupDVoSO	Omar Apollo	0	0	
17Zu03OgBVxgLxWmRUyNOJ	Knxwledge	0	0	
0epOFNiUfyON9EYx7Tpr6V	The Strokes	0	0	
2PaZWGu5T5nHjY2xxAkFsT	THE SCOTTS	0	0	
0erhjm5MwzWpFRFuorXLT2	King Dude	0	0	
74ASZWbe4lXaubB36ztrGX	Bob Dylan	0	0	
7nqSDaZKccpnUqjzedyZF4	The Bronx	0	0	
3rWZHrfrsPBxVy692yAIxF	WILLOW	0	0	
5Vuvs6Py2JRU7WiFDVsI7J	Lucky Daye	0	0	
7E2ioKxoxI2J94tUkIx6As	Alex Isley	0	0	
0cGUm45nv7Z6M6qdXYQGTX	Kehlani	0	0	
6CWTBjOJK75cTE8Xv8u1kj	Feist	0	0	
4AKwRarlmsUlLjIwt38NLw	Ofenbach	0	0	
1M3BVQ36cqPQix8lQNCh4K	Shovels & Rope	0	0	
6qqNVTkY8uBg9cP3Jd7DAH	Billie Eilish	0	0	
7dzq55YG3wjViqexDwiycQ	Ivete Sangalo	0	0	
3qvcCP2J0fWi0m0uQDUf6r	Luan Santana	0	0	
20qISvAhX20dpIbOOzGK3q	Nas	0	0	
4RnBFZRiMLRyZy0AzzTg2C	Run The Jewels	0	0	
4xRYI6VqpkE3UwrDrAZL8L	Logic	0	0	
165ZgPlLkK7bf5bDoFc6Sb	Limp Bizkit	0	0	
3s7WzrEs4FkNObqj4WyfQm	Black Soprano Family	0	0	
4nvFFLtv7ZqoTr83387uK4	Dynamicduo	0	0	
0xRXCcSX89eobfrshSVdyu	MEDUZA	0	0	
6WY7D3jk8zTrHtmkqqo5GI	Maren Morris	0	0	
6PfSUFtkMVoDkx4MQkzOi3	100 gecs	56	465566	https://i.scdn.co/image/ab6761610000e5ebd77a9c855001f3a9b5815bc0
5vSQUyT33qxr1xAX2Tkf3A	Clams Casino	56	218429	https://i.scdn.co/image/ab6761610000e5ebeb01ceedf9eb7f7cf92b634a
0eDvMgVFoNV3TpwtrVCoTj	Pop Smoke	82	11430239	https://i.scdn.co/image/ab6761610000e5eb597f9edd2cd1a892d4412b09
6guC9FqvlVboSKTI77NG2k	Dance Gavin Dance	64	613730	https://i.scdn.co/image/ab6761610000e5eb7ab31728854684433fe3dc64
2NjfBq1NflQcKSeiDooVjY	Tones And I	70	2983772	https://i.scdn.co/image/ab6761610000e5ebec4cca4babaad69382fb52e6
757aE44tKEUQEqRuT6GnEB	Roddy Ricch	79	8563937	https://i.scdn.co/image/ab6761610000e5eb9c30c6b69a55d48decd71600
6XyY86QOPPrYVGvF9ch6wz	Linkin Park	82	22045834	https://i.scdn.co/image/ab6761610000e5eb34e5aa6afc1ba147bfbb0677
422qjlzkDtxmaeeOLhnE6A	(K)NoW_NAME	48	44903	https://i.scdn.co/image/ab6761610000e5eb28e83e2139653508735b14d5
2cFrymmkijnjDg9SS92EPM	blackbear	78	4800453	https://i.scdn.co/image/ab6761610000e5eb4f7d049994ac00ed885bfbf2
1rCIEwPp5OnXW0ornlSsRl	Metric	59	711473	https://i.scdn.co/image/ab6761610000e5ebe0812e8d85a4cc98cbc3bf2c
6MPCFvOQv5cIGfw3jODMF0	Internet Money	70	671489	https://i.scdn.co/image/ab6761610000e5eb30cc15d302e22803fcb5ad34
4sQNUQjOYj9rV2sdfJ8laS	Angerfist	57	403201	https://i.scdn.co/image/ab6761610000e5ebc5f1b5bf40435c2d378a07ba
21dooacK2WGBB5amYvKyfM	Smokepurpp	60	2431810	https://i.scdn.co/image/ab6761610000e5eb7caf23154583969c7482e0ec
7Im2r58zlLJIDfamqDjEE6	Mestre Bimba	17	3877	https://i.scdn.co/image/ab67616d0000b27391f893ddac30579061aa0b2c
1r59KUMNZRw0M8FDnrHq0o	FETISH	46	31225	https://i.scdn.co/image/ab6761610000e5eb9d370cc1a5fc30642093f07d
0dlDsD7y6ccmDm8tuWCU6F	Freddie Dredd	75	1120096	https://i.scdn.co/image/ab6761610000e5eb9d100e5a9cf34beab8e75750
7A8S43ryYdbWpJKeHRZRcq	JACKBOYS	64	501372	https://i.scdn.co/image/ab6761610000e5eb440b705481183f0ddaa521d7
0iEtIxbK0KxaSlF7G42ZOp	Metro Boomin	79	3101343	https://i.scdn.co/image/ab6761610000e5ebdf9a1555f53a20087b8c5a5c
0Y5tJX1MQlPlqiwlOH1tJY	Travis Scott	87	21333703	https://i.scdn.co/image/ab6761610000e5ebe707b87e3f65997f6c09bfff
0H39MdGGX6dbnnQPt6NQkZ	SAINt JHN	69	898286	https://i.scdn.co/image/ab6761610000e5eb2a1356370e5fce1b25df0ac9
6Q1ggxOPVDbMyqlhv0tmT4	Bode Veio	11	446	https://i.scdn.co/image/ab67616d0000b273ad6c26da48be5afc9b5456f8
5m9PQtVJ9ZZVWgb3t2nTMN	ur pretty	40	18095	https://i.scdn.co/image/ab6761610000e5eb00145d4bcf1756ae14202b06
4RKYu5o9e1MSd5eq3SYr9I	Prison Mike	32	3432	https://i.scdn.co/image/ab67616d0000b273420d6ccc3a554ce8ed962555
5dHt1vcEm9qb8fCyLcB3HL	A$AP Ferg	70	3395349	https://i.scdn.co/image/ab6761610000e5ebf1122f644f19ba22750d2bd8
7HGNYPmbDrMkylWqeFCOIQ	Caetano Veloso	65	1952860	https://i.scdn.co/image/ab6761610000e5ebe98de50f36cf1aa4bf047757
3qZ2n5keOAat1SoF6bHwmb	Zeca Pagodinho	61	1429571	https://i.scdn.co/image/ab6761610000e5eb6ec92095c26af9ea20cd4451
09U6hmCerKcIJrixubiBjm	Pineapple StormTv	73	6311906	https://i.scdn.co/image/ab6761610000e5ebe915b03e0d384550b452d024
7oEkUINVIj1Nr3Wnj8tzqr	Gilberto Gil	62	1059110	https://i.scdn.co/image/ab6761610000e5eb03b2a5ceda2ab12bfaa3b5ed
5rX2c1zow6hCph8PnnU3kF	Astrud Gilberto	59	196948	https://i.scdn.co/image/ab67616d0000b2730a2d5daaa98e0395fdf36c78
1b8kpp4DUwt1hWaxTiWQhD	Gal Costa	66	622692	https://i.scdn.co/image/ab6761610000e5eb706bb8bbf9d721d8141ba358
2FW6Zt8gyIF7Fb7O3TGxnE	Sambabook	47	241	https://i.scdn.co/image/ab6761610000e5eb84b8527aaf1c1ce4099d2fe7
0Mz5XE0kb1GBnbLQm2VbcO	Mos Def	63	1283437	https://i.scdn.co/image/d39cd5769332fb51014cc1cc9934c8890fcd49f7
0av074qUwLn5eyzwqoq3xh	People Under The Stairs	49	181252	https://i.scdn.co/image/bf9be990f581592fad856fd135926686c516b869
2PmIyxmEFsNfQJjEifPDZC	RAT BOY	59	99324	https://i.scdn.co/image/ab6761610000e5eb162c91491669e10b34cc925e
3Rq3YOF9YG9YfCWD4D56RZ	Nujabes	60	774090	https://i.scdn.co/image/ab6761610000e5eb2dd5a47714902a1db1810456
3YQKmKGau1PzlVlkL1iodx	Twenty One Pilots	79	22773585	https://i.scdn.co/image/ab6761610000e5eb196972172c37d934d9ca8093
6eUKZXaKkcviH0Ku9w2n3V	Ed Sheeran	89	104928797	https://i.scdn.co/image/ab6761610000e5eb12a2ef08d00dd7451a6dbed6
7GN9PivdemQRKjDt4z5Zv8	The Internet	60	1190729	https://i.scdn.co/image/ab6761610000e5ebc32c5dcda378eb561f81b1f9
34Y0ldeyUv7jBvukWOGASO	Bobby Shmurda	59	1373689	https://i.scdn.co/image/ab6761610000e5ebee12e6771607433caee705a3
4LLpKhyESsyAXpc4laK94U	Mac Miller	82	8179883	https://i.scdn.co/image/ab6761610000e5ebed3b89aa602145fde71a163a
7gjAu1qr5C2grXeQFFOGeh	Passion Pit	57	1223180	https://i.scdn.co/image/ab6761610000e5ebeccf9bbcdcf7b750f6a6c687
3PfyosblIBaNJNH88MUkgM	Nate Eiesland	22	787	
7oPftvlwr6VrsViSDV7fJY	Green Day	78	13526040	https://i.scdn.co/image/ab6761610000e5eb047eac333eff0be4abe32cbf
738wLrAtLtCtFOLvQBXOXp	Major Lazer	73	6315098	https://i.scdn.co/image/ab6761610000e5eb133f44ab343b35c715a4ac97
6fxyWrfmjcbj5d12gXeiNV	Denzel Curry	71	1979159	https://i.scdn.co/image/ab6761610000e5ebb00f2e31d509ddc6fa0eb24b
6kDMoHTcBICPILP2aclPWZ	Mew	39	130682	https://i.scdn.co/image/ab6761610000e5eb94e9e7cff50fde27c86dc0b2
23cC3RI0hgD5sWmXKPAJuG	Matt Quentin	45	21239	https://i.scdn.co/image/ab6761610000e5eb10c2a5ed8ed7ad2ea8a7af65
1xHQO9GJIW9OXHxGBISYc5	Marian Hill	53	457881	https://i.scdn.co/image/ab6761610000e5eb65f01a288ca1ad0194c1e051
09hVIj6vWgoCDtT03h8ZCa	A Tribe Called Quest	65	1773625	https://i.scdn.co/image/ab6761610000e5eb774d73ae6796b6f437d89db9
1MBqzcu6aiY7GzP5BfG56T	La Caution	40	19570	https://i.scdn.co/image/ab67616d0000b273d3ddd4361d835095a06a70bf
1WxunfiOh9Ws0uu2JoDmjL	Quarteto Jobim-Morelenbaum	41	11446	https://i.scdn.co/image/ab67616d0000b273529e24bf8ffe6504aaa0d02c
5JYtpnUKxAzXfHEYpOeeit	Jorge Ben Jor	61	784099	https://i.scdn.co/image/a9c6a324c5f4a0f25bc711a7c4434c89c05ceba2
1gIa65d5ICT2xVWiUJ3u27	Tom Zé	45	249982	https://i.scdn.co/image/03d250f957eb557725bf2c1c7e5e0ccc7b8192eb
0I11U609NiFEdpvNix7oNl	Mestre Batata - Capoeira Besouro	2	337	
6xQwC94a61f3bZwyl4UJXD	Mestre Suassuna e Dirceu	21	4679	https://i.scdn.co/image/ab67616d0000b2738c65587da02793fa2b609569
4M5nCE77Qaxayuhp3fVn4V	Iron & Wine	61	1032801	https://i.scdn.co/image/ab6761610000e5eb6a521312add75461d989f671
6aaMZ3fcfLv4tEbmY7bjRM	Isaiah Rashad	66	1206376	https://i.scdn.co/image/ab6761610000e5eb1ff1685224034e6c12538722
7hi7sNBb4AWmzHRjFCs94V	Mestre Plinio	26	1487	https://i.scdn.co/image/ab67616d0000b2733af0895d597387883db18339
04gDigrS5kc9YWfZHwBETP	Maroon 5	84	38551676	https://i.scdn.co/image/ab6761610000e5eb288ac05481cedc5bddb5b11b
6BIltkF2V7p0PHLtUyc7re	Rafael de Lemba	24	1832	https://i.scdn.co/image/ab67616d0000b2739782bf68194be596d0455dc1
2p1fiYHYiXz9qi0JJyxBzN	Skepta	71	1064352	https://i.scdn.co/image/ab6761610000e5eb38bcbc9ddae4d1db009387d7
7qJAk8CiXUgDPPUF3REKr2	Raizes da Capoeira	4	245	
5SKEXbgzIdRl3gQJ23CnUP	Capoeira Experience	20	5381	https://i.scdn.co/image/ab67616d0000b2735d7c48f01fb27cf927810a7f
1cIz2h3ERs72r60yw78Deu	Drinks On Me	46	7226	https://i.scdn.co/image/ab6761610000e5ebd2fc6f1ed95ae028996a6a77
4ERtgeBbWRkFzIz6LaFCeY	Dashboard Confessional	55	556185	https://i.scdn.co/image/ab6761610000e5eb6c52301d3d723bcf907cfeaa
4dM6NDYSfLcspt8GLoT5aE	Hippie Sabotage	67	821572	https://i.scdn.co/image/ab6761610000e5eb5cc73bce8ae9e21bb1423b23
1KEUVZo7CMTSJoM8doulOT	Smile Empty Soul	46	296533	https://i.scdn.co/image/ab6761610000e5ebd11b9645340699a734cc9f2e
67p5GMYQZOgaAfx1YyttQk	Denis Porto	2	452	
6dGRShw3EqULdxZl9EEJYv	Grupo Muzenza de Capoeira	29	4804	https://i.scdn.co/image/ab67616d0000b2739b5d25ea34d2a4237ce92eb1
6qgc4bSHhzZxnJ01WDEAHt	Mestre Suassuna	26	5625	https://i.scdn.co/image/ab67616d0000b27357f512881e78692829c29116
5ZfHVIBVoMg0VjgUBU0alH	Grupo de Capoeira Angola Pelourinho	27	5331	https://i.scdn.co/image/ab67616d0000b273e815479e87e3e05b98e27ef4
5nJ5xDXFO4czh2gJ9f4wto	Mestre Kenura	19	1516	https://i.scdn.co/image/ab67616d0000b273624fa913636494daabdef5ec
5sEDTHJJyDEWVFx99hGSIb	Mark Mothersbaugh	43	27524	https://i.scdn.co/image/ab6761610000e5ebd707bc90aea4229d20d91682
1K9pNfOfxZFfbEgoOmjV13	Grupo Nzinga	20	2289	https://i.scdn.co/image/ab67616d0000b273aaa202ad9518e90f1f2e0ae5
4Lm0pUvmisUHMdoky5ch2I	Apocalyptica	58	876628	https://i.scdn.co/image/ab6761610000e5eb7526751c3a833aac58be50aa
1MXZ0hsGic96dWRDKwAwdr	Tyla Yaweh	61	476910	https://i.scdn.co/image/ab6761610000e5eb05565ec0dfa28e5372a48c2d
6M2wZ9GZgrQXHCFfjv46we	Dua Lipa	0	0	
6i392l38cR3uBPF0DbNs7S	Quality Control	0	0	
4o0pNHbyj36LPvukNqEug0	The Maine	0	0	
77AiFEVeAVj2ORpC85QVJs	Steve Aoki	0	0	
0C8ZW7ezQVs4URX5aX7Kqx	Selena Gomez	0	0	
5K4W6rqBFWDnAN6FQUkS6x	Kanye West	0	0	
2kCcBybjl3SAtIcwdWpUe3	Lil Peep	0	0	
66CXWjxzNUsdJxJ2JdwvnR	Ariana Grande	0	0	
3XV0lFzNs8BCTwhJTcMiBr	Blue Ivy	0	0	
0u18Cq5stIQLUoIaULzDmA	DROELOE	0	0	
4mPPxTpWqDR5rmOrTOh4nk	Equipto	0	0	
4nDoRrQiYLoBzwC5BhVJzF	Camila Cabello	0	0	
3wcj11K77LjEY1PkEazffa	Burna Boy	0	0	
4yYYCSCDUTypErQMZv5iSg	Ray Vaughn	0	0	
5h6l7v8Ecxw1BKVBLrjFfE	Mestre Pernalonga	0	0	
5zfEatKLDdRkgbw6sdLBAQ	Octavian	0	0	
39XT9gMoNmMCOlvTTR273m	K-Trap	0	0	
3tVQdUvClmAT7URs9V3rsp	Wizkid	0	0	
3NbqBIc16CNAe5nYSmHR3p	JAE5	0	0	
20gsENnposVs2I4rQ5kvrf	Sam Feldt	0	0	
1IueXOQyABrMOprrzwQJWN	Sigala	0	0	
5pUo3fmmHT8bhCyHE52hA6	Liam Payne	0	0	
7FngGIEGgN3Iwauw1MvO4P	nothing,nowhere.	0	0	
70TsVY28EcEUYSGG5Yw7mp	Sam Tinnesz	0	0	
18hl4QMrybIXbkGi2BzXcf	Dj Capoeira	26	694	https://i.scdn.co/image/ab67616d0000b273a489f894b3329d6181b906a5
0ONHkAv9pCAFxb0zJwDNTy	Pusha T	71	2597479	https://i.scdn.co/image/ab6761610000e5ebc5b88a3924d8318f25f20594
7kA4sEagpoNK91I7wr9tYr	Bleu Clair	48	31721	https://i.scdn.co/image/ab6761610000e5eb8abb3f2003236e24ea1ab426
1SImpQO0GbjRgvlwCcCtFo	The Red Jumpsuit Apparatus	61	1213241	https://i.scdn.co/image/ab6761610000e5eb534cac4f88d6ab5870c1bbbf
1URnnhqYAYcrqrcwql10ft	21 Savage	92	12009006	https://i.scdn.co/image/ab6761610000e5ebe01decbaa565f3feaaade6a9
4DdkRBBYG6Yk9Ka8tdJ9BW	Offset	77	2502593	https://i.scdn.co/image/ab6761610000e5ebcb4be1652aaf558da2984098
1AldSIJ8ANuZVbjKIhpKKq	Carolina Soares	25	5974	https://i.scdn.co/image/ab6761610000e5ebe74dd345f7659efa70b1ed4c
2EhUXeszBQRApbBmTOXlKU	Mestre Acordeon	13	4758	https://i.scdn.co/image/ab67616d0000b27314355c7d3bcf22d0f48d12da
4CrK2BAeyd3DIt2M2ELPJ4	Raizes da Capoeira II	6	278	
5CCwRZC6euC8Odo6y9X8jr	Rita Ora	71	7710099	https://i.scdn.co/image/ab6761610000e5eb484ddaa955c4c03a46ef8d8d
246dkjvS1zLTtiykXe5h60	Post Malone	87	38732459	https://i.scdn.co/image/ab6761610000e5ebb894ef9fa437b0389c5567cc
25uiPmTg16RbhZWAqwLBy5	Charli XCX	75	2705488	https://i.scdn.co/image/ab6761610000e5eb576cb43281160e345f728b71
4r63FhuTkUYltbVAg5TQnk	DaBaby	81	10239425	https://i.scdn.co/image/ab6761610000e5eb5ace68c56849548db7f102be
26T3LtbuGT1Fu9m0eRq5X3	Cage The Elephant	72	3038697	https://i.scdn.co/image/ab6761610000e5eb7d994f7e137c10249de19455
24XtlMhEMNdi822vi0MhY1	Taking Back Sunday	61	762747	https://i.scdn.co/image/ab6761610000e5ebaf5a3cb16e57a2a815a6207d
64KEffDW9EtZ1y2vBYgq8T	Marshmello	82	34515094	https://i.scdn.co/image/ab6761610000e5eb41e4a3b8c1d45a9e49b6de21
15UsOTVnJzReFVN1VCnxy4	XXXTENTACION	86	38903544	https://i.scdn.co/image/ab6761610000e5ebf0c20db5ef6c6fbe5135d2e4
5cj0lLjcoR7YOSnhnX0Po5	Doja Cat	86	22869556	https://i.scdn.co/image/ab6761610000e5eb727a2ac15afe659be999beba
5yV1qdnmxyIYiSFB02wpDj	The Postal Service	50	519093	https://i.scdn.co/image/034778d5916fdfaacf926d7ec0e7440f717cd064
41rVuRHYAiH7ltBTHVR9We	Slushii	54	638143	https://i.scdn.co/image/ab6761610000e5eb96ff6643a51f35410a1d7fcf
0EeQBlQJFiAfJeVN2vT9s0	Nipsey Hussle	65	2941255	https://i.scdn.co/image/ab6761610000e5ebe9edae8fe232af1d2995c991
0jNDKefhfSbLR9sFvcPLHo	San Holo	56	669125	https://i.scdn.co/image/ab6761610000e5eb9ba8dc387019ab72831ff2b3
7boQqq2hUcz9kHcQOecG4j	Andre Nickatina	49	194619	https://i.scdn.co/image/62613d0f3cb36995b553137326d87980795cad52
5BvJzeQpmsdsFp4HGUYUEx	Vampire Weekend	64	1821565	https://i.scdn.co/image/ab6761610000e5eb44829ac83c4538a8cf7e9f40
4MCBfE4596Uoi2O4DtmEMz	Juice WRLD	88	26386749	https://i.scdn.co/image/ab6761610000e5eb1908e1a8b79abf71d5598944
1vCWHaC5f2uS3yhpwWbIA6	Avicii	79	22234387	https://i.scdn.co/image/ab6761610000e5eb09bf4814c6585e1f69dfeef7
3TVXtAsR1Inumwj472S9r4	Drake	97	68731033	https://i.scdn.co/image/ab6761610000e5eb4293385d324db8558179afd9
0SwO7SWeDHJijQ3XNS7xEE	MGMT	73	2636368	https://i.scdn.co/image/ab6761610000e5eb089bb3257ef5b3fab2a3c90d
3AA28KZvwAUcZuOKwyblJQ	Gorillaz	79	9504420	https://i.scdn.co/image/ab6761610000e5ebc19b16a0104300245c65c164
5r4anprO9Hg9CBlmdkwFdE	Capoeira Nagô	20	5175	https://i.scdn.co/image/ab67616d0000b27306ca500ac2d0153dc7912275
2o5jDhtHVPhrJdv3cEQ99Z	Tiësto	0	0	
6DgP9otnZw5z6daOntINxp	Joel Corry	0	0	
7G6BVdBZ9lTjGEH37zbxmA	Mestre Recruta	0	0	
1RyvyyTE3xzB2ZywiAwp0i	Future	0	0	
4kEcRrHPFKoSlsHIhuCN2f	Mestre Capu	0	0	
1EI0NtLHoh9KBziYCeN1vM	Rhiannon Giddens	0	0	
4NHQUGzhtTLFvgF5SZesLK	Tove Lo	0	0	
2d9LRvQJnAXRijqIJDDs2K	Emicida	0	0	
2xiIXseIJcq3nG7C8fHeBj	Three Days Grace	0	0	
3o2dn2O0FCVsWDFSh8qxgG	Sabaton	0	0	
7mX72Bq2iXNr8fZdu23fQL	Boslen	0	0	
1LB8qB5BPb3MHQrfkvifXU	Cheap Trick	60	1250933	https://i.scdn.co/image/ab6772690000c46c5ad27b7aba43e761f7e3ec46
0RqtSIYZmd4fiBKVFqyIqD	Thirty Seconds To Mars	65	3244428	https://i.scdn.co/image/ab6761610000e5eb9cd2312e93fba5ce64ce55e1
1AwO9pWEBSBoWdEZu28XDC	Eartha Kitt	55	151588	https://i.scdn.co/image/ab6761610000e5ebfa589cdca77cfcd16bb576c1
4yvcSjfu4PC0CYQyLy4wSq	Glass Animals	77	3458632	https://i.scdn.co/image/ab6761610000e5eb66b27eccb69756f8eceabc23
1moxjboGR7GNWYIMWsRjgG	Florence + The Machine	74	6077678	https://i.scdn.co/image/ab6761610000e5ebe3c37f869b830d1cf1ec829a
1caBfBEapzw8z2Qz9q0OaQ	Asking Alexandria	64	1891868	https://i.scdn.co/image/ab6761610000e5ebaf99c0e6478c463beb1208e7
0vYkHhJ48Bs3jWcvZXvOrP	Patti Smith	56	930456	https://i.scdn.co/image/20e52d0b168541016f901d9ec6d4f2a0e41f193b
1ET1wIkDmuCBC80XcTr3Sg	The Pierces	43	105266	https://i.scdn.co/image/f5067e775a4c0afa5897800ac305d3db5315d328
7gcUMQcBkw833YqXciq0WB	Fae	29	4232	https://i.scdn.co/image/ab6761610000e5eb105cf19ec1edcb6fad3e9032
7x3f7c0fBanNlQwpx1255g	Françoise Hardy	55	340907	https://i.scdn.co/image/034718c8a5381259d9989066d80d207b0a9ef047
14ep6TM2JzapH5nk7vaora	Akira The Don	45	43311	https://i.scdn.co/image/ab6761610000e5eb0b9f364227b5043d9ea3af1b
6tbLPxj1uQ6vsRQZI2YFCT	In This Moment	60	1168008	https://i.scdn.co/image/ab6761610000e5eb5bb6a34ccf58c0e8d1bd77fe
2yEwvVSSSUkcLeSTNyHKh8	TOOL	68	2878257	https://i.scdn.co/image/ab6761610000e5eb13f5472b709101616c87cba3
5HYNPEO2NNBONQkp3Mvwvc	Scott Bradlee's Postmodern Jukebox	58	931801	https://i.scdn.co/image/ab6761610000e5ebb6a4db349883e25e959e45ea
7AQzXO3NPNQsI7oNu5rC3r	Marcy Playground	55	365723	https://i.scdn.co/image/ab6761610000e5ebc12f77e7db22099b40c86f74
5KDIH2gF0VpelTqyQS7udb	Staind	62	2180766	https://i.scdn.co/image/ab6761610000e5eba43eff361de1d811e2d17adb
77aDWNQLrjzW7i6YBRhCbQ	Vernon Jane	22	6072	https://i.scdn.co/image/ab6761610000e5eb489acb3635a6f0365102dd52
2MqhkhX4npxDZ62ObR5ELO	Hoobastank	64	2202282	https://i.scdn.co/image/ab6761610000e5ebfd24e4299227b496c8bc9765
1KCSPY1glIKqW2TotWuXOR	P!nk	78	14012308	https://i.scdn.co/image/ab6761610000e5eb7bbad89a61061304ec842588
67ea9eGLXYMsO2eYQRui3w	The Who	67	4762114	https://i.scdn.co/image/9cd709cabb4a614b4f1dd9ec256a5f30e21f0150
3TOqt5oJwL9BE2NG9MEwDa	Disturbed	72	5625562	https://i.scdn.co/image/ab6761610000e5eb012addc95f5b2e7283f45446
3G5WkIXbDxdNoGWHZbXDjI	Sarah Hester Ross	40	22004	https://i.scdn.co/image/ab6761610000e5eb6cd6d1acf6d900146134cd31
74eX4C98E4FCrAMl39qRsJ	Theory of a Deadman	62	1858422	https://i.scdn.co/image/ab6761610000e5eb7280f9217928e343c64a99f1
6CwfuxIqcltXDGjfZsMd9A	MARINA	72	4110547	https://i.scdn.co/image/ab6761610000e5eb951d80a1db6ae486a5ce5f36
6zFYqv1mOsgBRQbae3JJ9e	Billy Joel	75	4703221	https://i.scdn.co/image/ab6761610000e5eb712c7643e8aa18a4aca6c811
4QM5QCHicznALtX885CnZC	Slayyyter	53	299754	https://i.scdn.co/image/ab6761610000e5ebd01fb7eccf3f995adbf7d40d
5nGIFgo0shDenQYSE0Sn7c	Evanescence	70	3585228	https://i.scdn.co/image/ab6761610000e5eb7ecf213c7dd78e0049379c5b
5qa31A9HySw3T7MKWI9bGg	FLETCHER	69	704252	https://i.scdn.co/image/ab6761610000e5ebfaf7e9528de5dc23441abaf7
4iHNK0tOyZPYnBU7nGAgpQ	Mariah Carey	78	8291960	https://i.scdn.co/image/ab6761610000e5eb9a1fa03af692c41b21cd75bb
75xNYf2GU5wtQqBrd74SlY	Zheani	45	114640	https://i.scdn.co/image/ab6761610000e5eb8fb648d595d388df19111ef9
49aaHxvAJ0tCh0F15OnwIl	Loreen	50	796553	https://i.scdn.co/image/ab6761610000e5eb627b608096e886a88c0c6bdd
4SdIXLzfabqU61iK7SnKAU	G Flip	50	161593	https://i.scdn.co/image/ab6761610000e5eb487d63528c3ebd065e47ec16
7jZMxhsB8djyIbYmoiJSTs	Kiana Ledé	63	1380798	https://i.scdn.co/image/ab6761610000e5eb5c9e6b7026e782dac48d1264
3ZJxEmjYZd5VOqZ8o3aXiL	ABRA	57	259223	https://i.scdn.co/image/ab6761610000e5eb06d14e7caddb0ba6bfa66aeb
11T0XSkxSB5KUPTe8P8BOl	Sylvie Kreusch	39	16995	https://i.scdn.co/image/ab6761610000e5eb99e99187876d836777786935
202HZzqKvPsMHcbwnDZx7u	Dorian Electra	47	238839	https://i.scdn.co/image/ab6761610000e5eb60857c01dc846983c3aa7d18
4Gzfk9Lxm67nBs7E9BZjzG	Gin Wigmore	48	167142	https://i.scdn.co/image/ab6761610000e5eb21618e65117872912a012253
0Xkd9GsWwOYETVF0kPXZIG	Amanda Lear	35	43949	https://i.scdn.co/image/ab6761610000e5eb2e43d71e995ec8690bd98157
2cAXhrWAztXGwk6r15ibW2	Charlotte Sands	56	69170	https://i.scdn.co/image/ab6761610000e5eba2e94df6f82cd6432b8e5a1f
100sLnojEpcadRx4edEBA6	Zella Day	57	416258	https://i.scdn.co/image/ab6761610000e5ebf07625ed8cff82132521c156
3VjZEaHXvNbCmV5jc0VfZR	Grace Mitchell	39	76288	https://i.scdn.co/image/ab6761610000e5eb8198b6a303223994b2105f2b
4tpUmLEVLCGFr93o8hFFIB	Blondie	68	1177818	https://i.scdn.co/image/ab6761610000e5eb67dc4da82c968767d994f3c3
6E8uXyNsUKeGOgRqAOcgBa	Georgia Gibbs	37	9948	https://i.scdn.co/image/ab6761610000e5ebf68c46b9812e3e1b4150062b
6blEmsLU25ewy8hHtgZaSL	Jazmin Bean	52	415392	https://i.scdn.co/image/ab6761610000e5eb68bec8cbd50e6c1a48c43503
0DAZn759crST1j1p3Y2qTn	Sharon Knight	8	2570	https://i.scdn.co/image/ab6761610000e5eb1b43c3d5a5ac5ead3b983834
053q0ukIDRgzwTr4vNSwab	Grimes	68	1803448	https://i.scdn.co/image/ab6761610000e5eb34771f759ca81a422f5f2b57
6ueGR6SWhUJfvEhqkvMsVs	Janelle Monáe	64	1262469	https://i.scdn.co/image/ab6761610000e5eb3ea2c03525939b482f8d3bfd
49qiE8dj4JuNdpYGRPdKbF	Stone Sour	62	2589946	https://i.scdn.co/image/ab6761610000e5ebf4c48660e778eeea3d9f1c5b
3qm84nBOXUEQ2vnTfUTTFC	Guns N' Roses	79	26457587	https://i.scdn.co/image/ab6761610000e5eb50defaf9fc059a1efc541f4c
0e9C27umtAZF9E2jqyRfeP	Darkfield	13	1402	https://i.scdn.co/image/ab6761610000e5ebf2b7e93d1cc2b86f11407b27
6ogn9necmbUdCppmNnGOdi	Alanis Morissette	65	2366795	https://i.scdn.co/image/ab6772690000c46c44408083dac26a782655baf3
6om12Ev5ppgoMy3OYSoech	Halestorm	62	1277435	https://i.scdn.co/image/ab6761610000e5eb35d58aafc40646040e1f5f16
2feDdbD5araYcm6JhFHHw7	Labrinth	78	2565925	https://i.scdn.co/image/ab6761610000e5eb72a7311386470c1fbf81734d
3RNrq3jvMZxD9ZyoOZbQOD	Korn	73	5787228	https://i.scdn.co/image/ab6761610000e5eb29af2ffb6f4ddd6324f878bc
4gKo3LXoxHriLS6CBKThAU	MALINDA	49	157890	https://i.scdn.co/image/ab6761610000e5ebbff6b96a458de87258fd7e5f
2pqd3HsfsvcBGtHvPOg6eg	Highly Suspect	60	537689	https://i.scdn.co/image/ab6761610000e5eb17159c1fcba82d2b68010a8b
0k17h0D3J5VfsdmQ1iZtE9	Pink Floyd	77	17790063	https://i.scdn.co/image/e69f71e2be4b67b82af90fb8e9d805715e0684fa
5Va9LuEmaZxnbk1gMnjMD7	Arrested Development	49	240722	https://i.scdn.co/image/ab6761610000e5eb09f1ef3b76da5758e3bd7ad2
3iJJD5v7oIFUevW4N5w5cj	Arthur Russell	44	110549	https://i.scdn.co/image/ab6761610000e5eb3cfb09a7764e1ad77e323c18
2lVklP2whG8hFeQnfenH2k	Delayed Schedules	3	247	https://i.scdn.co/image/ab6761610000e5eb7013b6d9b376682c1a9d65e2
2CCcoAwiAwpIs1hcsqkk3b	Alan Watts	45	172398	https://i.scdn.co/image/ab6761610000e5eb2dcc10ddbe6909486b2edd7d
46auOkH1pk28rWrSoUNhLo	Orville Peck	56	281979	https://i.scdn.co/image/ab6761610000e5eb7b1eab5bbcfd5b2dd57c1753
65NrBzD3Jnf1iqbDjuUYjD	Jacoo	35	22934	https://i.scdn.co/image/ab6761610000e5eb5376113195c2e23a0152c0de
2VYQTNDsvvKN9wmU5W7xpj	Marilyn Manson	68	3736254	https://i.scdn.co/image/ab6761610000e5eb9e2dae585750a8d6055f4e35
0JDkhL4rjiPNEp92jAgJnS	Roy Orbison	63	1651212	https://i.scdn.co/image/ab6761610000e5eb63c7956d7de45418d7fe6b25
5Qlt3zQ63Z99mNhuun0JAT	Edwyn Collins	46	41477	https://i.scdn.co/image/ab6761610000e5ebfdbd9299d7899c86cb1e0a3a
26VFTg2z8YR0cCuwLzESi2	Halsey	82	18756981	https://i.scdn.co/image/ab6761610000e5ebd707e1c5177614c4ec95a06c
4VpWzXVUAR2YyQuWQpNGAf	Bohren & Der Club Of Gore	39	92353	https://i.scdn.co/image/ab6761610000e5eb657f1afcffd85e74dbf36b14
3HVdAiMNjYrQIKlOGxoGh5	Rob Zombie	65	2325088	https://i.scdn.co/image/ab6761610000e5eb40a6cfc37fa94d54d28aca22
5DDSCugRjUhxIdW4tkFWXI	The Red Pill	32	14135	https://i.scdn.co/image/ab67616d0000b273010774edae4183c325841aec
4KlYg0F5KG9QNDFKaeTNAy	VNV Nation	46	163768	https://i.scdn.co/image/ab6761610000e5eb345be110699a051c0c41815e
4NgfOZCL9Ml67xzM0xzIvC	Janis Joplin	61	2943532	https://i.scdn.co/image/ab6761610000e5ebbf0ee2c099003f6886e4da0c
0ATg66209dS5nFsvobJlRt	Speech	30	6517	https://i.scdn.co/image/ab6761610000e5eb7d07426c9e899f920c27c62e
6liAMWkVf5LH7YR9yfFy1Y	Portishead	60	1657735	https://i.scdn.co/image/05d3721739aee511a898081ab140daa7890a0120
1NVCNKYdNcuh92vE4rSxpo	Freya	10	1679	https://i.scdn.co/image/5135a5a782615a9dab389d179d14fd8f5bfe4deb
6B5c4sch27tWHAGdarpPaW	Seether	67	2981502	https://i.scdn.co/image/ab6761610000e5eb5db5a44768e9eb6fb4f415f9
05fG473iIaoy82BF1aGhL8	Slipknot	78	8830881	https://i.scdn.co/image/ab6761610000e5ebec01c52d6030a1574070e308
5YGY8feqx7naU7z4HrwZM6	Miley Cyrus	80	19011625	https://i.scdn.co/image/ab6761610000e5eb02651b19050d8bf64b18d40a
7aWpPjjgItUnXljFxYYKZI	DeathbyRomy	50	56979	https://i.scdn.co/image/ab6761610000e5eb5bab18845638657393d1759c
3PyJHH2wyfQK3WZrk9rpmP	Ashnikko	68	1802919	https://i.scdn.co/image/ab6761610000e5eb8f4d36b43fa094d32a167f1e
3LjhVl7GzYsza1biQjTpaN	Hayley Kiyoko	60	1606144	https://i.scdn.co/image/ab6761610000e5eb9518c52fa035e0cfb3d29724
5Lz5CnywFeg4Rs4l76OtG2	KiNG MALA	54	159960	https://i.scdn.co/image/ab6761610000e5eb3d7b9f55f506268e1f8a7df1
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
53	7CyeXFnOrfC1N6z4naIpgo	adult standards
54	7CyeXFnOrfC1N6z4naIpgo	brill building pop
55	7CyeXFnOrfC1N6z4naIpgo	classic girl group
56	7CyeXFnOrfC1N6z4naIpgo	soul
57	55VydwMyCuGcavwPuhutPL	post-hardcore
58	55VydwMyCuGcavwPuhutPL	screamo
59	08ct2eZF5lUPdJpHwNKWof	mellow gold
60	08ct2eZF5lUPdJpHwNKWof	neo mellow
61	08ct2eZF5lUPdJpHwNKWof	pop rock
62	08ct2eZF5lUPdJpHwNKWof	rock
63	08ct2eZF5lUPdJpHwNKWof	singer-songwriter
64	37w38cCSGgKLdayTRjna4W	alternative rock
65	37w38cCSGgKLdayTRjna4W	art pop
66	37w38cCSGgKLdayTRjna4W	dream pop
67	37w38cCSGgKLdayTRjna4W	melancholia
68	37w38cCSGgKLdayTRjna4W	rock
69	37w38cCSGgKLdayTRjna4W	shoegaze
70	37w38cCSGgKLdayTRjna4W	slowcore
71	4bthk9UfsYUYdcFyqxmSUU	new romantic
72	4bthk9UfsYUYdcFyqxmSUU	new wave
73	4bthk9UfsYUYdcFyqxmSUU	new wave pop
74	4bthk9UfsYUYdcFyqxmSUU	permanent wave
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
118	7guDJrEfX3qb6FEbdPA5qi	indie r&b
119	7guDJrEfX3qb6FEbdPA5qi	motown
120	7guDJrEfX3qb6FEbdPA5qi	quiet storm
121	7guDJrEfX3qb6FEbdPA5qi	soul
122	0YHgnSkV3S5mvSSCTRWDi5	deathgrass
123	57bUPid8xztkieZfS7OlEV	brill building pop
124	57bUPid8xztkieZfS7OlEV	classic girl group
125	57bUPid8xztkieZfS7OlEV	disco
126	57bUPid8xztkieZfS7OlEV	funk
127	57bUPid8xztkieZfS7OlEV	motown
128	57bUPid8xztkieZfS7OlEV	quiet storm
129	57bUPid8xztkieZfS7OlEV	soul
130	0X380XXQSNBYuleKzav5UO	alternative metal
131	0X380XXQSNBYuleKzav5UO	alternative rock
132	0X380XXQSNBYuleKzav5UO	cyberpunk
133	0X380XXQSNBYuleKzav5UO	electronic rock
134	0X380XXQSNBYuleKzav5UO	industrial
135	0X380XXQSNBYuleKzav5UO	industrial metal
136	0X380XXQSNBYuleKzav5UO	industrial rock
137	0X380XXQSNBYuleKzav5UO	nu metal
138	0X380XXQSNBYuleKzav5UO	rock
139	5eIbEEQnDM8yuDVB0bimSP	bass trap
140	5eIbEEQnDM8yuDVB0bimSP	edm
141	5eIbEEQnDM8yuDVB0bimSP	electro house
142	5eIbEEQnDM8yuDVB0bimSP	electronic trap
143	5eIbEEQnDM8yuDVB0bimSP	electropop
144	5eIbEEQnDM8yuDVB0bimSP	pop dance
145	5eIbEEQnDM8yuDVB0bimSP	vapor twitch
146	3pkmfqaBNsMqnXus05PNfP	alternative hip hop
147	3pkmfqaBNsMqnXus05PNfP	hip hop
148	3pkmfqaBNsMqnXus05PNfP	turntablism
149	20wkVLutqVOYrc0kxFs7rA	canadian contemporary r&b
150	20wkVLutqVOYrc0kxFs7rA	pop
151	20wkVLutqVOYrc0kxFs7rA	r&b
152	1mFX1QlezK1lNPKQJkhwWb	boy band
153	1mFX1QlezK1lNPKQJkhwWb	contemporary r&b
154	1mFX1QlezK1lNPKQJkhwWb	new jack swing
155	1mFX1QlezK1lNPKQJkhwWb	quiet storm
156	1mFX1QlezK1lNPKQJkhwWb	r&b
157	1mFX1QlezK1lNPKQJkhwWb	urban contemporary
158	0VbDAlm2KUlKI5UhXRBKWp	indie soul
159	0VbDAlm2KUlKI5UhXRBKWp	vapor soul
160	7KGqvFukcZRbQ7YFsYrgPa	soft rock
161	6PEMFpe3PTOksdV4ZXUpbE	hip hop
162	6PEMFpe3PTOksdV4ZXUpbE	indie soul
163	6PEMFpe3PTOksdV4ZXUpbE	neo soul
164	6PEMFpe3PTOksdV4ZXUpbE	underground hip hop
165	5wFXmYsg3KFJ8BDsQudJ4f	indie rock
166	2ooIqOf4X2uz4mMptXCtie	alternative rock
167	2ooIqOf4X2uz4mMptXCtie	anti-folk
168	2ooIqOf4X2uz4mMptXCtie	chamber pop
169	2ooIqOf4X2uz4mMptXCtie	elephant 6
170	2ooIqOf4X2uz4mMptXCtie	indie pop
171	2ooIqOf4X2uz4mMptXCtie	indie rock
172	2ooIqOf4X2uz4mMptXCtie	lo-fi
173	1KP6TWI40m7p3QBTU6u2xo	modern rock
174	1KP6TWI40m7p3QBTU6u2xo	pop
175	1MIe1z4RdqLqHSJsb7EBMm	indie pop
176	1MIe1z4RdqLqHSJsb7EBMm	indie rock
177	1MIe1z4RdqLqHSJsb7EBMm	kc indie
178	1MIe1z4RdqLqHSJsb7EBMm	modern rock
179	4l1cKWYW591xnwEGxpUg3J	alternative dance
180	4l1cKWYW591xnwEGxpUg3J	electropop
181	4l1cKWYW591xnwEGxpUg3J	indie rock
182	4l1cKWYW591xnwEGxpUg3J	indietronica
183	4l1cKWYW591xnwEGxpUg3J	modern rock
184	4l1cKWYW591xnwEGxpUg3J	new rave
185	4l1cKWYW591xnwEGxpUg3J	swedish electropop
186	4l1cKWYW591xnwEGxpUg3J	swedish indie pop
187	4l1cKWYW591xnwEGxpUg3J	swedish synthpop
188	1fZpYWNWdL5Z3wrDtISFUH	austin americana
189	1fZpYWNWdL5Z3wrDtISFUH	austindie
190	1fZpYWNWdL5Z3wrDtISFUH	indie folk
191	1fZpYWNWdL5Z3wrDtISFUH	new americana
192	1fZpYWNWdL5Z3wrDtISFUH	stomp and holler
193	0AkmSuTOzM2pNCIOSP8ziv	country rap
194	3dv4Q4q3LWOnbLJnC6GgTY	bedroom pop
195	60df5JBRRPcnSpsIMxxwQm	classic soul
196	60df5JBRRPcnSpsIMxxwQm	memphis soul
197	60df5JBRRPcnSpsIMxxwQm	soul
198	60df5JBRRPcnSpsIMxxwQm	soul blues
199	60df5JBRRPcnSpsIMxxwQm	southern soul
200	3JaAGmSTpJK35DqWrDUzBz	album rock
201	3JaAGmSTpJK35DqWrDUzBz	blues rock
202	3JaAGmSTpJK35DqWrDUzBz	classic rock
203	3JaAGmSTpJK35DqWrDUzBz	classic uk pop
204	3JaAGmSTpJK35DqWrDUzBz	glam rock
205	3JaAGmSTpJK35DqWrDUzBz	hard rock
206	3JaAGmSTpJK35DqWrDUzBz	rock
207	3RGLhK1IP9jnYFH4BRFJBS	classic rock
208	3RGLhK1IP9jnYFH4BRFJBS	permanent wave
209	3RGLhK1IP9jnYFH4BRFJBS	punk
210	3RGLhK1IP9jnYFH4BRFJBS	rock
211	0oSGxfWSnnOXhD2fKuz2Gy	art rock
212	0oSGxfWSnnOXhD2fKuz2Gy	classic rock
213	0oSGxfWSnnOXhD2fKuz2Gy	glam rock
214	0oSGxfWSnnOXhD2fKuz2Gy	permanent wave
215	0oSGxfWSnnOXhD2fKuz2Gy	rock
216	7lzordPuZEXxwt9aoVZYmG	album rock
217	7lzordPuZEXxwt9aoVZYmG	classic rock
218	7lzordPuZEXxwt9aoVZYmG	dance rock
219	7lzordPuZEXxwt9aoVZYmG	hard rock
220	7lzordPuZEXxwt9aoVZYmG	mellow gold
221	7lzordPuZEXxwt9aoVZYmG	new romantic
222	7lzordPuZEXxwt9aoVZYmG	new wave
223	7lzordPuZEXxwt9aoVZYmG	new wave pop
224	7lzordPuZEXxwt9aoVZYmG	rock
225	7lzordPuZEXxwt9aoVZYmG	soft rock
226	33EUXrFKGjpUSGacqEHhU4	classic rock
227	33EUXrFKGjpUSGacqEHhU4	glam rock
228	33EUXrFKGjpUSGacqEHhU4	new wave
229	33EUXrFKGjpUSGacqEHhU4	permanent wave
230	33EUXrFKGjpUSGacqEHhU4	post-punk
231	33EUXrFKGjpUSGacqEHhU4	protopunk
232	33EUXrFKGjpUSGacqEHhU4	punk
233	33EUXrFKGjpUSGacqEHhU4	rock
234	5aBEGOeWQCJfptic9xyaAb	dark wave
235	5aBEGOeWQCJfptic9xyaAb	gothic rock
236	5aBEGOeWQCJfptic9xyaAb	industrial
237	5aBEGOeWQCJfptic9xyaAb	industrial rock
238	5aBEGOeWQCJfptic9xyaAb	new romantic
239	5aBEGOeWQCJfptic9xyaAb	new wave
240	5aBEGOeWQCJfptic9xyaAb	post-punk
241	5aBEGOeWQCJfptic9xyaAb	synthpop
242	5aBEGOeWQCJfptic9xyaAb	uk post-punk
243	2ZfogSsOWP4mVfEqfpLXCt	alternative rock
244	2ZfogSsOWP4mVfEqfpLXCt	australian rock
245	2ZfogSsOWP4mVfEqfpLXCt	dream pop
246	2ZfogSsOWP4mVfEqfpLXCt	new romantic
247	2ZfogSsOWP4mVfEqfpLXCt	new wave
248	2ZfogSsOWP4mVfEqfpLXCt	pop rock
249	2ZfogSsOWP4mVfEqfpLXCt	post-punk
250	3gdbcIdNypBsYNu3iiCjtN	art rock
251	3gdbcIdNypBsYNu3iiCjtN	dance rock
252	3gdbcIdNypBsYNu3iiCjtN	new romantic
253	3gdbcIdNypBsYNu3iiCjtN	new wave
254	3gdbcIdNypBsYNu3iiCjtN	new wave pop
255	3gdbcIdNypBsYNu3iiCjtN	permanent wave
256	3gdbcIdNypBsYNu3iiCjtN	post-punk
257	3gdbcIdNypBsYNu3iiCjtN	rock
258	3gdbcIdNypBsYNu3iiCjtN	zolo
259	0rpMdBzQXf7aYRnu5fDBJy	acoustic punk
260	0rpMdBzQXf7aYRnu5fDBJy	alternative rock
261	0rpMdBzQXf7aYRnu5fDBJy	pop rock
262	0rpMdBzQXf7aYRnu5fDBJy	punk
263	0rpMdBzQXf7aYRnu5fDBJy	rock
264	3yY2gUcIsjMr8hjo51PoJ8	madchester
265	3yY2gUcIsjMr8hjo51PoJ8	new wave
266	3yY2gUcIsjMr8hjo51PoJ8	permanent wave
267	3yY2gUcIsjMr8hjo51PoJ8	rock
268	3yY2gUcIsjMr8hjo51PoJ8	uk post-punk
269	0Zy4ncr8h1jd7Nzr9946fD	gothic rock
270	0Zy4ncr8h1jd7Nzr9946fD	industrial
271	0Zy4ncr8h1jd7Nzr9946fD	industrial rock
272	0Zy4ncr8h1jd7Nzr9946fD	new romantic
273	0Zy4ncr8h1jd7Nzr9946fD	new wave
274	0Zy4ncr8h1jd7Nzr9946fD	post-punk
275	0Zy4ncr8h1jd7Nzr9946fD	uk post-punk
276	3fhOTtm0LBJ3Ojn4hIljLo	art rock
277	3fhOTtm0LBJ3Ojn4hIljLo	classic rock
278	3fhOTtm0LBJ3Ojn4hIljLo	glam rock
279	3fhOTtm0LBJ3Ojn4hIljLo	melancholia
280	3fhOTtm0LBJ3Ojn4hIljLo	mellow gold
281	3fhOTtm0LBJ3Ojn4hIljLo	new romantic
282	3fhOTtm0LBJ3Ojn4hIljLo	new wave
283	3fhOTtm0LBJ3Ojn4hIljLo	new wave pop
284	3fhOTtm0LBJ3Ojn4hIljLo	rock
285	3fhOTtm0LBJ3Ojn4hIljLo	soft rock
286	3fhOTtm0LBJ3Ojn4hIljLo	sophisti-pop
287	4BFMTELQyWJU1SwqcXMBm3	alternative rock
288	4BFMTELQyWJU1SwqcXMBm3	classic rock
289	4BFMTELQyWJU1SwqcXMBm3	detroit rock
290	4BFMTELQyWJU1SwqcXMBm3	garage rock
291	4BFMTELQyWJU1SwqcXMBm3	new wave
292	4BFMTELQyWJU1SwqcXMBm3	permanent wave
293	4BFMTELQyWJU1SwqcXMBm3	post-punk
294	4BFMTELQyWJU1SwqcXMBm3	protopunk
295	4BFMTELQyWJU1SwqcXMBm3	punk
296	4BFMTELQyWJU1SwqcXMBm3	punk blues
297	4BFMTELQyWJU1SwqcXMBm3	rock
298	4JfFdF9Row7UXtdsKtT6tc	funk
299	4JfFdF9Row7UXtdsKtT6tc	soul
300	0EdvGhlC1FkGItLOWQzG4J	alternative rock
301	0EdvGhlC1FkGItLOWQzG4J	reggae fusion
302	0EdvGhlC1FkGItLOWQzG4J	ska mexicano
303	0EdvGhlC1FkGItLOWQzG4J	ska punk
304	00FQb4jTyendYWaN8pK0wa	art pop
305	00FQb4jTyendYWaN8pK0wa	pop
306	462T0buQ5ScBUQCRpodDRf	funk
307	462T0buQ5ScBUQCRpodDRf	soul
308	3jK9MiCrA42lLAdMGUZpwa	escape room
309	3qnGvpP8Yth1AqSBMqON5x	modern blues
310	13ubrt8QOOCPljQ2FL1Kca	east coast hip hop
311	13ubrt8QOOCPljQ2FL1Kca	hip hop
312	13ubrt8QOOCPljQ2FL1Kca	rap
313	6QRlkjrHz5A62mqeNZz7t3	indie garage rock
314	6QRlkjrHz5A62mqeNZz7t3	indie surf
315	6QRlkjrHz5A62mqeNZz7t3	neo-psychedelic
316	5CuU6SRJjbbZL926nSGGxX	abstract hip hop
317	5CuU6SRJjbbZL926nSGGxX	alternative hip hop
318	5CuU6SRJjbbZL926nSGGxX	escape room
319	6pmxr66tMAePxzOLfjGNcX	albuquerque indie
320	6pmxr66tMAePxzOLfjGNcX	baroque pop
321	6pmxr66tMAePxzOLfjGNcX	chamber pop
322	6pmxr66tMAePxzOLfjGNcX	indie pop
323	6pmxr66tMAePxzOLfjGNcX	indie rock
324	6pmxr66tMAePxzOLfjGNcX	stomp and holler
325	3XHO7cRUPCLOr6jwp8vsx5	indie rock
326	3XHO7cRUPCLOr6jwp8vsx5	modern rock
327	6eU0jV2eEZ8XTM7EmlguK6	retro soul
328	2h93pZq0e7k5yf4dywlkpM	hip hop
329	2h93pZq0e7k5yf4dywlkpM	lgbtq+ hip hop
330	2h93pZq0e7k5yf4dywlkpM	neo soul
331	2h93pZq0e7k5yf4dywlkpM	pop
332	3z6Gk257P9jNcZbBXJNX5i	indie pop
333	3z6Gk257P9jNcZbBXJNX5i	lilith
334	3z6Gk257P9jNcZbBXJNX5i	piano rock
335	74oJ4qxwOZvX6oSsu1DGnw	album rock
336	74oJ4qxwOZvX6oSsu1DGnw	art rock
337	74oJ4qxwOZvX6oSsu1DGnw	blues rock
338	74oJ4qxwOZvX6oSsu1DGnw	classic rock
339	74oJ4qxwOZvX6oSsu1DGnw	folk rock
340	74oJ4qxwOZvX6oSsu1DGnw	hard rock
341	74oJ4qxwOZvX6oSsu1DGnw	psychedelic rock
342	74oJ4qxwOZvX6oSsu1DGnw	rock
343	74oJ4qxwOZvX6oSsu1DGnw	roots rock
344	74oJ4qxwOZvX6oSsu1DGnw	supergroup
345	0XSqX2PB3C5dTMv7SZaxSm	alternative rock
346	0XSqX2PB3C5dTMv7SZaxSm	canadian indie
347	0XSqX2PB3C5dTMv7SZaxSm	indie rock
348	0XSqX2PB3C5dTMv7SZaxSm	modern rock
349	0XSqX2PB3C5dTMv7SZaxSm	quebec indie
350	0XSqX2PB3C5dTMv7SZaxSm	stomp and holler
351	08GQAI4eElDnROBrJRGE0X	album rock
352	08GQAI4eElDnROBrJRGE0X	classic rock
353	08GQAI4eElDnROBrJRGE0X	rock
354	08GQAI4eElDnROBrJRGE0X	soft rock
355	08GQAI4eElDnROBrJRGE0X	yacht rock
356	6l3HvQ5sa6mXTsMTB19rO5	conscious hip hop
357	6l3HvQ5sa6mXTsMTB19rO5	hip hop
358	6l3HvQ5sa6mXTsMTB19rO5	north carolina hip hop
359	6l3HvQ5sa6mXTsMTB19rO5	rap
360	6RZUqkomCmb8zCRqc9eznB	alternative rock
361	6RZUqkomCmb8zCRqc9eznB	britpop
362	6RZUqkomCmb8zCRqc9eznB	permanent wave
363	6RZUqkomCmb8zCRqc9eznB	pop rock
364	6RZUqkomCmb8zCRqc9eznB	rock
365	0fA0VVWsXO9YnASrzqfmYu	hip hop
366	0fA0VVWsXO9YnASrzqfmYu	ohio hip hop
367	0fA0VVWsXO9YnASrzqfmYu	rap
368	6ZK2nrW8aCTg8Bid7I7N10	dark pop
369	6ZK2nrW8aCTg8Bid7I7N10	doomgaze
370	6ZK2nrW8aCTg8Bid7I7N10	gaian doom
371	6ZK2nrW8aCTg8Bid7I7N10	sacramento indie
372	6TVVIyd0fsRDGg6WzHKyTP	funk
373	6TVVIyd0fsRDGg6WzHKyTP	soul
374	6tkrcmVfWoHC4WOhE7IDyq	new americana
375	6tkrcmVfWoHC4WOhE7IDyq	roots americana
376	600GgDUq9kzGJgNIrVsWfz	indie surf
377	2jgPkn6LuUazBoBk6vvjh5	baroque pop
378	2jgPkn6LuUazBoBk6vvjh5	british invasion
379	2jgPkn6LuUazBoBk6vvjh5	bubblegum pop
380	2jgPkn6LuUazBoBk6vvjh5	classic rock
381	2jgPkn6LuUazBoBk6vvjh5	folk rock
382	2jgPkn6LuUazBoBk6vvjh5	psychedelic rock
383	2jgPkn6LuUazBoBk6vvjh5	rock
384	6v8FB84lnmJs434UJf2Mrm	canadian singer-songwriter
385	6v8FB84lnmJs434UJf2Mrm	classic canadian rock
386	6v8FB84lnmJs434UJf2Mrm	classic rock
387	6v8FB84lnmJs434UJf2Mrm	mellow gold
388	6v8FB84lnmJs434UJf2Mrm	permanent wave
389	6v8FB84lnmJs434UJf2Mrm	rock
390	6v8FB84lnmJs434UJf2Mrm	roots rock
391	6v8FB84lnmJs434UJf2Mrm	singer-songwriter
392	3QTDHixorJelOLxoxcjqGx	alternative r&b
393	3QTDHixorJelOLxoxcjqGx	hip hop
394	3QTDHixorJelOLxoxcjqGx	indie soul
395	3QTDHixorJelOLxoxcjqGx	la pop
396	3QTDHixorJelOLxoxcjqGx	neo soul
397	3QTDHixorJelOLxoxcjqGx	r&b
398	3QTDHixorJelOLxoxcjqGx	rap
399	77SW9BnxLY8rJ0RciFqkHh	modern alternative rock
400	77SW9BnxLY8rJ0RciFqkHh	modern rock
401	77SW9BnxLY8rJ0RciFqkHh	pop
402	77SW9BnxLY8rJ0RciFqkHh	shimmer pop
403	5NYEE4kgrEZPlM3DxUsTyc	la indie
404	75dQReiBOHN37fQgWQrIAJ	indie pop
405	75dQReiBOHN37fQgWQrIAJ	indie rock
406	75dQReiBOHN37fQgWQrIAJ	la indie
407	75dQReiBOHN37fQgWQrIAJ	modern rock
408	75dQReiBOHN37fQgWQrIAJ	stomp and holler
409	2pAajGWerK3ghwToNWFENS	alternative metal
410	2pAajGWerK3ghwToNWFENS	alternative rock
411	2pAajGWerK3ghwToNWFENS	industrial metal
412	2pAajGWerK3ghwToNWFENS	industrial rock
413	2pAajGWerK3ghwToNWFENS	nu metal
414	22bE4uQ6baNwSHPVcDxLCe	british invasion
415	22bE4uQ6baNwSHPVcDxLCe	classic rock
416	22bE4uQ6baNwSHPVcDxLCe	rock
417	5a2EaR3hamoenG9rDuVn8j	funk
418	5a2EaR3hamoenG9rDuVn8j	funk rock
419	5a2EaR3hamoenG9rDuVn8j	minneapolis sound
420	5a2EaR3hamoenG9rDuVn8j	synth funk
421	6Ghvu1VvMGScGpOUJBAHNH	alternative metal
422	6Ghvu1VvMGScGpOUJBAHNH	nu metal
423	6Ghvu1VvMGScGpOUJBAHNH	rap metal
424	6Ghvu1VvMGScGpOUJBAHNH	rock
425	6Ghvu1VvMGScGpOUJBAHNH	sacramento indie
426	4n0gvapwYbRpzU5Ov68B6P	garage pop
427	4n0gvapwYbRpzU5Ov68B6P	garage rock
428	4n0gvapwYbRpzU5Ov68B6P	indie garage rock
429	4n0gvapwYbRpzU5Ov68B6P	punk blues
430	4uSftVc3FPWe6RJuMZNEe9	baroque pop
431	4uSftVc3FPWe6RJuMZNEe9	chamber pop
432	4uSftVc3FPWe6RJuMZNEe9	chicago indie
433	4uSftVc3FPWe6RJuMZNEe9	indie folk
434	4uSftVc3FPWe6RJuMZNEe9	indie pop
435	4uSftVc3FPWe6RJuMZNEe9	indie rock
436	4uSftVc3FPWe6RJuMZNEe9	melancholia
437	4uSftVc3FPWe6RJuMZNEe9	stomp and holler
438	6AWdGez5g1jxpfl9XD4wI3	trap soul
439	6AWdGez5g1jxpfl9XD4wI3	underground hip hop
440	7HeVXdOdMhLslVputGTZFQ	new weird america
441	7HeVXdOdMhLslVputGTZFQ	toronto indie
442	0V7uVrIYr4FwFvUN9S4kYr	chicago indie
443	0V7uVrIYr4FwFvUN9S4kYr	funk
444	6hnWRPzGGKiapVX1UCdEAC	adult standards
445	6hnWRPzGGKiapVX1UCdEAC	brill building pop
446	6hnWRPzGGKiapVX1UCdEAC	classic soul
447	6hnWRPzGGKiapVX1UCdEAC	rock-and-roll
448	6hnWRPzGGKiapVX1UCdEAC	soul
449	2FRXiAz5Uz78LLLSwEUhLt	indie pop
450	7ITd48RbLVpUfheE7B86o2	alternative rock
451	7ITd48RbLVpUfheE7B86o2	anti-folk
452	7ITd48RbLVpUfheE7B86o2	baroque pop
453	7ITd48RbLVpUfheE7B86o2	canadian indie
454	7ITd48RbLVpUfheE7B86o2	chamber pop
455	7ITd48RbLVpUfheE7B86o2	indie folk
456	7ITd48RbLVpUfheE7B86o2	indie pop
457	7ITd48RbLVpUfheE7B86o2	indie rock
458	7ITd48RbLVpUfheE7B86o2	modern folk rock
459	7ITd48RbLVpUfheE7B86o2	modern rock
460	7ITd48RbLVpUfheE7B86o2	pop rock
461	7ITd48RbLVpUfheE7B86o2	stomp and holler
462	1yAwtBaoHLEDWAnWR87hBT	alternative rock
463	1yAwtBaoHLEDWAnWR87hBT	double drumming
464	1yAwtBaoHLEDWAnWR87hBT	indie rock
465	1yAwtBaoHLEDWAnWR87hBT	modern rock
466	1yAwtBaoHLEDWAnWR87hBT	rock
467	1yAwtBaoHLEDWAnWR87hBT	washington indie
468	6LufpoVlIYKQCu9Gjpk8B7	black americana
469	6LufpoVlIYKQCu9Gjpk8B7	classic soul
470	6LufpoVlIYKQCu9Gjpk8B7	funk
471	6LufpoVlIYKQCu9Gjpk8B7	neo soul
472	6LufpoVlIYKQCu9Gjpk8B7	retro soul
473	6LufpoVlIYKQCu9Gjpk8B7	soul
474	6LufpoVlIYKQCu9Gjpk8B7	southern soul
475	2kGBy2WHvF0VdZyqiVCkDT	chamber pop
476	2kGBy2WHvF0VdZyqiVCkDT	indie rock
477	68kEuyFKyqrdQQLLsmiatm	conscious hip hop
478	68kEuyFKyqrdQQLLsmiatm	hip hop
479	68kEuyFKyqrdQQLLsmiatm	rap
480	68kEuyFKyqrdQQLLsmiatm	underground hip hop
481	1hzfo8twXdOegF3xireCYs	german pop
482	251UrhgNbMr15NLzQ2KyKq	deep new americana
483	251UrhgNbMr15NLzQ2KyKq	indie folk
484	251UrhgNbMr15NLzQ2KyKq	new americana
485	251UrhgNbMr15NLzQ2KyKq	stomp and holler
486	4DFhHyjvGYa9wxdHUjtDkc	alternative metal
487	4DFhHyjvGYa9wxdHUjtDkc	alternative rock
488	4DFhHyjvGYa9wxdHUjtDkc	nu metal
489	4DFhHyjvGYa9wxdHUjtDkc	rap rock
490	4DFhHyjvGYa9wxdHUjtDkc	rock
491	4DFhHyjvGYa9wxdHUjtDkc	supergroup
492	5IcR3N7QB1j6KBL8eImZ8m	gangster rap
493	5IcR3N7QB1j6KBL8eImZ8m	hip hop
494	5IcR3N7QB1j6KBL8eImZ8m	pop rap
495	5IcR3N7QB1j6KBL8eImZ8m	rap
496	5IcR3N7QB1j6KBL8eImZ8m	southern hip hop
497	5IcR3N7QB1j6KBL8eImZ8m	trap
498	5IcR3N7QB1j6KBL8eImZ8m	underground hip hop
499	3D4qYDvoPn5cQxtBm4oseo	dreamo
500	3D4qYDvoPn5cQxtBm4oseo	emo
501	3D4qYDvoPn5cQxtBm4oseo	indie rock
502	3D4qYDvoPn5cQxtBm4oseo	philly indie
503	3D4qYDvoPn5cQxtBm4oseo	progressive post-hardcore
504	3D4qYDvoPn5cQxtBm4oseo	screamo
505	3tJ9PkBOrG7hFkHeNM2tbw	axe
506	3tJ9PkBOrG7hFkHeNM2tbw	brazilian percussion
507	3tJ9PkBOrG7hFkHeNM2tbw	mpb
508	3tJ9PkBOrG7hFkHeNM2tbw	pagode
509	3tJ9PkBOrG7hFkHeNM2tbw	samba
510	3tJ9PkBOrG7hFkHeNM2tbw	samba reggae
511	2ApaG60P4r0yhBoDCGD8YG	alternative rock
512	2ApaG60P4r0yhBoDCGD8YG	indie rock
513	2ApaG60P4r0yhBoDCGD8YG	melancholia
514	2ApaG60P4r0yhBoDCGD8YG	pop rock
515	2ApaG60P4r0yhBoDCGD8YG	rock
516	2ApaG60P4r0yhBoDCGD8YG	singer-songwriter
517	6GEykX11lQqp92UVOQQCC7	alternative hip hop
518	6GEykX11lQqp92UVOQQCC7	boom bap
519	6GEykX11lQqp92UVOQQCC7	east coast hip hop
520	6GEykX11lQqp92UVOQQCC7	hardcore hip hop
521	6GEykX11lQqp92UVOQQCC7	hip hop
522	6GEykX11lQqp92UVOQQCC7	jazz boom bap
523	6GEykX11lQqp92UVOQQCC7	turntablism
524	6GEykX11lQqp92UVOQQCC7	underground hip hop
525	1anAI9P9iSzc9qzLv6AtHZ	indie pop
526	1anAI9P9iSzc9qzLv6AtHZ	indie poptimism
527	1anAI9P9iSzc9qzLv6AtHZ	indie rock
528	1anAI9P9iSzc9qzLv6AtHZ	la indie
529	1anAI9P9iSzc9qzLv6AtHZ	modern rock
530	2auiVi8sUZo17dLy1HwrTU	afrofuturism
531	2auiVi8sUZo17dLy1HwrTU	alternative r&b
532	2auiVi8sUZo17dLy1HwrTU	dance pop
533	2auiVi8sUZo17dLy1HwrTU	escape room
534	2auiVi8sUZo17dLy1HwrTU	hip pop
535	2auiVi8sUZo17dLy1HwrTU	indie soul
536	2auiVi8sUZo17dLy1HwrTU	neo soul
537	2auiVi8sUZo17dLy1HwrTU	pop
538	2auiVi8sUZo17dLy1HwrTU	r&b
539	2auiVi8sUZo17dLy1HwrTU	urban contemporary
540	6zvul52xwTWzilBZl6BUbT	alternative rock
541	6zvul52xwTWzilBZl6BUbT	boston rock
542	6zvul52xwTWzilBZl6BUbT	modern rock
543	6zvul52xwTWzilBZl6BUbT	permanent wave
544	6zvul52xwTWzilBZl6BUbT	rock
545	2bToe6WyGvADJftreuXh2K	funk
546	2bToe6WyGvADJftreuXh2K	indie soul
547	2bToe6WyGvADJftreuXh2K	soul
548	432R46LaYsJZV2Gmc4jUV5	alternative rock
549	432R46LaYsJZV2Gmc4jUV5	art rock
550	432R46LaYsJZV2Gmc4jUV5	madchester
551	432R46LaYsJZV2Gmc4jUV5	new wave
552	432R46LaYsJZV2Gmc4jUV5	post-punk
553	432R46LaYsJZV2Gmc4jUV5	rock
554	432R46LaYsJZV2Gmc4jUV5	uk post-punk
555	1PryMSya1JnSAlcwYawCxp	afrobeat
556	1PryMSya1JnSAlcwYawCxp	brass band
557	1PryMSya1JnSAlcwYawCxp	funk
558	1PryMSya1JnSAlcwYawCxp	instrumental funk
559	1PryMSya1JnSAlcwYawCxp	soul
560	1nGqKVGfPPiVgxMdx8hYOI	deep new americana
561	1nGqKVGfPPiVgxMdx8hYOI	portland indie
562	1nGqKVGfPPiVgxMdx8hYOI	stomp and holler
563	7FKTg75ADVMZgY3P9ZMRtH	indie pop
564	7FKTg75ADVMZgY3P9ZMRtH	jacksonville indie
565	7FKTg75ADVMZgY3P9ZMRtH	modern rock
566	7bu3H8JO7d0UbMoVzbo70s	new wave
567	7bu3H8JO7d0UbMoVzbo70s	permanent wave
568	7bu3H8JO7d0UbMoVzbo70s	rock
569	7bu3H8JO7d0UbMoVzbo70s	uk post-punk
570	1SQRv42e4PjEYfPhS0Tk9E	album rock
571	1SQRv42e4PjEYfPhS0Tk9E	british invasion
572	1SQRv42e4PjEYfPhS0Tk9E	classic rock
573	1SQRv42e4PjEYfPhS0Tk9E	folk rock
574	1SQRv42e4PjEYfPhS0Tk9E	glam rock
575	1SQRv42e4PjEYfPhS0Tk9E	mellow gold
576	1SQRv42e4PjEYfPhS0Tk9E	protopunk
577	1SQRv42e4PjEYfPhS0Tk9E	psychedelic rock
578	1SQRv42e4PjEYfPhS0Tk9E	rock
579	1SQRv42e4PjEYfPhS0Tk9E	singer-songwriter
580	0oL26Dn9y761yfJgNb3vfu	indie folk
581	0oL26Dn9y761yfJgNb3vfu	indie rock
582	0oL26Dn9y761yfJgNb3vfu	michigan indie
583	0oL26Dn9y761yfJgNb3vfu	modern rock
584	0oL26Dn9y761yfJgNb3vfu	stomp and holler
585	0v6gOfGBclTSGu6agfXb23	canadian indie
586	0v6gOfGBclTSGu6agfXb23	indie rock
587	0v6gOfGBclTSGu6agfXb23	stomp and holler
588	0v6gOfGBclTSGu6agfXb23	toronto indie
589	0yNLKJebCb8Aueb54LYya3	alternative rock
590	0yNLKJebCb8Aueb54LYya3	art rock
591	0yNLKJebCb8Aueb54LYya3	dance rock
592	0yNLKJebCb8Aueb54LYya3	madchester
593	0yNLKJebCb8Aueb54LYya3	new romantic
594	0yNLKJebCb8Aueb54LYya3	new wave
595	0yNLKJebCb8Aueb54LYya3	new wave pop
596	0yNLKJebCb8Aueb54LYya3	permanent wave
597	0yNLKJebCb8Aueb54LYya3	pop rock
598	0yNLKJebCb8Aueb54LYya3	post-punk
599	0yNLKJebCb8Aueb54LYya3	rock
600	0yNLKJebCb8Aueb54LYya3	synthpop
601	0yNLKJebCb8Aueb54LYya3	uk post-punk
602	4fXkvh05wFhuH77MfD4m9o	funk
603	4fXkvh05wFhuH77MfD4m9o	retro soul
604	4fXkvh05wFhuH77MfD4m9o	rock
605	4fXkvh05wFhuH77MfD4m9o	roots rock
606	2x9SpqnPi8rlE9pjHBwmSC	art punk
607	2x9SpqnPi8rlE9pjHBwmSC	art rock
608	2x9SpqnPi8rlE9pjHBwmSC	dance rock
609	2x9SpqnPi8rlE9pjHBwmSC	funk rock
610	2x9SpqnPi8rlE9pjHBwmSC	new wave
611	2x9SpqnPi8rlE9pjHBwmSC	permanent wave
612	2x9SpqnPi8rlE9pjHBwmSC	post-punk
613	2x9SpqnPi8rlE9pjHBwmSC	rock
614	2x9SpqnPi8rlE9pjHBwmSC	zolo
615	4LG4Bs1Gadht7TCrMytQUO	albuquerque indie
616	4LG4Bs1Gadht7TCrMytQUO	alternative rock
617	4LG4Bs1Gadht7TCrMytQUO	indie pop
618	4LG4Bs1Gadht7TCrMytQUO	indie rock
619	4LG4Bs1Gadht7TCrMytQUO	modern rock
620	4LG4Bs1Gadht7TCrMytQUO	portland indie
621	4LG4Bs1Gadht7TCrMytQUO	stomp and holler
622	1Tp7C6LzxZe9Mix6rn4zbI	deep new americana
623	1Tp7C6LzxZe9Mix6rn4zbI	indie folk
624	1Tp7C6LzxZe9Mix6rn4zbI	indie rock
625	1Tp7C6LzxZe9Mix6rn4zbI	modern rock
626	1Tp7C6LzxZe9Mix6rn4zbI	stomp and holler
627	7foyQbi7GKriLiv1GPVEwt	deep new americana
628	7foyQbi7GKriLiv1GPVEwt	indie folk
629	7foyQbi7GKriLiv1GPVEwt	new americana
630	7foyQbi7GKriLiv1GPVEwt	south carolina indie
631	7foyQbi7GKriLiv1GPVEwt	stomp and holler
632	6m4tJuf67jwVSvMP34hrck	funk
633	6m4tJuf67jwVSvMP34hrck	neo soul
634	1nJvji2KIlWSseXRSlNYsC	alternative rock
635	1nJvji2KIlWSseXRSlNYsC	art rock
636	1nJvji2KIlWSseXRSlNYsC	classic rock
637	1nJvji2KIlWSseXRSlNYsC	folk rock
638	1nJvji2KIlWSseXRSlNYsC	melancholia
639	1nJvji2KIlWSseXRSlNYsC	permanent wave
640	1nJvji2KIlWSseXRSlNYsC	protopunk
641	1nJvji2KIlWSseXRSlNYsC	psychedelic rock
642	1nJvji2KIlWSseXRSlNYsC	rock
643	32Ko3nL0210QAt14S3Rs4Y	indie folk
644	32Ko3nL0210QAt14S3Rs4Y	indie pop
645	32Ko3nL0210QAt14S3Rs4Y	indie poptimism
646	32Ko3nL0210QAt14S3Rs4Y	indie rock
647	32Ko3nL0210QAt14S3Rs4Y	modern rock
648	32Ko3nL0210QAt14S3Rs4Y	stomp and holler
649	4Z8W4fKeB5YxbusRsdQVPb	alternative rock
650	4Z8W4fKeB5YxbusRsdQVPb	art rock
651	4Z8W4fKeB5YxbusRsdQVPb	melancholia
652	4Z8W4fKeB5YxbusRsdQVPb	oxford indie
653	4Z8W4fKeB5YxbusRsdQVPb	permanent wave
654	4Z8W4fKeB5YxbusRsdQVPb	rock
655	00tVTdpEhQQw1bqdu8RCx2	album rock
656	00tVTdpEhQQw1bqdu8RCx2	blues rock
657	00tVTdpEhQQw1bqdu8RCx2	classic rock
658	00tVTdpEhQQw1bqdu8RCx2	hard rock
659	00tVTdpEhQQw1bqdu8RCx2	metal
660	00tVTdpEhQQw1bqdu8RCx2	rock
661	00tVTdpEhQQw1bqdu8RCx2	soft rock
662	0vqkz1b2qBkoYrGMj2CUWq	classic soul
663	0vqkz1b2qBkoYrGMj2CUWq	funk
664	0vqkz1b2qBkoYrGMj2CUWq	quiet storm
665	0vqkz1b2qBkoYrGMj2CUWq	soul
666	0vqkz1b2qBkoYrGMj2CUWq	southern soul
667	2AV6XDIs32ofIJhkkDevjm	chicago soul
668	2AV6XDIs32ofIJhkkDevjm	classic soul
669	2AV6XDIs32ofIJhkkDevjm	funk
670	2AV6XDIs32ofIJhkkDevjm	soul
671	2FXC3k01G6Gw61bmprjgqS	irish singer-songwriter
672	2FXC3k01G6Gw61bmprjgqS	pop
673	2g3PKH7Z1Ofn5oGR6oDjLy	classic garage rock
674	2g3PKH7Z1Ofn5oGR6oDjLy	freakbeat
675	2g3PKH7Z1Ofn5oGR6oDjLy	garage rock
676	2g3PKH7Z1Ofn5oGR6oDjLy	protopunk
677	2g3PKH7Z1Ofn5oGR6oDjLy	psychedelic rock
678	2g3PKH7Z1Ofn5oGR6oDjLy	punk
679	2g3PKH7Z1Ofn5oGR6oDjLy	punk blues
680	6PfSUFtkMVoDkx4MQkzOi3	escape room
681	6PfSUFtkMVoDkx4MQkzOi3	hyperpop
682	6PfSUFtkMVoDkx4MQkzOi3	proto-hyperpop
683	6PfSUFtkMVoDkx4MQkzOi3	scenecore
684	5vSQUyT33qxr1xAX2Tkf3A	experimental hip hop
685	5vSQUyT33qxr1xAX2Tkf3A	psychedelic hip hop
686	0eDvMgVFoNV3TpwtrVCoTj	brooklyn drill
687	6guC9FqvlVboSKTI77NG2k	metalcore
688	6guC9FqvlVboSKTI77NG2k	pixie
689	6guC9FqvlVboSKTI77NG2k	sacramento indie
690	6guC9FqvlVboSKTI77NG2k	screamo
691	6guC9FqvlVboSKTI77NG2k	swancore
692	2NjfBq1NflQcKSeiDooVjY	australian pop
693	2NjfBq1NflQcKSeiDooVjY	pop
694	757aE44tKEUQEqRuT6GnEB	melodic rap
695	757aE44tKEUQEqRuT6GnEB	rap
696	757aE44tKEUQEqRuT6GnEB	trap
697	6XyY86QOPPrYVGvF9ch6wz	alternative metal
698	6XyY86QOPPrYVGvF9ch6wz	nu metal
699	6XyY86QOPPrYVGvF9ch6wz	post-grunge
700	6XyY86QOPPrYVGvF9ch6wz	rap metal
701	422qjlzkDtxmaeeOLhnE6A	anime score
702	2cFrymmkijnjDg9SS92EPM	pop
703	2cFrymmkijnjDg9SS92EPM	pop rap
704	1rCIEwPp5OnXW0ornlSsRl	alternative dance
705	1rCIEwPp5OnXW0ornlSsRl	canadian indie
706	1rCIEwPp5OnXW0ornlSsRl	canadian rock
707	1rCIEwPp5OnXW0ornlSsRl	electropop
708	1rCIEwPp5OnXW0ornlSsRl	indie rock
709	1rCIEwPp5OnXW0ornlSsRl	metropopolis
710	1rCIEwPp5OnXW0ornlSsRl	modern rock
711	1rCIEwPp5OnXW0ornlSsRl	neo-synthpop
712	6MPCFvOQv5cIGfw3jODMF0	pop rap
713	6MPCFvOQv5cIGfw3jODMF0	rap
714	6MPCFvOQv5cIGfw3jODMF0	trap
715	6MPCFvOQv5cIGfw3jODMF0	viral rap
716	4sQNUQjOYj9rV2sdfJ8laS	gabba
717	4sQNUQjOYj9rV2sdfJ8laS	hardcore techno
718	4sQNUQjOYj9rV2sdfJ8laS	tekk
719	4sQNUQjOYj9rV2sdfJ8laS	uptempo hardcore
720	3YQKmKGau1PzlVlkL1iodx	modern rock
721	3YQKmKGau1PzlVlkL1iodx	rock
722	6eUKZXaKkcviH0Ku9w2n3V	pop
723	6eUKZXaKkcviH0Ku9w2n3V	uk pop
724	7GN9PivdemQRKjDt4z5Zv8	alternative r&b
725	7GN9PivdemQRKjDt4z5Zv8	indie soul
726	7GN9PivdemQRKjDt4z5Zv8	lgbtq+ hip hop
727	7GN9PivdemQRKjDt4z5Zv8	neo soul
728	7GN9PivdemQRKjDt4z5Zv8	r&b
729	7GN9PivdemQRKjDt4z5Zv8	rap
730	34Y0ldeyUv7jBvukWOGASO	nyc rap
731	34Y0ldeyUv7jBvukWOGASO	pop rap
732	34Y0ldeyUv7jBvukWOGASO	rap
733	34Y0ldeyUv7jBvukWOGASO	southern hip hop
734	34Y0ldeyUv7jBvukWOGASO	trap
735	4LLpKhyESsyAXpc4laK94U	hip hop
736	4LLpKhyESsyAXpc4laK94U	pittsburgh rap
737	4LLpKhyESsyAXpc4laK94U	rap
738	7gjAu1qr5C2grXeQFFOGeh	alternative dance
739	7gjAu1qr5C2grXeQFFOGeh	indie rock
740	7gjAu1qr5C2grXeQFFOGeh	indietronica
741	7gjAu1qr5C2grXeQFFOGeh	modern rock
742	7gjAu1qr5C2grXeQFFOGeh	stomp and holler
743	7oPftvlwr6VrsViSDV7fJY	permanent wave
744	7oPftvlwr6VrsViSDV7fJY	punk
745	738wLrAtLtCtFOLvQBXOXp	dance pop
746	738wLrAtLtCtFOLvQBXOXp	edm
747	738wLrAtLtCtFOLvQBXOXp	electro house
748	738wLrAtLtCtFOLvQBXOXp	moombahton
749	738wLrAtLtCtFOLvQBXOXp	pop
750	738wLrAtLtCtFOLvQBXOXp	pop dance
751	738wLrAtLtCtFOLvQBXOXp	pop rap
752	738wLrAtLtCtFOLvQBXOXp	tropical house
753	6fxyWrfmjcbj5d12gXeiNV	dark trap
754	6fxyWrfmjcbj5d12gXeiNV	drill
755	6fxyWrfmjcbj5d12gXeiNV	hip hop
756	6fxyWrfmjcbj5d12gXeiNV	miami hip hop
757	6fxyWrfmjcbj5d12gXeiNV	rap
758	6fxyWrfmjcbj5d12gXeiNV	underground hip hop
759	6kDMoHTcBICPILP2aclPWZ	danish alternative rock
760	6kDMoHTcBICPILP2aclPWZ	danish rock
761	6kDMoHTcBICPILP2aclPWZ	dream pop
762	6kDMoHTcBICPILP2aclPWZ	melancholia
763	21dooacK2WGBB5amYvKyfM	dark trap
764	21dooacK2WGBB5amYvKyfM	melodic rap
765	21dooacK2WGBB5amYvKyfM	miami hip hop
766	21dooacK2WGBB5amYvKyfM	rap
767	21dooacK2WGBB5amYvKyfM	southern hip hop
768	21dooacK2WGBB5amYvKyfM	trap
769	21dooacK2WGBB5amYvKyfM	underground hip hop
770	21dooacK2WGBB5amYvKyfM	vapor trap
771	21dooacK2WGBB5amYvKyfM	viral rap
772	7Im2r58zlLJIDfamqDjEE6	capoeira
773	0dlDsD7y6ccmDm8tuWCU6F	aesthetic rap
774	0dlDsD7y6ccmDm8tuWCU6F	phonk
775	7A8S43ryYdbWpJKeHRZRcq	rap
776	7A8S43ryYdbWpJKeHRZRcq	trap
777	0iEtIxbK0KxaSlF7G42ZOp	hip hop
778	0iEtIxbK0KxaSlF7G42ZOp	rap
779	0iEtIxbK0KxaSlF7G42ZOp	trap
780	0Y5tJX1MQlPlqiwlOH1tJY	rap
781	0Y5tJX1MQlPlqiwlOH1tJY	slap house
782	0H39MdGGX6dbnnQPt6NQkZ	melodic rap
783	0H39MdGGX6dbnnQPt6NQkZ	pop rap
784	0H39MdGGX6dbnnQPt6NQkZ	rap
785	0H39MdGGX6dbnnQPt6NQkZ	slap house
786	6Q1ggxOPVDbMyqlhv0tmT4	capoeira
787	5dHt1vcEm9qb8fCyLcB3HL	gangster rap
788	5dHt1vcEm9qb8fCyLcB3HL	hip hop
789	5dHt1vcEm9qb8fCyLcB3HL	pop rap
790	5dHt1vcEm9qb8fCyLcB3HL	rap
791	5dHt1vcEm9qb8fCyLcB3HL	southern hip hop
792	5dHt1vcEm9qb8fCyLcB3HL	trap
793	5dHt1vcEm9qb8fCyLcB3HL	underground hip hop
794	0ONHkAv9pCAFxb0zJwDNTy	alternative hip hop
795	0ONHkAv9pCAFxb0zJwDNTy	hip hop
796	0ONHkAv9pCAFxb0zJwDNTy	pop rap
797	0ONHkAv9pCAFxb0zJwDNTy	rap
798	0ONHkAv9pCAFxb0zJwDNTy	southern hip hop
799	0ONHkAv9pCAFxb0zJwDNTy	trap
800	0ONHkAv9pCAFxb0zJwDNTy	underground hip hop
801	0ONHkAv9pCAFxb0zJwDNTy	virginia hip hop
802	7kA4sEagpoNK91I7wr9tYr	bass house
803	7kA4sEagpoNK91I7wr9tYr	indonesian edm
804	1SImpQO0GbjRgvlwCcCtFo	pop punk
805	1SImpQO0GbjRgvlwCcCtFo	pop rock
806	1SImpQO0GbjRgvlwCcCtFo	screamo
807	1URnnhqYAYcrqrcwql10ft	atl hip hop
808	1URnnhqYAYcrqrcwql10ft	rap
809	4DdkRBBYG6Yk9Ka8tdJ9BW	atl hip hop
810	4DdkRBBYG6Yk9Ka8tdJ9BW	hip hop
811	4DdkRBBYG6Yk9Ka8tdJ9BW	pop rap
812	4DdkRBBYG6Yk9Ka8tdJ9BW	rap
813	4DdkRBBYG6Yk9Ka8tdJ9BW	southern hip hop
814	4DdkRBBYG6Yk9Ka8tdJ9BW	trap
815	1AldSIJ8ANuZVbjKIhpKKq	capoeira
816	2EhUXeszBQRApbBmTOXlKU	capoeira
817	4CrK2BAeyd3DIt2M2ELPJ4	capoeira
818	5CCwRZC6euC8Odo6y9X8jr	dance pop
819	5CCwRZC6euC8Odo6y9X8jr	edm
820	5CCwRZC6euC8Odo6y9X8jr	electropop
821	5CCwRZC6euC8Odo6y9X8jr	pop
822	5CCwRZC6euC8Odo6y9X8jr	pop rap
823	5CCwRZC6euC8Odo6y9X8jr	post-teen pop
824	5CCwRZC6euC8Odo6y9X8jr	tropical house
825	5CCwRZC6euC8Odo6y9X8jr	uk pop
826	7HGNYPmbDrMkylWqeFCOIQ	bossa nova
827	7HGNYPmbDrMkylWqeFCOIQ	mpb
828	7HGNYPmbDrMkylWqeFCOIQ	samba de roda
829	7HGNYPmbDrMkylWqeFCOIQ	tropicalia
830	3qZ2n5keOAat1SoF6bHwmb	pagode
831	3qZ2n5keOAat1SoF6bHwmb	partido alto
832	3qZ2n5keOAat1SoF6bHwmb	samba
833	3qZ2n5keOAat1SoF6bHwmb	samba de roda
834	09U6hmCerKcIJrixubiBjm	rap baiano
835	09U6hmCerKcIJrixubiBjm	trap baiano
836	09U6hmCerKcIJrixubiBjm	trap brasileiro
837	7oEkUINVIj1Nr3Wnj8tzqr	bossa nova
838	7oEkUINVIj1Nr3Wnj8tzqr	mpb
839	7oEkUINVIj1Nr3Wnj8tzqr	samba
840	7oEkUINVIj1Nr3Wnj8tzqr	tropicalia
841	7oEkUINVIj1Nr3Wnj8tzqr	violao
842	5rX2c1zow6hCph8PnnU3kF	adult standards
843	5rX2c1zow6hCph8PnnU3kF	bossa nova
844	5rX2c1zow6hCph8PnnU3kF	brazilian jazz
845	5rX2c1zow6hCph8PnnU3kF	lounge
846	5rX2c1zow6hCph8PnnU3kF	samba-jazz
847	5rX2c1zow6hCph8PnnU3kF	vocal jazz
848	1b8kpp4DUwt1hWaxTiWQhD	bossa nova
849	1b8kpp4DUwt1hWaxTiWQhD	mpb
850	1b8kpp4DUwt1hWaxTiWQhD	samba
851	1b8kpp4DUwt1hWaxTiWQhD	tropicalia
852	0Mz5XE0kb1GBnbLQm2VbcO	alternative hip hop
853	0Mz5XE0kb1GBnbLQm2VbcO	conscious hip hop
854	0Mz5XE0kb1GBnbLQm2VbcO	east coast hip hop
855	0Mz5XE0kb1GBnbLQm2VbcO	gangster rap
856	0Mz5XE0kb1GBnbLQm2VbcO	hardcore hip hop
857	0Mz5XE0kb1GBnbLQm2VbcO	hip hop
858	0Mz5XE0kb1GBnbLQm2VbcO	rap
859	0Mz5XE0kb1GBnbLQm2VbcO	southern hip hop
860	0av074qUwLn5eyzwqoq3xh	alternative hip hop
861	0av074qUwLn5eyzwqoq3xh	hip hop
862	0av074qUwLn5eyzwqoq3xh	jazz rap
863	2PmIyxmEFsNfQJjEifPDZC	english indie rock
864	3Rq3YOF9YG9YfCWD4D56RZ	chillhop
865	3Rq3YOF9YG9YfCWD4D56RZ	downtempo
866	3Rq3YOF9YG9YfCWD4D56RZ	japanese chillhop
867	3Rq3YOF9YG9YfCWD4D56RZ	japanese old school hip hop
868	3Rq3YOF9YG9YfCWD4D56RZ	jazz rap
869	23cC3RI0hgD5sWmXKPAJuG	chillhop
870	23cC3RI0hgD5sWmXKPAJuG	indie soul
871	1xHQO9GJIW9OXHxGBISYc5	electropop
872	09hVIj6vWgoCDtT03h8ZCa	alternative hip hop
873	09hVIj6vWgoCDtT03h8ZCa	conscious hip hop
874	09hVIj6vWgoCDtT03h8ZCa	east coast hip hop
875	09hVIj6vWgoCDtT03h8ZCa	gangster rap
876	09hVIj6vWgoCDtT03h8ZCa	golden age hip hop
877	09hVIj6vWgoCDtT03h8ZCa	hardcore hip hop
878	09hVIj6vWgoCDtT03h8ZCa	hip hop
879	09hVIj6vWgoCDtT03h8ZCa	jazz rap
880	09hVIj6vWgoCDtT03h8ZCa	queens hip hop
881	09hVIj6vWgoCDtT03h8ZCa	rap
882	1MBqzcu6aiY7GzP5BfG56T	french hip hop
883	1MBqzcu6aiY7GzP5BfG56T	old school rap francais
884	1WxunfiOh9Ws0uu2JoDmjL	bossa nova
885	1WxunfiOh9Ws0uu2JoDmjL	samba-jazz
886	5JYtpnUKxAzXfHEYpOeeit	bossa nova
887	5JYtpnUKxAzXfHEYpOeeit	manguebeat
888	5JYtpnUKxAzXfHEYpOeeit	mpb
889	5JYtpnUKxAzXfHEYpOeeit	pagode
890	5JYtpnUKxAzXfHEYpOeeit	samba
891	5JYtpnUKxAzXfHEYpOeeit	samba-rock
892	5JYtpnUKxAzXfHEYpOeeit	tropicalia
893	1gIa65d5ICT2xVWiUJ3u27	bossa nova
894	1gIa65d5ICT2xVWiUJ3u27	brazilian indie
895	1gIa65d5ICT2xVWiUJ3u27	mpb
896	1gIa65d5ICT2xVWiUJ3u27	nova mpb
897	1gIa65d5ICT2xVWiUJ3u27	rock baiano
898	1gIa65d5ICT2xVWiUJ3u27	samba
899	1gIa65d5ICT2xVWiUJ3u27	tropicalia
987	0I11U609NiFEdpvNix7oNl	capoeira
988	6xQwC94a61f3bZwyl4UJXD	capoeira
989	4M5nCE77Qaxayuhp3fVn4V	chamber pop
990	4M5nCE77Qaxayuhp3fVn4V	indie folk
991	4M5nCE77Qaxayuhp3fVn4V	stomp and holler
992	6aaMZ3fcfLv4tEbmY7bjRM	hip hop
993	6aaMZ3fcfLv4tEbmY7bjRM	rap
994	6aaMZ3fcfLv4tEbmY7bjRM	tennessee hip hop
995	6aaMZ3fcfLv4tEbmY7bjRM	underground hip hop
996	7hi7sNBb4AWmzHRjFCs94V	capoeira
997	04gDigrS5kc9YWfZHwBETP	pop
998	6BIltkF2V7p0PHLtUyc7re	capoeira
999	2p1fiYHYiXz9qi0JJyxBzN	birmingham grime
1000	2p1fiYHYiXz9qi0JJyxBzN	grime
1001	2p1fiYHYiXz9qi0JJyxBzN	instrumental grime
1002	2p1fiYHYiXz9qi0JJyxBzN	rap
1003	5SKEXbgzIdRl3gQJ23CnUP	capoeira
1004	1cIz2h3ERs72r60yw78Deu	bass house
1005	4ERtgeBbWRkFzIz6LaFCeY	emo
1006	4ERtgeBbWRkFzIz6LaFCeY	neo mellow
1007	4ERtgeBbWRkFzIz6LaFCeY	pop punk
1008	4ERtgeBbWRkFzIz6LaFCeY	pop rock
1009	4dM6NDYSfLcspt8GLoT5aE	edm
1010	4dM6NDYSfLcspt8GLoT5aE	electronic trap
1011	1KEUVZo7CMTSJoM8doulOT	alternative metal
1012	1KEUVZo7CMTSJoM8doulOT	nu metal
1013	1KEUVZo7CMTSJoM8doulOT	post-grunge
1014	1KEUVZo7CMTSJoM8doulOT	rap rock
1015	67p5GMYQZOgaAfx1YyttQk	capoeira
1016	6dGRShw3EqULdxZl9EEJYv	capoeira
1017	6qgc4bSHhzZxnJ01WDEAHt	capoeira
1018	5ZfHVIBVoMg0VjgUBU0alH	capoeira
1019	5nJ5xDXFO4czh2gJ9f4wto	capoeira
1020	5nJ5xDXFO4czh2gJ9f4wto	samba de roda
1021	1K9pNfOfxZFfbEgoOmjV13	capoeira
1022	1K9pNfOfxZFfbEgoOmjV13	samba de roda
1023	4Lm0pUvmisUHMdoky5ch2I	alternative metal
1024	4Lm0pUvmisUHMdoky5ch2I	bow pop
1025	4Lm0pUvmisUHMdoky5ch2I	cello
1026	4Lm0pUvmisUHMdoky5ch2I	finnish metal
1027	4Lm0pUvmisUHMdoky5ch2I	nu metal
1028	1MXZ0hsGic96dWRDKwAwdr	cali rap
1029	1MXZ0hsGic96dWRDKwAwdr	melodic rap
1030	1MXZ0hsGic96dWRDKwAwdr	pop
900	246dkjvS1zLTtiykXe5h60	dfw rap
901	246dkjvS1zLTtiykXe5h60	melodic rap
902	246dkjvS1zLTtiykXe5h60	rap
903	25uiPmTg16RbhZWAqwLBy5	art pop
904	25uiPmTg16RbhZWAqwLBy5	candy pop
905	25uiPmTg16RbhZWAqwLBy5	dance pop
906	25uiPmTg16RbhZWAqwLBy5	electropop
907	25uiPmTg16RbhZWAqwLBy5	metropopolis
908	25uiPmTg16RbhZWAqwLBy5	pop
909	25uiPmTg16RbhZWAqwLBy5	post-teen pop
910	25uiPmTg16RbhZWAqwLBy5	uk pop
911	4r63FhuTkUYltbVAg5TQnk	north carolina hip hop
912	4r63FhuTkUYltbVAg5TQnk	rap
913	4r63FhuTkUYltbVAg5TQnk	trap
914	26T3LtbuGT1Fu9m0eRq5X3	modern rock
915	26T3LtbuGT1Fu9m0eRq5X3	punk blues
916	26T3LtbuGT1Fu9m0eRq5X3	rock
917	4kI8Ie27vjvonwaB2ePh8T	modern rock
918	4kI8Ie27vjvonwaB2ePh8T	rock
919	24XtlMhEMNdi822vi0MhY1	emo
920	24XtlMhEMNdi822vi0MhY1	pop punk
921	64KEffDW9EtZ1y2vBYgq8T	brostep
922	64KEffDW9EtZ1y2vBYgq8T	dance pop
923	64KEffDW9EtZ1y2vBYgq8T	edm
924	64KEffDW9EtZ1y2vBYgq8T	pop
925	64KEffDW9EtZ1y2vBYgq8T	pop dance
926	64KEffDW9EtZ1y2vBYgq8T	progressive electro house
927	15UsOTVnJzReFVN1VCnxy4	emo rap
928	15UsOTVnJzReFVN1VCnxy4	miami hip hop
929	5cj0lLjcoR7YOSnhnX0Po5	dance pop
930	5cj0lLjcoR7YOSnhnX0Po5	pop
931	6qqNVTkY8uBg9cP3Jd7DAH	art pop
932	6qqNVTkY8uBg9cP3Jd7DAH	electropop
933	6qqNVTkY8uBg9cP3Jd7DAH	pop
934	5yV1qdnmxyIYiSFB02wpDj	indie pop
935	5yV1qdnmxyIYiSFB02wpDj	indie rock
936	5yV1qdnmxyIYiSFB02wpDj	indietronica
937	5yV1qdnmxyIYiSFB02wpDj	seattle indie
938	41rVuRHYAiH7ltBTHVR9We	brostep
939	41rVuRHYAiH7ltBTHVR9We	edm
940	41rVuRHYAiH7ltBTHVR9We	electro house
941	41rVuRHYAiH7ltBTHVR9We	electronic trap
942	41rVuRHYAiH7ltBTHVR9We	future bass
943	41rVuRHYAiH7ltBTHVR9We	pop dance
944	41rVuRHYAiH7ltBTHVR9We	pop edm
945	0EeQBlQJFiAfJeVN2vT9s0	conscious hip hop
946	0EeQBlQJFiAfJeVN2vT9s0	gangster rap
947	0EeQBlQJFiAfJeVN2vT9s0	hip hop
948	0EeQBlQJFiAfJeVN2vT9s0	pop rap
949	0EeQBlQJFiAfJeVN2vT9s0	rap
950	0EeQBlQJFiAfJeVN2vT9s0	southern hip hop
951	0EeQBlQJFiAfJeVN2vT9s0	trap
952	0jNDKefhfSbLR9sFvcPLHo	edm
953	0jNDKefhfSbLR9sFvcPLHo	electro house
954	0jNDKefhfSbLR9sFvcPLHo	electronic trap
955	0jNDKefhfSbLR9sFvcPLHo	electropop
956	0jNDKefhfSbLR9sFvcPLHo	future bass
957	0jNDKefhfSbLR9sFvcPLHo	pop dance
958	0jNDKefhfSbLR9sFvcPLHo	pop edm
959	0jNDKefhfSbLR9sFvcPLHo	vapor twitch
960	7boQqq2hUcz9kHcQOecG4j	gangster rap
961	7boQqq2hUcz9kHcQOecG4j	hyphy
962	7boQqq2hUcz9kHcQOecG4j	west coast rap
963	7boQqq2hUcz9kHcQOecG4j	west coast trap
964	5BvJzeQpmsdsFp4HGUYUEx	baroque pop
965	5BvJzeQpmsdsFp4HGUYUEx	indie rock
966	5BvJzeQpmsdsFp4HGUYUEx	modern rock
967	5BvJzeQpmsdsFp4HGUYUEx	rock
968	4MCBfE4596Uoi2O4DtmEMz	chicago rap
969	4MCBfE4596Uoi2O4DtmEMz	melodic rap
970	1vCWHaC5f2uS3yhpwWbIA6	dance pop
971	1vCWHaC5f2uS3yhpwWbIA6	edm
972	1vCWHaC5f2uS3yhpwWbIA6	pop
973	1vCWHaC5f2uS3yhpwWbIA6	pop dance
974	1vCWHaC5f2uS3yhpwWbIA6	pop rap
975	3TVXtAsR1Inumwj472S9r4	canadian hip hop
976	3TVXtAsR1Inumwj472S9r4	canadian pop
977	3TVXtAsR1Inumwj472S9r4	hip hop
978	3TVXtAsR1Inumwj472S9r4	rap
979	3TVXtAsR1Inumwj472S9r4	toronto rap
980	0SwO7SWeDHJijQ3XNS7xEE	alternative dance
981	0SwO7SWeDHJijQ3XNS7xEE	indietronica
982	0SwO7SWeDHJijQ3XNS7xEE	modern rock
983	0SwO7SWeDHJijQ3XNS7xEE	rock
984	3AA28KZvwAUcZuOKwyblJQ	alternative hip hop
985	5r4anprO9Hg9CBlmdkwFdE	capoeira
986	5r4anprO9Hg9CBlmdkwFdE	samba reggae
1031	1MXZ0hsGic96dWRDKwAwdr	pop rap
1032	1MXZ0hsGic96dWRDKwAwdr	rap
1033	1MXZ0hsGic96dWRDKwAwdr	trap
1034	14ep6TM2JzapH5nk7vaora	welsh hip hop
1035	6tbLPxj1uQ6vsRQZI2YFCT	alternative metal
1036	6tbLPxj1uQ6vsRQZI2YFCT	nu metal
1037	2yEwvVSSSUkcLeSTNyHKh8	alternative metal
1038	2yEwvVSSSUkcLeSTNyHKh8	alternative rock
1039	2yEwvVSSSUkcLeSTNyHKh8	art rock
1040	2yEwvVSSSUkcLeSTNyHKh8	nu metal
1041	2yEwvVSSSUkcLeSTNyHKh8	progressive metal
1042	2yEwvVSSSUkcLeSTNyHKh8	progressive rock
1043	2yEwvVSSSUkcLeSTNyHKh8	rock
1044	5HYNPEO2NNBONQkp3Mvwvc	jazz cover
1045	5HYNPEO2NNBONQkp3Mvwvc	swing
1046	7AQzXO3NPNQsI7oNu5rC3r	alternative rock
1047	7AQzXO3NPNQsI7oNu5rC3r	pop rock
1048	7AQzXO3NPNQsI7oNu5rC3r	rock
1049	1LB8qB5BPb3MHQrfkvifXU	album rock
1050	1LB8qB5BPb3MHQrfkvifXU	art rock
1051	1LB8qB5BPb3MHQrfkvifXU	beatlesque
1052	1LB8qB5BPb3MHQrfkvifXU	classic rock
1053	1LB8qB5BPb3MHQrfkvifXU	glam metal
1054	1LB8qB5BPb3MHQrfkvifXU	glam rock
1055	1LB8qB5BPb3MHQrfkvifXU	hard rock
1056	1LB8qB5BPb3MHQrfkvifXU	heartland rock
1057	1LB8qB5BPb3MHQrfkvifXU	mellow gold
1058	1LB8qB5BPb3MHQrfkvifXU	new wave pop
1059	1LB8qB5BPb3MHQrfkvifXU	pop rock
1060	1LB8qB5BPb3MHQrfkvifXU	power pop
1061	1LB8qB5BPb3MHQrfkvifXU	rock
1062	1LB8qB5BPb3MHQrfkvifXU	soft rock
1063	0RqtSIYZmd4fiBKVFqyIqD	modern rock
1064	0RqtSIYZmd4fiBKVFqyIqD	post-grunge
1065	0RqtSIYZmd4fiBKVFqyIqD	rock
1066	5KDIH2gF0VpelTqyQS7udb	alternative metal
1067	5KDIH2gF0VpelTqyQS7udb	nu metal
1068	5KDIH2gF0VpelTqyQS7udb	pop rock
1069	5KDIH2gF0VpelTqyQS7udb	post-grunge
1070	5KDIH2gF0VpelTqyQS7udb	rap rock
1071	5KDIH2gF0VpelTqyQS7udb	rock
1072	77aDWNQLrjzW7i6YBRhCbQ	irish indie rock
1073	2MqhkhX4npxDZ62ObR5ELO	alternative metal
1074	2MqhkhX4npxDZ62ObR5ELO	funk metal
1075	2MqhkhX4npxDZ62ObR5ELO	nu metal
1076	2MqhkhX4npxDZ62ObR5ELO	pop rock
1077	2MqhkhX4npxDZ62ObR5ELO	post-grunge
1078	2MqhkhX4npxDZ62ObR5ELO	rap rock
1079	1KCSPY1glIKqW2TotWuXOR	dance pop
1080	1KCSPY1glIKqW2TotWuXOR	pop
1081	67ea9eGLXYMsO2eYQRui3w	album rock
1082	67ea9eGLXYMsO2eYQRui3w	art rock
1083	67ea9eGLXYMsO2eYQRui3w	blues rock
1084	67ea9eGLXYMsO2eYQRui3w	british invasion
1085	67ea9eGLXYMsO2eYQRui3w	classic rock
1086	67ea9eGLXYMsO2eYQRui3w	hard rock
1087	67ea9eGLXYMsO2eYQRui3w	mellow gold
1088	67ea9eGLXYMsO2eYQRui3w	psychedelic rock
1089	67ea9eGLXYMsO2eYQRui3w	rock
1090	3TOqt5oJwL9BE2NG9MEwDa	alternative metal
1091	3TOqt5oJwL9BE2NG9MEwDa	nu metal
1092	3TOqt5oJwL9BE2NG9MEwDa	rap metal
1093	74eX4C98E4FCrAMl39qRsJ	alternative metal
1094	74eX4C98E4FCrAMl39qRsJ	canadian metal
1095	74eX4C98E4FCrAMl39qRsJ	canadian rock
1096	74eX4C98E4FCrAMl39qRsJ	nu metal
1097	74eX4C98E4FCrAMl39qRsJ	post-grunge
1098	74eX4C98E4FCrAMl39qRsJ	rap rock
1099	6CwfuxIqcltXDGjfZsMd9A	dance pop
1100	6CwfuxIqcltXDGjfZsMd9A	electropop
1101	6CwfuxIqcltXDGjfZsMd9A	metropopolis
1102	6CwfuxIqcltXDGjfZsMd9A	pop
1103	6CwfuxIqcltXDGjfZsMd9A	uk alternative pop
1104	6zFYqv1mOsgBRQbae3JJ9e	classic rock
1105	6zFYqv1mOsgBRQbae3JJ9e	mellow gold
1106	6zFYqv1mOsgBRQbae3JJ9e	piano rock
1107	6zFYqv1mOsgBRQbae3JJ9e	rock
1108	6zFYqv1mOsgBRQbae3JJ9e	singer-songwriter
1109	6zFYqv1mOsgBRQbae3JJ9e	soft rock
1110	4QM5QCHicznALtX885CnZC	art pop
1111	4QM5QCHicznALtX885CnZC	dance pop
1112	4QM5QCHicznALtX885CnZC	electropop
1113	4QM5QCHicznALtX885CnZC	escape room
1114	4QM5QCHicznALtX885CnZC	hyperpop
1115	4QM5QCHicznALtX885CnZC	pink noise
1116	4QM5QCHicznALtX885CnZC	pop
1117	4QM5QCHicznALtX885CnZC	proto-hyperpop
1118	4QM5QCHicznALtX885CnZC	viral rap
1119	5nGIFgo0shDenQYSE0Sn7c	alternative metal
1120	5qa31A9HySw3T7MKWI9bGg	alt z
1121	5qa31A9HySw3T7MKWI9bGg	dance pop
1122	5qa31A9HySw3T7MKWI9bGg	electropop
1123	5qa31A9HySw3T7MKWI9bGg	pop
1124	5qa31A9HySw3T7MKWI9bGg	post-teen pop
1125	1AwO9pWEBSBoWdEZu28XDC	adult standards
1126	1AwO9pWEBSBoWdEZu28XDC	lounge
1127	1AwO9pWEBSBoWdEZu28XDC	torch song
1128	1AwO9pWEBSBoWdEZu28XDC	vocal jazz
1129	4yvcSjfu4PC0CYQyLy4wSq	gauze pop
1130	4yvcSjfu4PC0CYQyLy4wSq	indietronica
1131	4yvcSjfu4PC0CYQyLy4wSq	shiver pop
1132	1moxjboGR7GNWYIMWsRjgG	baroque pop
1133	1moxjboGR7GNWYIMWsRjgG	pop
1134	1moxjboGR7GNWYIMWsRjgG	uk alternative pop
1135	1caBfBEapzw8z2Qz9q0OaQ	alternative metal
1136	1caBfBEapzw8z2Qz9q0OaQ	metalcore
1137	1caBfBEapzw8z2Qz9q0OaQ	screamo
1138	1caBfBEapzw8z2Qz9q0OaQ	trancecore
1139	1caBfBEapzw8z2Qz9q0OaQ	uk metalcore
1140	0vYkHhJ48Bs3jWcvZXvOrP	art punk
1141	0vYkHhJ48Bs3jWcvZXvOrP	art rock
1142	0vYkHhJ48Bs3jWcvZXvOrP	permanent wave
1143	0vYkHhJ48Bs3jWcvZXvOrP	protopunk
1144	0vYkHhJ48Bs3jWcvZXvOrP	rock
1145	0vYkHhJ48Bs3jWcvZXvOrP	singer-songwriter
1146	1ET1wIkDmuCBC80XcTr3Sg	candy pop
1147	7gcUMQcBkw833YqXciq0WB	alt z
1148	7gcUMQcBkw833YqXciq0WB	dark pop
1149	7x3f7c0fBanNlQwpx1255g	chanson
1150	7x3f7c0fBanNlQwpx1255g	ye ye
1151	4iHNK0tOyZPYnBU7nGAgpQ	dance pop
1152	4iHNK0tOyZPYnBU7nGAgpQ	pop
1153	4iHNK0tOyZPYnBU7nGAgpQ	urban contemporary
1154	75xNYf2GU5wtQqBrd74SlY	brisbane indie
1155	75xNYf2GU5wtQqBrd74SlY	dark trap
1156	75xNYf2GU5wtQqBrd74SlY	viral rap
1157	49aaHxvAJ0tCh0F15OnwIl	electropop
1158	49aaHxvAJ0tCh0F15OnwIl	europop
1159	49aaHxvAJ0tCh0F15OnwIl	eurovision
1160	49aaHxvAJ0tCh0F15OnwIl	swedish pop
1161	4SdIXLzfabqU61iK7SnKAU	australian alternative pop
1162	4SdIXLzfabqU61iK7SnKAU	australian pop
1163	7jZMxhsB8djyIbYmoiJSTs	dance pop
1164	7jZMxhsB8djyIbYmoiJSTs	pop
1165	7jZMxhsB8djyIbYmoiJSTs	pop r&b
1166	7jZMxhsB8djyIbYmoiJSTs	post-teen pop
1167	7jZMxhsB8djyIbYmoiJSTs	r&b
1168	7jZMxhsB8djyIbYmoiJSTs	rap
1169	7jZMxhsB8djyIbYmoiJSTs	urban contemporary
1170	3ZJxEmjYZd5VOqZ8o3aXiL	alternative r&b
1171	3ZJxEmjYZd5VOqZ8o3aXiL	electropop
1172	3ZJxEmjYZd5VOqZ8o3aXiL	escape room
1173	11T0XSkxSB5KUPTe8P8BOl	belgian indie
1174	11T0XSkxSB5KUPTe8P8BOl	belgian pop
1175	202HZzqKvPsMHcbwnDZx7u	escape room
1176	202HZzqKvPsMHcbwnDZx7u	hyperpop
1177	202HZzqKvPsMHcbwnDZx7u	pink noise
1178	202HZzqKvPsMHcbwnDZx7u	proto-hyperpop
1179	4Gzfk9Lxm67nBs7E9BZjzG	auckland indie
1180	4Gzfk9Lxm67nBs7E9BZjzG	kiwi rock
1181	0Xkd9GsWwOYETVF0kPXZIG	disco
1182	0Xkd9GsWwOYETVF0kPXZIG	hi-nrg
1183	2cAXhrWAztXGwk6r15ibW2	alt z
1184	2cAXhrWAztXGwk6r15ibW2	pop punk
1185	100sLnojEpcadRx4edEBA6	alt z
1186	100sLnojEpcadRx4edEBA6	electropop
1187	100sLnojEpcadRx4edEBA6	gauze pop
1188	100sLnojEpcadRx4edEBA6	indie poptimism
1189	100sLnojEpcadRx4edEBA6	pop
1190	3VjZEaHXvNbCmV5jc0VfZR	indie electropop
1191	3VjZEaHXvNbCmV5jc0VfZR	indie poptimism
1192	4tpUmLEVLCGFr93o8hFFIB	candy pop
1193	4tpUmLEVLCGFr93o8hFFIB	new wave
1194	4tpUmLEVLCGFr93o8hFFIB	new wave pop
1195	4tpUmLEVLCGFr93o8hFFIB	permanent wave
1196	4tpUmLEVLCGFr93o8hFFIB	power pop
1197	4tpUmLEVLCGFr93o8hFFIB	rock
1198	6E8uXyNsUKeGOgRqAOcgBa	deep adult standards
1199	6blEmsLU25ewy8hHtgZaSL	indie pop
1200	6blEmsLU25ewy8hHtgZaSL	viral rap
1201	0DAZn759crST1j1p3Y2qTn	geek folk
1202	0DAZn759crST1j1p3Y2qTn	neo-pagan
1203	053q0ukIDRgzwTr4vNSwab	art pop
1204	053q0ukIDRgzwTr4vNSwab	canadian electropop
1205	053q0ukIDRgzwTr4vNSwab	dance pop
1206	053q0ukIDRgzwTr4vNSwab	grave wave
1207	053q0ukIDRgzwTr4vNSwab	indietronica
1208	053q0ukIDRgzwTr4vNSwab	metropopolis
1209	053q0ukIDRgzwTr4vNSwab	pop
1210	6ueGR6SWhUJfvEhqkvMsVs	afrofuturism
1211	6ueGR6SWhUJfvEhqkvMsVs	alternative r&b
1212	6ueGR6SWhUJfvEhqkvMsVs	atl hip hop
1213	6ueGR6SWhUJfvEhqkvMsVs	electropop
1214	6ueGR6SWhUJfvEhqkvMsVs	escape room
1215	6ueGR6SWhUJfvEhqkvMsVs	neo soul
1216	6ueGR6SWhUJfvEhqkvMsVs	pop
1217	6ueGR6SWhUJfvEhqkvMsVs	r&b
1218	49qiE8dj4JuNdpYGRPdKbF	alternative metal
1219	49qiE8dj4JuNdpYGRPdKbF	nu metal
1220	49qiE8dj4JuNdpYGRPdKbF	post-grunge
1221	49qiE8dj4JuNdpYGRPdKbF	rap rock
1222	49qiE8dj4JuNdpYGRPdKbF	rock
1223	3qm84nBOXUEQ2vnTfUTTFC	glam metal
1224	3qm84nBOXUEQ2vnTfUTTFC	hard rock
1225	3qm84nBOXUEQ2vnTfUTTFC	rock
1226	0e9C27umtAZF9E2jqyRfeP	cinematic post-rock
1227	6ogn9necmbUdCppmNnGOdi	canadian pop
1228	6ogn9necmbUdCppmNnGOdi	canadian singer-songwriter
1229	6ogn9necmbUdCppmNnGOdi	pop rock
1230	6ogn9necmbUdCppmNnGOdi	singer-songwriter
1231	6om12Ev5ppgoMy3OYSoech	alternative metal
1232	6om12Ev5ppgoMy3OYSoech	nu metal
1233	6om12Ev5ppgoMy3OYSoech	post-grunge
1234	2feDdbD5araYcm6JhFHHw7	indie poptimism
1235	2feDdbD5araYcm6JhFHHw7	pop
1236	3RNrq3jvMZxD9ZyoOZbQOD	alternative metal
1237	3RNrq3jvMZxD9ZyoOZbQOD	funk metal
1238	3RNrq3jvMZxD9ZyoOZbQOD	nu metal
1239	3RNrq3jvMZxD9ZyoOZbQOD	rap metal
1240	3RNrq3jvMZxD9ZyoOZbQOD	rock
1241	2pqd3HsfsvcBGtHvPOg6eg	modern alternative rock
1242	2pqd3HsfsvcBGtHvPOg6eg	modern rock
1243	2pqd3HsfsvcBGtHvPOg6eg	post-grunge
1244	2pqd3HsfsvcBGtHvPOg6eg	rock
1245	0k17h0D3J5VfsdmQ1iZtE9	album rock
1246	0k17h0D3J5VfsdmQ1iZtE9	art rock
1247	0k17h0D3J5VfsdmQ1iZtE9	classic rock
1248	0k17h0D3J5VfsdmQ1iZtE9	progressive rock
1249	0k17h0D3J5VfsdmQ1iZtE9	psychedelic rock
1250	0k17h0D3J5VfsdmQ1iZtE9	rock
1251	0k17h0D3J5VfsdmQ1iZtE9	symphonic rock
1252	5Va9LuEmaZxnbk1gMnjMD7	alternative hip hop
1253	5Va9LuEmaZxnbk1gMnjMD7	atl hip hop
1254	5Va9LuEmaZxnbk1gMnjMD7	conscious hip hop
1255	5Va9LuEmaZxnbk1gMnjMD7	hip hop
1256	5Va9LuEmaZxnbk1gMnjMD7	old school atlanta hip hop
1257	5Va9LuEmaZxnbk1gMnjMD7	rap
1258	3iJJD5v7oIFUevW4N5w5cj	art pop
1259	3iJJD5v7oIFUevW4N5w5cj	art rock
1260	3iJJD5v7oIFUevW4N5w5cj	cello
1261	3iJJD5v7oIFUevW4N5w5cj	dream pop
1262	3iJJD5v7oIFUevW4N5w5cj	experimental
1263	3iJJD5v7oIFUevW4N5w5cj	indie folk
1264	3iJJD5v7oIFUevW4N5w5cj	minimalism
1265	3iJJD5v7oIFUevW4N5w5cj	modern cello
1266	3iJJD5v7oIFUevW4N5w5cj	singer-songwriter
1267	2CCcoAwiAwpIs1hcsqkk3b	free folk
1268	46auOkH1pk28rWrSoUNhLo	alternative country
1269	46auOkH1pk28rWrSoUNhLo	queer country
1270	65NrBzD3Jnf1iqbDjuUYjD	chillstep
1271	2VYQTNDsvvKN9wmU5W7xpj	alternative metal
1272	2VYQTNDsvvKN9wmU5W7xpj	industrial
1273	2VYQTNDsvvKN9wmU5W7xpj	industrial metal
1274	2VYQTNDsvvKN9wmU5W7xpj	industrial rock
1275	2VYQTNDsvvKN9wmU5W7xpj	nu metal
1276	0JDkhL4rjiPNEp92jAgJnS	adult standards
1277	0JDkhL4rjiPNEp92jAgJnS	brill building pop
1278	0JDkhL4rjiPNEp92jAgJnS	bubblegum pop
1279	0JDkhL4rjiPNEp92jAgJnS	mellow gold
1280	0JDkhL4rjiPNEp92jAgJnS	rock-and-roll
1281	0JDkhL4rjiPNEp92jAgJnS	rockabilly
1282	5Qlt3zQ63Z99mNhuun0JAT	britpop
1283	5Qlt3zQ63Z99mNhuun0JAT	scottish new wave
1284	5Qlt3zQ63Z99mNhuun0JAT	solo wave
1285	26VFTg2z8YR0cCuwLzESi2	dance pop
1286	26VFTg2z8YR0cCuwLzESi2	electropop
1287	26VFTg2z8YR0cCuwLzESi2	etherpop
1288	26VFTg2z8YR0cCuwLzESi2	indie poptimism
1289	26VFTg2z8YR0cCuwLzESi2	pop
1290	4VpWzXVUAR2YyQuWQpNGAf	dark jazz
1291	4VpWzXVUAR2YyQuWQpNGAf	drone
1292	3HVdAiMNjYrQIKlOGxoGh5	alternative metal
1293	3HVdAiMNjYrQIKlOGxoGh5	hard rock
1294	3HVdAiMNjYrQIKlOGxoGh5	industrial rock
1295	3HVdAiMNjYrQIKlOGxoGh5	nu metal
1296	3HVdAiMNjYrQIKlOGxoGh5	rap rock
1297	3HVdAiMNjYrQIKlOGxoGh5	rock
1298	4KlYg0F5KG9QNDFKaeTNAy	dark wave
1299	4KlYg0F5KG9QNDFKaeTNAy	ebm
1300	4KlYg0F5KG9QNDFKaeTNAy	electro-industrial
1301	4KlYg0F5KG9QNDFKaeTNAy	futurepop
1302	4KlYg0F5KG9QNDFKaeTNAy	industrial metal
1303	4NgfOZCL9Ml67xzM0xzIvC	blues rock
1304	4NgfOZCL9Ml67xzM0xzIvC	classic rock
1305	4NgfOZCL9Ml67xzM0xzIvC	psychedelic rock
1306	4NgfOZCL9Ml67xzM0xzIvC	rock
1307	0ATg66209dS5nFsvobJlRt	conscious hip hop
1308	2xiIXseIJcq3nG7C8fHeBj	alternative metal
1309	2xiIXseIJcq3nG7C8fHeBj	canadian metal
1310	2xiIXseIJcq3nG7C8fHeBj	canadian rock
1311	2xiIXseIJcq3nG7C8fHeBj	nu metal
1312	2xiIXseIJcq3nG7C8fHeBj	post-grunge
1313	6liAMWkVf5LH7YR9yfFy1Y	dark pop
1314	6liAMWkVf5LH7YR9yfFy1Y	electronica
1315	6liAMWkVf5LH7YR9yfFy1Y	laboratorio
1316	6liAMWkVf5LH7YR9yfFy1Y	trip hop
1317	1NVCNKYdNcuh92vE4rSxpo	vegan straight edge
1318	6B5c4sch27tWHAGdarpPaW	alternative metal
1319	6B5c4sch27tWHAGdarpPaW	modern rock
1320	6B5c4sch27tWHAGdarpPaW	nu metal
1321	6B5c4sch27tWHAGdarpPaW	post-grunge
1322	6B5c4sch27tWHAGdarpPaW	south african rock
1323	05fG473iIaoy82BF1aGhL8	alternative metal
1324	05fG473iIaoy82BF1aGhL8	nu metal
1325	05fG473iIaoy82BF1aGhL8	rap metal
1326	5YGY8feqx7naU7z4HrwZM6	dance pop
1327	5YGY8feqx7naU7z4HrwZM6	pop
1328	5YGY8feqx7naU7z4HrwZM6	post-teen pop
1329	7aWpPjjgItUnXljFxYYKZI	alt z
1330	7aWpPjjgItUnXljFxYYKZI	dark pop
1331	7aWpPjjgItUnXljFxYYKZI	modern indie pop
1332	0cGUm45nv7Z6M6qdXYQGTX	dance pop
1333	0cGUm45nv7Z6M6qdXYQGTX	pop
1334	0cGUm45nv7Z6M6qdXYQGTX	post-teen pop
1335	0cGUm45nv7Z6M6qdXYQGTX	r&b
1336	0cGUm45nv7Z6M6qdXYQGTX	rap
1337	3PyJHH2wyfQK3WZrk9rpmP	dance pop
1338	3PyJHH2wyfQK3WZrk9rpmP	electropop
1339	3PyJHH2wyfQK3WZrk9rpmP	escape room
1340	3PyJHH2wyfQK3WZrk9rpmP	pop
1341	3LjhVl7GzYsza1biQjTpaN	alt z
1342	3LjhVl7GzYsza1biQjTpaN	dance pop
1343	3LjhVl7GzYsza1biQjTpaN	electropop
1344	3LjhVl7GzYsza1biQjTpaN	indie pop
1345	3LjhVl7GzYsza1biQjTpaN	indie poptimism
1346	3LjhVl7GzYsza1biQjTpaN	pop
1347	3LjhVl7GzYsza1biQjTpaN	post-teen pop
1348	5Lz5CnywFeg4Rs4l76OtG2	alt z
1349	5Lz5CnywFeg4Rs4l76OtG2	viral rap
1350	66CXWjxzNUsdJxJ2JdwvnR	dance pop
1351	66CXWjxzNUsdJxJ2JdwvnR	pop
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
7trx783SvnHhKkmgSSTIFJ	0.554	0.337	1	-10.189	1	0.0351	0.581	0	0.0871	0.216	89.961	4	343485
27AG99NmWMFLRoyZMMPNW2	0.342	0.613	7	-4.084	1	0.0311	0.705	0	0.14	0.267	145.84	4	266107
7l5j3FapCyr6HxUgoAynM2	0.576	0.535	9	-8.392	1	0.041	0.588	0.0106	0.31	0.196	139.939	4	280074
5VA4Ispp52EA1sOqzMz3Av	0.776	0.603	5	-5.696	1	0.0343	0.0728	6.25e-05	0.111	0.921	96.888	4	295920
7qHoVZ6076OGx18G6W5vQ9	0.753	0.18	7	-13.618	1	0.0566	0.975	0.00266	0.111	0.187	114.891	4	196453
4hv7GT5g9qNnrxlocsOSYt	0.554	0.56	4	-4.824	0	0.0415	0.142	0	0.104	0.0786	131.206	4	233707
4PFiLGx8jAzcAJxwPLUeZ9	0.483	0.275	0	-13.609	1	0.0418	0.232	0	0.125	0.31	138.063	3	240800
1ULovMYbbglXIn9TQzMsKz	0.219	0.827	5	-5.395	1	0.123	0.0477	0	0.135	0.121	131.7	4	186280
4isk4UYRcmslphcTq61xUg	0.372	0.641	9	-4.819	0	0.149	0.216	0	0.114	0.647	67.82	4	226360
5WoaF1B5XIEnWfmb5NZikf	0.674	0.506	6	-10.532	1	0.0434	0.173	0	0.0866	0.183	145.965	4	259333
7sf0tmuGZlHXUWpi9dQqcw	0.67	0.735	0	-6.712	1	0.0645	0.108	0.00042	0.251	0.498	112.52	4	315933
3Pu3IChaAoa5EjgUBv5F6x	0.644	0.799	4	-10.856	0	0.0598	0.0821	0.00154	0.055	0.889	108.381	4	246573
5p0bEz7DNsULez2X9yrNGa	0.79	0.737	8	-7.92	1	0.0284	0.0236	0.0149	0.114	0.693	119.001	4	168187
1dxXQuExRVu77xF1r5YtRF	0.518	0.757	6	-8.584	0	0.0555	0.000777	0.00931	0.115	0.189	129.901	4	130107
0wejso6CHHEEqvTD3f3gBz	0.544	0.369	10	-9.617	1	0.0319	0.527	0.000189	0.101	0.105	144.073	4	246080
23od4rorIdhvYeLL7YqP9n	0.641	0.507	9	-11.326	1	0.027	0.167	0.424	0.095	0.312	114.99	3	315427
2I3ZdIFXnRn1PSAdMC4w71	0.553	0.526	2	-11.51	1	0.0257	0.368	9.81e-05	0.288	0.582	83.99	4	218947
5eKfpH2dQ7FltCqb7LWEGJ	0.464	0.334	6	-12.916	1	0.0313	0.307	0.247	0.11	0.326	165.278	4	328933
7Cva2EgJougx6O6M5xgWAq	0.62	0.773	2	-8.324	1	0.0382	0.0741	0.000606	0.158	0.934	157.991	4	226320
7KR5uycb8gfQYRl1MTL8aB	0.47	0.696	2	-8.996	0	0.0347	0.00128	0.000168	0.098	0.263	156.916	4	264960
7xjbn0bhs7zx7E1s0lCqT3	0.619	0.578	7	-8.829	1	0.0738	0.0185	3.11e-05	0.139	0.556	144.986	5	245427
56KqaFSGTb7ifpt16t5Y1N	0.797	0.872	9	-6.727	0	0.0575	0.291	0	0.284	0.866	129.885	4	222427
3YZa4IzxK2UtEKTvdTgsi8	0.455	0.883	2	-9.159	1	0.0384	0.368	0	0.277	0.782	142.638	4	208413
4TIJ7zSBNejpoIPaWpWRKc	0.53	0.864	4	-4.948	0	0.061	0.000753	0.000459	0.354	0.484	166.312	4	288533
21YxK0klhpfLW8budkJaMF	0.383	0.97	9	-5.638	1	0.0435	0.0276	0	0.0942	0.62	101.603	4	313926
29iwiYD3KVWBKxe31nGjEL	0.56	0.941	10	-6.173	1	0.0849	0.255	0.0019	0.153	0.822	165.058	4	190693
5El6bpLd8nYPsvWgZLdHio	0.562	0.809	0	-6.791	1	0.0385	0.0276	0.23	0.11	0.451	174.527	4	268773
72dIN8F7D5ydB3auSqNi84	0.449	0.357	1	-8.48	1	0.0266	0.0605	0.483	0.105	0.178	66.979	4	419093
29Znt9AbEH9FSsw86zPAYT	0.433	0.67	7	-13.126	0	0.0396	0.0206	0.0096	0.208	0.497	156.99	4	295973
3EytfC22ikoXM921cJbejn	0.394	0.689	9	-6.648	1	0.0385	0.00119	0.0131	0.176	0.457	180.111	3	273067
4vKLfj7YuS2yRKAJ9Nn0Id	0.571	0.96	7	-5.498	1	0.0354	0.0137	0.00817	0.0591	0.802	162.297	4	240800
6eDwkS4IHADqk06ssrqfUX	0.719	0.444	7	-11.785	1	0.0952	0.2	0	0.0982	0.907	97.136	4	144360
0WQiDwKJclirSYG9v5tayI	0.523	0.769	4	-5.855	1	0.0269	0.04	0	0.136	0.876	136.162	4	244587
0vF9RAGwgYtfO1Aajwb7et	0.505	0.879	1	-6.078	1	0.0354	0.00011	0.49	0.579	0.338	112.021	3	275973
10fiZCExnOMqElSX952WZI	0.42	0.582	8	-7.53	1	0.0383	0.00112	0.117	0.0866	0.248	127.272	4	293920
14z3RzUHeZQgtpOlSYvmZD	0.471	0.758	7	-8.308	0	0.0401	0.0317	0.514	0.199	0.558	125.791	4	408827
1AR58rtcLziNnRHTCmCywd	0.537	0.784	9	-7.78	1	0.0425	0.00694	6.99e-05	0.298	0.395	78.053	4	211680
1e5XqFTNIrlgpXGjwPSykv	0.723	0.376	4	-13.622	1	0.0466	0.073	0.303	0.181	0.446	115.67	4	285545
3s5N94NsDYcOqgi7cSakv6	0.431	0.806	1	-6.852	0	0.0384	0.00318	0.45	0.124	0.171	127.854	4	266760
3wtMkvedoWMQ3XTKv7tqcZ	0.838	0.757	2	-5.399	1	0.0927	0.059	0.0119	0.0271	0.602	124.65	4	251333
4J6JARDGkdc1fqLEflP94Z	0.303	0.344	6	-11.919	0	0.0327	0.817	0.0512	0.118	0.164	154.572	3	278200
4ZTl5GUAmO49b2cf6jovqx	0.538	0.67	6	-8.548	1	0.0374	0.00391	0.0691	0.116	0.33	120.053	5	312413
4oB0d8H93GtllDkoHNuLIN	0.361	0.454	0	-8.494	1	0.0305	0.0931	0.00146	0.0737	0.298	124.899	4	234933
5avF5IwDg2v1QCxPvX9Fru	0.368	0.0212	5	-20.06	1	0.046	0.918	0.000509	0.111	0.197	144.828	3	252947
672N8DGGTOLCOgWe0koX5g	0.527	0.871	4	-8.708	1	0.0354	0.0229	0.155	0.419	0.107	120.722	4	188560
6Dq2LzijkY9WNPwBGDah4L	0.463	0.382	5	-11.682	1	0.0278	0.897	0.263	0.108	0.638	74.573	4	209160
3Cx9j78Z0NE6jYwBWvvV3P	0.925	0.229	4	-9.68	1	0.445	0.579	0.00578	0.116	0.168	104.273	4	140227
0VjIjW4GlUZAMYd2vXMi3b	0.514	0.73	1	-5.934	1	0.0598	0.00146	9.54e-05	0.0897	0.334	171.005	4	200040
1cKHdTo9u0ZymJdPGSh6nq	0.323	0.737	10	-4.008	1	0.0338	0.142	0.000162	0.163	0.155	113.26	4	241067
7MXVkk9YMctZqd1Srtv4MB	0.679	0.587	7	-7.015	1	0.276	0.141	6.35e-06	0.137	0.486	186.003	4	230453
09mEdoA6zrmBPgTEN5qXmN	0.461	0.593	1	-4.954	1	0.0356	0.17	0	0.307	0.175	134.17	3	228373
5QO79kh1waicV47BqGRL3g	0.68	0.826	0	-5.487	1	0.0309	0.0212	1.24e-05	0.543	0.644	118.051	4	215627
2LBqCSwhJGcFQeTHMVGwy3	0.586	0.525	1	-7.163	0	0.0615	0.111	0	0.134	0.508	133.629	4	260253
7fBv7CLKzipRk6EC6TWHOB	0.585	0.564	0	-7.063	0	0.0515	0.0671	0	0.135	0.137	113.003	4	242253
2vXKRlJBXyOcvZYTdNeckS	0.658	0.671	2	-12.21	1	0.0363	0.0933	0.000927	0.115	0.166	100.966	4	202093
5gDWsRxpJ2lZAffh5p7K0w	0.715	0.47	5	-12.638	0	0.0772	0.353	0.0923	0.104	0.426	89.965	4	111627
2p8IUWQDrpjuFltbdgLOag	0.664	0.572	5	-6.099	0	0.0305	0.0811	0.00604	0.121	0.143	108.959	4	361027
1wtOxkiel43cVs0Yux5Q4h	0.663	0.319	9	-13.481	1	0.0375	0.69	0.000993	0.117	0.193	109.957	4	256124
1Ist6PR2BZR3n2z2Y5R6S1	0.566	0.647	1	-6.815	0	0.0335	0.0477	0	0.121	0.22	111.96	4	264773
2nMeu6UenVvwUktBCpLMK9	0.324	0.416	11	-8.92	0	0.0368	0.262	3.69e-05	0.11	0.151	113.986	4	236053
0Oqc0kKFsQ6MhFOLBNZIGX	0.641	0.559	7	-11.132	0	0.0355	0.404	0.00402	0.0937	0.523	144.982	4	202193
1NZs6n6hl8UuMaX0UC0YTz	0.404	0.664	1	-6.698	1	0.0407	0.542	0.00402	0.11	0.0949	107.747	4	351640
5Y6nVaayzitvsD5F7nr3DV	0.527	0.591	6	-7.664	0	0.0396	0.194	0.0194	0.0907	0.461	123.167	4	256760
3lG6OtGDsYAOALxEmubQQm	0.467	0.119	2	-10.99	1	0.0401	0.969	1.4e-06	0.0973	0.156	70.499	4	272485
1KuVEZR4xuQVNr1KkanAV4	0.255	0.468	7	-6.43	0	0.0317	0.822	0.248	0.339	0.175	111.67	4	181960
2mdEsXPu8ZmkHRRtAdC09e	0.294	0.337	6	-10.614	0	0.036	0.814	0.414	0.14	0.135	91.781	5	300683
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
6GXbpne1EKdVlYhFazWFs4	0.807	0.63	9	-8.401	0	0.046	0.0589	0.000128	0.104	0.404	127.969	4	172863
3x8IsQzb1KhPPo6zNGzzL1	0.467	0.257	5	-10.123	1	0.0314	0.775	0	0.118	0.255	106.605	3	228000
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
3aLq93pLZHx25jcFhfbEee	0.398	0.176	2	-8.68	0	0.0311	0.743	0.00509	0.118	0.0691	139.941	4	233053
5j5RHCFkS5TFLbQRUJ65HH	0.482	0.449	9	-8.418	0	0.0335	0.715	0.0134	0.124	0.132	132.379	4	242760
7qcXUzPwoxSBFxjTbNrV0B	0.299	0.399	10	-12.176	1	0.0376	0.816	0.00117	0.147	0.302	158.253	3	233227
4G9aoDV0KAsAYqTEKY53BF	0.505	0.62	11	-8.635	1	0.0268	0.00154	0.281	0.093	0.255	149.965	4	360213
2i8fcnTT5iItxMNwa8mfr3	0.583	0.45	9	-9.873	1	0.0287	0.778	0.00399	0.139	0.492	95.923	4	148787
5P4zryS2epwU5j5fkmwO8Z	0.698	0.766	5	-5.718	1	0.0509	0.0376	0.0104	0.096	0.692	113.006	4	195748
5SvYRapjngsO2dYfBC9ZXV	0.262	0.708	2	-7.07	1	0.0398	0.000806	0.00875	0.115	0.199	171.132	3	325888
5S67wnJOMjuySVEu4ssCof	0.719	0.718	11	-5.482	1	0.0426	0.331	4.39e-05	0.107	0.91	113.965	4	223840
1fOc4Kf82a6J1C9gS5sE0d	0.373	0.469	0	-7.282	1	0.0415	0.00591	0.00887	0.0656	0.22	150.74	3	360829
7a5xvCgoD8qFEQmO8Jjvtf	0.715	0.6	5	-7.728	0	0.0264	0.0714	0.00165	0.0876	0.77	86.989	4	202492
0PbOwOT7vjiO0NiI8D31XH	0.749	0.659	4	-7.617	0	0.0278	0.139	0.000447	0.0716	0.93	91.199	4	183440
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
0hgEsoAu23ap8V5GFX9Y3i	0.752	0.544	9	-10.373	1	0.0314	0.343	0.0811	0.109	0.723	115.803	4	219267
1crbFuCkGL4kXnAGd63RXq	0.579	0.662	9	-6.885	1	0.0245	0.000625	3.89e-06	0.117	0.574	102.951	4	203733
0DoACS30GwIY6qaFjCMMUz	0.44	0.446	9	-9.928	1	0.031	0.39	0.569	0.179	0.201	127.372	4	475093
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
3V0nnQhqvbE3JmiDdnzQFQ	0.708	0.211	9	-9.603	0	0.0424	0.853	0	0.131	0.362	72.5	4	152280
24ntSW3QVJzR79lHAAOTaY	0.636	0.634	7	-10.01	1	0.0342	0.0364	0.147	0.0998	0.599	111.563	4	252812
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
4STCTQ1h0VuWfvDyhGOxkv	0.71	0.291	5	-14.132	0	0.0338	0.35	0	0.128	0.856	101.517	4	155560
16dz1n3ctolQbuZPtvHVqH	0.588	0.611	11	-9.088	1	0.0311	0.197	8.79e-05	0.0518	0.937	149.141	4	139493
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
6PGoSes0D9eUDeeAafB2As	0.8	0.585	10	-7.343	1	0.0924	0.264	0	0.153	0.779	126.058	4	213400
0fX4oNGBWO3dSGUZcVdVV2	0.79	0.67	1	-5.527	1	0.105	0.377	2.32e-06	0.119	0.408	139.956	4	195950
6IZvVAP7VPPnsGX6bvgkqg	0.665	0.535	4	-7.056	0	0.0572	0.0786	1.68e-05	0.154	0.37	138.842	4	275253
2g6tReTlM2Akp41g0HaeXN	0.775	0.736	1	-8.072	0	0.247	0.319	0.00116	0.127	0.362	100.988	4	239027
2HbKqm4o0w5wEeEFXm2sD4	0.716	0.531	7	-7.355	1	0.122	0.0703	0	0.224	0.344	71.994	4	386907
3iVcZ5G6tvkXZkZKlMpIUs	0.796	0.766	7	-5.974	1	0.238	0.0742	0	0.0827	0.558	110.034	4	219333
3QFInJAm9eyaho5vBzxInN	0.711	0.611	1	-5.453	1	0.33	0.00588	0	0.23	0.144	134.093	4	252262
6HZILIRieu8S0iqY8kIKhj	0.638	0.523	1	-6.664	1	0.357	0.00454	0	0.0842	0.422	139.913	4	185947
0P2vjYoUjjHBeYArlQtRmf	0.244	0.719	5	-5.675	1	0.031	0.000826	0.855	0.186	0.441	99.61	4	133703
60JTA6msKu6uFlpvK8Tynn	0.282	0.942	11	-3.058	1	0.0696	0.00136	0.00057	0.453	0.687	92.318	4	143253
1ZUTRq6PQhYfHJk3qeP7FR	0.476	0.564	9	-9.559	1	0.0282	0.296	0.00424	0.129	0.178	95.833	4	183427
3Gb1M4i5UlDauEnaLJF2HT	0.57	0.667	0	-8.108	1	0.0294	0.259	0.79	0.158	0.683	125.658	4	208907
3AIt9LB3C7Jz99OnvVjbyv	0.327	0.5	0	-9.585	1	0.0789	0.926	0.657	0.113	0.302	168.963	3	275781
4viHP6kRmImqmVGQjE8sks	0.216	0.744	6	-4.232	0	0.0318	0.00676	0.126	0.186	0.56	153.195	4	156183
20OiuevLsmNprmh6wZKljU	0.43	0.678	10	-7.776	1	0.037	0.127	0.147	0.464	0.559	143.41	4	165067
2kkJY0ENKaDX5Np8fjyYLM	0.282	0.856	9	-5.19	1	0.0375	8.3e-05	0.44	0.056	0.858	170.607	4	167892
1uSkFxzLIEtObyJtROqbnl	0.506	0.779	0	-4.634	1	0.0365	0.0227	0.0134	0.183	0.384	97.531	4	199493
0J0UZpA2Ivp4qaXe3QzCrT	0.319	0.61	5	-6.863	1	0.0314	0.195	0.0222	0.38	0.352	139.99	4	200825
0xFiDbmCNEcs8TE9hToHpa	0.715	0.858	6	-8.785	0	0.887	0.934	0.000582	0.164	0.698	80.534	4	122857
0V6QNE31BWyMuiKlvDRnE9	0.623	0.819	7	-6.377	1	0.222	0.121	0.141	0.118	0.705	79.435	4	254049
41t7RkFBjaEFoGvr29QhYL	0.593	0.565	1	-9.441	1	0.335	0.355	0.0122	0.229	0.368	87.994	4	242067
7fjLBPTsQrbkV2WRedi2bw	0.683	0.86	7	-7.317	1	0.31	0.0117	0.000379	0.356	0.298	143.311	4	175357
1pHKJodnA1bOXyWj981Tmx	0.717	0.821	1	-7.183	0	0.195	0.00478	0.625	0.0801	0.54	96.984	4	163058
46lQe6895zxB3HRP6YPbnl	0.66	0.666	7	-7.897	1	0.455	0.384	1.37e-06	0.163	0.601	85.567	4	185493
08rUqqyHYLORJvK6pqiUOM	0.461	0.736	0	-5.934	1	0.197	0.00203	8.3e-06	0.0804	0.313	179.373	4	215265
36iXvmiL3tsJX0QfhVZkhb	0.453	0.552	1	-7.519	1	0.219	0.146	0	0.683	0.807	168.576	4	133170
4eJpFVLqB3SVzciiTdK82L	0.434	0.736	2	-6.709	1	0.281	0.414	0	0.863	0.388	142.061	4	184032
7EGZTx7rDYoSzUtqsETyxz	0.627	0.478	2	-11.803	0	0.344	0.768	0.00262	0.0754	0.353	164.035	1	43803
1WBSFlSLyOZnSa8fj7a5yC	0.434	0.531	1	-9.553	1	0.0425	0.781	0.0134	0.135	0.641	131.199	4	230200
7H0UxIN751StFi2tznmHlg	0.621	0.569	2	-7.318	0	0.0297	0.928	0.0361	0.115	0.402	110.022	4	257480
5loVmc3MmtYGsTw12eDgcU	0.211	0.708	8	-6.008	1	0.0507	0.798	0.00402	0.0742	0.476	179.794	3	345093
2bxQP85JNU11CQV4KXCnau	0.728	0.679	11	-6.764	1	0.0271	0.296	0.00733	0.11	0.953	131.715	4	254387
1xRzpBiy7nmgP0oVmnseNF	0.697	0.729	11	-6.402	1	0.0675	0.488	0.637	0.0673	0.81	94.044	4	217400
1dD6UAnqCJotTyU1bhCnDQ	0.619	0.874	0	-7.014	1	0.0353	0.391	0.363	0.466	0.961	89.582	4	170640
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
2LMkwUfqC6S6s6qDVlEuzV	0.501	0.0958	0	-15.605	1	0.0433	0.77	0	0.298	0.204	108.741	4	248808
7DfFc7a6Rwfi3YQMRbDMau	0.721	0.339	0	-11.195	1	0.0532	0.409	0.00153	0.0973	0.2	129.83	4	200747
6Nle9hKrkL1wQpwNfEkxjh	0.776	0.503	0	-5.732	0	0.237	0.874	0	0.112	0.473	110.134	4	210285
5GUYJTQap5F3RDQiCOJhrS	0.581	0.21	8	-10.426	1	0.0321	0.768	0	0.369	0.452	80.099	4	249668
3vvnpqqg7Jbi2c2aOn6GHt	0.663	0.592	5	-7.533	0	0.127	0.0402	9.38e-05	0.352	0.786	159.999	4	207000
7zJHwxabKK5TqW7xrKEC73	0.9	0.597	4	-7.23	1	0.0769	0.707	1.46e-05	0.132	0.588	87.973	4	165000
4s8uPDOuyjoO6Rmn7Armjc	0.863	0.419	7	-7.069	1	0.0813	0.816	0	0.151	0.8	115.037	4	187826
1dc7H76rkWGymUigYxQ4hp	0.656	0.569	11	-7.921	0	0.202	0.391	5.73e-06	0.11	0.45	109.975	4	231273
1G9pU58ocxSyaBTOfDE15F	0.509	0.424	7	-7.209	0	0.127	0.752	0	0.031	0.534	97.447	4	156632
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
6Vkn98iI3sfATzdacZ307z	0.435	0.886	11	-4.749	1	0.0803	0.0061	0.00482	0.0993	0.44	165.007	4	216187
7pmahAnqScI4MjbQiZZqei	0.461	0.91	1	-7.198	1	0.0359	8.58e-05	0.0471	0.0863	0.615	155.697	4	214907
0W6QtgkxPNJ7simo1UcBIr	0.397	0.942	1	-2.53	1	0.0869	0.000227	0.24	0.14	0.356	158.993	4	232307
54s0TZeheZOxoVFxxmB3wA	0.408	0.891	0	-7.094	1	0.0505	3.51e-05	0.000517	0.11	0.196	167.996	4	248543
6Yg3J1OkP45uNcboiUg2Rw	0.371	0.636	5	-6.303	1	0.0301	7.59e-05	0.00757	0.349	0.193	155.466	4	224560
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
2UALJFCBhcFuknbnbOrN7E	0.236	0.273	2	-13.481	1	0.0315	0.471	0.456	0.162	0.0391	147.39	4	407489
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
3Xt9sp779WQWqLYPVbLU0q	0.553	0.556	5	-9.98	1	0.0421	0.134	0.0447	0.123	0.763	172.869	4	137760
6RyC5X1YGBBvNP0vKYYuvI	0.753	0.462	9	-6.677	1	0.0313	0.136	1.03e-06	0.111	0.825	131.11	4	145340
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
3gXMNdXzS4KkS8DQJbXxdN	0.454	0.454	0	-8.516	1	0.0292	0.573	0	0.946	0.272	106.778	4	323741
5T1mYdPKZjnpD8n6HLt2W5	0.88	0.344	7	-15.19	1	0.0584	0.257	0.0376	0.0283	0.89	117.644	4	199240
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
2wiV5iKq5F5A0KUee4OrlK	0.325	0.322	8	-16.613	1	0.03	0.887	0.214	0.118	0.724	182.073	3	329361
5YixskhSGNwmqjUrG0DTEY	0.584	0.703	7	-7.236	0	0.0837	0.0211	1.64e-06	0.535	0.65	94.01	4	106102
4sbsJMnW6k7TuLhVmodlFx	0.561	0.896	11	-5.005	0	0.0346	0.000255	0.376	0.373	0.447	109.606	4	214133
46LX0sSwIU4GFLcj23ZfMA	0.565	0.726	0	-6.715	1	0.0548	0.00181	3.06e-06	0.103	0.715	178.078	4	198627
0FqkI0vR3Z28v6GSudbKXj	0.651	0.759	11	-9.689	1	0.0356	0.0148	0.0108	0.165	0.929	143.04	4	112448
4chSRXrdadYm2ujaCyP3Cf	0.531	0.619	1	-7.285	1	0.074	0.00368	1.87e-05	0.0912	0.566	149.007	4	185560
3pihS07XVQEavaS9n7kObt	0.67	0.528	8	-9.372	0	0.0323	0.0565	0.00117	0.102	0.628	87.965	4	278311
6Ucrht7JfguIXoa4hF9Leo	0.369	0.923	0	-6.591	1	0.0445	4.1e-06	0.878	0.393	0.64	168.003	4	232947
6DJdXo8oT7kTA9mYpvpJRk	0.751	0.528	5	-10.874	0	0.0495	0.5	0.799	0.125	0.342	117.969	4	232760
51rPRW8NjxZoWPPjnRGzHw	0.704	0.487	9	-6.407	0	0.0604	0.669	8.64e-05	0.111	0.313	121.726	4	301893
0bkTdkWwGk3OGFX0afD3Wj	0.747	0.494	3	-7.957	0	0.141	0.393	0	0.0982	0.624	76.006	4	228453
6zWU7YALeEDMcPGhKKZJhV	0.567	0.593	6	-7.404	0	0.288	0.117	1.32e-06	0.248	0.358	88.545	4	194157
1xTYy3K3hiTcoZfoD7culn	0.884	0.658	0	-5.94	1	0.134	0.19	0.00164	0.103	0.502	112.978	4	196495
6T3Ebo7EOh8cUOyE4OhFpp	0.629	0.579	9	-6.543	0	0.107	0.811	0.00366	0.0813	0.363	135.86	4	204706
5z2XleKRbvbiytGucM5v2D	0.589	0.431	9	-10.096	0	0.0475	0.554	0.0317	0.0878	0.159	134.688	4	167143
5tkR9JkBj3Ueeo8W4k8IZD	0.818	0.461	6	-6.475	0	0.292	0.598	0.000135	0.108	0.532	88.006	4	188053
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
2VZDujZxmIDhW1G2sPsKqQ	0.705	0.426	3	-9.078	0	0.039	0.0157	0.00491	0.113	0.241	123.967	4	220707
0C42kuXV8DNlXzJTIUNFFE	0.528	0.478	6	-9.857	1	0.0592	0.171	6.08e-05	0.111	0.343	80.003	4	120667
2JbNx2R6LaF2dZ2CYA1kDV	0.69	0.46	5	-9.147	0	0.183	0.0355	9.89e-05	0.115	0.243	90.114	3	128575
2XvpMAHHUVuKodlo7BKqpv	0.654	0.155	5	-15.098	1	0.0372	0.962	0.000904	0.115	0.247	75.742	4	219268
3kpRgTtMnArQ5Gay0JxElf	0.55	0.373	9	-8.772	1	0.0314	0.391	0.0551	0.0935	0.33	121.941	3	293213
0AwLsPPWgYkib7HCrayqwy	0.44	0.416	11	-7.222	1	0.0322	0.19	0.723	0.11	0.412	101.93	3	256920
7BT2BsgZZffGmiENrzxCzy	0.738	0.334	9	-14.653	1	0.0505	0.825	0.189	0.0845	0.489	78.026	4	364333
14lFMWrwM30Q8FiijmxWVz	0.649	0.261	9	-10.247	0	0.0298	0.494	0.0573	0.149	0.386	75.679	4	187227
5Y8IMaCAPl996kjC4uo9Tx	0.384	0.441	9	-10.411	1	0.029	0.254	0.276	0.0725	0.22	81.493	4	274773
2rsswxxShjBqoEj7dbr4Sb	0.749	0.46	4	-7.641	0	0.0372	0.117	0.00237	0.106	0.43	91.99	3	261187
3rly0zvX18j9J00wh5bs5S	0.634	0.308	7	-15.771	1	0.0371	0.0605	0.822	0.108	0.131	111.973	3	266751
0s5VgEWaorOXCP0XdgTGXM	0.507	0.333	9	-10.079	0	0.034	0.563	0.515	0.311	0.334	103.541	4	249227
4lzPv33jwjnTJ7b2LMAmpG	0.614	0.508	11	-10.445	1	0.0675	0.824	4.53e-05	0.112	0.624	85.485	4	145453
2NF8A7C6tICScdRaZ0BrEe	0.837	0.793	11	-5.048	0	0.0567	0.0261	9.04e-05	0.0743	0.87	124.988	4	151011
5qVVPptGHVCPMci6NCbLCq	0.689	0.54	9	-9.878	1	0.0478	0.317	0.0122	0.129	0.474	120.083	4	249773
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
7uIaBPSTlBaAQr1asfZ3B4	0.181	0.359	9	-12.46	1	0.0498	0.921	4.9e-06	0.25	0.367	80.954	4	144907
4UcxTnA6C5vCW79PIZ38Vx	0.663	0.638	2	-8.765	1	0.0592	0.691	0	0.302	0.869	119.476	4	146493
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
3HUCTp20rxqMnCtdyU7JgU	0.634	0.433	2	-8.018	1	0.0256	0.864	0.00858	0.102	0.268	101.791	4	191671
5wDkzGnw8nsQUbgMryKWBl	0.501	0.458	1	-10.32	1	0.0944	0.229	2.67e-06	0.19	0.185	125.637	4	363143
5a2yG11mx2vNBcOo6UMIel	0.519	0.236	8	-15.29	0	0.0453	0.879	0.00912	0.0926	0.243	110.013	4	191295
2UODQhPzz51lssoMPOlfy5	0.494	0.836	7	-4.327	1	0.0531	0.0249	0	0.457	0.627	142.56	4	256560
721tATaNQPPGSuC3dYEI3h	0.331	0.559	2	-8.263	1	0.0316	0.224	0	0.297	0.236	115.117	4	313600
0IwXp8V7wgFCIthRh2z8Ot	0.588	0.613	2	-9.656	1	0.0396	0.369	0.0422	0.107	0.185	119.536	4	258333
7IxWqdG1zG0gaAFYq2q0Iy	0.487	0.81	4	-4.067	0	0.0357	0.000754	0	0.352	0.702	123.493	4	221853
221bl0jrSfJ1LMgUw36zRJ	0.531	0.765	0	-7.844	1	0.0349	0.0068	0.000313	0.209	0.452	135.457	4	227907
2GRbFpacyEnbA3Mk7KcfM4	0.411	0.754	7	-6.515	1	0.0294	0.101	2.83e-06	0.141	0.602	189.9	4	269147
5eltlS3CM4xGNkL6VhpTDm	0.391	0.581	9	-5.481	0	0.0901	0.25	0	0.0861	0.459	83.587	4	525933
1bvERTuePaoVjQ3NpJq9aH	0.593	0.365	9	-6.407	1	0.0252	0.511	0	0.139	0.159	98.345	4	237547
38psZM2gA6UWA7rqqgOjGL	0.605	0.789	4	-7.035	0	0.0338	0.00219	0.0178	0.127	0.434	136.041	4	243800
7m3fyN4mYVxLeYHTgWJiPB	0.481	0.846	2	-3.946	1	0.0422	0.00372	7.81e-06	0.0658	0.536	154.149	4	228360
2hnMS47jN0etwvFPzYk11f	0.682	0.765	1	-5.021	0	0.0395	0.0268	3.42e-05	0.188	0.567	90.807	4	182747
3B4q6KbHbGV51HO3GznBFF	0.804	0.696	7	-7.47	1	0.0899	0.00877	0.000985	0.314	0.657	95.721	4	170907
4eamJr2k9YDH8j58RSTmSc	0.708	0.757	7	-5.121	1	0.0791	0.0362	0	0.17	0.552	80.976	4	253840
2PdIo7ewQPuAsP99LVg9uy	0.69	0.681	9	-5.653	1	0.0379	0.0623	0	0.137	0.911	75.034	4	136147
4paJ10JPNCyOaLtz2cY928	0.801	0.548	11	-5.482	0	0.0516	0.0854	0.000232	0.387	0.627	92.059	4	188086
0Jur3mZsQba3vqSpcmsOPm	0.761	0.687	7	-6.185	1	0.131	0.00469	0.00532	0.245	0.316	95.089	4	173427
2JKlf0IYz5oWsT3OCLyjpO	0.753	0.484	9	-7.519	1	0.258	0.0149	0	0.135	0.597	79.668	4	211560
0vtJ9Dq53hfXE3KyP1yPni	0.688	0.489	0	-7.848	1	0.0378	0.00053	0.00292	0.143	0.364	94.27	4	183000
3kGt9uxpJzKTxwp2uJHrU5	0.638	0.864	2	-4.255	0	0.0358	0.00253	0	0.178	0.811	102.289	4	156160
7FLQo89iaS5gf2hnIEW7P9	0.64	0.695	4	-8.196	0	0.202	0.0113	2.75e-05	0.36	0.787	102.288	4	217653
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
0Z57YWES04xGh3AImDz6Qr	0.417	0.686	7	-6.484	1	0.0373	0.0955	0.0287	0.0989	0.625	204.113	4	189293
77RNVzAVwqWiZrZuWqMV2i	0.534	0.641	0	-9.172	1	0.0276	0.523	0.0428	0.0904	0.505	107.081	4	234160
3O30ywyRk6EKT68sBvVqOP	0.578	0.808	9	-4.131	1	0.0284	0.0608	0.144	0.0388	0.597	93.979	4	190613
7qqrGV5WpQnMKqVTsDZd9J	0.289	0.324	5	-9.866	1	0.0301	0.851	0.00368	0.112	0.244	77.94	4	301480
3wfF0Nw234zHY1vdIWIc2g	0.446	0.807	0	-5.222	1	0.041	0.215	0	0.226	0.8	188.094	4	170827
7ydJaSdC8Au68eYgspNznY	0.506	0.47	2	-8.787	1	0.0284	0.737	0.608	0.125	0.477	104.967	4	300240
2gUwnJ5cpl40TSlqmjfqAC	0.584	0.87	10	-4.703	1	0.0351	0.114	5.21e-06	0.108	0.852	164.992	4	215147
0rGB4l2BHJhL4C1s8w6jZG	0.426	0.453	2	-8.574	1	0.027	0.389	0.0971	0.123	0.175	87.787	4	143240
5AHYDez7G9xD3CIReL88yU	0.565	0.461	4	-8.337	1	0.0294	0.737	0	0.0943	0.318	104.771	4	219260
5jLMFDMUkGpzIgPF2sxWkB	0.189	0.726	7	-6.191	0	0.0511	0.303	0.00352	0.0807	0.322	210.495	3	278773
4uQ7wYsuL0DryknoDc11Hk	0.925	0.549	7	-6.572	1	0.0656	0.396	0.000154	0.11	0.0904	100.014	4	183160
0lqAn1YfFVQ3SdoF7tRZO2	0.593	0.947	4	-6.206	0	0.631	0.888	0	0.823	0.682	157.85	4	67210
3Vj8RQkFwOmDvUrwu6MtQZ	0.703	0.573	0	-9.032	1	0.0724	0.565	3.13e-06	0.0987	0.491	147.038	4	143830
5OFEJMirg4NPz7G1zgXDYu	0.859	0.423	1	-10.698	0	0.283	0.543	0	0.104	0.563	125.89	4	138410
1jhdCONafFj1hzJsPvZx27	0.699	0.782	2	-5.538	1	0.124	0.00664	0.000517	0.182	0.227	161.721	4	227873
7uX3gufAoBVqKVoD3dBLLD	0.776	0.379	9	-9.351	0	0.331	0.213	0.00175	0.0969	0.346	82.531	4	179016
7pBsquIkbED6W6uSQJGbkn	0.604	0.736	10	-5.596	0	0.0555	0.00608	0.109	0.11	0.345	118.012	4	211360
7bUcBztfGqO7cSI2gMZeCI	0.706	0.775	1	-6.819	1	0.335	0.152	3.32e-05	0.416	0.847	127.929	4	180893
6eL1ncVDtQHgSm3E288TS7	0.898	0.547	3	-5.707	0	0.313	0.484	1.04e-05	0.37	0.763	100.01	4	198133
7jN5Abri3a1crehbnlWa1F	0.743	0.601	4	-6.684	0	0.181	0.272	9.65e-05	0.496	0.284	89.97	4	226006
6vECYJHxYmm3Ydt3fF01pE	0.885	0.581	11	-8.813	1	0.0378	0.427	0.000204	0.0759	0.728	114.016	4	313684
3GXgrEjBjonrQrPEEi13yU	0.728	0.82	11	-6.198	0	0.031	0.00898	0.000216	0.176	0.652	124.001	4	164577
7HNpXPaTcX5CoNBjTAEWBr	0.688	0.697	9	-7.955	1	0.0485	0.753	6.21e-05	0.109	0.46	114.03	4	241053
5mpLcXEsk3jjzLFGuNKk5I	0.839	0.84	11	-8.721	1	0.0474	0.389	0.0319	0.114	0.904	117.98	4	262000
35iR1qzexmbcUSgA01S4gI	0.79	0.744	9	-7.033	0	0.0294	0.287	0.000934	0.0909	0.798	123.984	4	174348
2zR85boqjMOKPygjdDbGbC	0.74	0.503	1	-11.347	1	0.0522	0.0898	0.0665	0.118	0.548	118.026	4	250521
0RtXNY1EREFz5sO94TIHM9	0.96	0.652	6	-6.941	1	0.0443	0.365	0.0042	0.0951	0.887	123.974	4	155173
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
5thEuYF5DJK0KPk3eFUVXe	0.413	0.154	0	-15.49	1	0.0484	0.933	4.79e-06	0.126	0.233	112.046	4	301105
1b3UY0WcVkxQvPDGo7T36s	0.485	0.75	10	-6.564	1	0.0289	0.0278	0	0.385	0.802	91.795	4	234800
6lzjz4VBXtloniJwMXWicE	0.586	0.33	7	-11.789	1	0.0321	0.927	4.88e-06	0.105	0.355	104.807	4	306400
1FvDJ9KGxcqwv1utyPL3JZ	0.611	0.846	11	-5.9	1	0.0436	0.00509	0	0.0784	0.751	103.912	4	162920
1xaTREM89RbIxkcjlpf4Uw	0.609	0.759	6	-4.862	1	0.0276	0.028	0	0.183	0.774	114.045	4	215760
6LUGvXEAK8WxIBYK43uoTb	0.626	0.488	2	-7.805	1	0.0253	0.0102	0.000188	0.141	0.404	104.13	3	186627
1YrnDTqvcnUKxAIeXyaEmU	0.398	0.93	11	-6.76	1	0.0615	0.000854	0.121	0.0874	0.725	190.818	4	408173
6BrMEbPSSj55nQhkgf6DnE	0.241	0.468	2	-9.579	1	0.0272	0.534	0	0.161	0.451	91.581	3	112707
69Kzq3FMkDwiSFBQzRckFD	0.696	0.628	2	-8.407	1	0.0274	0.00102	0.428	0.272	0.701	100.038	4	221533
2OErSh4oVVAUll0vHxdr6p	0.401	0.901	1	-5.011	0	0.041	0.0704	0	0.538	0.839	134.799	4	193320
3M2bD9SMYnJIPdrTKUnBd3	0.407	0.424	0	-10.583	1	0.0318	0.0847	0	0.234	0.404	113.311	3	349187
64D3dzWyj0GpQT1AHx4kbK	0.53	0.861	7	-4.67	1	0.0372	0.0175	0.0177	0.0857	0.844	130.476	4	140507
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
7c60MUlDMw6ZI1Ft4LxLBY	0.672	0.525	4	-13.177	0	0.0485	0.381	2.21e-06	0.115	0.9	90.319	4	227160
1wHNSciCOxqs4dft2EWrIC	0.715	0.715	11	-6.344	1	0.162	0.37	1.03e-05	0.318	0.844	135.146	4	170388
3vdevXZtf1T08rQubQcwY4	0.674	0.612	11	-8.034	0	0.0918	0.482	6.63e-06	0.0663	0.943	82.908	4	247947
1uJKTRjp5WxzrWwfElOZDp	0.639	0.577	6	-9.969	1	0.103	0.412	6.38e-05	0.076	0.832	124.688	4	235160
2gVRDshVuLTKslwTequSO1	0.497	0.948	7	-6.712	1	0.115	0.0763	1.24e-05	0.879	0.743	87.595	4	286680
632pAox1NgFyiubpHzps90	0.584	0.538	4	-10.021	1	0.215	0.686	0	0.0969	0.925	122.043	5	256667
42zb6MpkTpMhuV3C3OeFXK	0.802	0.849	8	-6.753	1	0.092	0.246	0	0.135	0.936	104.816	4	234560
35SwFntBxtKFFOFKurhesr	0.556	0.796	8	-9.787	0	0.0672	0.772	0	0.0603	0.884	90.49	4	228507
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
5Wt2UAS92w2ZyDqX2dOEBg	0.903	0.785	8	-6.285	0	0.309	0.0192	3.83e-06	0.177	0.965	94.211	4	259107
5UcJZVvqgX9dnjq161bGQ4	0.63	0.77	7	-6.655	1	0.386	0.215	0	0.205	0.829	91.713	4	201129
0lRhj7HyP2KObeyFPUOPRA	0.349	0.892	6	-3.011	1	0.351	0.112	0	0.212	0.849	172.639	4	183688
34rwJDeFgvZXd9KtiBkQKI	0.557	0.845	10	-4.373	0	0.344	0.496	0	0.115	0.867	93.374	4	159155
04jxZHjzLOknmIJSgjefyZ	0.486	0.928	8	-4.13	0	0.363	0.467	0	0.116	0.57	90.036	4	207673
3TPvrMAd1hbPRXuHCRX0Pl	0.446	0.764	2	-6.479	1	0.181	0.057	0	0.141	0.576	152.604	4	316944
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
6PuoZT4kgw5DrUEdnQ6e01	0.886	0.371	5	-10.542	1	0.0465	0.349	0.00138	0.0985	0.928	115.026	4	219261
0aPX1AXz8Tp51Nak6B04ij	0.775	0.721	11	-5.446	1	0.0288	0.369	0.00513	0.0517	0.974	90.986	4	167813
7rNnqDOzc3Qoom2VhIyuxx	0.802	0.325	10	-9.327	1	0.0467	0.165	0.163	0.156	0.649	110.996	4	246200
0tN5MAdqjjhYS4HE2JnfzJ	0.786	0.384	5	-8.655	1	0.0654	0.072	0.00114	0.0484	0.771	137.943	4	211147
3YSefJ4OGYCIHNVowuSx7O	0.699	0.487	5	-7.747	1	0.0389	0.16	0.000191	0.0859	0.625	115.769	4	171714
7c0AtG5G1kbVUrBYxREGXv	0.731	0.447	6	-11.585	1	0.0466	0.234	0.218	0.182	0.34	106.006	4	235738
1wDBglPaH5ehDDNiNWCHp0	0.76	0.755	7	-5.714	1	0.05	0.256	0.00765	0.0817	0.55	104.655	4	231573
7dW6aiHZG0A8xApW0Xg40G	0.589	0.598	5	-7.103	0	0.0613	0.479	0.000237	0.117	0.726	130.059	4	167067
0CNJyQiyzYxbsuMGTQlria	0.759	0.668	11	-5.235	1	0.0365	0.294	0.000824	0.0804	0.716	117.884	4	250000
0m9TcZ6H1tdRQ2zpdZybaZ	0.801	0.414	11	-8.805	1	0.0559	0.245	0.00315	0.105	0.536	104.013	4	180577
48EjSdYh8wz2gBxxqzrsLe	0.719	0.615	6	-5.972	1	0.045	0.408	0.000147	0.235	0.465	96.988	4	250973
6IAgarq2wDeYzpsY2Kx0Hw	0.827	0.553	1	-5.296	1	0.032	0.0227	1.52e-05	0.176	0.0631	110.015	4	236120
7yvdp8dqmxExSJwT2fn6Xq	0.863	0.625	8	-6.323	1	0.313	0.101	4.13e-06	0.166	0.456	83.98	4	111227
6GCIYIWUBSLontW6divqsw	0.823	0.558	9	-7.119	1	0.0278	0.397	2.03e-05	0.0821	0.674	155.974	4	175707
22DHmfJa31hKpc2Lg0gVBV	0.827	0.477	0	-5.025	1	0.254	0.101	4.15e-05	0.0908	0.599	119.807	4	235493
0deHsjyrgcKGMZzIuvawq3	0.661	0.368	5	-7.342	0	0.0727	0.827	0.249	0.111	0.211	112.891	4	148253
688iitLNSV6Iik1QESqvth	0.507	0.418	1	-8.659	0	0.167	0.651	7.36e-06	0.126	0.24	84.902	4	101813
2TyCAfhwu5tRqFW8VnGMIL	0.823	0.411	0	-7.061	1	0.0557	0.409	0.00135	0.649	0.397	90.997	4	257547
4o8Rk1YzdkTxsSEXd3YhAK	0.8	0.526	10	-6.403	0	0.0326	0.326	0.0416	0.153	0.454	120	4	185960
5hR0wTnydz6lmErOV4c0sp	0.736	0.798	0	-6.174	1	0.127	0.0579	0.0681	0.161	0.464	113.996	4	260400
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
39shmbIHICJ2Wxnk1fPSdz	0.743	0.836	2	-6.465	1	0.116	0.0804	0	0.384	0.82	113.375	4	188987
5jzma6gCzYtKB1DbEwFZKH	0.651	0.801	0	-7.34	1	0.0514	0.123	0	0.0825	0.776	133.769	4	200480
6ITuEsxEy2qPhqMowdDAeI	0.762	0.722	2	-8.712	1	0.0428	0.0922	0.000368	0.132	0.966	122.769	4	194667
5dAxeuDkIkpa6wZpMOuG9i	0.526	0.9	2	-6.815	1	0.0545	0.00539	4.12e-05	0.14	0.883	151.279	4	163240
0jnFDxgNhS156vu6roUVco	0.74	0.613	7	-9.487	1	0.0856	0.00494	0.118	0.095	0.676	96.491	4	192440
72boGlgSwUK01n44O2tOCv	0.608	0.634	4	-11.24	1	0.0727	0.0568	0.00615	0.116	0.84	147.515	4	226947
7FYkZkF9fog6WS818wJnhl	0.52	0.906	9	-6.534	1	0.0601	0.0196	7.99e-05	0.0925	0.868	151.608	4	128267
6IMlcKjsIM3l3yXWykTa3y	0.721	0.488	4	-10.294	0	0.067	0.0289	0.038	0.18	0.884	152.287	4	363373
2ax1vei61BzRGsEn6ckEdL	0.802	0.596	7	-11.663	1	0.06	0.0465	1.17e-05	0.0695	0.702	90.275	4	330507
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
34iOH7LY3vme5rQxsVILZ4	0.527	0.923	2	-7.458	1	0.0379	0.000541	0.765	0.127	0.899	146.924	4	208453
5fbQCQt91LsVgXusFS0CCD	0.32	0.798	10	-7.078	0	0.124	0.00033	0.692	0.176	0.74	84.696	4	209040
4ZuC5MfGjRQs3pZtPxqMYP	0.433	0.756	9	-7.855	1	0.0565	0.000997	0.761	0.124	0.117	145.443	4	233720
0rcLhYRihks3t4lFPtHhQV	0.485	0.846	11	-7.63	0	0.0528	0.0157	0.0287	0.0766	0.743	144.246	4	237013
1Bq65xKgu0kjSUMUlfWyPl	0.496	0.849	7	-6.512	1	0.0401	0.0202	0.573	0.102	0.65	153.724	4	218440
5EabbLQZbdhCqG6aK9PFLU	0.387	0.525	2	-9.634	1	0.035	0.00236	0.769	0.251	0.258	78.339	4	291706
58vvxoXqQicDlUFJHfOuEs	0.561	0.7	0	-8.82	1	0.0798	0.356	2.96e-05	0.0723	0.607	82.857	4	144662
3iMq9V0Ece9ubjWAYVcMwj	0.478	0.783	9	-7.346	1	0.0419	0.000126	0.582	0.225	0.746	156.337	4	137653
7k42ztYdHyKWrKrENxwjkV	0.609	0.399	6	-10.79	1	0.03	0.242	0.406	0.109	0.469	119.937	4	252093
4lmYkAt0bgbNW2BhMXLWpa	0.565	0.773	2	-9.214	1	0.0745	0.283	0.121	0.0888	0.842	167.735	4	169594
2Y3x5VcEAxLNmVHxQOE0jB	0.778	0.399	1	-8.984	1	0.0858	0.0751	0.835	0.103	0.321	137.305	4	67720
5nqd51nD2UACz5JQ83v878	0.382	0.507	2	-8.179	1	0.0323	0.787	0.0124	0.235	0.494	135.787	4	143120
1bZH8L8V2m454tdcSPEIl7	0.628	0.585	3	-8.036	0	0.0421	0.147	0.927	0.0465	0.618	100.95	4	162267
1xDeDsNoBNyBidVQKPnWXE	0.587	0.732	5	-8.097	1	0.0317	0.055	0.924	0.247	0.747	96.848	4	202240
18OzYEBhFuusiRbvkhf6Zl	0.615	0.76	10	-8.393	0	0.0317	0.0186	0.053	0.0825	0.902	90.847	4	183213
4evkhyjgx4eLgyvujGWSTc	0.611	0.785	2	-7.174	1	0.0301	0.0866	0.83	0.129	0.656	103.688	4	228920
5aqR0sE4AVaycHGVVjoZmx	0.393	0.892	2	-4.685	0	0.0514	0.00187	0.89	0.0926	0.704	190.157	4	157613
4EGhtRnsa6DoGImFOzVzLd	0.692	0.661	10	-7.157	1	0.0606	0.0544	0.657	0.113	0.698	117.472	4	233000
74gBEukHVsGBlEdYWiwLWK	0.493	0.573	5	-8.564	1	0.0287	0.116	0.722	0.139	0.702	158.262	4	177013
4rNOFDkStRndjL08iV8f4D	0.59	0.733	9	-7.784	0	0.051	0.0163	0.951	0.0693	0.846	168.1	4	211573
2Gzg7PlsNS1XunWQFJBVt9	0.739	0.18	0	-11.439	1	0.0715	0.494	0	0.159	0.229	93.136	4	72747
0vmxiz1Zx3OP8C5CjfhIXK	0.314	0.43	10	-9.825	1	0.0296	0.466	3.59e-06	0.0997	0.152	176.944	3	180651
4nIVHPwEXljxt1D8hxEXgO	0.61	0.671	9	-4.688	0	0.0406	0.493	0	0.0928	0.542	120.424	4	150133
5yqEdgJawICKIDA5cQZBOn	0.685	0.509	9	-6.422	0	0.0571	0.536	0	0.042	0.386	116.095	4	143987
5jKBxNnQEs2gOtQkyBJF2z	0.581	0.569	0	-4.578	1	0.0391	0.0962	2.87e-06	0.0529	0.471	91.946	4	207480
0Qdti49fC0gs6nhWjEWXGp	0.414	0.57	5	-8.377	1	0.0388	0.519	0.0755	0.105	0.612	181.555	3	158027
0EYe1EIFXb5Ob9hgDtCj0w	0.755	0.66	9	-7.347	0	0.0841	0.472	0	0.1	0.869	118.757	4	173573
1Qc9iyuYBNMvlooaz4GRfN	0.334	0.338	7	-10.796	1	0.0382	0.518	0	0.115	0.222	96.921	4	168125
6ixvtEJ8wDs6Rg41ttIVqa	0.749	0.42	0	-8.219	1	0.031	0.248	3.11e-06	0.126	0.754	84.07	4	110373
3P2q1CHk8hVmu1IXjr8Us4	0.476	0.665	2	-6.895	1	0.0333	0.422	0.000754	0.0849	0.809	112.403	4	234027
0elCmyfISzkP5tAYTVuYjS	0.45	0.602	6	-4.301	1	0.0273	0.0892	0.00625	0.107	0.16	172.161	4	261734
2BedHMJWiW5CuiTd2wza1u	0.722	0.418	9	-8.274	1	0.0319	0.00461	0.76	0.127	0.134	123.028	4	227213
2JXiyD1zucGdFmnTeYb5Ry	0.52	0.265	6	-12.78	1	0.0316	0.223	0.152	0.113	0.0855	79.819	4	302000
2BIfG6wL1t5wk1KixoK2BV	0.709	0.655	4	-9.638	1	0.0342	0.543	0.00283	0.0931	0.609	111.97	4	319821
21lfQ6cXJF15ubyPLB6qHz	0.633	0.761	11	-7.097	1	0.034	0.0502	0.00114	0.638	0.801	96.061	4	248438
7r5elbHLaVama2WsDQpDp6	0.316	0.38	9	-8.547	1	0.0304	0.793	0.063	0.0765	0.123	80.673	4	274377
0cUGSqx7MfnjiVwDzpYdYo	0.482	0.654	5	-9.453	1	0.0518	0.121	0.494	0.0829	0.194	165.145	4	209667
2rpbbxk3EtstH1flOZcvVd	0.503	0.792	8	-6.061	0	0.0358	0.000345	0.000738	0.0721	0.508	167.975	4	269367
3FRJFImdfX5NSY3QH3jI4u	0.658	0.83	3	-5.522	1	0.0307	0.26	1.33e-05	0.108	0.336	127.04	4	247559
2gxYpg3ruB8p9DFWvnTHNX	0.64	0.802	7	-5.383	1	0.0481	0.0344	0.00373	0.255	0.546	92.928	4	213878
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
6Zz846CtUmQGP5z4F7sccA	0.343	0.732	0	-5.189	1	0.044	0.00533	0.00302	0.0685	0.392	180.162	4	180772
6zvpLxTrTKDzdeQ9OLshpQ	0.472	0.906	10	-3.12	1	0.0567	0.0565	3.59e-05	0.0901	0.177	128.941	4	176462
29WtjZlOl5MbzC3lhllMNv	0.505	0.645	2	-5.374	1	0.0264	0.0517	0.0451	0.0727	0.176	78.028	4	211875
72tFZO4vGmXJvjG62rnpWI	0.549	0.792	9	-4.163	1	0.0444	0.00479	0	0.266	0.531	102.394	4	190916
1f8G4jvkONnLMxJMx7V2Ck	0.481	0.917	2	-3.366	1	0.0385	0.00104	3.95e-06	0.398	0.377	108.747	4	185317
3NsIAWbfXNKbwC0UfvzyrK	0.461	0.45	11	-9.445	1	0.0334	0.594	0.231	0.105	0.118	99.895	4	316680
2C93EaiXnfll8oL9TWqQTA	0.375	0.914	8	-3.241	1	0.0589	0.000558	4.55e-05	0.101	0.254	138.934	4	294072
2DPTXclMay45uBj9bKEq9B	0.595	0.25	2	-10.885	1	0.0322	0.836	0	0.0897	0.15	114.928	4	202758
2qNdBOuOlZaML9ZEktD6mi	0.524	0.313	2	-8.673	1	0.0288	0.839	1.95e-06	0.0788	0.26	122.633	4	215996
79MMMdYL00iwKVHBSAUkLY	0.523	0.941	4	-4.444	0	0.0377	0.0878	0.148	0.106	0.145	120.67	4	192324
00sydAz6PeOxYzwG1dRIPi	0.235	0.977	6	0.878	1	0.107	0.00353	0.00604	0.172	0.241	152.952	4	208133
2ukIOcbkpWR5pjDtCRHCcX	0.445	0.927	9	-6.097	1	0.147	5.05e-05	0.000155	0.252	0.571	120.934	4	138624
3NpnrlBcEwRIgBs8tUrhyb	0.591	0.746	2	-7.066	1	0.0265	0.000107	0.527	0.195	0.857	131.377	4	223760
74CcP6fDBFdH8Xjo2F6Nb4	0.455	0.588	3	-12.238	0	0.0489	0.00461	0.549	0.131	0.348	131.857	4	209093
4bscUDqkO6soLEFXMr22ji	0.485	0.829	2	-5.251	1	0.0524	0.000176	0.0229	0.178	0.726	106.98	4	247840
6hAOC89VqirgFxREaQoGDQ	0.586	0.772	9	-4.732	1	0.0292	0.00557	0.0346	0.137	0.727	122.531	4	318213
21xrImrAULwa0VT8n4BJoA	0.407	0.665	5	-8.077	1	0.0365	0.00801	0.196	0.115	0.581	141.79	4	420133
4giZRI3pgupzawIJXLx7T9	0.362	0.896	2	-6.812	1	0.0338	3e-06	0.79	0.355	0.713	136.083	4	213027
406huHGjSj2bz0cnoeGI8j	0.259	0.933	9	-8.076	1	0.085	1.46e-05	0.00656	0.0599	0.352	161.106	4	197773
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
5Z0MrFDEIDB075We9w9276	0.573	0.786	7	-4.354	1	0.0352	0.0634	0.212	0.117	0.612	110.289	4	171267
2eM4Ew20VXdjBhm6a6Cs9l	0.61	0.752	10	-5.062	0	0.0389	0.294	0.0755	0.116	0.832	89.995	4	196867
4lhhYqzREcts4uOOqWHjRJ	0.712	0.8	9	-5.068	0	0.0377	0.0747	0.185	0.0938	0.685	107.047	4	283880
1NwyJs8dFvkV5cvvehav7s	0.546	0.681	7	-5.931	0	0.113	0.216	0.00661	0.0588	0.689	178.522	4	197360
26icLILupXJtsQq5EtZdwn	0.269	0.164	3	-12.865	1	0.0389	0.879	0.00066	0.122	0.254	69.071	3	133320
59s5vTB8LNV4tyZPp9HM3f	0.732	0.703	1	-6.159	0	0.0584	0.215	0.34	0.202	0.725	113.926	4	290422
3ItddtEzeCE37ScY8o3Tbg	0.573	0.901	0	-4.924	0	0.0434	0.405	0.111	0.307	0.794	98.454	4	202627
2rNVmfuyXAfmvZfg8O9D92	0.34	0.491	7	-7	1	0.0322	0.428	0.0397	0.226	0.248	176.309	3	254333
26Vcf2qFrnaa0pFJkGFh61	0.418	0.344	7	-8.42	1	0.0391	0.103	0.198	0.214	0.231	111.709	4	355627
2z6qRBkf6jjWUuzLA9CXO0	0.322	0.719	8	-4.641	1	0.0591	0.156	0.00695	0.668	0.328	148.308	3	316511
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
7MbVZOLSUloG4J3nH3Tnos	0.661	0.699	11	-5.548	1	0.0286	0.00977	0.000427	0.106	0.717	126.001	4	241194
3o5K1YmFz9i9KluRGJusd1	0.559	0.454	9	-8.377	0	0.0377	0.376	4.88e-06	0.258	0.284	134.941	4	204000
3C3KF3yVvF7iIsGxkmr6VB	0.621	0.61	10	-9.088	1	0.0358	0.141	0.0462	0.11	0.85	80.008	4	210895
3cHo4JYNEprRGPtunpABIK	0.767	0.376	11	-8.038	1	0.0294	0.564	1.56e-06	0.108	0.44	125.04	4	241302
6hokBBgD7caSiEXJxPmryn	0.493	0.831	4	-4.298	1	0.0372	0.00116	0.0045	0.179	0.768	179.967	4	226027
65LAG4XH7Oq0mZhFdPYqO4	0.457	0.58	9	-4.971	1	0.0286	0.00606	2.68e-05	0.0847	0.336	76.048	4	220253
7JsrgtynTsvDBuzUJ82o89	0.541	0.81	5	-3.524	1	0.0308	0.00525	0	0.127	0.679	145.008	4	197738
564vp2eEPOegtvHjnkhnhs	0.632	0.305	0	-11.948	1	0.0311	0.849	0.00383	0.112	0.348	119.877	4	220406
723gxwUYsB0XH2MTzYNiMB	0.569	0.222	0	-10.564	1	0.0287	0.923	0	0.102	0.296	143.968	4	180707
1uWp3OTBE1pryDJ4igGD1q	0.603	0.693	9	-5.461	1	0.0356	0.0163	0.000115	0.123	0.735	113.111	4	151515
7EDmkAQSnaGYk0ZoXbqvIM	0.551	0.927	1	-7.17	0	0.0464	0.395	0.00355	0.132	0.238	111.022	4	166478
7k6Ia6hsrweMKk1LiObkC9	0.578	0.897	6	-6.25	0	0.0413	0.0963	0.00215	0.195	0.768	96.027	4	201893
43Rh4q9wWgIEETAt0F2zCu	0.658	0.576	4	-8.367	1	0.0451	0.434	0	0.109	0.551	79.517	4	184300
0epaptkWK7BHkHJheQJtZ4	0.604	0.6	11	-8.751	1	0.0386	0.477	0.0847	0.0936	0.872	85.003	4	183205
37eZez9K3jcLUha0byAI4m	0.499	0.721	0	-7.353	1	0.0364	0.175	0.00312	0.0682	0.441	129.98	4	161789
0Vc56o8yGFp7Sm2z62lGQA	0.657	0.753	7	-7.139	1	0.0256	0.0853	0.111	0.353	0.735	101.975	4	215395
4FMeyMuT6Rk1B34v0AzV9q	0.439	0.527	0	-8.997	1	0.0294	0.299	0.038	0.118	0.546	177.965	4	170234
5n6BdIWBSpkfjZ29JP7WzK	0.597	0.472	0	-8.728	1	0.0247	0.24	0.000664	0.202	0.356	102.885	4	266053
4mOmMccRWthpaUtjPhiQm8	0.422	0.455	9	-8.49	1	0.0287	0.0355	1.76e-06	0.109	0.201	94.888	4	212503
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
0H6hMpN8zxZT3ToOelM5Cl	0.531	0.267	6	-12.877	0	0.0276	0.84	0.903	0.0889	0.45	80.129	3	62080
56PgQIFxAvXcEtXNYrsB0w	0.673	0.739	1	-7.529	1	0.0266	0.0115	0.0162	0.371	0.961	111.968	4	195045
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
1ceeCjdsXB1PRoUQ5EKvZj	0.59	0.433	0	-6.626	1	0.0296	0.653	0.000166	0.286	0.453	77.012	3	176093
34Yd2MzccdIpLaGEWdL4I4	0.752	0.674	10	-4.889	0	0.0348	0.727	0	0.0915	0.902	101.65	4	225827
7MR20mD5bWffs5yNmtmvnK	0.691	0.787	11	-5.501	0	0.0705	0.504	0	0.172	0.805	76.159	4	171733
6x6xL8nI9uj94pd4cUyiHB	0.799	0.833	10	-7.472	0	0.0442	0.163	0.000458	0.281	0.923	110.735	4	181973
3igY2JZg3xnyuZIEaZAE2Q	0.745	0.655	9	-5.275	0	0.0421	0.196	0	0.33	0.883	118.628	4	179120
1sOaZDQR1VSJZqxkD55ZtP	0.552	0.509	0	-6.93	1	0.0401	0.512	0.000122	0.0817	0.235	124.673	3	172440
2XdlLaMNZKmh8bqA4yK7pO	0.793	0.728	0	-5.619	1	0.0328	0.592	0	0.111	0.85	102.658	4	262760
0Kj3JOdo5iWJcOic035iNs	0.61	0.667	0	-6.408	1	0.0449	0.587	0	0.119	0.807	82.533	4	185173
7grHWewXZi12Qn941ePu4A	0.768	0.8	7	-5.204	1	0.0578	0.563	0	0.0538	0.96	117.547	4	170493
339AymorMFeh9GvJahQvnq	0.741	0.842	8	-4.706	1	0.0375	0.771	0.00331	0.616	0.921	106.053	4	242000
5QTxFnGygVM4jFQiBovmRo	0.333	0.927	9	-8.55	0	0.0733	0.0029	0.000208	0.297	0.385	141.466	4	308120
3fkPMWQ6cBNBLuFcPyMS8s	0.532	0.728	9	-9.079	0	0.0352	0.106	0.0108	0.0849	0.69	134.303	4	271000
6N0AnkdDFZUetw8KAGHV7e	0.373	0.869	4	-7.719	1	0.0554	0.164	7.76e-06	0.605	0.696	184.024	4	221400
60TYdVs6TWIsAJ1MPRdv59	0.367	0.609	9	-11.221	0	0.0457	0.301	0.0243	0.196	0.443	149.386	4	210547
0M7oqERflkrJVHD3IAZqxo	0.337	0.886	4	-8.607	1	0.098	0.0716	0.00156	0.204	0.648	177.713	4	242640
3G3PQdcOUZTCgvhvfNGfbv	0.419	0.909	0	-10.258	1	0.0639	0.00239	1.68e-05	0.24	0.494	142.217	4	228867
1bPUK3zBMK73QXmCLzqffn	0.453	0.776	0	-9.937	1	0.0432	0.162	3.81e-05	0.349	0.568	85.992	4	289587
2g02rt0UFudctbAnmJsm22	0.298	0.581	4	-8.133	0	0.0289	0.381	0.0224	0.172	0.26	89.285	4	383973
7gzbnBiHnGBpruEIWTSh1X	0.515	0.64	9	-9.621	0	0.0317	0.00191	5.49e-05	0.135	0.675	134.409	4	268273
6zdMlZyo0XyRNclXyQvVAl	0.538	0.851	8	-7.793	1	0.0643	0.0108	1.82e-05	0.325	0.66	117.359	4	271680
6G7MHIvSDR3ehXPkuDFAlM	0.47	0.385	6	-13.159	0	0.0296	0.767	0.0653	0.179	0.694	112.377	4	200973
2zyTP97uGsIc1C4KNNEkyn	0.476	0.585	11	-14.211	0	0.0478	0.107	1.43e-05	0.149	0.523	110.275	4	230507
2qhR4aymUGDfacDT6pzWf7	0.589	0.523	3	-11.12	1	0.0404	0.397	0.0217	0.0967	0.585	114.252	4	128360
6BSHpKBd2pc3A9WQfRWzyM	0.651	0.524	0	-11.63	0	0.0943	0.51	9.25e-05	0.128	0.651	72.766	4	333160
0cD5w3qEDDNtoi30sP6LaA	0.771	0.54	9	-10.407	1	0.0372	0.277	0.026	0.0883	0.933	118.938	4	122573
3vzFv7gTQq6CXzY4uO9JJN	0.445	0.302	11	-18.039	0	0.0342	0.601	0.00036	0.0771	0.739	82.358	4	215867
5R6QKzF87itE05T7Ht3G2x	0.502	0.564	2	-8.431	1	0.0292	0.415	1.76e-06	0.158	0.79	81.133	4	157333
3TPjX6hEANO8qGrxYtabkh	0.28	0.337	3	-8.385	0	0.0406	0.647	0.00314	0.134	0.251	89.126	4	232917
01wi82GHedsBUjSKf2hJQ0	0.685	0.654	1	-9.351	1	0.1	0.0287	0.0127	0.466	0.603	99.953	4	258907
48TcYDiPXXsOmoqwnl522G	0.59	0.733	9	-6.324	1	0.045	0.3	5.57e-06	0.197	0.852	101.186	4	186107
0MHXrqn909p0LRTPsNsGEi	0.538	0.969	11	-5.626	0	0.0906	0.417	0.00154	0.119	0.928	138.652	4	165790
01gDLZsi0j5fWC28FLPNO8	0.584	0.975	11	-6.534	0	0.0651	0.141	0.501	0.101	0.876	138.341	4	535333
7zrPswSV1yxrill5OyCuaU	0.851	0.669	10	-9.562	1	0.0379	0.239	0.0852	0.108	0.911	126.624	4	300693
4XsH9zBWPOCdXoH9ZDdS8r	0.784	0.708	2	-9.141	1	0.11	0.457	7.5e-05	0.0913	0.748	120.11	4	233600
1Mq4vRRox3bcruJA75M4D9	0.367	0.431	5	-11.191	1	0.0576	0.758	8.89e-06	0.113	0.57	76.454	4	223867
0zBNc7XcWXNHxeszwFsKiL	0.772	0.368	3	-11.183	0	0.0496	0.632	0.00714	0.121	0.564	143.834	4	318200
2ouFIPC3O1HNBcVTw1d9AN	0.523	0.803	1	-6.321	0	0.0791	0.107	0.000409	0.154	0.921	91.469	4	329467
7gmB6hVMsv0XbjfiTgpATI	0.683	0.526	8	-9.656	1	0.0437	0.138	0.00481	0.105	0.679	120.585	4	314227
5wdlG60d0WHoo8P3QzrlbG	0.686	0.755	1	-8.304	0	0.0488	0.149	0.063	0.111	0.686	119.895	4	470507
4xWggCcJgtUWw1yxJAXZR9	0.402	0.797	8	-8.095	1	0.0661	0.214	0	0.335	0.725	98.937	4	308293
1CS7Sd1u5tWkstBhpssyjP	0.566	0.664	4	-5.303	0	0.0464	0.634	0	0.116	0.437	128.945	4	241693
46nvQpUDsxpS08UTFOeKTA	0.539	0.715	11	-6.639	0	0.0595	0.0265	0	0.609	0.489	123.854	4	165524
57V4uc2b2diZ4RPHXWecb9	0.539	0.179	7	-14.33	1	0.0309	0.921	0.393	0.106	0.145	140.01	3	198027
1yTTMcUhL7rtz08Dsgb7Qb	0.561	0.597	11	-6	0	0.0405	0.286	0	0.0979	0.355	76.826	4	197299
3JtVtwLYCy9WXcHLQyzRnl	0.351	0.41	2	-8.66	1	0.0327	0.494	0.44	0.131	0.129	125.995	4	222026
37zuIvk4KBkAxxLJsxJaHq	0.521	0.526	5	-6.032	1	0.0281	0.243	0.00537	0.108	0.502	130.694	4	268293
2DNXgvkyv35vTWvdgjs7qn	0.443	0.533	7	-5.956	1	0.0473	0.429	3.66e-06	0.332	0.596	183.791	4	222813
5Apvsk0suoivI1H8CmBglv	0.523	0.687	7	-5.601	1	0.105	0.0215	2.86e-06	0.203	0.711	90.036	4	217480
1C042FLYy7rP3MfnkOcnha	0.415	0.11	1	-14.901	1	0.0388	0.951	0.00236	0.0962	0.234	81.876	4	240147
5TgEJ62DOzBpGxZ7WRsrqb	0.531	0.363	10	-7.672	1	0.0608	0.749	0	0.112	0.259	121.412	4	229720
2uXkW8uJcOIhlbUatEPLPs	0.506	0.948	10	-5.626	1	0.105	0.727	0	0.0904	0.934	130.195	4	160400
6ae38qMdEC86XRa2LaOguu	0.622	0.918	7	-6.342	0	0.0773	0.297	1.84e-06	0.176	0.821	141.63	4	132627
6u7UrwiZERRglVNSpgmxNf	0.331	0.957	7	-6.101	0	0.0504	0.419	0	0.102	0.548	143.299	4	133093
77DvhwGhnmfrXWwiJzeIMC	0.567	0.643	0	-11.354	1	0.0367	0.671	0	0.588	0.717	140.543	4	140867
18k49mXvNPtKlcT6Ky39pe	0.49	0.651	7	-12.212	1	0.0293	0.227	0.000981	0.13	0.718	81.493	4	158680
5IY9xXJ6E1o6IiCc8ykDro	0.528	0.827	7	-5.969	1	0.0295	0.136	0	0.305	0.935	82.13	4	160827
5chnuVLLyZgfVAHgWPwvTv	0.435	0.964	5	-3.057	1	0.0401	0.0115	0	0.318	0.542	106.505	4	159391
6qBYciZgi7JqSoNf8g7NpY	0.461	0.95	5	-5.199	1	0.0641	0.394	0	0.328	0.837	148.302	4	120707
3bbZNvBuGRVElpRLENwa3J	0.519	0.893	0	-5.34	1	0.0483	0.214	2.85e-06	0.282	0.71	137.733	4	137867
1pPGQdGD3gXLZm2Y1DgiHo	0.538	0.89	9	-5.256	1	0.0455	0.644	0	0.208	0.861	121.032	4	165467
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
22VdIZQfgXJea34mQxlt81	0.705	0.769	9	-5.526	0	0.0425	0.113	0	0.105	0.583	107.949	4	213520
0yhGTljYYHyP7phuxoKWiJ	0.612	0.657	11	-6.971	0	0.0454	0.103	0.124	0.131	0.767	87.94	4	289973
2QbGvQssb0VLLS4x5NOmyJ	0.776	0.562	9	-6.901	1	0.363	0.0399	0	0.138	0.521	169.03	4	147867
7vaFuClNKe02pjKYbXEJ46	0.639	0.737	9	-6.683	1	0.324	0.148	0.00111	0.12	0.182	154.984	4	174675
6L89mwZXSOwYl76YXfX13s	0.442	0.943	3	-3.205	1	0.0602	0.00293	8.71e-06	0.091	0.781	85.064	4	181533
1G6CIweqjfKzFyEfTH4V3u	0.452	0.646	2	-6.911	1	0.0379	0.00471	0.00646	0.0851	0.258	146.857	4	277467
0z5oHDjD9vMsck14zoAQOc	0.811	0.69	10	-7.844	0	0.272	0.0366	0	0.106	0.646	139.97	4	140369
0KV4Ax6L10oSTWqC8607K4	0.701	0.681	11	-8.244	1	0.407	0.831	5.02e-06	0.0663	0.4	97.983	4	136150
6myUpr3GDR80Dg3zqNTmmG	0.646	0.758	4	-7.75	0	0.0708	0.556	0.00316	0.335	0.0642	172.995	4	199787
1xzUQMiCoY5pdego0pHMeV	0.39	0.724	6	-7.607	0	0.0889	0.162	0	0.393	0.312	165.945	4	216560
3ImnbJHoSy5uUhC0ydBVI9	0.752	0.861	11	-6.852	1	0.0989	0.114	0.649	0.201	0.482	125.015	4	191905
5V5BHmvpylV0nSc2Yu2Mu4	0.69	0.88	1	-3.525	1	0.284	0.0384	0.502	0.126	0.813	159.933	4	174250
40mjsnRjCpycdUw3xhS20g	0.594	0.676	2	-5.808	1	0.344	0.135	0	0.163	0.472	143.477	4	181145
4nuAslShoN77tq12fzwjUq	0.636	0.647	5	-6.971	0	0.0381	0.247	0.00123	0.113	0.416	158.073	4	176027
6LyAwkJsHlW7RQ8S1cYAtM	0.638	0.4	11	-11.212	0	0.0425	0.733	0.000133	0.334	0.495	150.133	4	166093
4IIuCotvqijraSdnVLaFnM	0.331	0.513	11	-15.392	0	0.632	0.972	0.953	0.882	0.42	133.971	4	37013
6gBFPUFcJLzWGx4lenP6h2	0.841	0.728	7	-3.37	1	0.0484	0.0847	0	0.149	0.43	130.049	4	243837
3mRlFZHUyvJbPTlkzg4LyJ	0.782	0.5	5	-6.473	0	0.0611	0.342	1.88e-05	0.133	0.28	102.008	4	173611
5B3b5qszWCl22HlzitMh7x	0.907	0.412	8	-10.738	1	0.224	0.401	0	0.0846	0.885	87.977	4	168080
1tX1GK4bLfoS9oDIIbhYAv	0.626	0.781	3	-6.292	1	0.0445	0.00312	0	0.0879	0.481	163.983	4	141966
4xSY7Pxe3bveG1WOIIcYdr	0.838	0.362	11	-13.827	0	0.288	0.308	4.9e-05	0.136	0.495	137.165	4	134075
2cYqizR4lgvp4Qu6IQ3qGN	0.763	0.628	11	-5.85	1	0.05	0.0531	0	0.114	0.193	140.958	4	190557
46M2hXnaQpueG7vSvgVtVH	0.88	0.777	7	-6.875	0	0.125	0.164	0.0171	0.0957	0.974	154.955	4	93894
6AomCkEOQUODCYzQwH4SWC	0.705	0.733	5	-4.942	1	0.102	0.069	0.154	0.823	0.681	135.993	4	157507
2p23H2gdnWEiGUEymqarpJ	0.682	0.484	11	-10.844	1	0.0812	0.836	0	0.241	0.879	82.983	4	95400
24jP9hAAauSG4IH5zGji8a	0.593	0.42	5	-8.7	0	0.272	0.366	1.95e-05	0.239	0.247	204.044	4	178824
3eekarcy7kvN4yt5ZFzltW	0.598	0.427	7	-8.764	0	0.0317	0.0546	5.83e-06	0.21	0.0605	76.469	4	175721
1ZM8toCOlnfBKJdvR8GqUq	0.687	0.783	0	-4.573	1	0.191	0.0526	0	0.0718	0.359	156.141	4	233923
14eDzYfNRuqs1kf7zfIFJW	0.714	0.453	10	-13.085	1	0.0857	0.775	0	0.415	0.836	97.332	4	66213
1dQtt3K8GyPmH7ZD1LJ2ox	0.803	0.902	1	-2.934	1	0.0676	0.00533	0.667	0.111	0.628	126.999	4	166777
1fewSx2d5KIZ04wsooEBOz	0.901	0.464	5	-9.789	0	0.0645	0.368	1.71e-05	0.238	0.638	109.004	4	203267
2Guz1b911CbpG8L92cnglI	0.29	0.48	5	-6.583	1	0.0296	0.116	3.03e-06	0.626	0.382	112.62	4	229235
4gmmRb6bZJffOOiww1JGTO	0.906	0.444	4	-8.692	0	0.384	0.136	6.44e-05	0.173	0.678	140.063	4	235040
7sO5G9EABYOXQKNPNiE9NR	0.88	0.428	9	-8.28	1	0.206	0.149	5.05e-05	0.114	0.333	100.007	4	172800
2MLuFz9Y3Vg3PF0Yf93M5c	0.399	0.754	5	-5.283	0	0.374	0.205	0	0.742	0.36	130.475	4	140183
1x5ihkusmVWsQWtvSCtW9q	0.905	0.407	10	-10.363	0	0.463	0.131	0.000333	0.0725	0.527	135.077	4	304867
0XLQyCwYu8dhhzWAKSs3wr	0.78	0.704	9	-6.241	1	0.0575	0.872	0	0.0726	0.96	116.101	4	268080
1tzTiTLSRisnQiOnhgAdtF	0.768	0.728	11	-5.029	1	0.114	0.778	0	0.0968	0.938	127.304	4	108275
1wAdcYWWPbcqiUcum9brWw	0.742	0.486	1	-8.347	0	0.269	0.817	0	0.112	0.921	103.743	4	229200
2dy2C0StZ3yiEeb0Aoolcn	0.764	0.846	10	-2.743	0	0.0636	0.159	0.000263	0.0475	0.777	122.992	4	179579
3WKrSWltDbNcY5M3haaFxQ	0.583	0.549	2	-7.378	1	0.0452	0.715	0.00117	0.492	0.698	148.011	4	262525
1vvBUZseJ7fwYPX1NedOLd	0.792	0.698	1	-6.364	1	0.172	0.489	0.0788	0.127	0.751	129.971	4	173938
4FeBA1bxkUae1aDsplsmrv	0.441	0.882	0	-3.686	1	0.327	0.305	2.22e-06	0.293	0.733	170.19	4	166356
5SWnsxjhdcEDc7LJjq9UHk	0.819	0.626	10	-4.574	0	0.202	0.00748	0.101	0.167	0.415	143.01	4	195906
643PW82aBMUa1FiWi5VQY7	0.897	0.743	10	-5.446	0	0.222	0.304	4.44e-05	0.137	0.905	134.979	4	187105
23Dapn8107GgxvXDIsPwWm	0.526	0.902	3	-4.876	1	0.314	0.0529	0	0.531	0.797	168.188	4	121682
2Tdkz4mLxN8szqcMeNWcI8	0.459	0.746	5	-2.881	0	0.113	0.0114	0	0.2	0.627	151.535	4	166004
3VHiIVQe8Sc6gtSsTp3pDz	0.612	0.349	8	-6.984	1	0.26	0.0779	0	0.202	0.79	107.929	4	143663
2WzWwYoxWIqyjzIaazsqYV	0.645	0.979	4	-3.441	0	0.119	0.0206	1.27e-06	0.0789	0.919	171.9	4	196896
2T93MtJuKMzcGRTR8fdizV	0.849	0.473	8	-7.548	1	0.2	0.115	0	0.0488	0.616	107.001	4	214529
5Mm2CJzNRiICC5MWRWQnBo	0.473	0.936	1	-2.441	0	0.408	0.0335	1.35e-05	0.607	0.545	173.53	4	175699
0O6u0VJ46W86TxN9wgyqDj	0.733	0.67	5	-6.009	1	0.0751	0.121	0	0.121	0.472	100.964	4	192841
21jGcNKet2qwijlDFuPiPb	0.695	0.762	0	-3.497	1	0.0395	0.192	0.00244	0.0863	0.553	120.042	4	215280
0e7ipj03S05BNilyu5bRzt	0.585	0.52	5	-6.136	0	0.0712	0.124	7.01e-05	0.131	0.129	159.801	4	218147
0RiRZpuVRbi7oqRdSMwhQY	0.755	0.522	2	-4.368	1	0.0575	0.533	0	0.0685	0.925	89.96	4	157560
3a1lNhkSLSkpJE4MSHpDu9	0.63	0.804	6	-4.183	1	0.0363	0.215	0	0.253	0.492	123.146	4	220293
7xQAfvXzm3AkraOtGPWIZg	0.829	0.539	11	-7.359	0	0.208	0.136	1.78e-06	0.103	0.388	99.96	4	149547
7dt6x5M1jzdTEt8oCbisTK	0.68	0.578	10	-5.804	1	0.04	0.331	0	0.135	0.341	145.038	4	231267
0t3ZvGKlmYmVsDzBJAXK8C	0.548	0.653	5	-3.875	1	0.081	0.456	0	0.103	0.163	150.068	4	174853
75ZvA4QfFiZvzhj2xkaWAh	0.556	0.538	8	-5.408	0	0.0382	0.0689	0	0.196	0.291	143.95	4	223347
1nltpRhEiXikwDlVn4UADk	0.682	0.764	1	-5.411	1	0.0477	0.0363	0	0.103	0.701	97.023	4	192721
3Z7CaxQkqbIs1rewKi6v4W	0.748	0.841	7	-5.08	1	0.177	0.00445	1.33e-06	0.0413	0.717	123.045	4	129817
6Dy1jexKYriXAVG6evyUTJ	0.787	0.833	8	-4.403	1	0.0478	0.018	0.00747	0.0374	0.796	123.97	4	162604
11M8c9SHQYpd8DOrmcu25k	0.788	0.945	9	-5.091	1	0.0599	0.223	2.97e-06	0.115	0.466	128.036	4	168053
2grSOc6HNTXQQXNoRKt9UM	0.764	0.672	7	-5.947	0	0.0293	0.072	3.32e-06	0.0806	0.789	129.049	4	136614
5dry5tz8yLcLuOJ3l6ZEQd	0.711	0.931	1	-4.042	1	0.0323	0.0914	4.41e-05	0.0892	0.775	118.009	4	145840
5cYEuFqzITZlZzpoR1sHvu	0.765	0.675	1	-5.687	1	0.0402	0.0585	1.51e-06	0.0703	0.886	100.939	4	138800
0FZUbqZ1x2G71vl027d8Ud	0.852	0.592	1	-6.464	1	0.105	0.0058	0	0.375	0.237	102.014	4	157079
5hyq3LBlCfjRQAFkdQwe8o	0.836	0.684	11	-5.818	1	0.241	0.122	0	0.0854	0.514	151.007	4	193271
3qGHAKgjQruzj6doKkyEb5	0.504	0.711	9	-5.864	1	0.0452	0.0585	1.83e-05	0.382	0.5	134.824	4	232933
0TejbZNnypwBQDwkUPjPrT	0.723	0.99	7	-4.409	1	0.198	0.00214	5.63e-05	0.328	0.167	126.05	4	184871
3AydAydLzyyZutA0375XIz	0.551	0.819	2	-4.489	1	0.0525	0.0103	0.0437	0.153	0.846	174.917	4	137760
1eNrlXlW7Cj1QB1YUcZmpb	0.639	0.704	7	-5.818	1	0.0659	0.22	0.0872	0.0849	0.645	162.983	4	176467
4dRqYKhLVujxiBXcq50YzG	0.62	0.712	9	-6.434	1	0.1	0.228	3.39e-06	0.0561	0.83	170.234	4	268600
39exKIvycQDgs4T6uXdyu0	0.653	0.76	11	-6.086	1	0.0479	0.475	0.000129	0.0917	0.6	98.008	4	308733
51DZ0wUocQ8sQfjnibXVcD	0.644	0.811	11	-7.774	1	0.0517	0.149	0.000473	0.17	0.817	154.909	4	202667
607EA1HsuzrqqaPuxyNqpD	0.621	0.713	10	-7.226	1	0.102	0.605	8.28e-06	0.103	0.609	78.022	4	251627
0ful4PHfTIxzXiZSZsXQ0H	0.692	0.717	0	-4.226	1	0.0498	0.111	0.00123	0.044	0.973	119.902	4	195733
53KFMdxzi8IJDewiql1Qo3	0.863	0.576	8	-5.691	1	0.0567	0.406	0.00824	0.141	0.932	100.03	4	137600
10f0hrbCBiQk9STrFG3EU7	0.422	0.809	11	-5.607	1	0.246	0.0333	3.64e-05	0.203	0.735	87.076	4	160067
6AY1M1akbsVaQN3ATVyzH7	0.647	0.31	4	-10.237	1	0.0372	0.705	0.000723	0.1	0.189	103.974	4	237973
37F7E7BKEw2E4O2L7u0IEp	0.802	0.623	11	-5.862	0	0.459	0.0292	0.055	0.113	0.457	74.987	4	169947
3omcH1HGghFtzaFGgazoy8	0.656	0.872	7	-6.663	1	0.206	0.00297	0.00302	0.0778	0.568	150.059	4	125608
6J9UUQSQ9Vm9fh6vZgLlzu	0.795	0.6	10	-6.92	1	0.282	0.0394	0.0517	0.097	0.452	142.971	4	99808
5WbKBMz6y0FbUdZl18XlJO	0.789	0.541	2	-6.449	1	0.0733	0.0931	0.0281	0.137	0.732	149.229	4	113547
2qOfyyZc41LfQ63U9p3GVV	0.886	0.741	10	-5.043	1	0.0682	0.00254	0.000134	0.151	0.95	140.024	4	129196
7hARdySaXWuTLeqBrYP2xf	0.909	0.633	1	-7.923	1	0.307	0.0921	0.63	0.238	0.433	145.075	4	129607
0G88ZH0qqBCBbtrHnEDqrn	0.619	0.43	9	-11.118	1	0.0576	0.663	0.000197	0.119	0.718	128.322	4	584107
7lzfMZak2HjNPXXSxksjPB	0.723	0.694	0	-6.694	1	0.0802	0.313	0	0.052	0.739	106.359	4	168948
02a8cGumnKuEPgoCzmalJp	0.481	0.284	11	-14.762	0	0.186	0.634	0.000168	0.91	0.528	83.979	3	190533
1Hn0iEB1FPfJzJPK49qVtH	0.47	0.248	2	-13.407	1	0.039	0.739	0.00598	0.466	0.2	140.229	4	375173
6giaOyDFbE4J8iclhCdW7E	0.725	0.622	7	-5.573	0	0.0438	0.579	0	0.144	0.356	119.985	4	600000
044fQ35cLbMVwta0KyN5dM	0.474	0.0577	2	-17.945	1	0.0758	0.907	7.16e-05	0.137	0.182	77.689	3	174133
2BvDFQOl4JieEGK2cgKOey	0.774	0.647	1	-6.682	0	0.0514	0.47	0.000569	0.46	0.965	95.098	4	200960
3QKJELWORZZ7rUZDWeMWSA	0.653	0.319	4	-17.813	0	0.0364	0.439	0	0.0906	0.845	147.858	4	138013
3zcBNmJH6ToRCI0WNEIuES	0.653	0.647	4	-7.028	1	0.0437	0.201	0	0.0753	0.936	156.28	4	256693
50c0knPGjaJAuE4hRg28Qq	0.761	0.59	10	-10.274	1	0.0449	0.454	0.00933	0.0926	0.895	158.053	4	267267
5JuWx9sV8TbtIMhiiPVbnz	0.661	0.191	2	-15.779	1	0.0503	0.588	0	0.24	0.586	111.353	4	194800
5YctcwZCRMxlIHDpTuqKOE	0.495	0.306	9	-11.173	0	0.0303	0.777	0	0.887	0.356	108.416	4	187179
6Sm4XdGI7GhHG7sjVcVrI2	0.671	0.798	4	-6.914	1	0.181	0.583	0	0.241	0.502	95.6	4	210960
6sKopGG4r21ObTE8V6pD6x	0.6	0.12	7	-12.805	1	0.0502	0.87	0	0.088	0.439	60.761	3	214693
78I8jaChZbPu72bIGGPMKk	0.472	0.0322	9	-22.076	0	0.0378	0.979	0.00288	0.111	0.138	90.205	4	215440
5Ikos3uiBfPYAf7EZfz8t3	0.596	0.451	5	-9.468	1	0.0404	0.64	3.52e-06	0.158	0.486	148.045	4	228133
2wL88cvKXUOfHuYVd62hji	0.734	0.787	1	-7.358	0	0.0461	0.489	0.0461	0.329	0.757	108.329	4	266173
43HM6P2yX7ls3q92qrkhL4	0.763	0.574	10	-9.283	1	0.0315	0.447	3.56e-06	0.086	0.48	110.111	4	239533
1O5pf5R8xvppS2pD03HVy5	0.825	0.679	11	-7.408	0	0.05	0.0164	0.838	0.0468	0.613	91.674	4	209067
20I1Mickm2w7qGxk7uzOKr	0.844	0.707	11	-8.422	0	0.158	0.165	0	0.664	0.717	99.011	4	236768
465hVdgg75kPgRdpJfEFFT	0.641	0.531	2	-7.243	1	0.157	0.0492	0	0.118	0.194	135.564	4	225413
4mn5HdatHKN7iFGDes9G8i	0.751	0.74	9	-6.016	1	0.045	0.152	5.75e-05	0.0873	0.788	138.066	4	116161
7cEfPAbju7glmdAgT4e1AU	0.8	0.234	0	-12.292	0	0.138	0.537	9.67e-06	0.339	0.757	115.936	4	139933
0JL9TZip7mL7iwC5EOkALS	0.499	0.874	0	-4.586	1	0.097	0.611	0.000639	0.0703	0.861	97.317	4	199160
0Nkp56EKreoWMYxpXJqUNZ	0.782	0.365	7	-14.049	0	0.0726	0.532	0.89	0.0837	0.684	91.894	4	168913
0ZQfn5nh2TnVE6Q0AT8eXr	0.681	0.358	0	-14.701	0	0.138	0.677	0.00411	0.124	0.0682	113.402	5	197773
0eEXcw3JLVXcRxYrVYMy68	0.866	0.534	11	-9.201	1	0.229	0.184	0.266	0.0929	0.841	98.243	4	226133
126HWk9JuCt4PHZJAAsgOv	0.717	0.965	8	-3.506	0	0.0457	0.000116	0.525	0.0939	0.741	98.976	4	255718
1IkE3IsuP4HNU073wsE6T5	0.781	0.477	11	-9.463	0	0.0818	0.776	0.0346	0.0954	0.375	150.147	4	156502
1MPmF4py7FxbeqFGpKn09C	0.589	0.65	6	-9.463	0	0.0599	0.612	0.00413	0.927	0.206	116.941	4	272923
1XjFyPzU5z3zbYJQETYGiZ	0.615	0.319	4	-9.178	0	0.0376	0.639	0	0.142	0.828	90.998	4	86760
1brWhQEoBoT9tMnNfcRsjr	0.667	0.206	9	-14.884	0	0.325	0.349	0.00039	0.134	0.408	148.45	3	198933
29Lq5UKpHBGxQTDxsPKwFz	0.656	0.375	5	-10.531	1	0.0631	0.699	3.62e-06	0.155	0.83	137.981	4	224867
2VBN5kSs1fyiE5fnOYeKsG	0.703	0.278	0	-11.32	1	0.0662	0.543	0	0.146	0.623	114.322	4	199667
2YXpMdEMEoy48OPr6VTzpI	0.841	0.574	7	-8.021	1	0.124	0.658	0	0.141	0.895	151.425	4	170600
2dCBXxXNur85q9gGIpsAdr	0.653	0.395	9	-8.785	0	0.218	0.954	6.72e-06	0.325	0.628	154.501	4	130760
5nujrmhLynf4yMoMtj8AQF	0.702	0.825	6	-3.787	0	0.0601	0.00883	0	0.0674	0.915	102.977	4	203064
7ytR5pFWmSjzHJIeQkgog4	0.746	0.69	11	-7.956	1	0.164	0.247	0	0.101	0.497	89.977	4	181733
5MPPttjfGap2C6j6eKcO6J	0.97	0.463	10	-7.259	1	0.366	0.0957	0	0.151	0.46	108.003	4	142417
6Ozh9Ok6h4Oi1wUSLtBseN	0.769	0.787	11	-3.909	1	0.367	0.189	0	0.129	0.836	126.77	4	159715
0cu0rhnlCnJ7JIeHRiLpj3	0.902	0.669	1	-5.049	1	0.457	0.161	0	0.0728	0.628	139.949	4	112547
6r9xnueU24r4eoG3HXC87E	0.807	0.625	0	-6.67	1	0.351	0.0741	0	0.487	0.871	146.031	4	111971
2gwkD6igEhQbDQegRCcdoB	0.876	0.662	2	-6.482	0	0.426	0.0608	0	0.127	0.844	75.445	4	163320
1YDebgap5OFwXEBG18NJvy	0.933	0.656	2	-5.85	1	0.322	0.129	0	0.161	0.934	119.987	4	159083
26UxwWl9xCb83OynXELJcL	0.781	0.726	0	-4.213	1	0.0836	0.0299	0	0.093	0.436	139.988	4	181714
0fySG6A6qLE8IvDpayb5bM	0.768	0.652	1	-2.708	0	0.307	0.113	0	0.107	0.777	154.187	4	144935
2tznHmp70DxMyr2XhWLOW0	0.636	0.676	2	-3.442	1	0.0263	0.0807	0	0.0831	0.273	113.98	4	208760
3Pzh926pXggbMe2ZpXyMV7	0.636	0.849	0	-7.075	1	0.106	0.0438	0	0.372	0.917	156.036	4	175493
4sebUbjqbcgDSwG6PbSGI0	0.44	0.778	1	-1.786	0	0.0327	0.0265	1.04e-06	0.151	0.304	148.038	4	229347
5n0CTysih20NYdT2S0Wpe8	0.47	0.623	0	-5.655	1	0.0302	0.392	0.000439	0.0992	0.298	77.861	4	225973
1Q3t9fWvHUXKsMmpD2XpUu	0.549	0.789	5	-6.071	1	0.0313	0.0178	6.7e-05	0.059	0.715	136.125	4	214387
1KuVdyg8d6NlRhbpHxg5UF	0.668	0.913	9	-3.097	1	0.0348	0.0119	6.7e-06	0.111	0.933	132.039	4	219053
0tkBOcK7oRVXQJY97zzSvr	0.589	0.481	0	-4.801	1	0.0285	0.273	1.33e-05	0.0986	0.176	93.568	4	228293
4Y6GIje3GErVRIq1Ff5BJq	0.705	0.728	4	-3.184	0	0.035	0.00122	0.0693	0.0753	0.966	109.991	4	226533
4dpEYOPcmHNfvERbiajp3G	0.524	0.532	6	-6.07	0	0.026	0.0285	7.86e-05	0.242	0.367	135.678	4	224893
5r5Lj2MkgwQJz6TaBdL865	0.543	0.946	2	-0.734	1	0.0454	0.00614	1.49e-05	0.106	0.547	117.962	4	222813
6QgjcU0zLnzq5OrUoSZ3OK	0.801	0.795	1	-5.115	0	0.0504	0.0417	0.000113	0.0717	0.754	79.028	4	163253
60eOMEt3WNVX1m1jmApmnX	0.546	0.583	6	-7.317	0	0.0348	0.002	0.173	0.115	0.235	128.017	4	246787
4SNtyKNyYJ8ERT7YLlnFBr	0.671	0.445	4	-7.842	0	0.0291	0.348	5.93e-05	0.155	0.811	75.996	4	246480
0ePX6rVjeql7Bt1KurTbAG	0.722	0.889	3	-2.564	0	0.0416	0.0682	4.77e-06	0.124	0.743	139.965	4	177397
7iOyMOxdOULvXqUqC26spJ	0.627	0.633	10	-7.41	0	0.0305	0.133	7.07e-05	0.216	0.763	85.999	4	194053
0WTq8iUzSlGDAbowEdRKKD	0.543	0.768	0	-5.914	1	0.0288	0.0322	6.72e-06	0.779	0.681	79.965	4	179360
4WMuY659P2MKnoW40oGXe8	0.601	0.859	4	-6.311	0	0.0397	0.0351	0.331	0.144	0.431	101.003	4	249747
384TqRlwlMfeUAODhXfF3O	0.551	0.741	8	-4.245	1	0.029	0.00648	0.00603	0.0707	0.399	79.984	4	211720
0595RikX32pk1tk7cO7K7H	0.89	0.775	6	-6.475	0	0.0461	0.128	3.47e-06	0.0611	0.8	125.031	4	175047
43QhrhgRrH9NWy6eoUro4X	0.63	0.736	10	-7.302	0	0.0384	0.0507	0.00244	0.109	0.919	137.948	4	227253
6fTgbkBiMITtHUmik95ClX	0.552	0.836	6	-5.608	1	0.0453	0.00942	0	0.372	0.432	140.496	4	208280
6OyKBwLzq4h15XmxeWf5n4	0.398	0.89	1	-2.248	0	0.0473	0.0252	0	0.0472	0.572	95.095	4	212938
0IPKskRI33eRXjUhNUr9b5	0.484	0.828	11	-5.197	1	0.0543	0.0288	0	0.313	0.577	195.999	4	207281
6um5ccNzX7k3SRsVnLupvI	0.491	0.904	9	-4.729	1	0.0765	0.00929	0	0.106	0.607	156.031	4	247760
5om8idoAx58nxbReNe7HwL	0.669	0.849	1	-2.564	0	0.0581	0.00912	0	0.279	0.399	95.01	4	202105
0cY6CAgB5wShSOTT3lQl2t	0.363	0.756	11	-4.687	0	0.0494	0.00775	0	0.0794	0.68	155.644	4	181337
5heRy6IDNiQXDJf1tZ6SUc	0.436	0.946	8	-4.755	0	0.103	0.00121	0	0.215	0.603	93.544	4	191133
3m1OyPw3fzMPAwDMcYcM6Z	0.536	0.855	7	-5.269	1	0.144	0.00139	0	0.0815	0.522	157.942	3	251373
1JFPraHovseDzutd6BOIry	0.503	0.708	0	-4.148	1	0.0735	0.00134	0	0.081	0.533	90.356	4	205125
376GmAj8YF8fIJLe5IwOoH	0.456	0.875	11	-4.636	1	0.033	0.00598	3.58e-05	0.194	0.63	74.375	4	227507
10xV5l9nhLvFpR8mqzs0bL	0.912	0.774	0	-4.673	0	0.0455	0.121	0.0127	0.101	0.632	119.966	4	155589
4qu63nuBpdn0qHUHuObEj1	0.721	0.738	7	-4.77	1	0.0403	0.00226	4.41e-06	0.118	0.637	119.976	4	154983
6XO8RlYuJCiI0v3IA48FeJ	0.645	0.525	3	-5.399	0	0.0355	0.0574	0	0.505	0.238	83.018	4	108499
2dpaYNEQHiRxtZbfNsse99	0.687	0.792	5	-2.749	1	0.0452	0.191	0	0.167	0.671	100.015	4	214290
7vGuf3Y35N4wmASOKLUVVU	0.52	0.761	4	-3.093	1	0.0853	0.256	4.96e-06	0.17	0.286	141.971	4	180823
0tBbt8CrmxbjRP0pueQkyU	0.724	0.804	11	-4.614	0	0.0448	0.124	0	0.204	0.306	124.987	4	197993
2Y0wPrPQBrGhoLn14xRYCG	0.625	0.814	0	-5.181	1	0.0657	0.0172	0	0.158	0.535	144.991	4	205485
08bNPGLD8AhKpnnERrAc6G	0.626	0.88	9	-2.384	0	0.0504	0.205	0	0.128	0.534	95.079	4	202621
3Z8FwOEN59mRMxDCtb8N0A	0.63	0.633	4	-7.088	1	0.0457	0.00776	0	0.0541	0.452	93.995	4	172762
0ada5XsQGLPUVbmTCkAP49	0.701	0.65	6	-6.313	1	0.104	0.291	0	0.112	0.647	90.003	4	160212
3CRDbSIZ4r5MsZ0YwxuEkn	0.734	0.637	4	-5.677	0	0.141	0.0462	2.29e-05	0.0602	0.648	169.977	4	202333
23OXdR7YuUBVWh5hSnYJau	0.609	0.674	10	-7.388	0	0.0548	0.0735	0.06	0.345	0.315	90.009	4	324467
3bnVBN67NBEzedqQuWrpP4	0.655	0.632	2	-4.802	1	0.0489	0.0189	0	0.0722	0.447	120.113	4	188493
2nG54Y4a3sH9YpfxMolOyi	0.588	0.856	9	-5.242	0	0.0316	0.000818	0.0739	0.238	0.635	96.966	4	175044
5cbpoIu3YjoOwbBDGUEp3P	0.766	0.519	9	-7.355	0	0.0366	0.098	0	0.0855	0.612	129.972	4	267720
7i9763l5SSfOnqZ35VOcfy	0.613	0.873	7	-6.376	0	0.0449	0.00397	0.00111	0.367	0.392	129.989	4	234813
36tghkPg1AO4HsAzo6YpPp	0.68	0.693	0	-7.234	1	0.0435	0.445	0	0.208	0.851	114.948	4	163880
5HeKOKc4phmLn8e4I7EkzD	0.749	0.723	1	-6.609	1	0.0432	0.0563	0.022	0.0977	0.674	108.999	4	229120
5TXDeTFVRVY7Cvt0Dw4vWW	0.746	0.251	11	-16.169	0	0.259	0.782	0.00203	0.106	0.18	139.999	4	120027
2ZRo7axmMPeSVUvDbGkJah	0.592	0.457	9	-6.081	0	0.0603	0.661	0.000331	0.146	0.225	146.04	4	110886
3GVkPk8mqxz0itaAriG1L7	0.734	0.57	7	-7.066	0	0.133	0.847	2.14e-05	0.112	0.689	129.953	4	95467
7m9OqQk4RVRkw9JJdeAw96	0.872	0.391	0	-9.144	0	0.242	0.469	4.13e-06	0.297	0.437	134.021	4	119133
3ee8Jmje8o58CHK66QrVC2	0.74	0.613	8	-4.88	1	0.145	0.258	0.00372	0.123	0.473	75.023	4	166606
7AQim7LbvFVZJE3O8TYgf2	0.797	0.533	0	-9.74	0	0.0412	0.0172	0.000152	0.103	0.329	131.036	4	146520
0JP9xo3adEtGSdUEISiszL	0.921	0.537	9	-5.723	0	0.0804	0.556	0.00404	0.102	0.711	128.009	4	135090
7floNISpH8VF4z4459Qo18	0.763	0.726	1	-6.405	1	0.282	0.259	0	0.0976	0.349	139.059	4	126346
06JvOZ39sK8D8SqiqfaxDU	0.712	0.861	5	-5.487	0	0.25	0.0182	6.09e-06	0.511	0.388	84.042	4	148571
4jvjzW7Hm0yK4LvvE0Paz9	0.669	0.574	4	-6.442	0	0.0286	0.0175	0.00294	0.146	0.273	120.013	4	196400
0hquQWY3xvYqN4qtiquniF	0.801	0.601	8	-7.574	0	0.255	0.0777	3.23e-05	0.145	0.74	159.969	4	182907
6Uj1ctrBOjOas8xZXGqKk4	0.824	0.764	5	-4.175	0	0.0854	0.0888	0.00294	0.117	0.881	107.998	4	172627
3Vi5XqYrmQgOYBajMWSvCi	0.664	0.609	1	-6.509	1	0.0707	0.304	0	0.0926	0.194	130.041	4	210560
0k4d5YPDr1r7FX77VdqWez	0.828	0.621	8	-6.414	1	0.0565	0.0164	0.00233	0.0845	0.436	128.986	4	186173
60ynsPSSKe6O3sfwRnIBRf	0.749	0.463	11	-8.433	1	0.0842	0.21	0.0382	0.338	0.189	90.035	4	226987
3DarAbFujv6eYNliUTyqtz	0.764	0.705	8	-3.463	1	0.0284	0.259	8.92e-05	0.12	0.781	110.97	4	208667
0W6I02J9xcqK8MtSeosEXb	0.912	0.655	8	-6.029	0	0.162	0.315	3.39e-05	0.0894	0.793	91.942	4	138293
5lAnYvAIkSDNXqfo7DyFUm	0.855	0.488	3	-4.601	1	0.208	0.506	0	0.347	0.619	124.097	4	174253
3Dv1eDb0MEgF93GpLXlucZ	0.787	0.673	11	-4.583	0	0.159	0.264	3.35e-06	0.0904	0.779	110.962	4	237893
0u2P5u6lvoDfwTYjAADbn4	0.351	0.296	4	-10.109	0	0.0333	0.934	0	0.095	0.12	115.284	4	200186
4RVwu0g32PAqgUiJoXsdF8	0.332	0.225	0	-8.697	1	0.0348	0.767	0.00349	0.128	0.297	81.055	3	298899
3GYlZ7tbxLOxe6ewMNVTkw	0.412	0.236	4	-15.159	0	0.0379	0.83	0.00653	0.147	0.119	140.214	4	281381
3ZCTVFBt2Brf31RLEnCkWJ	0.704	0.225	6	-14.454	0	0.0994	0.902	0.657	0.106	0.243	120.006	4	245426
04sN26COy28wTXYj3dMoiZ	0.614	0.318	7	-12.695	1	0.0478	0.896	0.00239	0.0795	0.112	119.959	4	180933
2Fxmhks0bxGSBdJ92vM42m	0.701	0.425	7	-10.965	1	0.375	0.328	0.13	0.1	0.562	135.128	4	194088
43zdsphuZLzwA9k4DJhU0I	0.367	0.111	4	-14.084	1	0.0972	0.978	3.97e-05	0.0897	0.198	82.642	4	196077
32BeYxKPrig1LefHsC0Xuo	0.334	0.599	0	-5.742	1	0.0365	0.0468	0.000392	0.205	0.127	161.74	3	151444
41zXlQxzTi6cGAjpOXyLYH	0.483	0.412	7	-8.461	1	0.0402	0.737	0	0.116	0.247	170.163	3	203569
6CcJMwBtXByIz4zQLzFkKc	0.421	0.131	0	-18.435	1	0.0382	0.952	0.00453	0.109	0.12	137.446	4	291796
4G21jWo0Cm6lOIUNnZ2mUI	0.644	0.808	5	-7.268	1	0.0513	0.0467	0.187	0.0652	0.175	174.98	4	266507
3l14MJpQB4tFFgKLqUqtV3	0.63	0.752	0	-7.218	1	0.0458	0.278	0.0226	0.104	0.201	153.971	4	283747
5TS9LZZ3nf3W0EPZKZiYFX	0.704	0.674	2	-7.391	1	0.0308	0.175	0.0543	0.0978	0.698	134.98	4	226613
0xn9WsyWhNbfI82Ipnpwqa	0.606	0.555	2	-8.418	1	0.0319	0.0798	0.0712	0.12	0.155	155.031	4	300547
0bWtmYrWat7IWlpx3rmuwc	0.702	0.68	0	-5.746	1	0.0376	0.288	0.000414	0.145	0.538	129.004	4	261093
4gW0C3SyybbjP9cAKZVUBh	0.696	0.603	0	-6.826	1	0.069	0.102	0.00534	0.365	0.288	87.476	4	252653
0CHRgDidZqHau44aQpQcBG	0.59	0.793	11	-5.982	0	0.0276	0.0107	0.0601	0.064	0.678	149.988	4	294400
30s3cW1xHDYjsN6giTJ8F0	0.626	0.528	1	-9.237	1	0.0441	0.0588	0.00141	0.0919	0.0394	125.077	4	257293
5N89h6717o32ZseUAeUKtz	0.673	0.705	3	-7.771	1	0.0388	0.221	0.56	0.131	0.404	99.956	4	269507
71RakHH2tdYRLFM2RniO5K	0.523	0.539	0	-10.241	1	0.0359	0.47	0.748	0.0698	0.364	129.032	3	234387
0VUiaSYJJgUF0JvweD6Mr9	0.745	0.98	2	-2.639	1	0.105	0.0397	0.303	0.337	0.733	135.1	4	199111
3Fpd2bYU5uc0C5DvIzsMzw	0.821	0.948	4	-3.153	1	0.0911	0.00382	0.948	0.068	0.555	123.989	4	225750
3YVj9LLq5GMvBvoKubnUp0	0.774	0.81	1	-2.984	0	0.0734	0.186	0.00949	0.0261	0.975	146.95	4	146709
3XlHlWFhlI4OZiguOMcuuc	0.518	0.847	8	-5.489	0	0.274	0.0517	0.000283	0.159	0.341	150.037	4	224018
7ppz0b5ecGXM8xHg5yGDhK	0.712	0.727	4	-5.22	0	0.0362	0.263	0.000257	0.13	0.492	145.014	4	178767
27WOAkJrAYagnYj7Y2tsFw	0.548	0.877	6	-2.927	0	0.051	0.0726	0.000116	0.101	0.365	150.081	4	202440
7cpnqcFMN6Z7yiSOZyzGMU	0.732	0.961	1	-3.563	0	0.152	0.0551	0.72	0.0716	0.6	145.018	4	195310
7D3KNbOAbyR7dYLX0BZuyU	0.42	0.975	5	-0.77	0	0.24	0.0269	0.0221	0.234	0.303	75.012	4	184630
2vP8axvS6mqgnPwwxMARPs	0.626	0.915	10	-2.466	0	0.0528	0.0342	0.00238	0.0893	0.123	150.055	4	166400
2jt1zmAB5VEY9TLNNiXLKW	0.518	0.977	0	-2.781	1	0.0937	0.00983	0.00157	0.0632	0.269	149.964	4	194421
0zLCBJZSiELJf02ucPP9wb	0.769	0.719	8	-5.472	1	0.0474	0.0143	0.00777	0.359	0.863	121.955	4	176867
6OboXrS1zbfCmh7uDFCIQ5	0.759	0.9	1	-1.999	0	0.0419	0.00571	5.13e-05	0.294	0.389	127.999	4	198979
2Y8hY4rRRQQjdaZkkwzpd9	0.791	0.839	0	-2.887	1	0.0424	0.0849	0	0.193	0.349	116.991	4	184699
4hTErxf8ZqFNGH0hZqEoAI	0.828	0.521	10	-5.583	1	0.137	0.858	0	0.13	0.369	106.009	4	200475
0kUz4NuENHYVUChlthlNaB	0.393	0.724	4	-5.54	1	0.0825	0.0676	0	0.205	0.147	89.684	5	196874
0B3FovCVaGKS5w1FTidEUP	0.603	0.602	6	-7.083	1	0.23	0.049	0	0.279	0.595	119.703	5	248472
691df0fYjhhszUgQH3FGvP	0.706	0.558	7	-5.253	1	0.0525	0.0792	0	0.162	0.212	112.975	4	169405
2HhJ0b1AwX5Vgcnf3zzx1p	0.693	0.494	1	-7.252	0	0.108	0.139	0.000187	0.111	0.302	135.022	4	241842
3q0U6eqmHObU2cy0O6VHGS	0.789	0.552	5	-7.498	1	0.0454	0.0518	5.72e-06	0.101	0.379	134.968	4	197885
3R9j8urSPiBbapNbyuSYkE	0.6	0.716	3	-5.554	0	0.384	0.0491	0	0.109	0.246	180.165	4	175040
4iVD0fTHGxV9JWloujsL3s	0.604	0.436	2	-8.32	1	0.188	0.0544	0.000242	0.162	0.239	107.978	4	361280
6ya8ejoKgw906Y8LWclqrp	0.671	0.833	5	-5.152	0	0.395	0.0825	0	0.0726	0.702	79.351	4	233278
2hVtGnJeHOo0EqjzYXNFg5	0.836	0.779	7	-3.829	1	0.0519	0.00369	0.000173	0.58	0.555	119.908	4	258520
6hkQ6OQ6nhe7QCckH91aGa	0.597	0.755	4	-2.209	0	0.052	0.0423	0	0.582	0.0467	89.146	4	238333
6fIjnWrv46njJHLDAY2JdC	0.512	0.734	8	-5.448	0	0.438	0.431	0	0.226	0.168	93.995	4	245813
39xWBHPM4E9MwzEy5gbM7p	0.711	0.746	1	-4.224	1	0.253	0.0289	0	0.371	0.279	96.024	4	225573
7yB6GF5kgPEoeGE4EAWiJU	0.569	0.836	4	-3.831	0	0.226	0.0276	0	0.479	0.0927	75.701	4	250920
0A1owXuxPwqTQPqOJcmUGz	0.595	0.798	11	-10.198	1	0.446	0.0852	0	0.196	0.392	92.114	4	237013
1f0tj0IQ28OXq7hS0Rz0LH	0.629	0.73	6	-5.223	0	0.292	0.0764	0	0.361	0.658	80.361	4	230080
6jq6rcOikCZAmjliAgAmfT	0.57	0.763	1	-4.137	1	0.0573	0.0857	2.49e-06	0.0932	0.43	150.088	4	239853
6Dg3ArDiJcseYoeeTZZXK6	0.538	0.694	3	-7.035	1	0.0483	0.143	0.098	0.112	0.425	145.007	4	206793
6VpRQDOM7nQ6viuVUSXWGn	0.401	0.786	1	-6.455	0	0.055	0.367	0.0065	0.134	0.264	134.87	4	201199
7uSZPbd8DxdkmSauCKnITY	0.747	0.491	6	-6.043	1	0.0639	0.197	1.77e-05	0.0837	0.827	145.034	4	266483
3LnoLo62GjfKDYIN7eJpPB	0.416	0.615	5	-7.898	1	0.0452	0.123	0.00171	0.273	0.181	130.228	4	311625
7snnEDYwv30hRtmifVni8P	0.573	0.69	2	-4.939	1	0.0399	0.523	4.58e-05	0.148	0.345	155.138	4	260903
1k3J7o5b0tDUzbllLycVUJ	0.45	0.771	11	-4.588	1	0.106	0.433	0	0.204	0.41	150.024	4	228000
3H8h60jhdQNu5s9HHTLdFr	0.483	0.632	2	-5.624	1	0.0351	0.0419	0.000622	0.422	0.363	146.936	4	228125
4AqH4V7PEC5BTK29FVmXQd	0.593	0.569	8	-7.071	1	0.164	0.208	0.00442	0.221	0.3	149.908	4	220800
1rS3g0pYnbnwTtj3A4OvXP	0.458	0.73	0	-5.582	1	0.0406	0.237	0.0059	0.223	0.0854	134.968	4	341476
0sGTf0ZhFsJqS3h48oVAY5	0.497	0.546	3	-10.737	0	0.137	0.743	6.27e-05	0.0844	0.86	88.265	4	201613
1heBExZeADNocdIDP9vE8E	0.614	0.411	11	-11.534	1	0.189	0.829	9.26e-06	0.566	0.633	77.341	4	246293
0n7K7V7ni5VBL65TzDMVwn	0.526	0.449	2	-12.797	0	0.242	0.823	0	0.449	0.825	93.238	4	262640
4E7M4Yz0kFfidlGnllvuTI	0.87	0.392	3	-13.143	0	0.507	0.699	0	0.302	0.79	145.431	4	212413
05BnyatUof9QNcvTXzdtW4	0.744	0.423	2	-13.645	1	0.359	0.817	0	0.322	0.91	82.515	4	102280
7BYIzRTZDMMWrUYOJAtj19	0.71	0.443	2	-12.757	1	0.0714	0.847	0	0.0975	0.819	96.477	4	224933
7ICqkvo7Md45yI1XEYQBsw	0.508	0.505	4	-12.099	1	0.0622	0.861	0	0.166	0.967	93.355	4	350693
5eqpyyK2p7CbMofum6rRQK	0.765	0.365	4	-15.369	1	0.203	0.887	0	0.0677	0.803	92.727	4	87560
1X4x5dsB2OhY4CctleooV2	0.901	0.833	11	-5.396	1	0.189	0.322	0	0.112	0.446	94.26	4	285160
0NWwLNAS3Xfy1WRleGrmaV	0.92	0.64	2	-6.708	1	0.312	0.366	0	0.114	0.649	92.96	4	219293
51Fhx9LB9isxUbvEFvDTh7	0.89	0.814	11	-6.88	0	0.148	0.355	0	0.104	0.77	128.475	4	194320
3UssRQyQL6OEuYXWkDmYmr	0.83	0.67	2	-6.189	1	0.361	0.0815	3.87e-06	0.343	0.957	180.338	4	171427
5FmjAvHSzqXiuyiq1Ds7Ml	0.842	0.648	11	-6.939	1	0.255	0.172	0	0.374	0.389	85.467	4	276520
7aw2aLN4VypvfP90ns4Oqs	0.821	0.88	6	-4.02	0	0.163	0.0648	0	0.188	0.845	109.992	4	198613
2iLLM4nKqHLUqYFZZIVWJ4	0.674	0.514	8	-7.837	0	0.29	0.528	0	0.103	0.479	164.11	4	230947
1ZbvEfR0gXKeuDSEtwdrwH	0.748	0.546	3	-8.898	1	0.0368	0.579	0.695	0.0919	0.822	79.762	4	96400
4arFkQK84KZjA7UPpunJ2y	0.646	0.677	7	-6.519	1	0.304	0.359	0	0.314	0.787	100.814	4	223013
5KdWhOz7etD59lB2ehc6xo	0.843	0.753	11	-5.573	0	0.369	0.019	0	0.484	0.298	90.06	4	325560
0tgVpDi06FyKpA1z0VMD4v	0.599	0.448	8	-6.312	1	0.0232	0.163	0	0.106	0.168	95.05	3	263400
3rmo8F54jFF8OgYsqTxm5d	0.807	0.893	11	-3.745	0	0.0347	0.0451	2.79e-05	0.366	0.537	126.011	4	230747
50nfwKoDiSYg8zOCREWAm5	0.788	0.859	2	-2.724	1	0.0856	0.281	0	0.0424	0.822	141.02	4	207853
7qiZfU4dY1lWllzX7mPBI3	0.825	0.652	1	-3.183	0	0.0802	0.581	0	0.0931	0.931	95.977	4	233713
2DB4DdfCFMw1iaR6JaR03a	0.756	0.697	8	-6.377	1	0.0401	0.182	0	0.333	0.956	94.996	4	206071
6fxVffaTuwjgEk5h9QyRjy	0.614	0.379	4	-10.48	1	0.0476	0.607	0.000464	0.0986	0.201	107.989	4	258987
4zrKN5Sv8JS5mqnbVcsul7	0.574	0.852	2	-1.248	1	0.0397	0.0529	0	0.161	0.501	123.038	4	209027
1Slwb6dOYkBlWal1PGtnNg	0.781	0.445	2	-6.061	1	0.0295	0.474	0	0.184	0.591	78.998	4	281560
0HaRLPnr887lcQM2YQzkff	0.87	0.479	9	-7.779	1	0.165	0.161	0.000157	0.209	0.717	104.059	4	159124
2RttW7RAu5nOAfq6YFvApB	0.522	0.385	0	-7.355	1	0.0288	0.536	0	0.135	0.236	89.792	4	207520
3ymSzAIqvWTxKYD0BBODbH	0.636	0.616	11	-6.32	1	0.0509	0.779	0	0.155	0.809	82.644	4	177467
6nAYtpcRsku5JoBUhXk5EA	0.594	0.673	3	-5.417	0	0.0985	0.866	0	0.111	0.686	77.966	4	217333
2hsjrCNUjG5vPLN2IcigtS	0.552	0.567	9	-6.963	0	0.137	0.728	0	0.13	0.763	78.175	4	172813
32eVHUmKEixGAX4hdNj5pR	0.652	0.633	11	-6.149	1	0.0831	0.682	0	0.187	0.798	78.001	4	229187
2rCB7ynjLw7iD1ZOI5zXvC	0.681	0.615	4	-7.201	1	0.146	0.678	0	0.136	0.941	92.361	4	304920
6hlxA75xLIaazYhqjFAGXq	0.562	0.845	7	-4.608	0	0.0486	0.69	0	0.185	0.775	77.015	4	249587
0OCFtx3jwLYfGxZ6Wcn7Aj	0.614	0.554	2	-6.778	1	0.202	0.665	0	0.289	0.556	84.457	4	189120
1WgOf7lU1lGH7wHsam8rCH	0.632	0.644	1	-5.263	0	0.101	0.291	0	0.0728	0.848	83.734	4	163467
36yAonKXZwKGJ6YVtkITRT	0.593	0.68	1	-4.585	1	0.057	0.559	0	0.365	0.839	82.337	4	153027
4NCwg4UvOsir3Vvozx0QFM	0.558	0.637	1	-4.866	1	0.098	0.647	0	0.575	0.815	82.581	4	209867
0xta6Gah3inmeHbj0e3F9a	0.894	0.615	3	-6.269	1	0.0826	0.0308	0.00921	0.309	0.661	120	4	193209
6BiCjPFN5rM9JPy5eP5mCs	0.971	0.677	2	-6.895	1	0.092	0.0476	2.22e-05	0.112	0.58	120.027	4	158051
2RPbEp0DyBVlkRvvYKopO7	0.706	0.688	1	-6.357	1	0.269	0.151	0	0.466	0.313	125.966	4	330783
0Gt4nGWoATcQFL38a1NRao	0.652	0.906	9	-4.032	1	0.161	0.13	0.0681	0.504	0.559	125.103	4	167277
0VYchQkqpeEyh95D1pWqy2	0.838	0.634	11	-7.018	1	0.258	0.101	0.13	0.143	0.526	163	4	176683
5f6esnDQcBiFAm8iMfkw12	0.59	0.602	8	-8.195	1	0.413	0.577	6.59e-06	0.643	0.72	121.986	4	166087
71lyUtIPCMAYjTwwwxy2jW	0.667	0.523	10	-9.477	0	0.329	0.532	2.12e-05	0.137	0.409	143.934	4	232571
5FX89IUKm9QJT9ymrmyK4k	0.865	0.472	11	-7.359	0	0.237	0.223	5.39e-05	0.109	0.843	130.011	4	192029
4OWhcwHOnB7ZLGJI0Fo4oN	0.976	0.665	0	-5.75	1	0.152	0.00487	5.08e-06	0.115	0.756	119.965	4	106375
0qLt7pQhm8LDxFgI0YXdlY	0.608	0.676	1	-7.56	1	0.248	0.212	0	0.347	0.57	80.939	4	260632
519nSwwD1B5g1nw4iZkqsh	0.88	0.771	9	-10.558	1	0.065	0.00631	0.484	0.0797	0.609	139.941	4	87786
285pBltuF7vW8TeWk8hdRR	0.511	0.566	6	-7.23	0	0.2	0.349	0	0.34	0.218	83.903	4	239836
2RJAKIw6nIkgZVsAIKhmqz	0.633	0.548	5	-5.634	0	0.0467	0.269	0	0.16	0.35	160.011	4	192000
4VXIryQMWpIdGgYR4TrjT1	0.671	0.529	0	-7.226	1	0.307	0.0769	0.000335	0.0856	0.203	161.989	4	165820
6iaSML1PIYq936g62BDtBq	0.623	0.692	2	-5.122	1	0.0504	0.328	0	0.153	0.566	79.899	4	240051
2U5WueTLIK5WJLD7mvDODv	0.65	0.613	9	-6.13	0	0.128	0.00336	0	0.267	0.0804	149.972	4	194621
3oDkdAySo1VQQG0ptV7uwa	0.665	0.651	1	-5.515	1	0.156	0.0414	0	0.0896	0.237	163.935	4	175755
3wwo0bJvDSorOpNfzEkfXx	0.635	0.537	7	-7.895	0	0.0832	0.172	0	0.418	0.383	125.028	4	215381
5wujBwqG7INdStqGd4tRMX	0.736	0.67	10	-6.702	1	0.311	0.186	0	0.114	0.845	130.032	4	169999
1lsHg7CSPitu1R3VjLTFUv	0.482	0.772	7	-8.447	1	0.194	0.339	0	0.0927	0.704	93.306	4	683224
44em4VSTU8NBYyUZmYIOar	0.587	0.643	7	-8.815	1	0.118	0.813	0.00522	0.104	0.762	89.952	4	397967
1vtQFjkIN1chP0iLDgATQ0	0.694	0.851	5	-7.592	1	0.112	0.835	5.93e-06	0.112	0.962	98.397	4	238585
4eKd0hwevnvwxTUCKApZe4	0.79	0.676	11	-5.45	0	0.0869	0.23	0.00468	0.115	0.347	105.006	4	797714
6BOpez82pPBooERz4yvdYP	0.683	0.774	0	-7.041	1	0.044	0.652	0	0.325	0.85	93.664	4	241743
5jRiMVtNu3XF45niBV1QY4	0.817	0.721	3	-6.009	0	0.0403	0.808	0	0.0531	0.919	115.544	4	230946
1KdHNhK8yloNM4Cr5bndbg	0.77	0.901	3	-7.008	0	0.129	0.709	3.52e-06	0.305	0.768	124.491	4	269003
092uPpAF9zVl7WbpVdSJFL	0.675	0.646	2	-11.371	1	0.254	0.252	0.742	0.0738	0.703	109.577	4	367200
0ct6r3EGTcMLPtrXHDvVjc	0.527	0.835	6	-5.298	1	0.0433	0.0166	0	0.249	0.654	125.983	4	176658
0nrRP2bk19rLc0orkWPQk2	0.532	0.783	2	-5.697	1	0.0523	0.0038	0.0012	0.161	0.643	124.08	4	247427
2P4OICZRVAQcYAV2JReRfj	0.579	0.736	6	-3.863	0	0.0527	0.31	0	0.198	0.613	127.999	4	230613
5UqCQaDshqbIk3pkhy4Pjg	0.584	0.889	1	-5.941	0	0.0343	0.0462	0.828	0.309	0.464	126.04	4	199907
6Pgkp4qUoTmJIPn7ReaGxL	0.662	0.858	2	-4.844	1	0.0428	0.00163	0	0.0456	0.295	133.993	4	181673
4lhqb6JvbHId48OUJGwymk	0.545	0.78	7	-4.867	0	0.0436	0.0309	4.64e-05	0.0828	0.458	125.014	4	255093
2x0RZdkZcD8QRI53XT4GI5	0.802	0.645	5	-6.181	0	0.0715	0.272	0	0.119	0.376	100.001	4	157202
4eDYMhIin1pSLIG96f1aD0	0.569	0.785	1	-4.057	0	0.0457	0.0505	1.12e-06	0.086	0.303	128.031	4	148387
75NhhYjHO43mvZgYtnXgti	0.655	0.666	5	-5.309	1	0.0612	0.134	2.12e-05	0.0683	0.272	102.977	4	181812
591nHHHzZl1NLt9PMKpinM	0.509	0.79	6	-3.782	0	0.0374	0.332	6.67e-05	0.316	0.638	127.946	4	208320
1bDbXMyjaUIooNwFE9wn0N	0.561	0.52	11	-9.342	0	0.244	0.0503	1.86e-06	0.355	0.424	153.15	3	239360
3F5CgOj3wFlRv51JsHbxhe	0.529	0.673	0	-4.711	1	0.175	0.000307	2.41e-06	0.093	0.366	165.921	4	218365
46s57QULU02Voy0Kup6UEb	0.908	0.546	8	-10.491	0	0.323	0.0127	0	0.0707	0.225	131.016	4	170502
2KLwPaRDOB87XOYAT2fgxh	0.749	0.63	4	-6.652	0	0.116	0.0623	0	0.353	0.445	122.03	4	242027
34tz0eDhGuFErIuW3q4mPX	0.841	0.358	9	-8.368	1	0.591	0.0201	0	0.39	0.329	158.014	4	261544
59nOXPmaKlBfGMDeOVGrIK	0.463	0.642	1	-4.474	1	0.34	0.314	0	0.0686	0.339	83.389	4	189893
7GeTsDIc5ykNB6lORO6Cee	0.734	0.605	1	-8.476	1	0.0699	0.0102	0	0.317	0.252	103.976	4	236795
2ZL7WZcjuYKi1KUDtp4kCC	0.773	0.701	7	-6.386	1	0.0512	0.01	0	0.163	0.203	129.963	4	214589
7l2nxyx7IkBX5orhkALg0V	0.934	0.614	5	-7.384	1	0.198	0.00274	0	0.123	0.616	144.045	4	160821
0wshkEEcJUQU33RSRBb5dv	0.849	0.433	5	-8.434	0	0.316	0.0407	0	0.388	0.395	142.11	4	152962
2Y0iGXY6m6immVb2ktbseM	0.705	0.712	6	-6.156	1	0.0385	0.0102	0.000855	0.1	0.62	97.512	4	299960
1jJci4qxiYcOHhQR247rEU	0.451	0.931	9	-3.871	1	0.0719	0.00076	0.0049	0.361	0.172	122.961	4	302840
3FtYbEfBqAlGO46NUDQSAt	0.763	0.803	1	-3.713	1	0.0351	0.0709	0.285	0.348	0.561	103.04	3	229640
4iG2gAwKXsOcijVaVXzRPW	0.438	0.94	2	-3.249	1	0.0452	8.74e-05	0.0777	0.3	0.421	100.99	3	261000
3td69vL9Py7Ai9wfXYnvji	0.645	0.938	11	-4.557	0	0.0391	0.0946	0.0226	0.159	0.495	140.886	4	263880
0t4z0WaQomQqPONghWn8c2	0.628	0.841	9	-4.583	1	0.0268	0.0285	0.00332	0.254	0.706	111.985	4	289853
6kblAEj0T0312fv5QWsXzo	0.761	0.637	7	-8.169	1	0.0268	0.439	0.0082	0.102	0.656	125.115	4	235387
19K3lUMJmOdeuOBTrbLm19	0.549	0.859	5	-3.993	1	0.0361	0.0964	2.36e-05	0.322	0.69	77.013	4	250773
3XOKU8CKSiQsuQHD5vhzo5	0.633	0.919	5	-6.208	0	0.0343	0.00596	0.273	0.43	0.805	147.97	4	278387
0wYPM5pexJu96AClrozpIh	0.591	0.863	4	-8.226	1	0.0321	0.0248	0.466	0.114	0.434	139.978	4	265880
40iJIUlhi6renaREYGeIDS	0.666	0.465	1	-8.545	1	0.26	0.0503	0	0.215	0.292	167.937	4	291175
2xLMifQCjDGFmkHkpNLD9h	0.834	0.73	8	-3.714	1	0.222	0.00513	0	0.124	0.446	155.008	4	312820
5uEYRdEIh9Bo4fpjDd4Na9	0.841	0.593	1	-7.846	1	0.0379	0.418	0	0.124	0.808	124.917	4	162803
51EC3I1nQXpec4gDk0mQyP	0.402	0.526	9	-6.741	0	0.0904	0.113	8.33e-06	0.105	0.312	81.404	4	339067
11kDth1aKUEUMq9r1pqyds	0.712	0.481	4	-5.415	0	0.0487	0.173	0	0.241	0.062	140	4	196138
6gi6y1xwmVszDWkUqab1qw	0.802	0.591	8	-4.895	1	0.225	0.0104	0	0.196	0.309	139.864	4	157712
0d28khcov6AiegSCpG5TuT	0.818	0.705	6	-6.679	1	0.177	0.00836	0.00233	0.613	0.772	138.559	4	222640
64dLd6rVqDLtkXFYrEUHIU	0.695	0.923	1	-3.93	0	0.0522	0.0425	0.0469	0.116	0.551	108.014	3	215150
1foMv2HQwfQ2vntFf9HFeG	0.676	0.703	8	-5.815	0	0.0302	0.0869	0.000687	0.0463	0.852	92.761	4	200173
0q6LuUqGLUiCPP1cbdwFs3	0.689	0.739	2	-5.81	1	0.026	1.51e-05	0.509	0.064	0.578	120.423	4	233867
7yMiX7n9SBvadzox8T5jzT	0.663	0.694	10	-8.627	0	0.171	0.0253	0	0.0698	0.525	167.953	4	340920
4Hff1IjRbLGeLgFgxvHflk	0.76	0.891	11	-5.852	0	0.0372	0.0229	0.0869	0.298	0.966	120.264	4	245000
3lIxtCaROdRDuTnNBDm3n2	0.726	0.815	11	-5.886	1	0.0313	0.00799	0.081	0.112	0.462	140.158	4	209560
2W3ZpQg9i6lE6kmHbcdu9N	0.741	0.913	2	-3.34	0	0.0465	0.00343	0.103	0.325	0.643	120.012	4	213750
0dFwiyWPwC2yML3ZH7B56V	0.533	0.855	0	-4.747	1	0.0388	0.00186	0.375	0.0567	0.464	75.011	4	220106
2bfGNzdiRa1jXZRdfssSzR	0.625	0.877	10	-7.176	0	0.162	0.0315	0.0811	0.672	0.865	192.296	4	230426
51pshtuYkgUQnt5huMPbKL	0.794	0.766	9	-3.894	0	0.0377	0.0135	0	0.0785	0.55	127.007	4	195873
0N9C80kcgL0xXGduKnYKWi	0.735	0.812	2	-4.417	1	0.151	0.528	0	0.186	0.584	109.835	4	162876
5bJ1DrEM4hNCafcDd1oxHx	0.52	0.538	1	-8.109	1	0.206	0.367	0.00187	0.119	0.177	141.894	4	345133
6GnhWMhgJb7uyiiPEiEkDA	0.843	0.435	8	-8.442	1	0.178	0.47	0	0.147	0.19	120.058	4	208080
1OubIZ0ARYCUq5kceYUQiO	0.465	0.225	4	-12.637	0	0.0455	0.948	0.00155	0.18	0.207	57.75	4	256427
4gT3mNJA8lnlkYFqGZ8IA2	0.516	0.546	5	-9.105	1	0.249	0.814	4.5e-06	0.0995	0.515	78.267	4	271733
2hwOoMtWPtTSSn6WHV7Vp5	0.742	0.553	8	-8.98	1	0.419	0.389	0	0.0694	0.508	84.931	4	209440
1DWZUa5Mzf2BwzpHtgbHPY	0.794	0.32	1	-12.92	0	0.173	0.853	0.134	0.112	0.241	174.088	4	342040
01z2fBGB8Hl3Jd3zXe4IXR	0.272	0.238	2	-12.148	0	0.0349	0.89	0.00925	0.275	0.119	83.507	4	161840
5iUQMwxUPdJBFeGkePtM66	0.836	0.67	5	-6.907	0	0.23	0.00826	0.000355	0.0837	0.556	107.018	4	305350
7kdyc52WSOnaYetBSS4mE5	0.886	0.539	1	-9.838	1	0.403	0.269	7.11e-05	0.0884	0.471	134.93	4	231800
5edZrk1cC6VFtlryFT0QDx	0.812	0.39	8	-11.593	1	0.0399	0.417	0	0.0619	0.966	87.954	4	327173
61qCCgptAHVqP8DLzDdDWS	0.778	0.54	0	-8.494	0	0.224	0.28	0.000722	0.098	0.45	134.855	4	217027
3OefJy3MhpFwc3I8dj1A5n	0.923	0.472	8	-9.496	1	0.224	0.217	0	0.0826	0.413	134.992	4	303067
0MJcKr4SRFFPAj7h8T8Y2u	0.91	0.52	8	-10.151	1	0.275	0.348	0	0.0794	0.382	134.973	4	211707
1gxuZDZ3iD4umJebIEAQ5c	0.825	0.507	8	-11.269	1	0.181	0.348	0	0.0734	0.861	87.995	4	243307
4qtZIirGU2wcP2faEv0jry	0.898	0.43	1	-12.233	1	0.222	0.378	0	0.074	0.887	88.023	4	256040
2JMJMtzG0shNuHmaJ1uk6q	0.753	0.438	0	-9.631	0	0.142	0.562	0	0.111	0.821	87.988	4	432133
4Amw1lKBUbmaanUTGzv77U	0.578	0.551	10	-6.196	1	0.0313	0.853	0	0.0833	0.946	80.186	4	119240
4RXnp2ZTi0CyetuM6xTcjg	0.635	0.682	1	-4.977	0	0.0576	0.805	0	0.119	0.785	92.171	4	194973
4q8CVsKQcAeNZ3RguQjmTU	0.704	0.662	5	-6.836	1	0.092	0.589	0	0.152	0.682	113.069	4	192960
1EIWddhCtay8sMJeu58lvm	0.578	0.471	6	-6.451	1	0.0361	0.846	0	0.099	0.392	86.509	4	259680
7z8F1kHqUvh8jA4hztNeU8	0.583	0.428	6	-6.618	1	0.196	0.824	0	0.0903	0.376	132.294	4	594933
7eiI2R22MxDNVLN7S9VqVH	0.889	0.377	11	-7.961	1	0.0389	0.799	0	0.116	0.579	104.973	4	113067
2xmOKduEJr0OwXim7ngrGG	0.666	0.644	11	-6.321	1	0.0461	0.565	0	0.123	0.926	82.646	4	274800
4cy68Rp4tdkCVoo8lj30F5	0.635	0.445	11	-5.252	0	0.0472	0.571	0	0.195	0.734	145.445	4	128840
6wiM5H4NW3WIOBoXhQ4dj9	0.779	0.398	5	-9.771	1	0.12	0.848	0	0.476	0.679	123.293	4	233840
77QQcQ7wIeaKL6Qs7Xxd08	0.443	0.715	3	-6.767	0	0.275	0.647	0	0.416	0.895	96.876	4	265480
3ATP7JXuBSLUXkZqzRYFoC	0.807	0.668	6	-6.73	1	0.238	0.531	0	0.594	0.962	95.608	4	131267
3OevO7P8qXFaxB5R6GIfn0	0.596	0.461	10	-8.757	0	0.0561	0.796	0	0.626	0.585	127.106	4	650333
1CimagjBZShN4Tju88HJZ0	0.664	0.683	6	-6.905	1	0.111	0.558	0	0.477	0.913	135.841	3	98907
5iUP22DajCVfhuesgQT8Cz	0.825	0.459	0	-8.483	0	0.082	0.834	0	0.61	0.693	120.598	4	178907
2y1Zu0XQcOmX90TCj1q40v	0.648	0.595	6	-6.618	1	0.288	0.502	0	0.245	0.969	201.236	4	74400
15uf8cMOumUbwio2InLSRD	0.75	0.606	5	-7.016	0	0.297	0.639	0	0.551	0.968	95.173	4	99400
2bSnBMXCNPP7WyGoCzDGc8	0.783	0.628	10	-7.449	1	0.339	0.661	0	0.273	0.971	96.725	4	100840
0OpfYRVsgQ9LHX8oLtkMLO	0.827	0.486	11	-7.257	1	0.226	0.489	0	0.113	0.847	98.698	4	103133
0hQbovQO5Cui5Imze8Q3oo	0.568	0.458	9	-9.566	1	0.0278	0.815	0.000177	0.109	0.449	95.111	4	292307
1wuB9MID26ep43OlkOtBXd	0.542	0.443	9	-13.246	1	0.0416	0.339	0.000199	0.382	0.932	87.254	4	214933
0C13P4IghHNFPjt4zIJ8vX	0.356	0.272	2	-13.263	1	0.0368	0.508	2.02e-05	0.263	0.509	113.345	4	212933
3ejU8JMenktibKkNz9dPBL	0.651	0.151	0	-17.553	1	0.0422	0.959	0.00759	0.722	0.379	117.721	4	176563
6kCjKljGsnyzXaKKH9Cbgu	0.626	0.0914	0	-20.211	0	0.0856	0.826	0.000131	0.113	0.471	121.171	4	180453
5X7YQ1Wp36sNprUKZSPLFK	0.816	0.723	5	-8.42	0	0.0656	0.223	8.13e-05	0.0591	0.926	93.953	4	210133
0L1yQFYhyqNAWcBgIUV67g	0.734	0.831	2	-6.697	1	0.322	0.803	0	0.067	0.568	104.166	4	142602
0SFPOFERSw2S0LHZKn1922	0.856	0.732	8	-7.695	1	0.255	0.803	0.000267	0.182	0.642	105.767	4	109793
2i9zvqrXQG26kEu2NTS7O5	0.765	0.861	11	-7.735	0	0.15	0.82	0.0411	0.0521	0.721	167.26	4	150596
2pNPgdqUPD1o8hINF6wGqu	0.854	0.74	0	-8.952	1	0.272	0.966	0.803	0.0935	0.646	82.381	4	113241
2A3yr7MEP0nuNUDILrcUzb	0.786	0.558	4	-8.913	1	0.331	0.958	0.000195	0.191	0.871	103.558	4	536398
2wwvaVeLrZoMXyoZka0Lhg	0.747	0.575	11	-9.378	1	0.33	0.829	2.57e-05	0.0603	0.231	101.311	4	139598
4ikNVocxDbLrZaEZsF3OlG	0.909	0.822	2	-8.391	1	0.17	0.898	0.0162	0.136	0.427	99.684	4	177842
37o6Qp0N3sM45KuWrmggJU	0.73	0.582	2	-10.249	1	0.342	0.99	0.0466	0.278	0.848	107.002	4	449933
1NhN6IoHQgig0OBC2PhhK0	0.426	0.887	2	-15.236	1	0.304	0.732	0.305	0.764	0.824	152.795	4	83547
16G3MldzNlwg0Z5f3QqgqD	0.69	0.464	11	-13.771	1	0.0991	0.723	0.15	0.0407	0.668	78.013	4	228093
1Zv4IM34qfZDUAXphMsgKy	0.719	0.44	6	-12.763	1	0.0416	0.836	0.00171	0.062	0.851	87.278	4	216933
4MGnJCU8aFXT6LzQ7WHOzE	0.697	0.499	11	-13.156	1	0.0601	0.821	0	0.469	0.941	99.193	4	213640
4P2SJB4mGJ0DpusrKbrGBV	0.733	0.476	11	-15.107	1	0.0815	0.855	0	0.174	0.564	106.337	4	201693
0iSPxBpIugjKUCtaA09lJ9	0.753	0.722	4	-14.555	1	0.0562	0.782	2.1e-06	0.245	0.771	106.735	4	96333
4KWBI1Wahst6TL5nCtdYco	0.885	0.506	11	-15.92	0	0.0475	0.645	5.71e-06	0.136	0.945	96.856	4	197733
7jqm2nYr4bgr5k3mPdO3Of	0.759	0.439	1	-16.689	0	0.063	0.801	0.268	0.0931	0.837	144.397	4	183107
77nHLoT85IkKuq8f0HOerE	0.714	0.443	6	-15.749	1	0.115	0.766	0	0.191	0.957	108.391	4	119573
2vI5ny3qb8S3sXdlxMl5P0	0.826	0.52	9	-15.622	1	0.0739	0.742	0.0576	0.0856	0.964	108.83	4	158427
28UlfpwBBPTpvu9nsgHp2g	0.73	0.431	1	-13.536	1	0.076	0.872	0	0.0781	0.745	76.816	4	202333
1fEGtTZjrjJW8eUeewnNJR	0.369	0.403	3	-7.996	1	0.0259	0.827	0.0541	0.106	0.177	154.899	3	241917
5JEM7lT9uSyhUsKFXwGfSm	0.627	0.247	1	-13.303	1	0.0321	0.811	0.0587	0.112	0.639	125.305	4	170217
1MxHIIzcTeFnaNsDGY3pfj	0.512	0.501	5	-9.971	1	0.0325	0.609	6.25e-05	0.0973	0.726	79.989	4	231755
6HbxpoChDH9ThadFOSAnma	0.662	0.322	1	-15.115	1	0.0304	0.855	0.0019	0.144	0.425	115.771	4	195200
6UIxGIqWlO5wsddY44AV1R	0.386	0.205	4	-16.699	1	0.0366	0.653	0.0448	0.106	0.623	172.373	4	152613
0QYgtwYCftkAqunXmvkZtr	0.384	0.366	7	-10.65	1	0.0329	0.371	9.17e-05	0.101	0.199	138.134	4	261370
6dDxgfvM8pJm7AzmLZB1nN	0.611	0.275	6	-10.644	1	0.028	0.808	0.911	0.403	0.552	94.116	4	251280
7dP4k5nDDwI1qMDoz5m0f6	0.634	0.419	0	-10.386	1	0.028	0.499	0.00438	0.124	0.562	118.838	4	212487
2xa9PoO42d7VjT0KqG5d3I	0.47	0.237	2	-15.593	1	0.0348	0.837	0.464	0.115	0.358	81.268	4	207773
6iw32k0OUKHildYsQTRnVB	0.245	0.242	4	-12.963	1	0.0318	0.965	0.00833	0.271	0.138	135.714	3	267120
45pUWUeEWGoSdH6UF162G8	0.642	0.533	2	-7.45	1	0.266	0.0104	0.000108	0.251	0.112	120.041	4	225439
0sSRLXxknVTQDStgU1NqpY	0.501	0.403	6	-11.106	0	0.119	0.234	0	0.267	0.111	118.352	4	399154
7MiZjKawmXTsTNePyTfPyL	0.391	0.396	1	-8.621	0	0.189	0.702	0.405	0.315	0.199	99.112	5	131272
62N2JSA0jHmSH7Va9t7hIf	0.735	0.686	4	-7.562	0	0.0366	0.00108	0.874	0.0933	0.0656	121.011	4	258933
0uYmQ3X53P03KWj83u5I59	0.356	0.576	2	-9.825	1	0.145	0.641	0.000921	0.311	0.444	127.99	4	225022
4aVbFYIU67P8F5pqPakaXQ	0	0.236	7	-13.909	0	0	0.962	0.000335	0.105	0	0	0	157041
3kKbRNJmzSWdDgfKqJ9Eck	0.411	0.523	11	-11.786	1	0.241	0.782	9.08e-06	0.293	0.205	144.738	4	220727
6ZT3coOj97F6CVvruPtnox	0.487	0.68	7	-8.497	0	0.0408	0.000599	0.0339	0.144	0.0752	94.46	3	324807
4U9kJBr61UhO5srPib7zyz	0.718	0.443	2	-12.369	0	0.0458	0.911	4.71e-05	0.0972	0.442	109.041	4	255530
0TxPln0uhql4ucFGk1XISM	0.595	0.645	1	-5.877	1	0.0744	0.708	0.00884	0.11	0.367	81.969	4	170387
3bjLA6ukBcGtvhe5tybxp7	0.774	0.295	6	-9	0	0.0741	0.893	0.00163	0.0637	0.197	141.003	4	177046
1DehtVbbTjUQjxGaXd5PnH	0.5	0.308	7	-14.472	0	0.0615	0.853	0.937	0.174	0.138	129.116	4	210308
3EmNjy3zFszmAOCikiKxCd	0.542	0.838	6	-5.198	1	0.0392	0.00216	2.05e-06	0.0829	0.423	106.044	4	221827
7ryIN2iKJiWvvIgEUAZieL	0.595	0.884	8	-3.075	0	0.0392	0.0382	0.000118	0.142	0.518	97.02	4	190773
7GXxHj3tEDoJJbeoiAFL5H	0.455	0.928	6	-3.919	1	0.0524	0.000561	0	0.104	0.414	151.928	4	213169
5mMbj4tHHK7rKA5xsjpxgy	0.503	0.406	4	-7.996	0	0.0274	0.0824	0	0.19	0.11	110.587	4	260465
0hH4tifGuOUFfosHyWYksB	0.305	0.939	8	-3.476	1	0.0747	0.000312	0.00045	0.394	0.416	117.305	4	226717
5OSxX2OPiEN4Y9xmxVbCuV	0.416	0.588	4	-5.772	1	0.028	0.00222	0.00596	0.0992	0.309	72.99	4	237653
6BAsBBihclKUFYHFgfblVs	0.284	0.315	4	-11.167	1	0.0297	0.963	0.631	0.117	0.064	101.046	4	163201
2WABC8g95w3gco43ssbnZS	0.481	0.962	6	-2.901	0	0.107	0.000873	7.8e-06	0.097	0.389	149.039	4	244934
7BwOeJFK3isNQjk0OSydYW	0.481	0.495	10	-6.3	1	0.0281	0.608	0	0.0951	0.299	160.044	4	211973
4Th8cKZu3Cv86XkVy0MvEC	0.45	0.733	5	-5.375	0	0.0292	0.0339	2e-06	0.143	0.394	146.936	4	201267
1yvZL7uOOShmjYNR16LUhf	0.784	0.809	10	-7.287	1	0.194	0.523	0	0.0604	0.525	107.975	4	175613
075IuZsbrbseQft103cyGf	0.722	0.945	0	-7.76	1	0.039	0.235	0.567	0.0775	0.754	119.993	4	189493
3DWaW63wUHFFd3uPb3zxOG	0.74	0.875	7	-4.88	1	0.0773	0.431	0	0.0832	0.937	91.018	4	205747
6wKFvNbzWbDYF3l8zhHG9Y	0.668	0.685	7	-8.19	0	0.0443	0.453	1.95e-05	0.135	0.61	100.043	4	230800
4c0sQihy8sC6seVq58flWk	0.763	0.713	6	-5.86	0	0.106	0.0784	0.28	0.0832	0.969	160.058	4	169520
6OQbZkUt3lrAL5IxpnfWl2	0.821	0.856	1	-6.544	1	0.126	0.0013	0.618	0.0664	0.745	90.008	4	177533
4GN2wb0tsbw6bYy547NVLz	0.688	0.776	2	-6.116	1	0.0461	0.0976	0.863	0.0774	0.656	97.987	4	208867
76DHj55PsSlbUmBgtJFW19	0.845	0.866	1	-7.933	1	0.133	0.0648	0.325	0.0662	0.451	139.985	4	173253
78Vr6h9qESHnTkN60Uiyak	0.71	0.876	11	-6.293	1	0.195	0.217	8.41e-06	0.121	0.804	89.958	4	235173
6HL03eZbvf3OA81tUZEyh0	0.623	0.488	0	-6.674	1	0.067	0.858	0	0.645	0.906	72.306	4	67813
22hUmBHDGOUv5wGSgdL8n6	0.759	0.347	6	-10.019	1	0.188	0.902	0	0.129	0.61	124.895	4	75413
4de69eAJNEpQQSjilA9d4a	0.666	0.492	5	-8.506	1	0.0586	0.747	0	0.342	0.699	128.058	4	62013
6nkyoFpw96gRuCto4B8uzw	0.702	0.509	3	-9.332	0	0.105	0.889	0	0.177	0.581	74.444	4	68453
4VPVkg5yKgMKH4LczJEHwH	0.707	0.412	5	-11.61	0	0.531	0.897	6.75e-06	0.132	0.566	117.982	4	61227
0mALRdpqjWgYqT6psEvCRo	0.605	0.475	0	-9.229	1	0.0505	0.922	0	0.491	0.758	139.723	4	79413
3wJOOOjEuoF7JLwZASAr3U	0.562	0.44	10	-8.651	0	0.0418	0.65	0	0.567	0.715	138.29	4	57160
1I9hUdCQaLcdQr9MtqY20k	0.551	0.493	3	-9.039	0	0.0541	0.763	0	0.237	0.568	134.501	4	260360
3FhJkEJjDb54FGauk92KBl	0.639	0.364	6	-11.179	1	0.418	0.774	0	0.121	0.621	133.396	4	73320
6x4IkaBTb9UN2TkF0Z5eYL	0.715	0.488	1	-9.067	1	0.195	0.891	0	0.672	0.651	128.338	4	87893
4cktbXiXOapiLBMprHFErI	0.775	0.327	11	-7.241	1	0.0557	0.841	0	0.0821	0.595	91.05	4	189486
4P0osvTXoSYZZC2n8IFH3c	0.739	0.756	4	-4.828	1	0.0394	0.0136	0	0.37	0.523	110.028	4	231387
4gbVRS8gloEluzf0GzDOFc	0.742	0.713	1	-5.522	0	0.0303	0.0205	0	0.059	0.879	120.032	4	189960
5zFglKYiknIxks8geR8rcL	0.713	0.676	10	-5.483	1	0.027	0.0377	0	0.154	0.721	99.048	4	227395
2iuZJX9X9P0GKaE93xcPjk	0.748	0.788	1	-7.055	1	0.0334	0.0591	0	0.0863	0.884	120.076	4	235493
2bL2gyO6kBdLkNSkxXNh6x	0.279	0.742	4	-6.46	0	0.0898	0.000185	0	0.593	0.328	189.868	4	231013
6ECp64rv50XVz93WvxXMGF	0.712	0.862	5	-4.612	0	0.0378	0.0525	0	0.093	0.809	95.051	4	206200
7LcfRTgAVTs5pQGEQgUEzN	0.722	0.758	11	-4.477	0	0.0471	0.0111	0	0.308	0.62	128.047	4	201160
4llK75pXNWZz6KAho2Gp16	0.651	0.663	0	-5.569	0	0.0281	0.228	0	0.0994	0.465	102	4	259453
4XNrMwGx1SqP01sqkGTDmo	0.718	0.82	5	-3.453	0	0.0323	0.0444	0	0.0846	0.613	92.998	4	219467
36GK0zhH2G52EJTP6FCG86	0.532	0.471	0	-9.064	1	0.331	0.794	0	0.2	0.452	79.699	4	394980
1Gb8fNgiPnJFuC9yAmUN32	0.488	0.477	11	-6.846	0	0.0837	0.737	0	0.269	0.809	83.265	4	429984
7bysuZQRmiZF5f0ylO1PW3	0.482	0.425	9	-9.139	0	0.0759	0.785	0	0.218	0.863	80.579	4	423035
6bn9gXjHKqHUdCpzOC9GUZ	0.507	0.499	9	-7.395	1	0.143	0.681	0	0.359	0.772	84.019	4	438996
0Tcv6S71vFaRktNG9TX8kr	0.601	0.461	9	-7.766	0	0.236	0.763	0	0.268	0.831	109.695	4	411515
6VfZMviYxr1fXHshHSpUCC	0.48	0.402	11	-9.772	1	0.101	0.802	0	0.329	0.637	81.362	4	483457
7FJ69qi4X4ZlzsW1ikQFpb	0.499	0.423	9	-10.77	1	0.316	0.774	0	0.148	0.767	83.959	4	318964
6v4UVEpozyMwetw9NOvJee	0.485	0.574	5	-10.082	1	0.413	0.704	0	0.423	0.686	80.789	4	367659
5iWX0JLUmdOdxl8IwWVoLB	0.484	0.421	10	-10.505	0	0.181	0.839	0	0.124	0.786	79.555	4	435947
6Gh4DYlRKid8w5zNbR8M98	0.548	0.412	4	-12.953	0	0.177	0.744	0	0.594	0.75	142.565	4	447145
1S1bZVv8sqYY39S6KWchuk	0.866	0.563	6	-6.965	0	0.102	0.187	0	0.0888	0.309	127.905	4	161668
3Hha9pVZsWGwQiFKvsMrwS	0.87	0.65	2	-7.706	1	0.385	0.418	0	0.118	0.726	142.975	4	187972
11RIJRbBfyLlJut96itSFd	0.836	0.614	8	-4.543	0	0.311	0.345	9.86e-05	0.088	0.603	101.97	4	199521
0Z5HVNSXGXHf7MDb0zJHVW	0.947	0.652	6	-4.292	0	0.233	0.156	0.000346	0.0651	0.447	110.031	4	179800
3nG784YlxS4VQOF0qiHKVP	0.781	0.72	6	-8.347	0	0.165	0.112	4.1e-05	0.153	0.403	150.074	4	168400
44GokgCa37BTZP2NU2zkoJ	0.656	0.746	7	-4.716	1	0.314	0.126	0	0.508	0.824	104.044	3	188939
2Jy4EdqIZswDZvVDh5dx3A	0.561	0.722	4	-6.437	0	0.068	0.173	4.86e-05	0.175	0.173	103.099	4	234027
3tTDOodJcr6vKF2DASlwMZ	0.827	0.854	0	-3.43	1	0.238	0.334	0	0.073	0.869	139.089	4	185968
0kmxWw7KjktV4V1ZpbOeru	0.75	0.601	2	-6.809	1	0.184	0.0403	0.0014	0.0764	0.547	136.92	4	175347
6tTsNfuUnA8JbGY8GvupSt	0.697	0.57	4	-6.668	0	0.0502	0.819	0	0.256	0.861	90.067	4	171773
45uq0gzKNTbLQz9vNJCnff	0.503	0.638	4	-5.896	1	0.115	0.838	0	0.109	0.783	88.891	4	251347
4zMROpckk80sLKjw6tkawT	0.757	0.781	9	-4.535	1	0.116	0.761	0	0.225	0.543	125.25	4	169613
6Fnn1LaX3P2Cp5v8j4xKus	0.631	0.708	11	-3.183	0	0.0478	0.83	3.26e-06	0.311	0.779	89.243	4	124027
3C20qDtHYaVtofa6LhzNa1	0.65	0.601	0	-7.048	1	0.142	0.925	0	0.0584	0.528	153.841	4	175534
1Dpy0E104inl2X65Ql3Y6V	0.49	0.482	4	-10.966	1	0.133	0.842	0	0.142	0.807	85.889	4	251401
3ji7Cq0BDAyOZqeRJpDzie	0.85	0.358	0	-13.894	1	0.326	0.857	0.000125	0.109	0.372	82.916	4	122360
5tW7ndPplZCfvI1MOHHUmu	0.643	0.578	11	-6.228	1	0.0357	0.809	0	0.343	0.829	87.27	4	86573
0EzVzowY6rIB8VpiLLsRYK	0.564	0.758	0	-14.264	1	0.0886	0.522	0.949	0.094	0.969	118.143	4	209933
2b8YEV18sPCRStHLIK3aUg	0.745	0.822	2	-7.955	1	0.346	0.79	0	0.189	0.582	103.881	4	142813
26qUQwpITcSERRQHKoAOVC	0.764	0.786	5	-7.435	0	0.045	0.0234	1.8e-05	0.0651	0.658	113.966	4	190511
48cO0bR6orzUT4csoMLNNn	0.747	0.467	9	-7.766	1	0.0588	0.79	0	0.0784	0.434	123.084	4	182467
3LldLxInVpaT0AgIDpn4vw	0.784	0.856	10	-5.073	1	0.174	0.573	0	0.0497	0.47	107.996	4	176040
3G2r49FbOhh7osxOwLFFBX	0.768	0.741	0	-6.831	0	0.13	0.208	0	0.092	0.735	132.024	4	225933
7Li7QfaykOzZn1M2kExVft	0.907	0.788	7	-6.848	1	0.146	0.185	0.00556	0.119	0.824	129.045	4	125027
3XxM98K1e0HSdNIbpYhOVQ	0.74	0.875	7	-4.88	1	0.0773	0.431	0	0.0832	0.937	91.018	4	205747
7rgjTkoEzielkTQH5txOTC	0.444	0.714	6	-6.767	1	0.275	0.647	0	0.416	0.895	96.894	4	265480
49Pbi6nYfpkBZLjLE41LW8	0.8	0.859	10	-8.201	0	0.188	0.244	0.00369	0.326	0.451	100.373	4	145160
4zegu7nLeNfg61wxkOMY8C	0.763	0.713	6	-5.86	0	0.106	0.0784	0.28	0.0832	0.969	160.058	4	169520
1IGh7ZesvXXgiNlViqVqh8	0.869	0.942	10	-7.906	1	0.118	0.15	0	0.109	0.914	92.439	4	250267
2M2itA0spt6ZXit7l21WMJ	0.688	0.707	4	-5.749	0	0.158	0.0999	9.37e-05	0.157	0.297	128.032	4	151875
0c7OcnAQz6H3IIzQA3MP6C	0.541	0.768	6	-6.139	0	0.0545	0.122	0.000182	0.0761	0.0395	130.915	4	152061
7xonaZK7T4Z18vpx8LMNV2	0.837	0.776	2	-6.919	1	0.111	0.0221	0.762	0.0911	0.208	131.026	4	170382
7lrPlOCR3zXpXR9ZNHAOkX	0.814	0.791	3	-6.184	0	0.334	0.181	3.3e-05	0.247	0.527	127.986	4	126000
6SmvawO0Gp3P6B7b1A9dme	0.77	0.863	5	-5.138	0	0.283	0.242	8.54e-05	0.467	0.162	133.973	4	180896
18K5KELzE7eOlNSJK331T5	0.859	0.723	11	-7.36	0	0.101	0.00263	0.811	0.0345	0.948	128.007	4	151000
44Yt3A3eD9WuFpSAMNcN9M	0.784	0.696	1	-6.2	1	0.0602	0.0061	0.582	0.242	0.185	134	4	148657
22gwoAmeEcuEXRykQYkCEg	0.71	0.49	8	-7.22	1	0.0741	0.583	0.6	0.218	0.112	128.028	4	142038
3PdwZoy7TJcPGw7GI8GI4u	0.915	0.638	1	-4.709	0	0.116	0.0032	0.00134	0.656	0.36	130.95	4	183206
6dB6hoCnZMh8HHnDwC6uzq	0.632	0.595	7	-8.605	1	0.142	0.81	0	0.0485	0.739	99.486	4	254867
3UJi2gDm3F83DzoKpXQmK6	0.833	0.672	2	-6.871	1	0.102	0.776	0.351	0.0785	0.566	89.734	4	70267
5nD10SsobH1vinpLywA2v0	0.631	0.708	11	-3.183	0	0.0478	0.83	3.26e-06	0.311	0.779	89.243	4	124027
0SaX3d0lQxVk10l0BogLm6	0.717	0.878	2	-7.119	0	0.0866	0.669	0	0.0942	0.871	100.98	4	186373
5EpJgg2VVcY4d3eXr1xGfa	0.607	0.523	9	-11.381	0	0.0315	0.626	0	0.48	0.968	151.943	4	292947
4pWGuSvx4lsYz2TNAfddMN	0.389	0.423	11	-10.952	1	0.0504	0.977	0.000335	0.195	0.535	84.765	4	231372
745opsndWgiHRATVJnr9G8	0.795	0.501	1	-9.893	1	0.169	0.804	0	0.0531	0.827	119.127	4	258533
31q8oDJXYeGeOToU7T1uDH	0.606	0.386	1	-11.1	1	0.0842	0.901	0	0.128	0.761	77.924	4	231853
4p4TOJ0NSSZAviCvBZPiqs	0.795	0.194	1	-12.006	1	0.0741	0.363	0	0.213	0.433	120.917	4	86106
2Xy1UIVfOlukyye6Fd0wrI	0.673	0.729	6	-4.879	1	0.0496	0.083	0	0.1	0.675	122.023	4	169672
73QyyUMMvtNELmULI4FOsp	0.733	0.886	2	-1.856	0	0.0426	0.0481	1.81e-06	0.191	0.696	126.031	4	175435
73ucpKq91TuejrLHgzDNHK	0.579	0.738	10	-5.711	1	0.0542	0.0821	1.52e-06	0.232	0.431	124.023	4	202907
0FEk8LwY8h4rAR63ggfhV0	0.647	0.726	3	-4.389	0	0.0552	0.157	0	0.0844	0.769	114.998	4	198996
5Fla3zyOCcIRqrDoKLU0DP	0.475	0.846	10	-3.344	1	0.283	0.275	0	0.0824	0.451	96.036	4	191120
2ia7iiEtpiOL2ZVuWxBZGB	0.753	0.801	4	-3.215	1	0.0296	0.403	0	0.128	0.794	128.011	4	203467
5rlMVKnvE6ZSzNCs8ZyHqU	0.535	0.8	2	-4.569	0	0.0342	0.0183	0	0.421	0.175	113.023	4	242828
46xkXPGjR9Ig9BcaTUNus3	0.853	0.571	1	-5.845	1	0.0543	0.133	0	0.0564	0.958	117.991	4	180160
3y3brCCecHC3Db18aIOnny	0.591	0.705	9	-6.519	0	0.079	0.381	0.000116	0.131	0.27	121.799	4	215316
6Xy72HZ9nf2jx48dQuF1mA	0.649	0.743	11	-6.042	0	0.0679	0.0342	0	0.0855	0.344	106.915	4	215827
2DgAknj9a6riqm4h7mZdGD	0.717	0.816	6	-5.863	1	0.0433	0.345	0	0.114	0.875	100.033	4	220227
4vrW1O3nZJM8QQN8gzXubU	0.64	0.441	0	-9.741	1	0.0379	0.681	9.95e-06	0.71	0.36	103.061	4	229864
1WhWizm70M63k5UVIHX1Fe	0.564	0.416	10	-6.813	1	0.0423	0.554	0.00145	0.11	0.344	179.728	3	239560
4OID5ZgFFWJzAH5jdetEAn	0.452	0.182	0	-21.331	1	0.0499	0.837	0.000182	0.973	0.248	130.993	4	188080
0l9BjXMUwxN8QHmD8n7hFF	0.76	0.48	11	-8.562	1	0.0655	0.548	0.00139	0.971	0.438	120.124	4	300973
6yVSp9H2STyLeOs7pjy2w4	0.463	0.827	3	-4.085	1	0.0437	0.013	2.41e-05	0.0964	0.26	94.035	4	186867
1EotcFbWTbMCXeKFVEtX6Y	0.515	0.802	8	-3.423	1	0.0345	0.0321	0	0.0844	0.29	85.998	4	201347
6A4cQ6n7R5Kws0Gsan7gCF	0.445	0.638	8	-5.024	1	0.0273	0.00117	0.0528	0.105	0.15	174.045	4	233360
1fZhHANKVFNZ9W8iSh76gF	0.636	0.838	3	-3.988	1	0.0329	0.00143	1.22e-05	0.0573	0.318	101.584	4	199107
1VViTGNqiNV8zwe3b3tE09	0.453	0.528	1	-7.621	1	0.0319	0.411	0	0.193	0.218	141.992	4	226307
4NEAoEh4hZF1Tgp1QXrUHC	0.568	0.302	6	-7.817	1	0.0281	0.21	0	0.104	0.214	83.413	1	207200
1w5dZMSwIM242ymwTv0PAi	0.541	0.675	0	-7.682	1	0.0451	0.0249	0	0.0741	0.119	139.926	4	253560
7jvp8DZy7FtHeXdN1k8w2s	0.485	0.834	4	-4.851	1	0.0363	0.0453	1.01e-06	0.138	0.277	89.754	4	242453
2zpXEpZbAgQdhNyy6iwPwZ	0.796	0.426	0	-8.564	1	0.0393	0.305	0.000122	0.117	0.515	120.024	4	232176
3aouFaljxig7RLEmPLFtnj	0.539	0.895	7	-4.605	1	0.106	0.0119	0	0.135	0.556	169.98	4	168566
1PNpMSjXiBDvcPGU72ZPPh	0.806	0.794	1	-9.084	1	0.0407	0.0242	0.000742	0.191	0.696	123.999	4	203480
4DxRJQrvZOwj3qcw8M6buA	0.701	0.506	1	-7.973	1	0.052	0.58	0	0.0851	0.644	74.683	4	305827
4mCBnL9grVQwl5CqBaWtfL	0.607	0.542	10	-5.252	1	0.0691	0.82	0	0.0928	0.842	140.7	4	194200
3vUKsxHqRk4QLXPTiZrLVP	0.81	0.781	9	-4.107	1	0.165	0.68	0	0.0924	0.758	76.449	4	143667
4sjEulO9EpD7w41TaWx5Xr	0.738	0.523	11	-5.652	0	0.0873	0.736	0	0.0735	0.441	108.33	4	133227
2lzigdrNwf0ORO1NcxOoUO	0.829	0.516	8	-12.168	1	0.269	0.377	0	0.106	0.888	84.958	4	234120
0hD3LwiqNdE3a8yVgFAUnA	0.635	0.416	3	-5.409	1	0.0357	0.783	0	0.167	0.556	81.34	4	286107
44kQN9hPguaYxVoFa3Q8sv	0.77	0.414	7	-8.304	1	0.0746	0.739	0	0.068	0.468	120.905	4	107800
4RXZnPwSSISh7uYWvJ1fth	0.627	0.531	1	-7.844	1	0.0338	0.573	0	0.177	0.618	85.173	4	235187
4ZPWz8Lme2naqa1YLeUUk8	0.507	0.492	4	-5.764	1	0.0689	0.861	0	0.239	0.636	74.552	4	276733
3HwUZwgi9hxqd0FzcJ7WAs	0.672	0.346	11	-13.076	1	0.455	0.804	0	0.111	0.685	139.747	4	235298
0ENvhTTww1MVOulrzuxSmu	0.692	0.897	11	-4.969	0	0.0398	0.236	3.86e-06	0.116	0.968	106.163	4	226640
7CjSjWTdVPD0ov82Qz55Xb	0.446	0.793	2	-4.746	1	0.115	0.14	0	0.573	0.901	86.313	4	323773
5jKg6K5LjLH4RkVpxXqO6W	0.626	0.219	6	-18.227	0	0.0315	0.717	0.00513	0.702	0.267	100.101	4	293053
1G3tT3xLodVLyZV7MQDXin	0.725	0.299	4	-15.108	1	0.113	0.9	0.107	0.118	0.527	170.164	4	195200
48QajhR9A10V7uM2UbIWxO	0.641	0.522	2	-10.519	1	0.369	0.769	0	0.394	0.627	79.795	4	310400
6j7cLMzPmnmlP5f6qQk9Cl	0.572	0.109	2	-11.712	1	0.0483	0.941	8.41e-05	0.355	0.134	96.228	4	275882
38c0b6ZOc5g8WRZe8ssqlU	0.596	0.626	5	-7.335	1	0.335	0.742	0	0.135	0.797	87.282	4	273760
0OSvRcSUm7LcDqpUeM69p9	0.713	0.762	0	-5.646	0	0.0375	0.814	0.00386	0.147	0.961	112.023	4	68389
1n7VhRXtAIrzJFyQgs1rHv	0.819	0.725	3	-6.001	0	0.0401	0.82	0	0.0466	0.897	115.618	4	231393
4QWceg3uZikNjrTu7WdAIo	0.618	0.599	3	-7.216	0	0.255	0.634	0	0.204	0.804	111.112	4	195944
2O23IqySHayho5Vz6utLUj	0.824	0.576	8	-8.961	1	0.213	0.804	0	0.247	0.624	131.801	4	146260
6lZyOeja5VnjLcJXID5Hg8	0.798	0.491	3	-7.354	0	0.258	0.563	0	0.0758	0.859	146.847	4	690600
3eikIG2eUqhYNKD9oMTuye	0.695	0.652	11	-8.58	1	0.0629	0.817	0	0.556	0.926	98.813	4	210991
4Xs7u89f7XGy4Ayr7qMJ9g	0.747	0.581	9	-5.539	0	0.0571	0.799	0	0.136	0.529	130.019	4	226760
23nUrTSlZxZcBepKnV1awN	0.653	0.602	0	-4.424	0	0.0369	0.88	0.29	0.104	0.582	112.36	4	71471
36ZakwjewtzwQBkC3quEeI	0.699	0.6	10	-5.852	1	0.0525	0.762	0	0.31	0.774	133.106	4	306267
5tt394udRU89Pn2s3qPGaQ	0.81	0.3	9	-17.58	1	0.506	0.361	0.301	0.13	0.85	122.727	4	142640
4tTZq61IKisspn9NhoJtYn	0.559	0.706	2	-11.333	1	0.15	0.139	5.03e-06	0.0991	0.375	105.029	4	217640
6A7bFw2HCDcINCCQc8YrMb	0.786	0.416	4	-11.577	1	0.353	0.754	8.66e-05	0.106	0.789	123.174	4	139600
3wyElammb2nsBW3C9fAkIk	0.787	0.898	2	-9.948	1	0.0445	0.175	0.00556	0.336	0.825	104.954	4	325653
5kl98MGNOGnEeFCu4yjq9e	0.641	0.652	5	-8.825	1	0.171	0.84	0	0.127	0.846	127.827	4	178840
5fwEN7ftDTrqTpxOwadeIX	0.494	0.528	2	-11.866	1	0.0436	0.401	0	0.126	0.832	132.887	4	185080
1OVkk2RSizr8K76vJ5I4fH	0.503	0.595	0	-5.595	1	0.0651	0.879	0	0.12	0.686	77.854	4	545667
3eylvPuZoAkWdifEKCa1oQ	0.685	0.68	6	-5.129	1	0.156	0.86	0	0.107	0.633	69.7	4	220320
1UYcrnSD8Rnoq2WF63bm1p	0.75	0.312	0	-17.164	1	0.525	0.704	0	0.0977	0.586	59.887	4	94827
5YHU5831C6bRvOa6CVCM06	0.73	0.312	0	-14.519	1	0.256	0.851	0	0.136	0.742	62.33	4	69827
5nB2JGElpjz3S1mvuRqtmt	0.678	0.474	0	-12.309	1	0.0543	0.756	0	0.44	0.762	71.671	4	63400
5OHtcQ9E8yBPMkBJErXq2X	0.699	0.366	3	-14.174	1	0.0908	0.838	0	0.16	0.924	69.327	4	79507
3PiXFYaUEppQNIVd4oUHtm	0.594	0.261	2	-14.414	0	0.121	0.763	0	0.331	0.752	67.426	4	109440
5CnE8fSmlzy5lqRlMQLN8H	0.745	0.319	8	-13.27	1	0.0437	0.862	0	0.388	0.899	70.747	4	71293
30HDhoUonXtlCNbCf0Ba2K	0.791	0.402	2	-16.662	0	0.601	0.891	0	0.112	0.328	73.639	4	147693
7yipsQk69cuYXLUhNfjVAI	0.678	0.434	3	-12.155	1	0.0895	0.636	0	0.429	0.686	128.466	4	59040
27bGm75UZl3dAoAU7LNMia	0.616	0.607	6	-12.858	0	0.0961	0.609	0.755	0.101	0.904	81.454	4	107827
17OgIIdvc0KymFYcor26Gq	0.517	0.586	11	-8.739	1	0.274	0.752	0.000277	0.0929	0.936	92.734	4	159427
6y9HlkxnspyN5oR72nq8fR	0.722	0.526	3	-13.187	1	0.23	0.745	0.116	0.281	0.466	84.651	4	86853
2LujgCdmK3q7E1MUoQtqDQ	0.508	0.48	4	-9.95	1	0.235	0.657	0	0.0959	0.861	92.756	4	441773
0DOEEDHu8u8WibYECqV3jP	0.591	0.549	1	-13.181	1	0.342	0.851	0.0151	0.28	0.64	82.813	4	109693
44Lfg5afznXp2hPRJnSzOw	0.592	0.552	9	-13.125	1	0.362	0.874	0.0403	0.132	0.838	168.903	4	82920
2pywyi09scGdkNi867SC5L	0.597	0.465	4	-9.582	1	0.382	0.597	0	0.14	0.815	95.863	4	412600
2SE3og1vCHpzjeoCavKhAm	0.626	0.46	6	-12.929	0	0.402	0.782	3.55e-06	0.253	0.724	173.301	4	76160
2h57VIrvd8hOcN0y0Sys2v	0.593	0.505	9	-12.692	1	0.245	0.794	2.28e-05	0.162	0.676	83.404	4	72773
0CQjhFLfrrTjKqulms4Qdw	0.669	0.542	4	-13.479	1	0.299	0.838	0.0621	0.255	0.686	85.315	4	89613
4Jm9RwZ2C46J06ARRllUs5	0.26	0.655	9	-9.165	0	0.0383	0.0623	0.425	0.0884	0.215	150.617	4	69573
6ksqO0S2mvvwpyMhVpVYFx	0.518	0.715	7	-9.591	0	0.0343	0.0616	0.698	0.107	0.0769	119.889	4	97640
646yYgVW5sZWJloaGEW728	0.124	0.385	2	-12.117	0	0.0364	0.694	0.888	0.0669	0.0496	70.531	4	533293
30xHm3p2stFpmHyq0Rfm9x	0.691	0.569	2	-11.392	1	0.0384	0.0113	0.284	0.0735	0.752	79.983	4	270000
0CqbwdoEU3YHSC6yYAdd5c	0.593	0.72	9	-8.443	0	0.0284	4.27e-05	0.901	0.327	0.583	128.04	4	134467
4MJ5RyJXc0COLaoeBxvgpw	0.222	0.499	5	-11.596	1	0.0432	0.287	0.848	0.0673	0.134	125.521	4	199053
4wANVTeoqbvjEExHqcbJzp	0.119	0.134	5	-16.627	1	0.0439	0.547	0.893	0.243	0.037	95.441	4	142573
4dSLsmWv6qn6HMM4UeX7Yr	0.754	0.561	1	-12.48	1	0.0788	0.324	0.855	0.0916	0.333	119.988	4	70600
3il2koOrabDw2G0CqelDmO	0.838	0.773	7	-11.003	1	0.0435	0.544	0.904	0.0981	0.934	139.998	4	228422
2a78kBS0eSbDZGExEI6sFp	0.806	0.565	5	-10.306	1	0.0385	0.386	0.885	0.0978	0.549	123.027	4	199485
2Gf5quhybNaFtyuqjkuaQM	0.823	0.902	6	-7.363	1	0.155	0.473	0	0.122	0.916	142.226	4	149667
2og2K6jY8pt5sfVtqLz4UC	0.608	0.594	3	-5.264	0	0.0398	0.704	0	0.0968	0.825	121.391	4	114827
1FKDd7KScFEpz7QJRDYDoq	0.685	0.419	1	-6.523	0	0.127	0.613	0	0.105	0.746	113.492	4	149800
4yuOEKDCj0yJko2uo12zBv	0.782	0.648	5	-6.519	1	0.223	0.83	0	0.422	0.566	135.548	4	74133
6zadj5fkeetxH07dVbeiQZ	0.555	0.64	5	-3.766	1	0.0304	0.79	0	0.308	0.562	140.568	4	61613
7FfxbaoWXc3vEhXChEhNpO	0.575	0.66	0	-4.668	0	0.0344	0.813	0	0.544	0.775	118.271	4	81360
1JsGPnxkxlGGAnFtYmtNSj	0.664	0.663	1	-4.765	0	0.0475	0.809	0	0.145	0.893	135.479	4	208693
0gs7nB5nWGLx80u4Xmhdaq	0.58	0.677	0	-5.629	0	0.0723	0.844	0	0.146	0.863	128.531	4	232387
67bdhgDvzzWeoXwe3Nd2dM	0.57	0.627	5	-2.119	0	0.0359	0.834	0	0.265	0.324	129.824	4	89467
1ACxSxd20k2neg8hmUp01j	0.624	0.651	5	-3.734	1	0.0398	0.773	0	0.312	0.769	139.561	4	62427
5QZKcQDp0tCcvMdyqEciBV	0.457	0.621	10	-5.923	1	0.138	0.218	0	0.0944	0.634	85.359	3	224638
5DPASDOoVakOcD8EIhb46T	0.737	0.548	4	-7.003	0	0.0498	0.0127	9.76e-06	0.176	0.156	160.058	4	175759
341lTIxmhybbQsgydwJiFx	0.796	0.683	10	-5.165	0	0.277	0.0111	2.58e-06	0.126	0.737	173.852	3	141123
18LhA0zBzAa2YnhcN3hWGa	0.703	0.557	4	-6.798	0	0.0438	0.0116	9.85e-05	0.12	0.127	159.985	4	163168
3McTpsUQfEDrlNd2ikro2E	0.712	0.822	6	-3.728	0	0.131	0.0321	0	0.239	0.469	91.011	4	211237
7sMGW6lb6zKVvLA9IHUCgG	0.797	0.881	6	-3.972	0	0.063	0.282	0	0.107	0.835	90.037	4	130429
3tfxO1TvXXQ7HymM15lGt1	0.445	0.606	4	-6.279	1	0.0778	0.82	0	0.117	0.375	86.712	5	167996
5jDx8OLmJpnLKiDStY8US7	0.716	0.695	10	-6.854	0	0.0571	0.00244	0.457	0.147	0.428	148.881	4	130815
4Rq2BMG5VWMhb2whSx8bf4	0.504	0.597	10	-6.237	1	0.1	0.206	0	0.0949	0.557	117.974	4	230489
2OGfK0dPkEdALPwrmYXrVE	0.736	0.697	8	-5.393	1	0.0558	0.356	0	0.176	0.387	75.006	4	191777
1mCNkrKh9NEgxJWUqHnEgo	0.354	0.829	9	-3.834	1	0.047	0.00183	0	0.119	0.195	163.958	4	216520
1WxF4gMsFXnKCyh48CW2RI	0.274	0.792	2	-4.388	0	0.0413	0.00833	0	0.131	0.092	179.067	4	237347
1JrtC2ubRFV2xB79J3UY1Z	0.509	0.856	11	-3.943	0	0.0331	0.00017	0.00302	0.12	0.535	84.542	4	213960
3bAoghFUTVwGYXYnzRqhCf	0.33	0.734	2	-4.972	0	0.0416	0.000953	0	0.0874	0.256	178.986	4	221493
00i9VF7sjSaTqblAuKFBDO	0.409	0.877	2	-5.865	0	0.0602	0.00329	0	0.222	0.403	177.928	4	208021
3uErbNGaNIPJkRlMrLxR9Z	0.346	0.198	2	-12.208	0	0.0334	0.566	0.893	0.0958	0.163	138.103	3	285533
6Tkzu1nvzb5tHVsjiu8IDF	0.493	0.905	8	-5.415	1	0.0332	0.000172	0.000879	0.102	0.321	90.014	4	208587
2mPpPlCJKhjojKylWEs4ZC	0.481	0.746	9	-4.233	0	0.0377	0.000687	0	0.131	0.545	85.934	4	234493
2a8ND713OfNIdlJD1p8jB3	0.433	0.595	7	-6.797	1	0.032	0.101	0	0.342	0.24	74.989	4	173747
6W4pRJhZhyO3rz9vTITKRB	0.448	0.947	2	-6.658	1	0.0785	0.000119	0.0201	0.116	0.0835	124.045	4	353267
0a9uf4gKoAXwCuAjxt90Sz	0.567	0.919	0	-4.608	1	0.0321	0.000685	0.0873	0.464	0.369	130.016	4	341586
6yxPd3usemvhanh73TzwXi	0.568	0.897	7	-4.834	0	0.0425	0.00157	0.0472	0.129	0.365	139.983	4	381493
6VCC4JE3vE8c2szV0SWld9	0.487	0.945	10	-4.361	0	0.0336	4.81e-05	0.532	0.45	0.165	139.984	4	281143
4lEOGsYnc9wdxkJGkHuXAm	0.492	0.931	1	-3.714	1	0.0386	4.76e-05	0.000494	0.287	0.276	139.993	4	351429
4pj2L6WbBAlevdxx6jgm32	0.497	0.99	6	-3.436	1	0.13	0.000778	0	0.129	0.101	131.99	4	249050
6UgmF3c0nWYeqVs7prJo9C	0.614	0.925	5	-4.023	0	0.0357	0.00388	0.103	0.187	0.484	109.939	4	344727
2JiNqhSpFgkxgHNFRYjpDC	0.579	0.796	4	-4.735	0	0.0333	0.0179	0.000448	0.0894	0.309	89.99	4	328961
5wBaNy59nK8hJnx8AB2zRe	0.428	0.959	6	-3.727	1	0.256	0.0319	0	0.0888	0.262	144.396	4	249133
44QQarpAdUDdAidS5ddJIL	0.219	0.93	6	-10.452	1	0.0888	0.143	0.662	0.699	0.0391	71.521	3	141480
0nLOl4fSiBZKGFla5pLUtf	0.335	0.849	0	-6.927	1	0.321	0.00193	0.254	0.0928	0.256	181.716	3	399267
1HNRXicnRXw34nouoSQi3c	0.442	0.895	4	-4.388	1	0.101	0.0173	9.9e-06	0.715	0.489	143.829	4	238013
3WZiHsjugLgasZW7wGemNN	0.469	0.951	10	-4.222	1	0.111	0.0119	0	0.0976	0.283	149.976	4	254811
6AzrwTzu1Vhl2t13h3fNVh	0.504	0.952	9	-3.449	0	0.0638	0.00191	0	0.699	0.237	104.007	4	251773
01NVKlabAce8Nw70qxgY3d	0.629	0.942	10	-4.837	0	0.102	0.0295	1.87e-06	0.1	0.474	119.958	4	353875
6AioOohg4bQZFA4jIYQQ2r	0.375	0.682	0	-6.898	0	0.0364	0.00152	0.598	0.0897	0.396	159.23	4	363067
269xqcgGTN9PlivhUkOLhX	0.54	0.674	2	-6.351	1	0.0802	0.0553	0.0608	0.112	0.309	89.933	4	238719
3zUwwYcmob803s2Bkck8GY	0.54	0.967	1	-4.174	0	0.162	0.00796	0	0.683	0.293	136.896	4	247373
3jg7Dbq8xxUGLNeUe8TUYv	0.246	0.888	7	-4.249	1	0.295	0.00155	0	0.47	0.41	194.958	3	256533
54sEj5GIx2EW78nRDyC58R	0.435	0.743	9	-5.804	0	0.0792	0.107	5.76e-06	0.115	0.28	141.877	4	292507
2Kerz9H9IejzeIpjhDJoYG	0.527	0.366	10	-10.943	1	0.0277	0.487	0.0023	0.11	0.234	98.994	4	272743
3AOcpwgy3V2Fwg7B8PZfKl	0.292	0.359	5	-9.043	1	0.0328	0.697	1.85e-05	0.108	0.228	177.334	3	283259
1PfkFgRDLuSggFQAd8uvXp	0.245	0.241	8	-19.77	1	0.0322	0.0629	0.077	0.488	0.352	77.736	1	87314
0mt02gJ425Xjm7c3jYkOBn	0.504	0.655	0	-8.644	0	0.0542	0.604	0.00193	0.364	0.262	99.982	4	264066
6wl8vrSR56Tm7GSXjAVP91	0.364	0.502	1	-9.748	0	0.0348	0.0094	0.201	0.103	0.196	94.762	4	297347
45OFlmffEQJWlHu8Yf6Q1R	0.507	0.949	2	-4.555	1	0.17	0.00017	0	0.166	0.423	133.963	4	217627
0kgXAjZ2y0kGjKUekY0H8t	0.403	0.851	4	-4.813	0	0.131	0.0234	3.92e-05	0.358	0.12	162.029	4	249503
0W8oh1Zst7Y1GczYEDOIuS	0.445	0.882	4	-4.979	1	0.109	0.0258	0.000808	0.0824	0.573	144.28	4	247960
2g4x7SwGAU05mTQqLKroFg	0.531	0.897	7	-4.834	0	0.0439	0.00163	0.0445	0.129	0.361	139.916	4	381493
12f3kgz9J1vU0Sd3qISMuJ	0.238	0.854	2	-4.565	1	0.0682	0.0436	6.82e-06	0.334	0.138	178.076	4	289026
3J84AjpIGKYHL1NDKmM2pB	0.539	0.938	2	-4.331	1	0.0403	0.00089	3.44e-05	0.22	0.614	152.98	4	249640
4LKieNzKrd4nk25Mq8dkfu	0.485	0.943	10	-4.363	0	0.0334	4.98e-05	0.566	0.45	0.164	139.973	4	281143
5mkGfmJGFZpwK9nA5amOhv	0.67	0.558	2	-9.159	1	0.0251	0.238	0	0.106	0.63	80.511	4	173493
1lATXTBJDHwawvT1UfxWu3	0.469	0.79	7	-6.889	1	0.0391	0.000148	0.372	0.282	0.466	107.45	4	381947
4S0oduY2t0ajpZQ6T9kAq1	0.322	0.854	11	-5.729	0	0.0786	0.0671	0.000416	0.342	0.078	119.856	4	244750
5WW76v0NDWK5Wy5tfai5G8	0.268	0.889	10	-4.626	0	0.18	0.00262	0.00066	0.0996	0.498	167.886	4	240996
76AYOdnKWcSLviCsKDXyS1	0.448	0.982	9	-3.971	0	0.287	0.000165	2.32e-06	0.0539	0.0978	131.895	4	299820
79D6ftjlstX0zTqag7jw4z	0.256	0.74	1	-3.918	0	0.0404	0.0197	0.00139	0.103	0.165	120.111	4	300613
1Ym6aMuT5bliaZMC67AmPp	0.449	0.534	8	-9.493	0	0.0494	0.048	0.0011	0.384	0.342	94.261	3	180902
3aARLhAch8wF1wDMzkL7nJ	0.392	0.356	8	-12.296	1	0.0325	0.371	0.174	0.284	0.125	105.68	4	243600
5QqyRUZeBE04yJxsD1OC0I	0.76	0.574	1	-8.57	1	0.126	0.0155	2.02e-05	0.199	0.137	134.981	4	260672
5V2Tg65HSuF0hB22SlNRoa	0.554	0.886	5	-4.529	1	0.114	0.0106	0	0.365	0.326	90.03	4	309173
6eygbzyL6hY8jFQTARDuo9	0.658	0.46	6	-8.646	0	0.0444	0.456	0.00111	0.0963	0.223	114.801	4	164710
0qSVzDIOLWqIoOHjUUjv8c	0.17	0.957	4	-5.873	1	0.337	0.000685	0	0.09	0.177	198.122	3	279087
0QB98b4YFxtW4NQ9narHQM	0.552	0.987	11	-3.642	1	0.148	0.00122	0.000279	0.669	0.272	89.986	4	310267
3ZKRAzNAsiJrBGUM2BX9av	0.333	0.389	7	-9.132	1	0.0364	0.539	0.0772	0.163	0.25	144.204	4	295569
3ltS4rlFrCYkdQqGzVjXBi	0.36	0.957	11	-4.657	0	0.24	0.00387	3.08e-06	0.0983	0.116	157.058	4	185201
7x2jq2kAhxDH3M6FcgJKbs	0.194	0.154	0	-18.954	1	0.0413	0.935	0.918	0.0801	0.0383	147.872	4	44616
5gbxjsBPzpjZuPvIptYvPi	0.481	0.964	2	-4.114	0	0.384	0.000824	0	0.124	0.0808	144.055	4	270253
7lSdUlVf8k6kxklKkskb1m	0.352	0.41	11	-8.796	0	0.0388	0.556	0.0113	0.114	0.0952	118.721	4	355184
03sEzk1VyrUZSgyhoQR0LZ	0.415	0.53	9	-9.338	0	0.0314	0.00209	0.75	0.11	0.0586	114.174	1	713192
1JkZg3eMQTmTn93E8Yd3UL	0.806	0.462	2	-12.778	1	0.0298	0.78	0.0134	0.15	0.736	92.726	4	191227
0lP4HYLmvowOKdsQ7CVkuq	0.179	0.912	4	-3.881	0	0.0791	0.0014	0.000294	0.582	0.289	182.99	3	231533
50Re2bLgXqG9qN7v2QHNTm	0.515	0.594	1	-4.708	1	0.0262	0.00844	0.00658	0.0752	0.218	146.564	4	293133
1u8lE1YTkgQrXnMpPpVUC6	0.41	0.644	6	-5.964	0	0.104	0.0489	0.000607	0.169	0.614	140.274	4	289495
2YwlwV98tjcKF664eEAAyV	0.524	0.252	9	-11.421	0	0.0419	0.907	2.92e-06	0.159	0.383	122.5	3	261500
58AwxWLaRHn2lTqqH9dLkU	0.467	0.644	4	-5.677	1	0.0285	0.0128	0	0.136	0.0654	82.915	4	232707
7yWEPokjQeePPTZD9RqxP4	0.608	0.415	9	-8.183	1	0.178	0.648	0	0.291	0.521	117.914	4	241500
32j279x3imcBWBu9OaHX2n	0.61	0.649	5	-6.063	1	0.036	0.0442	0	0.114	0.529	137.006	4	246067
0aTiUssEOy0Mt69bsavj6K	0.33	0.611	10	-9.571	1	0.0495	0.00219	0.769	0.107	0.241	172.606	1	817832
0cKk8BKEi7zXbdrYdyqBP5	0.394	0.622	4	-8.258	0	0.0336	0.213	4.45e-05	0.0892	0.342	126.844	4	221427
0eZBeB2xFIS65jQHerispi	0.322	0.28	6	-9.367	0	0.0281	0.468	1.1e-06	0.102	0.175	85.794	4	248467
2ae6mkuD2gJnJQADl488et	0.603	0.422	7	-15.598	1	0.0631	0.281	0.776	0.0745	0.0685	95.17	1	441253
2iy4qPWFbtzGSDT8xzKIMb	0.724	0.422	0	-13.759	0	0.0581	0.452	0	0.101	0.845	129.911	4	108513
3MGJF1CDFGfjXESL2Heva0	0.565	0.646	7	-4.749	1	0.0335	0.0412	0	0.362	0.481	91.973	4	213413
4hTg9q0AnxtH4yZKeRcMin	0.285	0.297	9	-9.259	0	0.0339	0.743	0	0.138	0.156	103.653	3	283529
51G4UdHXjcNrdLueS1ohzU	0.583	0.823	0	-4.542	1	0.0592	0.0531	0	0.127	0.501	140.013	4	195253
5xrHvVmSF3ui0EKI8FArv3	0.495	0.753	9	-4.737	0	0.102	0.631	3.23e-06	0.16	0.744	121.056	4	250000
70C4NyhjD5OZUMzvWZ3njJ	0.331	0.55	0	-6.483	1	0.0272	0.605	3.96e-06	0.192	0.429	177.734	3	339000
5Pj9iXYfe607U62YwSF5rC	0.713	0.757	1	-5.248	1	0.0728	0.00238	0	0.233	0.316	134.993	4	151867
0eHxqgbpr2ptXQtw8Ab3ve	0.39	0.208	0	-11.402	1	0.035	0.913	0.000348	0.124	0.0546	114.838	4	331360
4l52LL7FmhrUXF1F9zV62c	0.523	0.513	5	-6.105	0	0.0435	0.697	0	0.434	0.624	136.695	4	227500
170yBuCB3FvhMG2DMSQ4IG	0.789	0.501	5	-5.433	0	0.0746	0.209	0	0.191	0.694	108.989	4	168933
2tAzcTFry1OhmNERFjUR93	0.604	0.883	11	-3.821	0	0.047	0.0254	0	0.0813	0.544	90.001	4	245533
0PhhFpOOM0dOJhMsjHtypt	0.837	0.507	9	-7.539	0	0.0704	0.738	0	0.0842	0.588	95.039	4	156035
0V7c0zElQpTNGUwyC18YMM	0.441	0.644	0	-5.986	1	0.132	0.61	0.000485	0.308	0.727	104.622	4	216875
1YQY7ODoHmrfDwzgshRBKq	0.625	0.498	5	-7.395	1	0.0669	0.607	0	0.321	0.531	76.196	4	174072
2Dqg2mRbfIVKhBZleNrgmH	0.358	0.628	7	-9.685	1	0.0556	0.00586	0.471	0.111	0.262	108.441	4	831440
3H8BLMeJCoXQsozaXi2xzy	0.518	0.355	8	-8.558	1	0.0663	0.839	0	0.254	0.388	78.516	4	211813
5C5gvDZsl6d8bh89URfKHr	0.698	0.664	7	-7.828	1	0.0778	0.121	0.00131	0.331	0.623	96.001	4	253831
0UdBCetwMDQO7JIhi7Waik	0.359	0.527	9	-6.371	0	0.125	0.397	0	0.162	0.239	87.28	3	217547
1lqTpQzSgGZZ850bimyxMP	0.292	0.953	7	-2.262	1	0.121	9.26e-05	1.19e-05	0.115	0.261	179.672	4	214725
272Z4tzaSMMcgrZ0R494S2	0.422	0.814	9	-7.365	1	0.195	0.118	5.3e-06	0.115	0.411	147.065	4	354320
4KWntZBFeQOdoYNgPwcEGe	0.623	0.658	1	-5.057	0	0.0405	0.0176	0.000539	0.238	0.341	129.977	4	184147
7qzNc93sUMR3vHt5WADmOa	0.534	0.95	9	-2.712	0	0.161	0.012	1.91e-06	0.413	0.527	140.071	4	207587
06WohfoFEUa5faNy8f9S5N	0.465	0.96	6	-3.888	1	0.0792	0.00023	0	0.129	0.43	132.014	4	255773
08M4WOUOlAHeZEmj9gEyKt	0.516	0.939	2	-3.682	0	0.0917	0.0178	0.0109	0.101	0.358	140.071	4	297216
0CUbuoOBaYAGSYmjjSlNON	0.761	0.685	9	-4.892	0	0.339	0.0602	0	0.11	0.548	107.125	4	183925
0Yg1hSAUgd2AAneReFOVzS	0.741	0.365	9	-9.594	1	0.0329	0.812	0.00957	0.144	0.888	107.847	3	187747
0cELvuwJW1acISUHYB6suj	0.74	0.752	9	-7.008	0	0.0359	0.0409	0.00125	0.0233	0.939	114.851	4	248093
0eHIMJCzU1QV0R6OHeLOuR	0.551	0.915	2	-2.496	1	0.0846	0.00844	0	0.326	0.416	67.978	4	260160
0q6WphTLKGQksoPMiNB1LJ	0.542	0.862	2	-6.373	1	0.0583	0.00377	0.000915	0.0877	0.294	151.957	4	181073
0tvw5vooI7iT74m2x1T7HU	0.627	0.833	11	-7.948	0	0.0641	0.23	0.101	0.149	0.193	126.13	4	176196
1ZpcR68PKaoz8DpQDRqFEE	0.51	0.609	8	-4.6	0	0.0941	0.0228	0	0.442	0.323	122.984	4	174740
1eNThMHqjtDhoyGXytVBvh	0.387	0.992	6	-1.733	1	0.348	0.0101	0.000421	0.173	0.127	165.974	4	226400
1gsYCXkisSnnjBb3qwYZoc	0.565	0.531	2	-6.09	1	0.197	0.497	1.94e-06	0.102	0.237	129.424	4	182858
1gxdWpeOUBpvB908fiZs4D	0.303	0.249	0	-11.715	1	0.111	0.97	1.95e-05	0.117	0.131	66.932	4	200661
1kYR2wTYZUsZ2Gcx7yPYSZ	0.533	0.938	5	-3.28	1	0.2	0.0024	0	0.778	0.357	129.93	4	247467
1w1hr8DdUGqGF4qyhCvGhP	0.627	0.243	3	-7.075	1	0.0353	0.759	0	0.08	0.549	94.176	4	199149
26nwOFTFf5JLDBFOK1MMe1	0.906	0.343	6	-6.999	1	0.0496	0.11	0.197	0.0873	0.87	130.973	4	62215
2IHcAcZ4D6QRGZgmWGgGhc	0.609	0.61	10	-7.906	0	0.0302	0.397	0.000442	0.127	0.331	88.507	4	267653
2MaWDFu5l9SKXNDd6qCIx6	0.759	0.626	5	-6.289	0	0.217	0.212	1.13e-05	0.0922	0.651	115.007	4	181773
2i9yWmgHVqWW1vmXtxUaN9	0.684	0.617	2	-6.266	0	0.0886	0.0181	1.53e-06	0.0839	0.628	89.435	4	87673
2m17BTWlZq0wtS9cpJsCfM	0.506	0.7	0	-5.716	1	0.0487	0.00998	0.000124	0.37	0.561	126.235	4	205307
2p1Cjaderx0MeKrAoHwchx	0.553	0.782	5	-8.125	1	0.0305	0.0483	0.217	0.401	0.599	133.306	4	233053
2ptbBxMTCbFBefVMXwrdSC	0.806	0.437	5	-9.599	1	0.191	0.0279	0	0.457	0.803	114.918	4	143500
2zsWRxMcUdGjj8TnWkVKw0	0.637	0.724	6	-5.151	0	0.0403	0.119	0	0.299	0.414	80.982	4	176787
39oHEZp6LFEmXLy8tKHcYf	0.433	0.653	10	-6.796	0	0.0583	0.064	0	0.112	0.274	127.901	4	196200
3DiRdaZtPrVdb4U2RIuRWm	0.447	0.863	6	-6.303	0	0.0585	0.00365	0.0138	0.0448	0.835	162.311	4	208467
3HBZdyG6QHhrEdwLQYXjfU	0.349	0.876	11	-3.737	0	0.0508	0.0576	0.845	0.189	0.198	130.011	4	226495
3NYq7c5AIUiubPz9UZl82h	0.385	0.547	0	-9.005	1	0.0525	0.0331	0	0.636	0.354	73.107	4	168680
3e90JC8EKLsSDUHmPpxkfp	0.597	0.495	8	-8.674	1	0.201	0.215	0.000163	0.104	0.171	76.991	4	253800
3eIDFlBvKsssIpKeTSKEO6	0.411	0.95	7	-3.051	1	0.114	0.0303	0	0.0423	0.423	179.997	4	240960
3ejS3PKnKnLiI1CIKM5E4K	0.245	0.564	7	-5.829	1	0.0405	0.0621	0.288	0.112	0.0942	149.734	4	307318
4191RXFPa7Ge9XkA4cWlna	0.526	0.334	10	-8.491	0	0.251	0.702	0.00782	0.0586	0.522	74.966	4	212496
46SZJUs1Qnutjk3QlNcnKY	0.522	0.346	11	-11.458	0	0.0435	0.933	0	0.474	0.726	106.715	4	146627
4Cbrtoamv6acNiHNAUKnj0	0.467	0.753	9	-5.319	0	0.0454	0.17	0	0.245	0.44	89.02	4	212960
4K6QbaU4KdvYJAOncr2Iu0	0.356	0.97	9	-2.855	0	0.0935	0.0635	0	0.121	0.142	149.937	4	268040
\.


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.friends (friend_id, f1_id, f2_id) FROM stdin;
1	12163992542	the_real_wjdhollow
2	the_real_wjdhollow	12163992542
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
adult standards	adult standards	f
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
indie r&b	indie r&b	f
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
punk	punk	f
art rock	art rock	f
post-punk	post-punk	f
protopunk	protopunk	f
dark wave	dark wave	f
gothic rock	gothic rock	f
uk post-punk	uk post-punk	f
zolo	zolo	f
acoustic punk	acoustic punk	f
madchester	madchester	f
detroit rock	detroit rock	f
punk blues	punk blues	f
reggae fusion	reggae fusion	f
ska mexicano	ska mexicano	f
ska punk	ska punk	f
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
ohio hip hop	ohio hip hop	f
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
modern alternative rock	modern alternative rock	f
shimmer pop	shimmer pop	f
la indie	la indie	f
minneapolis sound	minneapolis sound	f
synth funk	synth funk	f
rap metal	rap metal	f
garage pop	garage pop	f
chicago indie	chicago indie	f
trap soul	trap soul	f
new weird america	new weird america	f
toronto indie	toronto indie	f
rock-and-roll	rock-and-roll	f
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
progressive post-hardcore	progressive post-hardcore	f
axe	axe	f
brazilian percussion	brazilian percussion	f
mpb	mpb	f
pagode	pagode	f
samba	samba	f
samba reggae	samba reggae	f
boom bap	boom bap	f
hardcore hip hop	hardcore hip hop	f
jazz boom bap	jazz boom bap	f
indie poptimism	indie poptimism	f
afrofuturism	afrofuturism	f
hip pop	hip pop	f
boston rock	boston rock	f
afrobeat	afrobeat	f
brass band	brass band	f
instrumental funk	instrumental funk	f
portland indie	portland indie	f
jacksonville indie	jacksonville indie	f
michigan indie	michigan indie	f
art punk	art punk	f
south carolina indie	south carolina indie	f
oxford indie	oxford indie	f
metal	metal	f
chicago soul	chicago soul	f
irish singer-songwriter	irish singer-songwriter	f
classic garage rock	classic garage rock	f
freakbeat	freakbeat	f
proto-hyperpop	proto-hyperpop	f
scenecore	scenecore	f
experimental hip hop	experimental hip hop	f
psychedelic hip hop	psychedelic hip hop	f
brooklyn drill	brooklyn drill	f
metalcore	metalcore	f
pixie	pixie	f
swancore	swancore	f
australian pop	australian pop	f
melodic rap	melodic rap	f
post-grunge	post-grunge	f
anime score	anime score	f
canadian rock	canadian rock	f
metropopolis	metropopolis	f
neo-synthpop	neo-synthpop	f
viral rap	viral rap	f
gabba	gabba	f
hardcore techno	hardcore techno	f
tekk	tekk	f
uptempo hardcore	uptempo hardcore	f
uk pop	uk pop	f
nyc rap	nyc rap	f
pittsburgh rap	pittsburgh rap	f
moombahton	moombahton	f
tropical house	tropical house	f
dark trap	dark trap	f
drill	drill	f
miami hip hop	miami hip hop	f
danish alternative rock	danish alternative rock	f
danish rock	danish rock	f
vapor trap	vapor trap	f
capoeira	capoeira	f
aesthetic rap	aesthetic rap	f
phonk	phonk	f
slap house	slap house	f
virginia hip hop	virginia hip hop	f
bass house	bass house	f
indonesian edm	indonesian edm	f
pop punk	pop punk	f
post-teen pop	post-teen pop	f
bossa nova	bossa nova	f
samba de roda	samba de roda	f
tropicalia	tropicalia	f
partido alto	partido alto	f
rap baiano	rap baiano	f
trap baiano	trap baiano	f
trap brasileiro	trap brasileiro	f
violao	violao	f
brazilian jazz	brazilian jazz	f
lounge	lounge	f
samba-jazz	samba-jazz	f
vocal jazz	vocal jazz	f
jazz rap	jazz rap	f
english indie rock	english indie rock	f
chillhop	chillhop	f
downtempo	downtempo	f
japanese chillhop	japanese chillhop	f
japanese old school hip hop	japanese old school hip hop	f
golden age hip hop	golden age hip hop	f
queens hip hop	queens hip hop	f
french hip hop	french hip hop	f
old school rap francais	old school rap francais	f
manguebeat	manguebeat	f
samba-rock	samba-rock	f
brazilian indie	brazilian indie	f
nova mpb	nova mpb	f
rock baiano	rock baiano	f
tennessee hip hop	tennessee hip hop	f
birmingham grime	birmingham grime	f
grime	grime	f
instrumental grime	instrumental grime	f
bow pop	bow pop	f
cello	cello	f
finnish metal	finnish metal	f
cali rap	cali rap	f
dfw rap	dfw rap	f
candy pop	candy pop	f
brostep	brostep	f
progressive electro house	progressive electro house	f
emo rap	emo rap	f
seattle indie	seattle indie	f
future bass	future bass	f
pop edm	pop edm	f
hyphy	hyphy	f
west coast trap	west coast trap	f
chicago rap	chicago rap	f
canadian hip hop	canadian hip hop	f
toronto rap	toronto rap	f
welsh hip hop	welsh hip hop	f
progressive metal	progressive metal	f
progressive rock	progressive rock	f
jazz cover	jazz cover	f
swing	swing	f
beatlesque	beatlesque	f
glam metal	glam metal	f
power pop	power pop	f
irish indie rock	irish indie rock	f
funk metal	funk metal	f
canadian metal	canadian metal	f
uk alternative pop	uk alternative pop	f
pink noise	pink noise	f
alt z	alt z	f
torch song	torch song	f
gauze pop	gauze pop	f
shiver pop	shiver pop	f
trancecore	trancecore	f
uk metalcore	uk metalcore	f
chanson	chanson	f
ye ye	ye ye	f
brisbane indie	brisbane indie	f
europop	europop	f
eurovision	eurovision	f
swedish pop	swedish pop	f
australian alternative pop	australian alternative pop	f
pop r&b	pop r&b	f
belgian indie	belgian indie	f
belgian pop	belgian pop	f
auckland indie	auckland indie	f
kiwi rock	kiwi rock	f
hi-nrg	hi-nrg	f
indie electropop	indie electropop	f
deep adult standards	deep adult standards	f
geek folk	geek folk	f
neo-pagan	neo-pagan	f
canadian electropop	canadian electropop	f
grave wave	grave wave	f
cinematic post-rock	cinematic post-rock	f
symphonic rock	symphonic rock	f
old school atlanta hip hop	old school atlanta hip hop	f
experimental	experimental	f
minimalism	minimalism	f
modern cello	modern cello	f
free folk	free folk	f
queer country	queer country	f
chillstep	chillstep	f
rockabilly	rockabilly	f
scottish new wave	scottish new wave	f
solo wave	solo wave	f
etherpop	etherpop	f
dark jazz	dark jazz	f
drone	drone	f
ebm	ebm	f
electro-industrial	electro-industrial	f
futurepop	futurepop	f
electronica	electronica	f
laboratorio	laboratorio	f
trip hop	trip hop	f
vegan straight edge	vegan straight edge	f
south african rock	south african rock	f
modern indie pop	modern indie pop	f
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.items (id, user_id, date, item_type, timespan, rank, spotify_id) FROM stdin;
1	12163992542	1668800914	track	long_term	1	1Kjw0LwdniCWran4PxJqPQ
2	12163992542	1668800914	track	long_term	2	1I40L32fTSSkBkPeArX9Ul
3	12163992542	1668800914	track	long_term	3	5fBjPtOxhgdpU6LNWLyVHv
4	12163992542	1668800914	track	long_term	4	4FE9SgxcOoCNuGnaaU8TXz
5	12163992542	1668800914	track	long_term	5	4FF4q2qyOsFhRavZ0bdVXT
6	12163992542	1668800914	track	long_term	6	0qprlw0jfsW4H9cG0FFE0Z
7	12163992542	1668800914	track	long_term	7	3jp7Ryj1sX3riA7NQaVlLd
8	12163992542	1668800914	track	long_term	8	2I88NEWpKrAPZuapXNV5G6
9	12163992542	1668800914	track	long_term	9	6YZQx90VEuzf0lRY9TYh7j
10	12163992542	1668800914	track	long_term	10	54b8qPFqYqIndfdxiLApea
11	12163992542	1668800914	track	long_term	11	3sTN90bIP2cJ1783ctHykO
12	12163992542	1668800914	track	long_term	12	2P3SLxeQHPqh8qKB6gtJY2
13	12163992542	1668800914	track	long_term	13	474uVhyGgK5MtY9gMcDgGl
14	12163992542	1668800914	track	long_term	14	16ro1is6DmDKkarlJMBbzV
15	12163992542	1668800914	track	long_term	15	4frLb7nWtsz2ymBE6k2GRP
16	12163992542	1668800914	track	long_term	16	2G2YzndIA6jeWFPBXhUjh5
17	12163992542	1668800914	track	long_term	17	5jZ1Z2GFTf2gwmFc3qiUxs
18	12163992542	1668800914	track	long_term	18	5vyt44455ipNNVSYq8fYY7
19	12163992542	1668800914	track	long_term	19	1OFKUn2VLafrHj7ybnap0Q
20	12163992542	1668800914	track	long_term	20	21oJ1K99GBJrE2GVQGVjA0
21	12163992542	1668800914	track	long_term	21	1LzNfuep1bnAUR9skqdHCK
22	12163992542	1668800914	track	long_term	22	748yv6bb3l3CcKS45a6SZ8
23	12163992542	1668800914	track	long_term	23	6NvRxjfYkkT2SpirAlmsjH
24	12163992542	1668800914	track	long_term	24	0hJS3EHWC4uL9sJ52ErpoN
25	12163992542	1668800914	track	long_term	25	1ZaNp6b4cY3zcrciagi7td
26	12163992542	1668800914	track	long_term	26	1qQSRy9DjrGh3jtsSCU6B1
27	12163992542	1668800914	track	long_term	27	3s8MBOMdUi5Vol77qq8KJJ
28	12163992542	1668800914	track	long_term	28	4j3GWI86JvSaF0BLdmgcfF
29	12163992542	1668800914	track	long_term	29	4f8Mh5wuWHOsfXtzjrJB3t
30	12163992542	1668800914	track	long_term	30	6VojZJpMyuKClbwyilWlQj
31	12163992542	1668800914	track	long_term	31	1TDdYSYLIXMJ4EiKO6ZCYk
32	12163992542	1668800914	track	long_term	32	1RbOObDFn7GOseR1w529Zj
33	12163992542	1668800914	track	long_term	33	0Hw6SCrtU9pFCjgAONpnGZ
34	12163992542	1668800914	track	long_term	34	0S29RwGLJutn4qnFJQL13n
35	12163992542	1668800914	track	long_term	35	5SCB7L1alKg7ZEeSw7Sq9f
36	12163992542	1668800914	track	long_term	36	3aN2V18W3EiW7eg5tHALpF
37	12163992542	1668800914	track	long_term	37	5hVghJ4KaYES3BFUATCYn0
38	12163992542	1668800914	track	long_term	38	6fc51JZVE0Yijdi6RuoLFv
39	12163992542	1668800914	track	long_term	39	3zJ5RDG0bLQAV2rntFgUtb
40	12163992542	1668800914	track	long_term	40	6iGU74CwXuT4XVepjc9Emf
41	12163992542	1668800914	track	long_term	41	7wdzLe2Gsx1RGqbvYZHASz
42	12163992542	1668800914	track	long_term	42	3imS277wRbz1CFoDySgTff
43	12163992542	1668800914	track	long_term	43	3mT1AONeTJDi1k8vH8pA2L
44	12163992542	1668800914	track	long_term	44	7Cu2COdH93MnuireuKNiS3
45	12163992542	1668800914	track	long_term	45	7JmPqImeW3kLoYVNBA9v11
46	12163992542	1668800914	track	long_term	46	2aCKBrLn7rbhStk5k4FwnF
47	12163992542	1668800914	track	long_term	47	0vJvCnuxXL2BCSRa1ZoeNl
48	12163992542	1668800914	track	long_term	48	1zkkvSLk5Nh4uoyKWwuie9
49	12163992542	1668800914	track	long_term	49	62wdQ5CInFr7cjISqrr46f
50	12163992542	1668800914	track	long_term	50	3iVp14VoAsAZkIdgQoRRAb
51	12163992542	1668800914	track	medium_term	1	16ro1is6DmDKkarlJMBbzV
52	12163992542	1668800914	track	medium_term	2	0hJS3EHWC4uL9sJ52ErpoN
53	12163992542	1668800914	track	medium_term	3	5vyt44455ipNNVSYq8fYY7
54	12163992542	1668800914	track	medium_term	4	474uVhyGgK5MtY9gMcDgGl
55	12163992542	1668800914	track	medium_term	5	1TDdYSYLIXMJ4EiKO6ZCYk
56	12163992542	1668800914	track	medium_term	6	63k361zOGEhmvgzBdzzSGP
57	12163992542	1668800914	track	medium_term	7	04M3DsiMNyn8s5XQJrW5sL
58	12163992542	1668800914	track	medium_term	8	6fc51JZVE0Yijdi6RuoLFv
59	12163992542	1668800914	track	medium_term	9	5rfT032kGmLvbxZzfHlu5D
60	12163992542	1668800914	track	medium_term	10	5zzWx7oJ9zBmv76uFaFeYR
61	12163992542	1668800914	track	medium_term	11	2pA4ip3VIEVcIa3qE02oAX
62	12163992542	1668800914	track	medium_term	12	1k7aPYyAnNTjVbjw1YDNp1
63	12163992542	1668800914	track	medium_term	13	41xaZ4WLlKD95U5PknoJrV
64	12163992542	1668800914	track	medium_term	14	1zkkvSLk5Nh4uoyKWwuie9
65	12163992542	1668800914	track	medium_term	15	33vFhGNZa44VJ0I21AOGYe
66	12163992542	1668800914	track	medium_term	16	03v70ZBxmcPX3RWAZMzqaW
67	12163992542	1668800914	track	medium_term	17	1RzgWAFlI6KOenjOxJYcH0
68	12163992542	1668800914	track	medium_term	18	2OeL43EXwaC205Xr1da1qJ
69	12163992542	1668800914	track	medium_term	19	5CU1bbfY1wUPm7fU255Dhf
70	12163992542	1668800914	track	medium_term	20	0dqJjKKxuKD5Dt3QH2n4CG
71	12163992542	1668800914	track	medium_term	21	5C90m8eM6GJR2SACiLAWHo
72	12163992542	1668800914	track	medium_term	22	4Fc62OkXYtEOjMmaSyJoQY
73	12163992542	1668800914	track	medium_term	23	244QS6446wyO1UfVTWlOlR
74	12163992542	1668800914	track	medium_term	24	5L7IgwUPhir2FJftGNXJDW
75	12163992542	1668800914	track	medium_term	25	35mL8keNDi2VLHrFXZCgJR
76	12163992542	1668800914	track	medium_term	26	3aN2V18W3EiW7eg5tHALpF
77	12163992542	1668800914	track	medium_term	27	50bmpfgcV29ouRVDfr5wOc
78	12163992542	1668800914	track	medium_term	28	5IRdIQNIZzVqE4XyBylkvd
79	12163992542	1668800914	track	medium_term	29	4FF4q2qyOsFhRavZ0bdVXT
80	12163992542	1668800914	track	medium_term	30	5do7Ql6G8N03fY6G9Y08Ec
81	12163992542	1668800914	track	medium_term	31	6YZQx90VEuzf0lRY9TYh7j
82	12163992542	1668800914	track	medium_term	32	0ZAbupc7jAQpG9IxojQ3s3
83	12163992542	1668800914	track	medium_term	33	6MDijuuArPJv1vbp7K1x3f
84	12163992542	1668800914	track	medium_term	34	0b2vqB7QNT4z8nnaYqbuel
85	12163992542	1668800914	track	medium_term	35	47KDDZgFiX1w6RFOuLXsSn
86	12163992542	1668800914	track	medium_term	36	3LcjZGk0GBlPRe5XhYVGgM
87	12163992542	1668800914	track	medium_term	37	37ZvpHeZKazqOnLfAGm9nb
88	12163992542	1668800914	track	medium_term	38	0JXXNGljqupsJaZsgSbMZV
89	12163992542	1668800914	track	medium_term	39	3banchOoe2giyRK0jaO1c7
90	12163992542	1668800914	track	medium_term	40	7trx783SvnHhKkmgSSTIFJ
91	12163992542	1668800914	track	medium_term	41	27AG99NmWMFLRoyZMMPNW2
92	12163992542	1668800914	track	medium_term	42	7l5j3FapCyr6HxUgoAynM2
93	12163992542	1668800914	track	medium_term	43	5VA4Ispp52EA1sOqzMz3Av
94	12163992542	1668800914	track	medium_term	44	7qHoVZ6076OGx18G6W5vQ9
95	12163992542	1668800914	track	medium_term	45	4hv7GT5g9qNnrxlocsOSYt
96	12163992542	1668800914	track	medium_term	46	4PFiLGx8jAzcAJxwPLUeZ9
97	12163992542	1668800914	track	medium_term	47	1ULovMYbbglXIn9TQzMsKz
98	12163992542	1668800914	track	medium_term	48	4isk4UYRcmslphcTq61xUg
99	12163992542	1668800914	track	medium_term	49	5WoaF1B5XIEnWfmb5NZikf
100	12163992542	1668800914	track	medium_term	50	7sf0tmuGZlHXUWpi9dQqcw
101	12163992542	1668800914	track	short_term	1	0b2vqB7QNT4z8nnaYqbuel
102	12163992542	1668800914	track	short_term	2	3Pu3IChaAoa5EjgUBv5F6x
103	12163992542	1668800914	track	short_term	3	63k361zOGEhmvgzBdzzSGP
104	12163992542	1668800914	track	short_term	4	5p0bEz7DNsULez2X9yrNGa
105	12163992542	1668800914	track	short_term	5	1dxXQuExRVu77xF1r5YtRF
106	12163992542	1668800914	track	short_term	6	244QS6446wyO1UfVTWlOlR
107	12163992542	1668800914	track	short_term	7	0wejso6CHHEEqvTD3f3gBz
108	12163992542	1668800914	track	short_term	8	23od4rorIdhvYeLL7YqP9n
109	12163992542	1668800914	track	short_term	9	2I3ZdIFXnRn1PSAdMC4w71
110	12163992542	1668800914	track	short_term	10	5eKfpH2dQ7FltCqb7LWEGJ
111	12163992542	1668800914	track	short_term	11	7Cva2EgJougx6O6M5xgWAq
112	12163992542	1668800914	track	short_term	12	7KR5uycb8gfQYRl1MTL8aB
113	12163992542	1668800914	track	short_term	13	7xjbn0bhs7zx7E1s0lCqT3
114	12163992542	1668800914	track	short_term	14	474uVhyGgK5MtY9gMcDgGl
115	12163992542	1668800914	track	short_term	15	56KqaFSGTb7ifpt16t5Y1N
116	12163992542	1668800914	track	short_term	16	4Fc62OkXYtEOjMmaSyJoQY
117	12163992542	1668800914	track	short_term	17	3YZa4IzxK2UtEKTvdTgsi8
118	12163992542	1668800914	track	short_term	18	4TIJ7zSBNejpoIPaWpWRKc
119	12163992542	1668800914	track	short_term	19	1TDdYSYLIXMJ4EiKO6ZCYk
120	12163992542	1668800914	track	short_term	20	21YxK0klhpfLW8budkJaMF
121	12163992542	1668800914	track	short_term	21	29iwiYD3KVWBKxe31nGjEL
122	12163992542	1668800914	track	short_term	22	5El6bpLd8nYPsvWgZLdHio
123	12163992542	1668800914	track	short_term	23	72dIN8F7D5ydB3auSqNi84
124	12163992542	1668800914	track	short_term	24	29Znt9AbEH9FSsw86zPAYT
125	12163992542	1668800914	track	short_term	25	3EytfC22ikoXM921cJbejn
126	12163992542	1668800914	track	short_term	26	4vKLfj7YuS2yRKAJ9Nn0Id
127	12163992542	1668800914	track	short_term	27	6eDwkS4IHADqk06ssrqfUX
128	12163992542	1668800914	track	short_term	28	0WQiDwKJclirSYG9v5tayI
129	12163992542	1668800914	track	short_term	29	0vF9RAGwgYtfO1Aajwb7et
130	12163992542	1668800914	track	short_term	30	10fiZCExnOMqElSX952WZI
131	12163992542	1668800914	track	short_term	31	14z3RzUHeZQgtpOlSYvmZD
132	12163992542	1668800914	track	short_term	32	1AR58rtcLziNnRHTCmCywd
133	12163992542	1668800914	track	short_term	33	1e5XqFTNIrlgpXGjwPSykv
134	12163992542	1668800914	track	short_term	34	3s5N94NsDYcOqgi7cSakv6
135	12163992542	1668800914	track	short_term	35	3wtMkvedoWMQ3XTKv7tqcZ
136	12163992542	1668800914	track	short_term	36	4J6JARDGkdc1fqLEflP94Z
137	12163992542	1668800914	track	short_term	37	4ZTl5GUAmO49b2cf6jovqx
138	12163992542	1668800914	track	short_term	38	4oB0d8H93GtllDkoHNuLIN
139	12163992542	1668800914	track	short_term	39	5avF5IwDg2v1QCxPvX9Fru
140	12163992542	1668800914	track	short_term	40	672N8DGGTOLCOgWe0koX5g
141	12163992542	1668800914	track	short_term	41	16ro1is6DmDKkarlJMBbzV
142	12163992542	1668800914	track	short_term	42	6fc51JZVE0Yijdi6RuoLFv
143	12163992542	1668800914	track	short_term	43	6Dq2LzijkY9WNPwBGDah4L
144	12163992542	1668800914	track	short_term	44	0hJS3EHWC4uL9sJ52ErpoN
145	12163992542	1668800914	track	short_term	45	1k7aPYyAnNTjVbjw1YDNp1
146	12163992542	1668800914	track	short_term	46	33vFhGNZa44VJ0I21AOGYe
147	12163992542	1668800914	track	short_term	47	1RzgWAFlI6KOenjOxJYcH0
148	12163992542	1668800914	track	short_term	48	41xaZ4WLlKD95U5PknoJrV
149	12163992542	1668800914	track	short_term	49	5vyt44455ipNNVSYq8fYY7
150	12163992542	1668800914	track	short_term	50	3Cx9j78Z0NE6jYwBWvvV3P
151	12163992542	1668800917	artist	long_term	1	1Xyo4u8uXC1ZmMpatF05PJ
152	12163992542	1668800917	artist	long_term	2	00FQb4jTyendYWaN8pK0wa
153	12163992542	1668800917	artist	long_term	3	360IAlyVv4PCEVjgyMZrxK
154	12163992542	1668800917	artist	long_term	4	4hz8tIajF2INpgM0qzPJz2
155	12163992542	1668800917	artist	long_term	5	4V8LLVI7PbaPR0K2TGSxFF
156	12163992542	1668800917	artist	long_term	6	4lujUKeO6nQAJXpq37Epn7
157	12163992542	1668800917	artist	long_term	7	0bzfPKdbXL5ezYW2z3UGQj
158	12163992542	1668800917	artist	long_term	8	5wFXmYsg3KFJ8BDsQudJ4f
159	12163992542	1668800917	artist	long_term	9	462T0buQ5ScBUQCRpodDRf
160	12163992542	1668800917	artist	long_term	10	0YrtvWJMgSdVrk3SfNjTbx
161	12163992542	1668800917	artist	long_term	11	6ltzsmQQbmdoHHbLZ4ZN25
162	12163992542	1668800917	artist	long_term	12	3jK9MiCrA42lLAdMGUZpwa
163	12163992542	1668800917	artist	long_term	13	3qnGvpP8Yth1AqSBMqON5x
164	12163992542	1668800917	artist	long_term	14	60df5JBRRPcnSpsIMxxwQm
165	12163992542	1668800917	artist	long_term	15	13ubrt8QOOCPljQ2FL1Kca
166	12163992542	1668800917	artist	long_term	16	2YZyLoL8N0Wb9xBt1NhZWg
167	12163992542	1668800917	artist	long_term	17	6QRlkjrHz5A62mqeNZz7t3
168	12163992542	1668800917	artist	long_term	18	5CuU6SRJjbbZL926nSGGxX
169	12163992542	1668800917	artist	long_term	19	6pmxr66tMAePxzOLfjGNcX
170	12163992542	1668800917	artist	long_term	20	3XHO7cRUPCLOr6jwp8vsx5
171	12163992542	1668800917	artist	long_term	21	20wkVLutqVOYrc0kxFs7rA
172	12163992542	1668800917	artist	long_term	22	6eU0jV2eEZ8XTM7EmlguK6
173	12163992542	1668800917	artist	long_term	23	2h93pZq0e7k5yf4dywlkpM
174	12163992542	1668800917	artist	long_term	24	1zXCFUgH6FWS0iCiCKsH55
175	12163992542	1668800917	artist	long_term	25	6PEMFpe3PTOksdV4ZXUpbE
176	12163992542	1668800917	artist	long_term	26	3z6Gk257P9jNcZbBXJNX5i
177	12163992542	1668800917	artist	long_term	27	74oJ4qxwOZvX6oSsu1DGnw
178	12163992542	1668800917	artist	long_term	28	0XSqX2PB3C5dTMv7SZaxSm
179	12163992542	1668800917	artist	long_term	29	08GQAI4eElDnROBrJRGE0X
180	12163992542	1668800917	artist	long_term	30	6l3HvQ5sa6mXTsMTB19rO5
181	12163992542	1668800917	artist	long_term	31	6RZUqkomCmb8zCRqc9eznB
182	12163992542	1668800917	artist	long_term	32	0fA0VVWsXO9YnASrzqfmYu
183	12163992542	1668800917	artist	long_term	33	6ZK2nrW8aCTg8Bid7I7N10
184	12163992542	1668800917	artist	long_term	34	6TVVIyd0fsRDGg6WzHKyTP
185	12163992542	1668800917	artist	long_term	35	6tkrcmVfWoHC4WOhE7IDyq
186	12163992542	1668800917	artist	long_term	36	600GgDUq9kzGJgNIrVsWfz
187	12163992542	1668800917	artist	long_term	37	2jgPkn6LuUazBoBk6vvjh5
188	12163992542	1668800917	artist	long_term	38	6v8FB84lnmJs434UJf2Mrm
189	12163992542	1668800917	artist	long_term	39	3QTDHixorJelOLxoxcjqGx
190	12163992542	1668800917	artist	long_term	40	0qu422H5MOoQxGjd4IzHbS
191	12163992542	1668800917	artist	long_term	41	3ycxRkcZ67ALN3GQJ57Vig
192	12163992542	1668800917	artist	long_term	42	2ooIqOf4X2uz4mMptXCtie
193	12163992542	1668800917	artist	long_term	43	77SW9BnxLY8rJ0RciFqkHh
194	12163992542	1668800917	artist	long_term	44	5NYEE4kgrEZPlM3DxUsTyc
195	12163992542	1668800917	artist	long_term	45	75dQReiBOHN37fQgWQrIAJ
196	12163992542	1668800917	artist	long_term	46	2pAajGWerK3ghwToNWFENS
197	12163992542	1668800917	artist	long_term	47	22bE4uQ6baNwSHPVcDxLCe
198	12163992542	1668800917	artist	long_term	48	5a2EaR3hamoenG9rDuVn8j
199	12163992542	1668800917	artist	long_term	49	6Ghvu1VvMGScGpOUJBAHNH
200	12163992542	1668800917	artist	long_term	50	1KP6TWI40m7p3QBTU6u2xo
201	12163992542	1668800917	artist	medium_term	1	4hz8tIajF2INpgM0qzPJz2
202	12163992542	1668800917	artist	medium_term	2	5wFXmYsg3KFJ8BDsQudJ4f
203	12163992542	1668800917	artist	medium_term	3	360IAlyVv4PCEVjgyMZrxK
204	12163992542	1668800917	artist	medium_term	4	0YrtvWJMgSdVrk3SfNjTbx
205	12163992542	1668800917	artist	medium_term	5	0fA0VVWsXO9YnASrzqfmYu
206	12163992542	1668800917	artist	medium_term	6	2ooIqOf4X2uz4mMptXCtie
207	12163992542	1668800917	artist	medium_term	7	4n0gvapwYbRpzU5Ov68B6P
208	12163992542	1668800917	artist	medium_term	8	1KP6TWI40m7p3QBTU6u2xo
209	12163992542	1668800917	artist	medium_term	9	3jK9MiCrA42lLAdMGUZpwa
210	12163992542	1668800917	artist	medium_term	10	4lujUKeO6nQAJXpq37Epn7
211	12163992542	1668800917	artist	medium_term	11	0XSqX2PB3C5dTMv7SZaxSm
212	12163992542	1668800917	artist	medium_term	12	1zXCFUgH6FWS0iCiCKsH55
213	12163992542	1668800917	artist	medium_term	13	3XHO7cRUPCLOr6jwp8vsx5
214	12163992542	1668800917	artist	medium_term	14	462T0buQ5ScBUQCRpodDRf
215	12163992542	1668800917	artist	medium_term	15	4uSftVc3FPWe6RJuMZNEe9
216	12163992542	1668800917	artist	medium_term	16	6AWdGez5g1jxpfl9XD4wI3
217	12163992542	1668800917	artist	medium_term	17	7HeVXdOdMhLslVputGTZFQ
218	12163992542	1668800917	artist	medium_term	18	6ltzsmQQbmdoHHbLZ4ZN25
219	12163992542	1668800917	artist	medium_term	19	0V7uVrIYr4FwFvUN9S4kYr
220	12163992542	1668800917	artist	medium_term	20	6hnWRPzGGKiapVX1UCdEAC
221	12163992542	1668800917	artist	medium_term	21	2FRXiAz5Uz78LLLSwEUhLt
222	12163992542	1668800917	artist	medium_term	22	2pAajGWerK3ghwToNWFENS
223	12163992542	1668800917	artist	medium_term	23	1Xyo4u8uXC1ZmMpatF05PJ
224	12163992542	1668800917	artist	medium_term	24	1fZpYWNWdL5Z3wrDtISFUH
225	12163992542	1668800917	artist	medium_term	25	6TVVIyd0fsRDGg6WzHKyTP
226	12163992542	1668800917	artist	medium_term	26	7ITd48RbLVpUfheE7B86o2
227	12163992542	1668800917	artist	medium_term	27	0EdvGhlC1FkGItLOWQzG4J
228	12163992542	1668800917	artist	medium_term	28	1yAwtBaoHLEDWAnWR87hBT
229	12163992542	1668800917	artist	medium_term	29	6LufpoVlIYKQCu9Gjpk8B7
230	12163992542	1668800917	artist	medium_term	30	0oSGxfWSnnOXhD2fKuz2Gy
231	12163992542	1668800917	artist	medium_term	31	00FQb4jTyendYWaN8pK0wa
232	12163992542	1668800917	artist	medium_term	32	2kGBy2WHvF0VdZyqiVCkDT
233	12163992542	1668800917	artist	medium_term	33	60df5JBRRPcnSpsIMxxwQm
234	12163992542	1668800917	artist	medium_term	34	68kEuyFKyqrdQQLLsmiatm
235	12163992542	1668800917	artist	medium_term	35	1hzfo8twXdOegF3xireCYs
236	12163992542	1668800917	artist	medium_term	36	251UrhgNbMr15NLzQ2KyKq
237	12163992542	1668800917	artist	medium_term	37	3yY2gUcIsjMr8hjo51PoJ8
238	12163992542	1668800917	artist	medium_term	38	4DFhHyjvGYa9wxdHUjtDkc
239	12163992542	1668800917	artist	medium_term	39	5IcR3N7QB1j6KBL8eImZ8m
240	12163992542	1668800917	artist	medium_term	40	3D4qYDvoPn5cQxtBm4oseo
241	12163992542	1668800917	artist	medium_term	41	3tJ9PkBOrG7hFkHeNM2tbw
242	12163992542	1668800917	artist	medium_term	42	2ApaG60P4r0yhBoDCGD8YG
243	12163992542	1668800917	artist	medium_term	43	0bzfPKdbXL5ezYW2z3UGQj
244	12163992542	1668800917	artist	medium_term	44	6RZUqkomCmb8zCRqc9eznB
245	12163992542	1668800917	artist	medium_term	45	6GEykX11lQqp92UVOQQCC7
246	12163992542	1668800917	artist	medium_term	46	0rpMdBzQXf7aYRnu5fDBJy
247	12163992542	1668800917	artist	medium_term	47	1anAI9P9iSzc9qzLv6AtHZ
248	12163992542	1668800917	artist	medium_term	48	2auiVi8sUZo17dLy1HwrTU
249	12163992542	1668800917	artist	medium_term	49	3qnGvpP8Yth1AqSBMqON5x
250	12163992542	1668800917	artist	medium_term	50	75dQReiBOHN37fQgWQrIAJ
251	12163992542	1668800917	artist	short_term	1	0YrtvWJMgSdVrk3SfNjTbx
252	12163992542	1668800917	artist	short_term	2	5wFXmYsg3KFJ8BDsQudJ4f
253	12163992542	1668800917	artist	short_term	3	4hz8tIajF2INpgM0qzPJz2
254	12163992542	1668800917	artist	short_term	4	4lujUKeO6nQAJXpq37Epn7
255	12163992542	1668800917	artist	short_term	5	0oSGxfWSnnOXhD2fKuz2Gy
256	12163992542	1668800917	artist	short_term	6	462T0buQ5ScBUQCRpodDRf
257	12163992542	1668800917	artist	short_term	7	6TVVIyd0fsRDGg6WzHKyTP
258	12163992542	1668800917	artist	short_term	8	0EdvGhlC1FkGItLOWQzG4J
259	12163992542	1668800917	artist	short_term	9	6LufpoVlIYKQCu9Gjpk8B7
260	12163992542	1668800917	artist	short_term	10	3yY2gUcIsjMr8hjo51PoJ8
261	12163992542	1668800917	artist	short_term	11	6ltzsmQQbmdoHHbLZ4ZN25
262	12163992542	1668800917	artist	short_term	12	0V7uVrIYr4FwFvUN9S4kYr
263	12163992542	1668800917	artist	short_term	13	6zvul52xwTWzilBZl6BUbT
264	12163992542	1668800917	artist	short_term	14	75dQReiBOHN37fQgWQrIAJ
265	12163992542	1668800917	artist	short_term	15	2ooIqOf4X2uz4mMptXCtie
266	12163992542	1668800917	artist	short_term	16	3RGLhK1IP9jnYFH4BRFJBS
267	12163992542	1668800917	artist	short_term	17	2bToe6WyGvADJftreuXh2K
268	12163992542	1668800917	artist	short_term	18	432R46LaYsJZV2Gmc4jUV5
269	12163992542	1668800917	artist	short_term	19	1PryMSya1JnSAlcwYawCxp
270	12163992542	1668800917	artist	short_term	20	0rpMdBzQXf7aYRnu5fDBJy
271	12163992542	1668800917	artist	short_term	21	1nGqKVGfPPiVgxMdx8hYOI
272	12163992542	1668800917	artist	short_term	22	1fZpYWNWdL5Z3wrDtISFUH
273	12163992542	1668800917	artist	short_term	23	7FKTg75ADVMZgY3P9ZMRtH
274	12163992542	1668800917	artist	short_term	24	7bu3H8JO7d0UbMoVzbo70s
275	12163992542	1668800917	artist	short_term	25	0MVp3LuNho9Hk6Q1owsWwt
276	12163992542	1668800917	artist	short_term	26	1SQRv42e4PjEYfPhS0Tk9E
277	12163992542	1668800917	artist	short_term	27	0oL26Dn9y761yfJgNb3vfu
278	12163992542	1668800917	artist	short_term	28	4BFMTELQyWJU1SwqcXMBm3
279	12163992542	1668800917	artist	short_term	29	60df5JBRRPcnSpsIMxxwQm
280	12163992542	1668800917	artist	short_term	30	0v6gOfGBclTSGu6agfXb23
281	12163992542	1668800917	artist	short_term	31	0yNLKJebCb8Aueb54LYya3
282	12163992542	1668800917	artist	short_term	32	4fXkvh05wFhuH77MfD4m9o
283	12163992542	1668800917	artist	short_term	33	2x9SpqnPi8rlE9pjHBwmSC
284	12163992542	1668800917	artist	short_term	34	4LG4Bs1Gadht7TCrMytQUO
285	12163992542	1668800917	artist	short_term	35	0XSqX2PB3C5dTMv7SZaxSm
286	12163992542	1668800917	artist	short_term	36	1Tp7C6LzxZe9Mix6rn4zbI
287	12163992542	1668800917	artist	short_term	37	7foyQbi7GKriLiv1GPVEwt
288	12163992542	1668800917	artist	short_term	38	1anAI9P9iSzc9qzLv6AtHZ
289	12163992542	1668800917	artist	short_term	39	6m4tJuf67jwVSvMP34hrck
290	12163992542	1668800917	artist	short_term	40	1nJvji2KIlWSseXRSlNYsC
291	12163992542	1668800917	artist	short_term	41	32Ko3nL0210QAt14S3Rs4Y
292	12163992542	1668800917	artist	short_term	42	4Z8W4fKeB5YxbusRsdQVPb
293	12163992542	1668800917	artist	short_term	43	4zsrUnozu6zRlVELQezaBn
294	12163992542	1668800917	artist	short_term	44	00tVTdpEhQQw1bqdu8RCx2
295	12163992542	1668800917	artist	short_term	45	0vqkz1b2qBkoYrGMj2CUWq
296	12163992542	1668800917	artist	short_term	46	22bE4uQ6baNwSHPVcDxLCe
297	12163992542	1668800917	artist	short_term	47	2AV6XDIs32ofIJhkkDevjm
298	12163992542	1668800917	artist	short_term	48	2FXC3k01G6Gw61bmprjgqS
299	12163992542	1668800917	artist	short_term	49	2g3PKH7Z1Ofn5oGR6oDjLy
300	12163992542	1668800917	artist	short_term	50	2h93pZq0e7k5yf4dywlkpM
301	the_real_wjdhollow	1668801050	track	long_term	1	7CUkeiG7QtB7tPU9f8SANS
302	the_real_wjdhollow	1668801050	track	long_term	2	0HsGh7cboYz6cVMIyFrQ8j
303	the_real_wjdhollow	1668801050	track	long_term	3	50bmpfgcV29ouRVDfr5wOc
304	the_real_wjdhollow	1668801050	track	long_term	4	0ZAbupc7jAQpG9IxojQ3s3
305	the_real_wjdhollow	1668801050	track	long_term	5	474uVhyGgK5MtY9gMcDgGl
306	the_real_wjdhollow	1668801050	track	long_term	6	4uQ7wYsuL0DryknoDc11Hk
307	the_real_wjdhollow	1668801050	track	long_term	7	734xplxSpoW22U5OeeZcr8
308	the_real_wjdhollow	1668801050	track	long_term	8	65ENznU4hwrR04whyJboxr
309	the_real_wjdhollow	1668801050	track	long_term	9	0fIffclhgJC5h8AdMMVvkp
310	the_real_wjdhollow	1668801050	track	long_term	10	7trx783SvnHhKkmgSSTIFJ
311	the_real_wjdhollow	1668801050	track	long_term	11	4rc2WNOt2w8BHfQjBC8PO0
312	the_real_wjdhollow	1668801050	track	long_term	12	7HNpXPaTcX5CoNBjTAEWBr
313	the_real_wjdhollow	1668801050	track	long_term	13	2XU0oxnq2qxCpomAAuJY8K
314	the_real_wjdhollow	1668801050	track	long_term	14	61bwFjzXGG1x2aZsANdLyl
315	the_real_wjdhollow	1668801050	track	long_term	15	0nbXyq5TXYPCO7pr3N8S4I
316	the_real_wjdhollow	1668801050	track	long_term	16	4jM6Tl8062cc9gTJgTZTpx
317	the_real_wjdhollow	1668801050	track	long_term	17	6vECYJHxYmm3Ydt3fF01pE
318	the_real_wjdhollow	1668801050	track	long_term	18	2SY8qCm2nwl2JK3BBOhBrl
319	the_real_wjdhollow	1668801050	track	long_term	19	7aiClxsDWFRQ0Kzk5KI5ku
320	the_real_wjdhollow	1668801050	track	long_term	20	7fBv7CLKzipRk6EC6TWHOB
321	the_real_wjdhollow	1668801050	track	long_term	21	1z4xjDLLWJgG48Bn8OCxZv
322	the_real_wjdhollow	1668801050	track	long_term	22	02kDW379Yfd5PzW5A6vuGt
323	the_real_wjdhollow	1668801050	track	long_term	23	4fuPFCrsnZ85emMfL52CKp
324	the_real_wjdhollow	1668801050	track	long_term	24	2Z8WuEywRWYTKe1NybPQEW
325	the_real_wjdhollow	1668801050	track	long_term	25	5OFEJMirg4NPz7G1zgXDYu
326	the_real_wjdhollow	1668801050	track	long_term	26	6PQ88X9TkUIAUIZJHW2upE
327	the_real_wjdhollow	1668801050	track	long_term	27	2eel5Us5RHsvtBNPnFT5E1
328	the_real_wjdhollow	1668801050	track	long_term	28	6i0V12jOa3mr6uu4WYhUBr
329	the_real_wjdhollow	1668801050	track	long_term	29	3NWTRZ0A8xKlBP1qgNftql
330	the_real_wjdhollow	1668801050	track	long_term	30	19gEmPjfqSZT0ulDRfjl0m
331	the_real_wjdhollow	1668801050	track	long_term	31	78JKJfKsqgeBDBF58gv1SF
332	the_real_wjdhollow	1668801050	track	long_term	32	367HmvU5MpsWZdAJ3QbGlZ
333	the_real_wjdhollow	1668801050	track	long_term	33	0wzruvvN7f5wu39aFcjTMw
334	the_real_wjdhollow	1668801050	track	long_term	34	3p9x4bK5bwmgXE6POMvOp0
335	the_real_wjdhollow	1668801050	track	long_term	35	6bnF93Rx87YqUBLSgjiMU8
336	the_real_wjdhollow	1668801050	track	long_term	36	4EFy48vEJNG3xQf5Er4scn
337	the_real_wjdhollow	1668801050	track	long_term	37	37ZvpHeZKazqOnLfAGm9nb
338	the_real_wjdhollow	1668801050	track	long_term	38	6ORqU0bHbVCRjXm9AjyHyZ
339	the_real_wjdhollow	1668801050	track	long_term	39	2fwz9mBaELJCzXuEEEe35Y
340	the_real_wjdhollow	1668801050	track	long_term	40	5wfllwdjglyQislkskYLBv
341	the_real_wjdhollow	1668801050	track	long_term	41	0VjIjW4GlUZAMYd2vXMi3b
342	the_real_wjdhollow	1668801050	track	long_term	42	22VdIZQfgXJea34mQxlt81
343	the_real_wjdhollow	1668801050	track	long_term	43	5rfT032kGmLvbxZzfHlu5D
344	the_real_wjdhollow	1668801050	track	long_term	44	5mpLcXEsk3jjzLFGuNKk5I
345	the_real_wjdhollow	1668801050	track	long_term	45	16ro1is6DmDKkarlJMBbzV
346	the_real_wjdhollow	1668801050	track	long_term	46	0yhGTljYYHyP7phuxoKWiJ
347	the_real_wjdhollow	1668801050	track	long_term	47	2QbGvQssb0VLLS4x5NOmyJ
348	the_real_wjdhollow	1668801050	track	long_term	48	7vaFuClNKe02pjKYbXEJ46
349	the_real_wjdhollow	1668801050	track	long_term	49	6L89mwZXSOwYl76YXfX13s
350	the_real_wjdhollow	1668801050	track	long_term	50	1G6CIweqjfKzFyEfTH4V3u
351	the_real_wjdhollow	1668801050	track	medium_term	1	0z5oHDjD9vMsck14zoAQOc
352	the_real_wjdhollow	1668801050	track	medium_term	2	0KV4Ax6L10oSTWqC8607K4
353	the_real_wjdhollow	1668801050	track	medium_term	3	6myUpr3GDR80Dg3zqNTmmG
354	the_real_wjdhollow	1668801050	track	medium_term	4	5CFJRZRq6sdKKtRwNPWbYv
355	the_real_wjdhollow	1668801050	track	medium_term	5	1xzUQMiCoY5pdego0pHMeV
356	the_real_wjdhollow	1668801050	track	medium_term	6	7CUkeiG7QtB7tPU9f8SANS
357	the_real_wjdhollow	1668801050	track	medium_term	7	3ImnbJHoSy5uUhC0ydBVI9
358	the_real_wjdhollow	1668801050	track	medium_term	8	39Yp9wwQiSRIDOvrVg7mbk
359	the_real_wjdhollow	1668801050	track	medium_term	9	5V5BHmvpylV0nSc2Yu2Mu4
360	the_real_wjdhollow	1668801050	track	medium_term	10	40mjsnRjCpycdUw3xhS20g
361	the_real_wjdhollow	1668801050	track	medium_term	11	4nuAslShoN77tq12fzwjUq
362	the_real_wjdhollow	1668801050	track	medium_term	12	6LyAwkJsHlW7RQ8S1cYAtM
363	the_real_wjdhollow	1668801050	track	medium_term	13	4jM6Tl8062cc9gTJgTZTpx
364	the_real_wjdhollow	1668801050	track	medium_term	14	30KctD1WsHKTIYczXjip5a
365	the_real_wjdhollow	1668801050	track	medium_term	15	4IIuCotvqijraSdnVLaFnM
366	the_real_wjdhollow	1668801050	track	medium_term	16	6gBFPUFcJLzWGx4lenP6h2
367	the_real_wjdhollow	1668801050	track	medium_term	17	3mRlFZHUyvJbPTlkzg4LyJ
368	the_real_wjdhollow	1668801050	track	medium_term	18	5B3b5qszWCl22HlzitMh7x
369	the_real_wjdhollow	1668801050	track	medium_term	19	1tX1GK4bLfoS9oDIIbhYAv
370	the_real_wjdhollow	1668801050	track	medium_term	20	4xSY7Pxe3bveG1WOIIcYdr
371	the_real_wjdhollow	1668801050	track	medium_term	21	0fIffclhgJC5h8AdMMVvkp
372	the_real_wjdhollow	1668801050	track	medium_term	22	0IH3D0P8OrQFs6ajcqbm0R
373	the_real_wjdhollow	1668801050	track	medium_term	23	2cYqizR4lgvp4Qu6IQ3qGN
374	the_real_wjdhollow	1668801050	track	medium_term	24	46M2hXnaQpueG7vSvgVtVH
375	the_real_wjdhollow	1668801050	track	medium_term	25	6AomCkEOQUODCYzQwH4SWC
376	the_real_wjdhollow	1668801050	track	medium_term	26	2p23H2gdnWEiGUEymqarpJ
377	the_real_wjdhollow	1668801050	track	medium_term	27	24jP9hAAauSG4IH5zGji8a
378	the_real_wjdhollow	1668801050	track	medium_term	28	3eekarcy7kvN4yt5ZFzltW
379	the_real_wjdhollow	1668801050	track	medium_term	29	7ycWLEP1GsNjVvcjawXz3z
380	the_real_wjdhollow	1668801050	track	medium_term	30	1ZM8toCOlnfBKJdvR8GqUq
381	the_real_wjdhollow	1668801050	track	medium_term	31	14eDzYfNRuqs1kf7zfIFJW
382	the_real_wjdhollow	1668801050	track	medium_term	32	1dQtt3K8GyPmH7ZD1LJ2ox
383	the_real_wjdhollow	1668801050	track	medium_term	33	1fewSx2d5KIZ04wsooEBOz
384	the_real_wjdhollow	1668801050	track	medium_term	34	2Guz1b911CbpG8L92cnglI
385	the_real_wjdhollow	1668801050	track	medium_term	35	4gmmRb6bZJffOOiww1JGTO
386	the_real_wjdhollow	1668801050	track	medium_term	36	7sO5G9EABYOXQKNPNiE9NR
387	the_real_wjdhollow	1668801050	track	medium_term	37	5OFEJMirg4NPz7G1zgXDYu
388	the_real_wjdhollow	1668801050	track	medium_term	38	2MLuFz9Y3Vg3PF0Yf93M5c
389	the_real_wjdhollow	1668801050	track	medium_term	39	1x5ihkusmVWsQWtvSCtW9q
390	the_real_wjdhollow	1668801050	track	medium_term	40	0XLQyCwYu8dhhzWAKSs3wr
391	the_real_wjdhollow	1668801050	track	medium_term	41	1tzTiTLSRisnQiOnhgAdtF
392	the_real_wjdhollow	1668801050	track	medium_term	42	1wAdcYWWPbcqiUcum9brWw
393	the_real_wjdhollow	1668801050	track	medium_term	43	2dy2C0StZ3yiEeb0Aoolcn
394	the_real_wjdhollow	1668801050	track	medium_term	44	3WKrSWltDbNcY5M3haaFxQ
395	the_real_wjdhollow	1668801050	track	medium_term	45	4FF4q2qyOsFhRavZ0bdVXT
396	the_real_wjdhollow	1668801050	track	medium_term	46	1vvBUZseJ7fwYPX1NedOLd
397	the_real_wjdhollow	1668801050	track	medium_term	47	4FeBA1bxkUae1aDsplsmrv
398	the_real_wjdhollow	1668801050	track	medium_term	48	5SWnsxjhdcEDc7LJjq9UHk
399	the_real_wjdhollow	1668801050	track	medium_term	49	643PW82aBMUa1FiWi5VQY7
400	the_real_wjdhollow	1668801050	track	medium_term	50	367HmvU5MpsWZdAJ3QbGlZ
401	the_real_wjdhollow	1668801050	track	short_term	1	0G88ZH0qqBCBbtrHnEDqrn
402	the_real_wjdhollow	1668801050	track	short_term	2	7lzfMZak2HjNPXXSxksjPB
403	the_real_wjdhollow	1668801050	track	short_term	3	02a8cGumnKuEPgoCzmalJp
404	the_real_wjdhollow	1668801050	track	short_term	4	1Hn0iEB1FPfJzJPK49qVtH
405	the_real_wjdhollow	1668801050	track	short_term	5	6giaOyDFbE4J8iclhCdW7E
406	the_real_wjdhollow	1668801050	track	short_term	6	0z5oHDjD9vMsck14zoAQOc
407	the_real_wjdhollow	1668801050	track	short_term	7	044fQ35cLbMVwta0KyN5dM
408	the_real_wjdhollow	1668801050	track	short_term	8	2BvDFQOl4JieEGK2cgKOey
409	the_real_wjdhollow	1668801050	track	short_term	9	2cYqizR4lgvp4Qu6IQ3qGN
410	the_real_wjdhollow	1668801050	track	short_term	10	3QKJELWORZZ7rUZDWeMWSA
411	the_real_wjdhollow	1668801050	track	short_term	11	3zcBNmJH6ToRCI0WNEIuES
412	the_real_wjdhollow	1668801050	track	short_term	12	4gmmRb6bZJffOOiww1JGTO
413	the_real_wjdhollow	1668801050	track	short_term	13	4nuAslShoN77tq12fzwjUq
414	the_real_wjdhollow	1668801050	track	short_term	14	50c0knPGjaJAuE4hRg28Qq
415	the_real_wjdhollow	1668801050	track	short_term	15	5CFJRZRq6sdKKtRwNPWbYv
416	the_real_wjdhollow	1668801050	track	short_term	16	5JuWx9sV8TbtIMhiiPVbnz
417	the_real_wjdhollow	1668801050	track	short_term	17	5YctcwZCRMxlIHDpTuqKOE
418	the_real_wjdhollow	1668801050	track	short_term	18	6Sm4XdGI7GhHG7sjVcVrI2
419	the_real_wjdhollow	1668801050	track	short_term	19	6myUpr3GDR80Dg3zqNTmmG
420	the_real_wjdhollow	1668801050	track	short_term	20	6sKopGG4r21ObTE8V6pD6x
421	the_real_wjdhollow	1668801050	track	short_term	21	78I8jaChZbPu72bIGGPMKk
422	the_real_wjdhollow	1668801050	track	short_term	22	7sO5G9EABYOXQKNPNiE9NR
423	the_real_wjdhollow	1668801050	track	short_term	23	5Ikos3uiBfPYAf7EZfz8t3
424	the_real_wjdhollow	1668801050	track	short_term	24	0IH3D0P8OrQFs6ajcqbm0R
425	the_real_wjdhollow	1668801050	track	short_term	25	1fewSx2d5KIZ04wsooEBOz
426	the_real_wjdhollow	1668801050	track	short_term	26	1xzUQMiCoY5pdego0pHMeV
427	the_real_wjdhollow	1668801050	track	short_term	27	24jP9hAAauSG4IH5zGji8a
428	the_real_wjdhollow	1668801050	track	short_term	28	2wL88cvKXUOfHuYVd62hji
429	the_real_wjdhollow	1668801050	track	short_term	29	39Yp9wwQiSRIDOvrVg7mbk
430	the_real_wjdhollow	1668801050	track	short_term	30	43HM6P2yX7ls3q92qrkhL4
431	the_real_wjdhollow	1668801050	track	short_term	31	6LyAwkJsHlW7RQ8S1cYAtM
432	the_real_wjdhollow	1668801050	track	short_term	32	1O5pf5R8xvppS2pD03HVy5
433	the_real_wjdhollow	1668801050	track	short_term	33	20I1Mickm2w7qGxk7uzOKr
434	the_real_wjdhollow	1668801050	track	short_term	34	465hVdgg75kPgRdpJfEFFT
435	the_real_wjdhollow	1668801050	track	short_term	35	4mn5HdatHKN7iFGDes9G8i
436	the_real_wjdhollow	1668801050	track	short_term	36	7cEfPAbju7glmdAgT4e1AU
437	the_real_wjdhollow	1668801050	track	short_term	37	0JL9TZip7mL7iwC5EOkALS
438	the_real_wjdhollow	1668801050	track	short_term	38	0Nkp56EKreoWMYxpXJqUNZ
439	the_real_wjdhollow	1668801050	track	short_term	39	0QZ5yyl6B6utIWkxeBDxQN
440	the_real_wjdhollow	1668801050	track	short_term	40	0ZQfn5nh2TnVE6Q0AT8eXr
441	the_real_wjdhollow	1668801050	track	short_term	41	0eEXcw3JLVXcRxYrVYMy68
442	the_real_wjdhollow	1668801050	track	short_term	42	126HWk9JuCt4PHZJAAsgOv
443	the_real_wjdhollow	1668801050	track	short_term	43	1IkE3IsuP4HNU073wsE6T5
444	the_real_wjdhollow	1668801050	track	short_term	44	1MPmF4py7FxbeqFGpKn09C
445	the_real_wjdhollow	1668801050	track	short_term	45	1XjFyPzU5z3zbYJQETYGiZ
446	the_real_wjdhollow	1668801050	track	short_term	46	1brWhQEoBoT9tMnNfcRsjr
447	the_real_wjdhollow	1668801050	track	short_term	47	29Lq5UKpHBGxQTDxsPKwFz
448	the_real_wjdhollow	1668801050	track	short_term	48	2VBN5kSs1fyiE5fnOYeKsG
449	the_real_wjdhollow	1668801050	track	short_term	49	2YXpMdEMEoy48OPr6VTzpI
450	the_real_wjdhollow	1668801050	track	short_term	50	2dCBXxXNur85q9gGIpsAdr
501	the_real_wjdhollow	1668801052	artist	medium_term	1	0fA0VVWsXO9YnASrzqfmYu
502	the_real_wjdhollow	1668801052	artist	medium_term	2	18hl4QMrybIXbkGi2BzXcf
503	the_real_wjdhollow	1668801052	artist	medium_term	3	2EhUXeszBQRApbBmTOXlKU
504	the_real_wjdhollow	1668801052	artist	medium_term	4	6PfSUFtkMVoDkx4MQkzOi3
505	the_real_wjdhollow	1668801052	artist	medium_term	5	4hz8tIajF2INpgM0qzPJz2
506	the_real_wjdhollow	1668801052	artist	medium_term	6	5r4anprO9Hg9CBlmdkwFdE
507	the_real_wjdhollow	1668801052	artist	medium_term	7	6Q1ggxOPVDbMyqlhv0tmT4
508	the_real_wjdhollow	1668801052	artist	medium_term	8	1AldSIJ8ANuZVbjKIhpKKq
509	the_real_wjdhollow	1668801052	artist	medium_term	9	0I11U609NiFEdpvNix7oNl
510	the_real_wjdhollow	1668801052	artist	medium_term	10	0Y5tJX1MQlPlqiwlOH1tJY
511	the_real_wjdhollow	1668801052	artist	medium_term	11	0dlDsD7y6ccmDm8tuWCU6F
512	the_real_wjdhollow	1668801052	artist	medium_term	12	1hzfo8twXdOegF3xireCYs
513	the_real_wjdhollow	1668801052	artist	medium_term	13	5IcR3N7QB1j6KBL8eImZ8m
514	the_real_wjdhollow	1668801052	artist	medium_term	14	7HGNYPmbDrMkylWqeFCOIQ
515	the_real_wjdhollow	1668801052	artist	medium_term	15	7Im2r58zlLJIDfamqDjEE6
516	the_real_wjdhollow	1668801052	artist	medium_term	16	6xQwC94a61f3bZwyl4UJXD
517	the_real_wjdhollow	1668801052	artist	medium_term	17	4M5nCE77Qaxayuhp3fVn4V
518	the_real_wjdhollow	1668801052	artist	medium_term	18	13ubrt8QOOCPljQ2FL1Kca
519	the_real_wjdhollow	1668801052	artist	medium_term	19	6aaMZ3fcfLv4tEbmY7bjRM
520	the_real_wjdhollow	1668801052	artist	medium_term	20	7hi7sNBb4AWmzHRjFCs94V
521	the_real_wjdhollow	1668801052	artist	medium_term	21	04gDigrS5kc9YWfZHwBETP
522	the_real_wjdhollow	1668801052	artist	medium_term	22	6BIltkF2V7p0PHLtUyc7re
523	the_real_wjdhollow	1668801052	artist	medium_term	23	2p1fiYHYiXz9qi0JJyxBzN
524	the_real_wjdhollow	1668801052	artist	medium_term	24	7qJAk8CiXUgDPPUF3REKr2
525	the_real_wjdhollow	1668801052	artist	medium_term	25	5SKEXbgzIdRl3gQJ23CnUP
526	the_real_wjdhollow	1668801052	artist	medium_term	26	1cIz2h3ERs72r60yw78Deu
527	the_real_wjdhollow	1668801052	artist	medium_term	27	4CrK2BAeyd3DIt2M2ELPJ4
528	the_real_wjdhollow	1668801052	artist	medium_term	28	5CCwRZC6euC8Odo6y9X8jr
529	the_real_wjdhollow	1668801052	artist	medium_term	29	1b8kpp4DUwt1hWaxTiWQhD
530	the_real_wjdhollow	1668801052	artist	medium_term	30	4ERtgeBbWRkFzIz6LaFCeY
451	the_real_wjdhollow	1668801052	artist	long_term	1	4hz8tIajF2INpgM0qzPJz2
452	the_real_wjdhollow	1668801052	artist	long_term	2	68kEuyFKyqrdQQLLsmiatm
453	the_real_wjdhollow	1668801052	artist	long_term	3	0EdvGhlC1FkGItLOWQzG4J
454	the_real_wjdhollow	1668801052	artist	long_term	4	1Xyo4u8uXC1ZmMpatF05PJ
455	the_real_wjdhollow	1668801052	artist	long_term	5	0fA0VVWsXO9YnASrzqfmYu
456	the_real_wjdhollow	1668801052	artist	long_term	6	6PfSUFtkMVoDkx4MQkzOi3
457	the_real_wjdhollow	1668801052	artist	long_term	7	5wFXmYsg3KFJ8BDsQudJ4f
458	the_real_wjdhollow	1668801052	artist	long_term	8	0YrtvWJMgSdVrk3SfNjTbx
459	the_real_wjdhollow	1668801052	artist	long_term	9	5IcR3N7QB1j6KBL8eImZ8m
460	the_real_wjdhollow	1668801052	artist	long_term	10	2ooIqOf4X2uz4mMptXCtie
461	the_real_wjdhollow	1668801052	artist	long_term	11	246dkjvS1zLTtiykXe5h60
462	the_real_wjdhollow	1668801052	artist	long_term	12	25uiPmTg16RbhZWAqwLBy5
463	the_real_wjdhollow	1668801052	artist	long_term	13	1hzfo8twXdOegF3xireCYs
464	the_real_wjdhollow	1668801052	artist	long_term	14	4r63FhuTkUYltbVAg5TQnk
465	the_real_wjdhollow	1668801052	artist	long_term	15	26T3LtbuGT1Fu9m0eRq5X3
466	the_real_wjdhollow	1668801052	artist	long_term	16	4kI8Ie27vjvonwaB2ePh8T
467	the_real_wjdhollow	1668801052	artist	long_term	17	24XtlMhEMNdi822vi0MhY1
468	the_real_wjdhollow	1668801052	artist	long_term	18	64KEffDW9EtZ1y2vBYgq8T
469	the_real_wjdhollow	1668801052	artist	long_term	19	3YQKmKGau1PzlVlkL1iodx
470	the_real_wjdhollow	1668801052	artist	long_term	20	1yAwtBaoHLEDWAnWR87hBT
471	the_real_wjdhollow	1668801052	artist	long_term	21	360IAlyVv4PCEVjgyMZrxK
472	the_real_wjdhollow	1668801052	artist	long_term	22	15UsOTVnJzReFVN1VCnxy4
473	the_real_wjdhollow	1668801052	artist	long_term	23	5cj0lLjcoR7YOSnhnX0Po5
474	the_real_wjdhollow	1668801052	artist	long_term	24	6qqNVTkY8uBg9cP3Jd7DAH
475	the_real_wjdhollow	1668801052	artist	long_term	25	5yV1qdnmxyIYiSFB02wpDj
476	the_real_wjdhollow	1668801052	artist	long_term	26	41rVuRHYAiH7ltBTHVR9We
477	the_real_wjdhollow	1668801052	artist	long_term	27	13ubrt8QOOCPljQ2FL1Kca
478	the_real_wjdhollow	1668801052	artist	long_term	28	2kGBy2WHvF0VdZyqiVCkDT
479	the_real_wjdhollow	1668801052	artist	long_term	29	0H39MdGGX6dbnnQPt6NQkZ
480	the_real_wjdhollow	1668801052	artist	long_term	30	0EeQBlQJFiAfJeVN2vT9s0
481	the_real_wjdhollow	1668801052	artist	long_term	31	0jNDKefhfSbLR9sFvcPLHo
482	the_real_wjdhollow	1668801052	artist	long_term	32	18hl4QMrybIXbkGi2BzXcf
483	the_real_wjdhollow	1668801052	artist	long_term	33	7boQqq2hUcz9kHcQOecG4j
484	the_real_wjdhollow	1668801052	artist	long_term	34	3XHO7cRUPCLOr6jwp8vsx5
485	the_real_wjdhollow	1668801052	artist	long_term	35	5BvJzeQpmsdsFp4HGUYUEx
486	the_real_wjdhollow	1668801052	artist	long_term	36	0dlDsD7y6ccmDm8tuWCU6F
487	the_real_wjdhollow	1668801052	artist	long_term	37	4MCBfE4596Uoi2O4DtmEMz
488	the_real_wjdhollow	1668801052	artist	long_term	38	2EhUXeszBQRApbBmTOXlKU
489	the_real_wjdhollow	1668801052	artist	long_term	39	4V8LLVI7PbaPR0K2TGSxFF
490	the_real_wjdhollow	1668801052	artist	long_term	40	6eUKZXaKkcviH0Ku9w2n3V
491	the_real_wjdhollow	1668801052	artist	long_term	41	0XSqX2PB3C5dTMv7SZaxSm
492	the_real_wjdhollow	1668801052	artist	long_term	42	1vCWHaC5f2uS3yhpwWbIA6
493	the_real_wjdhollow	1668801052	artist	long_term	43	3TVXtAsR1Inumwj472S9r4
494	the_real_wjdhollow	1668801052	artist	long_term	44	0SwO7SWeDHJijQ3XNS7xEE
495	the_real_wjdhollow	1668801052	artist	long_term	45	0Y5tJX1MQlPlqiwlOH1tJY
496	the_real_wjdhollow	1668801052	artist	long_term	46	3AA28KZvwAUcZuOKwyblJQ
497	the_real_wjdhollow	1668801052	artist	long_term	47	4LLpKhyESsyAXpc4laK94U
498	the_real_wjdhollow	1668801052	artist	long_term	48	6QRlkjrHz5A62mqeNZz7t3
499	the_real_wjdhollow	1668801052	artist	long_term	49	5r4anprO9Hg9CBlmdkwFdE
500	the_real_wjdhollow	1668801052	artist	long_term	50	4Z8W4fKeB5YxbusRsdQVPb
551	the_real_wjdhollow	1668801052	artist	short_term	1	7HGNYPmbDrMkylWqeFCOIQ
552	the_real_wjdhollow	1668801052	artist	short_term	2	0fA0VVWsXO9YnASrzqfmYu
553	the_real_wjdhollow	1668801052	artist	short_term	3	1b8kpp4DUwt1hWaxTiWQhD
554	the_real_wjdhollow	1668801052	artist	short_term	4	7oEkUINVIj1Nr3Wnj8tzqr
555	the_real_wjdhollow	1668801052	artist	short_term	5	1gIa65d5ICT2xVWiUJ3u27
531	the_real_wjdhollow	1668801052	artist	medium_term	31	1URnnhqYAYcrqrcwql10ft
532	the_real_wjdhollow	1668801052	artist	medium_term	32	4dM6NDYSfLcspt8GLoT5aE
533	the_real_wjdhollow	1668801052	artist	medium_term	33	1KEUVZo7CMTSJoM8doulOT
534	the_real_wjdhollow	1668801052	artist	medium_term	34	67p5GMYQZOgaAfx1YyttQk
535	the_real_wjdhollow	1668801052	artist	medium_term	35	6dGRShw3EqULdxZl9EEJYv
536	the_real_wjdhollow	1668801052	artist	medium_term	36	7oEkUINVIj1Nr3Wnj8tzqr
537	the_real_wjdhollow	1668801052	artist	medium_term	37	6ltzsmQQbmdoHHbLZ4ZN25
538	the_real_wjdhollow	1668801052	artist	medium_term	38	68kEuyFKyqrdQQLLsmiatm
539	the_real_wjdhollow	1668801052	artist	medium_term	39	6qgc4bSHhzZxnJ01WDEAHt
540	the_real_wjdhollow	1668801052	artist	medium_term	40	0YrtvWJMgSdVrk3SfNjTbx
541	the_real_wjdhollow	1668801052	artist	medium_term	41	1gIa65d5ICT2xVWiUJ3u27
542	the_real_wjdhollow	1668801052	artist	medium_term	42	2YZyLoL8N0Wb9xBt1NhZWg
543	the_real_wjdhollow	1668801052	artist	medium_term	43	5ZfHVIBVoMg0VjgUBU0alH
544	the_real_wjdhollow	1668801052	artist	medium_term	44	5nJ5xDXFO4czh2gJ9f4wto
545	the_real_wjdhollow	1668801052	artist	medium_term	45	5sEDTHJJyDEWVFx99hGSIb
546	the_real_wjdhollow	1668801052	artist	medium_term	46	1K9pNfOfxZFfbEgoOmjV13
547	the_real_wjdhollow	1668801052	artist	medium_term	47	4LLpKhyESsyAXpc4laK94U
548	the_real_wjdhollow	1668801052	artist	medium_term	48	4Lm0pUvmisUHMdoky5ch2I
549	the_real_wjdhollow	1668801052	artist	medium_term	49	6TVVIyd0fsRDGg6WzHKyTP
550	the_real_wjdhollow	1668801052	artist	medium_term	50	1MXZ0hsGic96dWRDKwAwdr
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
2I88NEWpKrAPZuapXNV5G6	30DhU7BDmF4PH0JVhu8ZRg	2ICdqEf91Kc9FwdlLtB748	Belong to You (feat. 6LACK)	61
6YZQx90VEuzf0lRY9TYh7j	360IAlyVv4PCEVjgyMZrxK	3fUHDbd0oujqAerhHZjdsj	Get You - Recorded at Spotify Studios NYC	46
54b8qPFqYqIndfdxiLApea	34jw2BbxjoYalTp8cJFCPv	56dfEbntfVTMCxjrjggL1e	Alone	74
3sTN90bIP2cJ1783ctHykO	5Q81rlcTFh3k6DQJXPdsot	0NBTBo1qrg554sAj79nEqD	Love$ick (feat. A$AP Rocky)	73
2P3SLxeQHPqh8qKB6gtJY2	2YZyLoL8N0Wb9xBt1NhZWg	3DGQ1iZ9XKUQxAUWjfC34w	Poetic Justice	72
474uVhyGgK5MtY9gMcDgGl	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	It's Called: Freefall	76
16ro1is6DmDKkarlJMBbzV	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	When It Lands	60
4frLb7nWtsz2ymBE6k2GRP	1Xyo4u8uXC1ZmMpatF05PJ	0P3oVJBFOv3TDXlYRhGL7s	Earned It (Fifty Shades Of Grey)	74
2G2YzndIA6jeWFPBXhUjh5	7CyeXFnOrfC1N6z4naIpgo	3vLFWR3fLqfY82WGvaLuyV	Be My Baby	68
5jZ1Z2GFTf2gwmFc3qiUxs	55VydwMyCuGcavwPuhutPL	57d5dFo7oN2yUyGfSKPrRv	The Taste of Ink	66
5vyt44455ipNNVSYq8fYY7	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Fever Pitch	55
1OFKUn2VLafrHj7ybnap0Q	08ct2eZF5lUPdJpHwNKWof	5AYmpTfdv1OoASUJ5rZB7K	Only Wanna Be with You	69
21oJ1K99GBJrE2GVQGVjA0	30DhU7BDmF4PH0JVhu8ZRg	2ICdqEf91Kc9FwdlLtB748	Frozen	61
1LzNfuep1bnAUR9skqdHCK	37w38cCSGgKLdayTRjna4W	5K18gTgac0q6Jma5HkV1vA	Fade Into You	78
748yv6bb3l3CcKS45a6SZ8	4bthk9UfsYUYdcFyqxmSUU	2HyJKdwnnaM156kvcPDwr8	Head Over Heels	68
6NvRxjfYkkT2SpirAlmsjH	4pejUc4iciQfgdX6OKulQn	58HZZpS0wxJKwGjoerg0mk	No One Knows	66
0hJS3EHWC4uL9sJ52ErpoN	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Hide	57
1ZaNp6b4cY3zcrciagi7td	7qKoy46vPnmIxKCN6ewBG4	0xAjncT0noqLbBH6iT4HjH	Cigarette Lighter Love Song - Live	14
1qQSRy9DjrGh3jtsSCU6B1	1eClJfHLoDI4rZe5HxzBFv	7cuwWzS0oiApEt2fpKafkX	Never Tear Us Apart	62
3s8MBOMdUi5Vol77qq8KJJ	2iul6etLF5hjjpxo43rzz7	05kYWbiEVwGcd2Y2wolwWz	Wolf Like Me ft. Shovels & Rope	0
4j3GWI86JvSaF0BLdmgcfF	73sIBHcqh3Z3NyqHKZ7FOL	15k99o4mZJ9mfpQGIOrZ45	Summertime Magic	62
4f8Mh5wuWHOsfXtzjrJB3t	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	I THINK	72
6VojZJpMyuKClbwyilWlQj	3oDbviiivRWhXwIE8hxkVV	2ninxvLuYGCb6H92qTaSFZ	Wouldn't It Be Nice	57
1TDdYSYLIXMJ4EiKO6ZCYk	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Mission to Mars	58
1RbOObDFn7GOseR1w529Zj	6loBF9iQdE11WSX29fNKqY	1V8qUSg1WAHf3dCrVYdJ5Z	Things Can Only Get Better	56
0Hw6SCrtU9pFCjgAONpnGZ	7guDJrEfX3qb6FEbdPA5qi	0qnHA4SDco9mPuWGzDqVDK	Uptight (Everything's Alright)	57
0S29RwGLJutn4qnFJQL13n	0YHgnSkV3S5mvSSCTRWDi5	511e7X2zYDqPWQGADatYz2	Georgia Law Man	44
5SCB7L1alKg7ZEeSw7Sq9f	57bUPid8xztkieZfS7OlEV	7vNmiLEdMqJYUlPxSx2zgg	I Hear A Symphony	48
3aN2V18W3EiW7eg5tHALpF	0X380XXQSNBYuleKzav5UO	4uiVwLbTzE6VMkXpaDAwB8	We're In This Together	56
5hVghJ4KaYES3BFUATCYn0	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	EARFQUAKE	80
6fc51JZVE0Yijdi6RuoLFv	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Painkillers	65
3zJ5RDG0bLQAV2rntFgUtb	0bzfPKdbXL5ezYW2z3UGQj	1yIqauTni1V7l7djYAKSsZ	You Ain't The Problem	53
6iGU74CwXuT4XVepjc9Emf	3oDbviiivRWhXwIE8hxkVV	6GphKx2QAPRoVGWE9D7ou8	God Only Knows - Mono / 1997 Remastered	67
7wdzLe2Gsx1RGqbvYZHASz	2YZyLoL8N0Wb9xBt1NhZWg	51C65YqHrDODM1hD5FEL5x	i	64
3imS277wRbz1CFoDySgTff	5eIbEEQnDM8yuDVB0bimSP	7GpuEZzRrPT4IGiEuWaBzy	Light Me Up	45
3mT1AONeTJDi1k8vH8pA2L	3pkmfqaBNsMqnXus05PNfP	6XBKxM9rbzyOBP6gpE0qhd	I've Been Thinking	0
7Cu2COdH93MnuireuKNiS3	20wkVLutqVOYrc0kxFs7rA	4uP43hIpmEEDuW7aOfiU2C	Streetcar	67
7JmPqImeW3kLoYVNBA9v11	1mFX1QlezK1lNPKQJkhwWb	1bTjSqotSDtUjcwFfukTQP	If It Isn't Love	57
2aCKBrLn7rbhStk5k4FwnF	7guDJrEfX3qb6FEbdPA5qi	6thSjE17RxW8tJFtLyXA3B	I Was Made To Love Her	54
0vJvCnuxXL2BCSRa1ZoeNl	0VbDAlm2KUlKI5UhXRBKWp	5wpZhWqsoXKBcVwvcEtCvv	Electric Feel	0
1zkkvSLk5Nh4uoyKWwuie9	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Holy War	52
62wdQ5CInFr7cjISqrr46f	7KGqvFukcZRbQ7YFsYrgPa	4v9R5sk4HQ0X1krbEis34P	Baby	54
3iVp14VoAsAZkIdgQoRRAb	6PEMFpe3PTOksdV4ZXUpbE	0K3FiXt6ekJTWaUku3LpHL	Livvin	0
63k361zOGEhmvgzBdzzSGP	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Sunshine	61
04M3DsiMNyn8s5XQJrW5sL	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Cold Love	56
5rfT032kGmLvbxZzfHlu5D	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	In the Aeroplane Over the Sea	65
5zzWx7oJ9zBmv76uFaFeYR	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Counting Cards	47
2pA4ip3VIEVcIa3qE02oAX	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	10,000 Emerald Pools	62
1k7aPYyAnNTjVbjw1YDNp1	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Moody Orange	50
41xaZ4WLlKD95U5PknoJrV	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Matchbox	49
33vFhGNZa44VJ0I21AOGYe	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Recktify	45
03v70ZBxmcPX3RWAZMzqaW	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Clouds	61
1RzgWAFlI6KOenjOxJYcH0	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Possum Queen	46
2OeL43EXwaC205Xr1da1qJ	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Polite Company	49
5CU1bbfY1wUPm7fU255Dhf	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	King of Carrot Flowers Pt. 1	60
0dqJjKKxuKD5Dt3QH2n4CG	1MIe1z4RdqLqHSJsb7EBMm	0y3tRiTDYzj5IuQb0Kk86x	Hands Down	55
5C90m8eM6GJR2SACiLAWHo	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Wasted	57
4Fc62OkXYtEOjMmaSyJoQY	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Run	46
244QS6446wyO1UfVTWlOlR	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Maze	49
5L7IgwUPhir2FJftGNXJDW	4hz8tIajF2INpgM0qzPJz2	15RYnRTIMHrCB6X3HjK2mC	Heart	61
35mL8keNDi2VLHrFXZCgJR	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Shameful Company	48
50bmpfgcV29ouRVDfr5wOc	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Lady Lie	60
5IRdIQNIZzVqE4XyBylkvd	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	American Shoes	46
5do7Ql6G8N03fY6G9Y08Ec	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Goodnight Chicago	57
0ZAbupc7jAQpG9IxojQ3s3	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Cocaine Jesus	71
6MDijuuArPJv1vbp7K1x3f	4l1cKWYW591xnwEGxpUg3J	3pWJFrSX6apPzt4inM4zXt	Genghis Khan	60
0b2vqB7QNT4z8nnaYqbuel	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I Don’t Know How I Survive	53
47KDDZgFiX1w6RFOuLXsSn	1fZpYWNWdL5Z3wrDtISFUH	6gtu2oXhmDQN8TAsWimZbj	Tomorrow	67
3LcjZGk0GBlPRe5XhYVGgM	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Caramelo Duro (feat. Kali Uchis)	51
37ZvpHeZKazqOnLfAGm9nb	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	All's Well That Ends	61
0JXXNGljqupsJaZsgSbMZV	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	Sure Thing	81
3banchOoe2giyRK0jaO1c7	0AkmSuTOzM2pNCIOSP8ziv	7kb2GfJGvn8Gr0LCGBSQjZ	Hell and You	56
7trx783SvnHhKkmgSSTIFJ	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	First Class	64
27AG99NmWMFLRoyZMMPNW2	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	Two-Headed Boy	53
7l5j3FapCyr6HxUgoAynM2	3dv4Q4q3LWOnbLJnC6GgTY	5CPwacWmIAaA5DLUq7EHUC	Gap in the Clouds	56
5VA4Ispp52EA1sOqzMz3Av	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	All I Want Is You (feat. J. Cole)	73
7qHoVZ6076OGx18G6W5vQ9	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Bare Bones	48
4hv7GT5g9qNnrxlocsOSYt	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Anointed	40
4PFiLGx8jAzcAJxwPLUeZ9	60df5JBRRPcnSpsIMxxwQm	3YKQkIPHtWGuvkBeVNIMhg	Cigarettes and Coffee	59
1ULovMYbbglXIn9TQzMsKz	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	King of Carrot Flowers Pts. 2 & 3	50
4isk4UYRcmslphcTq61xUg	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	Quickie	54
5WoaF1B5XIEnWfmb5NZikf	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Sky Walker (feat. Travis Scott)	73
7sf0tmuGZlHXUWpi9dQqcw	360IAlyVv4PCEVjgyMZrxK	7ezeSBh9E63ijDAxn8Ke4P	Cadillac	33
3Pu3IChaAoa5EjgUBv5F6x	3JaAGmSTpJK35DqWrDUzBz	3PsFboiPeObjAc6gbQHt54	Ballroom Blitz	64
5p0bEz7DNsULez2X9yrNGa	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Pepper	51
1dxXQuExRVu77xF1r5YtRF	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Roman Candles	53
0wejso6CHHEEqvTD3f3gBz	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Rand McNally	50
23od4rorIdhvYeLL7YqP9n	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Foxglove Through The Clearcut	50
2I3ZdIFXnRn1PSAdMC4w71	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Wheat Like Waves	47
5eKfpH2dQ7FltCqb7LWEGJ	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Alien	46
7Cva2EgJougx6O6M5xgWAq	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Here to Forever	61
7KR5uycb8gfQYRl1MTL8aB	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I Miss Strangers	48
7xjbn0bhs7zx7E1s0lCqT3	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Asphalt Meadows	54
56KqaFSGTb7ifpt16t5Y1N	3RGLhK1IP9jnYFH4BRFJBS	1ZH5g1RDq3GY1OvyD0w0s2	Rock the Casbah - Remastered	71
3YZa4IzxK2UtEKTvdTgsi8	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Suffragette City - 2012 Remaster	61
4TIJ7zSBNejpoIPaWpWRKc	7lzordPuZEXxwt9aoVZYmG	2FZNWUmgRoP8uJZBaHJdfj	Rebel Yell	73
21YxK0klhpfLW8budkJaMF	33EUXrFKGjpUSGacqEHhU4	2jnV6ytZOmt71iEC5xHEYz	Lust For Life	64
29iwiYD3KVWBKxe31nGjEL	2CVBumuL5KyztqCyo7CETY	02OIGj20Ltaa8rN8mKsHBT	Jet Boy Jet Girl	37
5El6bpLd8nYPsvWgZLdHio	5aBEGOeWQCJfptic9xyaAb	440zYLMcBZhHc93WSGKDKo	Go! - Club Mix	41
72dIN8F7D5ydB3auSqNi84	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Silence	59
29Znt9AbEH9FSsw86zPAYT	2ZfogSsOWP4mVfEqfpLXCt	3gz1CZk5wFg2inBuUWDa8x	Reptile	49
3EytfC22ikoXM921cJbejn	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Gold	54
4vKLfj7YuS2yRKAJ9Nn0Id	3gdbcIdNypBsYNu3iiCjtN	1K4t7Jv7DuolDWnFLxKxkd	Give Me Back My Man	49
6eDwkS4IHADqk06ssrqfUX	0rpMdBzQXf7aYRnu5fDBJy	7bDSKEP1qhybTrrLhXw1D3	Blister In The Sun	50
0WQiDwKJclirSYG9v5tayI	3yY2gUcIsjMr8hjo51PoJ8	5Y0p2XCgRRIjna91aQE8q7	There Is a Light That Never Goes Out - 2011 Remaster	79
0vF9RAGwgYtfO1Aajwb7et	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Moth	44
10fiZCExnOMqElSX952WZI	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	Lead, SD	39
14z3RzUHeZQgtpOlSYvmZD	0Zy4ncr8h1jd7Nzr9946fD	2qcwXvluk9iFwNNg4eDBXm	Love Like Blood	48
1AR58rtcLziNnRHTCmCywd	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I’ll Never Give Up On You	46
1e5XqFTNIrlgpXGjwPSykv	2to6ZW4W0XOZZsztSErr0b	0UHxylrPIp6GtS7EJlfwRU	Red Right Hand	47
3s5N94NsDYcOqgi7cSakv6	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Wolf	39
3wtMkvedoWMQ3XTKv7tqcZ	3fhOTtm0LBJ3Ojn4hIljLo	5Tpor3YZBVEJ9tWD5L31mH	Love Is The Drug	59
4J6JARDGkdc1fqLEflP94Z	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Fragments From the Decade	46
4ZTl5GUAmO49b2cf6jovqx	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Grocery	40
4oB0d8H93GtllDkoHNuLIN	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Mistake	41
5avF5IwDg2v1QCxPvX9Fru	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Parts	37
672N8DGGTOLCOgWe0koX5g	4BFMTELQyWJU1SwqcXMBm3	3MANoCcmaHWeXSuWiO3iVo	I Wanna Be Your Dog	58
6Dq2LzijkY9WNPwBGDah4L	4JfFdF9Row7UXtdsKtT6tc	3nD9Oab8M4sCLNmqmwSOdA	Didn't I	64
3Cx9j78Z0NE6jYwBWvvV3P	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	Waiting For My Ruca	54
0VjIjW4GlUZAMYd2vXMi3b	1Xyo4u8uXC1ZmMpatF05PJ	4yP0hdKOZPNshxUOjY0cZj	Blinding Lights	90
1cKHdTo9u0ZymJdPGSh6nq	1Xyo4u8uXC1ZmMpatF05PJ	4qZBW3f2Q8y0k1A84d4iAO	I Was Never There	89
7MXVkk9YMctZqd1Srtv4MB	1Xyo4u8uXC1ZmMpatF05PJ	2ODvWsOgouMbaA5xf0RkJe	Starboy	89
09mEdoA6zrmBPgTEN5qXmN	1Xyo4u8uXC1ZmMpatF05PJ	4qZBW3f2Q8y0k1A84d4iAO	Call Out My Name	88
5QO79kh1waicV47BqGRL3g	1Xyo4u8uXC1ZmMpatF05PJ	4yP0hdKOZPNshxUOjY0cZj	Save Your Tears	88
2LBqCSwhJGcFQeTHMVGwy3	1Xyo4u8uXC1ZmMpatF05PJ	4AdZV63ycxFLF6Hcol0QnB	Die For You	87
7fBv7CLKzipRk6EC6TWHOB	1Xyo4u8uXC1ZmMpatF05PJ	0P3oVJBFOv3TDXlYRhGL7s	The Hills	86
2vXKRlJBXyOcvZYTdNeckS	3hteYQFiMFbJY7wS0xDymP	0JA38Ekhsv43y2lBj5GQkQ	Lost in the Fire (feat. The Weeknd)	84
5gDWsRxpJ2lZAffh5p7K0w	1Xyo4u8uXC1ZmMpatF05PJ	4AdZV63ycxFLF6Hcol0QnB	Stargirl Interlude	83
2p8IUWQDrpjuFltbdgLOag	1Xyo4u8uXC1ZmMpatF05PJ	4yP0hdKOZPNshxUOjY0cZj	After Hours	83
1wtOxkiel43cVs0Yux5Q4h	06HL4z0CvFAxyc27GXpf02	151w1FgRZfnKZA9FEcg9Z3	Snow On The Beach (feat. Lana Del Rey)	91
1Ist6PR2BZR3n2z2Y5R6S1	00FQb4jTyendYWaN8pK0wa	0Dt3FbpMQwjoT5KNAw0IXR	Summertime Sadness	74
2nMeu6UenVvwUktBCpLMK9	00FQb4jTyendYWaN8pK0wa	1D92WOHWUI2AGQCCdplcXL	Young And Beautiful	82
0Oqc0kKFsQ6MhFOLBNZIGX	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Doin' Time	81
1NZs6n6hl8UuMaX0UC0YTz	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	Brooklyn Baby	81
5Y6nVaayzitvsD5F7nr3DV	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	West Coast	80
3lG6OtGDsYAOALxEmubQQm	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Happiness is a butterfly	77
1KuVEZR4xuQVNr1KkanAV4	00FQb4jTyendYWaN8pK0wa	1ORxRsK3MrSLvh7VQTF01F	The Other Woman	76
2mdEsXPu8ZmkHRRtAdC09e	00FQb4jTyendYWaN8pK0wa	5XpEKORZ4y6OrCZSKsi46A	Cinnamon Girl	76
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
0fv2KH6hac06J86hBUTcSf	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	NEW MAGIC WAND	81
5TxRUOsGeWeRl3xOML59Ai	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	ARE WE STILL FRIENDS?	80
3jHdKaLCkuNEkWcLVmQPCX	4V8LLVI7PbaPR0K2TGSxFF	5iUwaD3wFVwfaAfs9Z0eCh	BEST INTEREST	79
3S68RFe1lsdCdTMPIMJM3X	2RdwBSPQiwcmiDo9kixcl8	4YV8SurDnk8sctOOZzYtbH	Cash In Cash Out	78
1hz7SRTGUNAtIQ46qiNv2p	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	GONE, GONE / THANK YOU	77
5B0kgjHULYJhAQkK5XsMoC	4V8LLVI7PbaPR0K2TGSxFF	45ba6QAtNrdv6Ke4MFOKk9	WUSYANAME (feat. Youngboy Never Broke Again & Ty Dolla $ign)	76
3EG9FJ0ToLfgnc1IG2Z1wz	4V8LLVI7PbaPR0K2TGSxFF	45ba6QAtNrdv6Ke4MFOKk9	SWEET / I THOUGHT YOU WANTED TO DANCE (feat. Brent Faiyaz & Fana Hues)	75
0SA0mMXWh23raZ6xzOCU2V	4V8LLVI7PbaPR0K2TGSxFF	5dbCm8qaCdWnNdVyi3urUO	She	74
2a5qaGUrVHWAIrh0xmTADM	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	neve give up	53
6GXbpne1EKdVlYhFazWFs4	4lujUKeO6nQAJXpq37Epn7	6wYeJwJU9Y4fuLQVfGyJk9	O Me O My	52
3x8IsQzb1KhPPo6zNGzzL1	4lujUKeO6nQAJXpq37Epn7	2jGQieA1EggldcxFAiQHjJ	Lay Down	51
3mslSmibP6M7u9RQEOZ2Zh	4lujUKeO6nQAJXpq37Epn7	014KjVEwCWxN2hWFYsUWNB	bend yr ear	51
6E39NM14yu6A6uFjuiQfZt	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	belladonna	49
7e1DF2fp2NP2zHlEClZP2z	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	bbbaby	48
6J4et4u2ECB9AH2QC9B5tg	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	hey rose	48
4SMHL36a0GQKh8ZuE33cby	4lujUKeO6nQAJXpq37Epn7	3rioHzbE7RDGbgxzg9uFNd	about her. again.	47
2YSgnpegXNXgk8UxgG8znT	4kI8Ie27vjvonwaB2ePh8T	4VzzEviJGYUtAeSsJlI9QB	Number One (feat. Richie Havens & Son Little)	41
7KX65PC1UZuImsUInThbav	0bzfPKdbXL5ezYW2z3UGQj	55A6d8TOuiAs6zDiKj2c3A	Cold Little Heart - Radio Edit	70
46EuzanXhKwIc7755wLAvS	0bzfPKdbXL5ezYW2z3UGQj	79VDAdjzMMGoftIbw5feYN	Home Again	52
7oOEFDLSQscl0uGulnIEmG	0bzfPKdbXL5ezYW2z3UGQj	0qxsfpy2VU0i4eDR9RTaAU	Love & Hate	63
0f2zcrhhHT59aIGQvRlTZ1	0bzfPKdbXL5ezYW2z3UGQj	0qxsfpy2VU0i4eDR9RTaAU	One More Night	60
1WS1Q9G8vj0gPN2aOkZ80A	2dBj3prW7gP9bCCOIQeDUf	0rEbmIQjHTKzKraH4UqiDy	Aquamarine (feat. Michael Kiwanuka)	56
2LUTN2pDXUplYlc7WjE1Mm	0bzfPKdbXL5ezYW2z3UGQj	5qmEF78Uq9CjwIgvKQe7WG	Money (with Tom Misch)	56
3aLq93pLZHx25jcFhfbEee	0bzfPKdbXL5ezYW2z3UGQj	1yIqauTni1V7l7djYAKSsZ	Solid Ground	54
5j5RHCFkS5TFLbQRUJ65HH	0bzfPKdbXL5ezYW2z3UGQj	0QJHIPjOnmwYuduAcNaQ5m	Beautiful Life - Edit	54
7qcXUzPwoxSBFxjTbNrV0B	5wFXmYsg3KFJ8BDsQudJ4f	5pCfjopxazLdvmLae6My9w	The Gold - Phoebe Bridgers Version	72
4G9aoDV0KAsAYqTEKY53BF	5wFXmYsg3KFJ8BDsQudJ4f	3mD3TH55C4q6H5ObfJw4w6	I Know How To Speak	54
2i8fcnTT5iItxMNwa8mfr3	5wFXmYsg3KFJ8BDsQudJ4f	3GJ7F5BNIZjY5fhiu8ui4B	Telepath	53
5P4zryS2epwU5j5fkmwO8Z	0oL26Dn9y761yfJgNb3vfu	4gFsfMVkEduaEMfQIlNEqn	In My Head	53
5SvYRapjngsO2dYfBC9ZXV	5wFXmYsg3KFJ8BDsQudJ4f	3q44ueZD50lWp4BXm0GDcE	No Rule	52
5S67wnJOMjuySVEu4ssCof	0e9H8oaYYRCKFXOVv848nt	1RHlOUoinOK5WZconLM6lp	Forest Whitaker	50
1fOc4Kf82a6J1C9gS5sE0d	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Changes	61
7a5xvCgoD8qFEQmO8Jjvtf	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	The World (Is Going Up in Flames)	60
0PbOwOT7vjiO0NiI8D31XH	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	Heart of Gold	60
0LHm5xYhzH6ZfmTVJ6LWpR	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	No Time for Dreaming	57
4ml0940tmn92PzmkSb2lwU	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	Stay Away	56
6ZWDOwh9OO57DaO0ROHIHO	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Good to Be Back Home	53
2aWr9QRr0pSmYFH04zngiP	462T0buQ5ScBUQCRpodDRf	3rimYQyKq7BatxuUoPIBrb	Strictly Reserved for You	50
3F4WWA3JqsX2VmvqHywxEA	462T0buQ5ScBUQCRpodDRf	3rimYQyKq7BatxuUoPIBrb	Where Do We Go From Here	50
2dDR1wNf50GYrWohFnS3Pv	462T0buQ5ScBUQCRpodDRf	6llfJp31mi9r7swqmSAwuK	How Long	49
5nMZwcaQcQCONoiHmov5YT	462T0buQ5ScBUQCRpodDRf	7g7WzMzTLLOyTSzVUnJACI	Nobody But You	48
3kZC0ZmFWrEHdUCmUqlvgZ	0YrtvWJMgSdVrk3SfNjTbx	1NFGnxmeIEBakre4DvLaJq	I Will Follow You into the Dark	65
5yc59J3MR3tVDPTOgwgRI5	0YrtvWJMgSdVrk3SfNjTbx	1NFGnxmeIEBakre4DvLaJq	Soul Meets Body	60
6LNwTodkmxsc2dKRJWQr6y	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	A Lack of Color	57
0PTYTZvNNtlvdOwWRYrbfC	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	The Sound of Settling	56
0hgEsoAu23ap8V5GFX9Y3i	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	Title and Registration	55
1crbFuCkGL4kXnAGd63RXq	0YrtvWJMgSdVrk3SfNjTbx	1NFGnxmeIEBakre4DvLaJq	Crooked Teeth	55
0DoACS30GwIY6qaFjCMMUz	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	Transatlanticism	55
6p8ZhmQS4fia0j93S2M3Fj	0YrtvWJMgSdVrk3SfNjTbx	3stEKyV4hKU1G5yXtmDOaN	Waterfalls	54
0QZ5yyl6B6utIWkxeBDxQN	6ltzsmQQbmdoHHbLZ4ZN25	3yoNZlqerJnsnMN5EDwwBS	The Night We Met	78
4yyg2J2uXOjCtCyT64984C	6ltzsmQQbmdoHHbLZ4ZN25	2ZDjruwuzzzT8JMJRXvLtl	Ends of the Earth	67
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
7jvCeWOSnJs2N3spqobWnO	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Skate	71
3MlQPB0wJuopo3NTZGlMpI	6PEMFpe3PTOksdV4ZXUpbE	1o8zUe3QYHV42SHSsg6ffu	Where I Go (feat. H.E.R.)	71
3jiKUMXqwEodB7gVv1RMZU	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	After Last Night (with Thundercat & Bootsy Collins)	70
3a6FcTyvSf0ED3VXeH3PJ5	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Fly As Me	65
2JUQ7mV1AHk2owXLydmN4Z	0du5cEVh5yTK9QJze8zA0C	1YgekJJTEueWDaMr7BYqPk	Love's Train	60
2K6vUau7bnZUamjbRSOOvJ	0du5cEVh5yTK9QJze8zA0C	4VZ7jhV0wHpoNPCB7Vmiml	777	65
276zciJ7Fg7Jk6Ta6QuLkp	3jK9MiCrA42lLAdMGUZpwa	4VFG1DOuTeDMBjBLZT7hCK	Come Down	63
3hhbDnFUb2bicI2df6VurK	3qnGvpP8Yth1AqSBMqON5x	21KIagsx1ZvYcv0sVkEAWv	River	72
3V0nnQhqvbE3JmiDdnzQFQ	55fhWPvDiMpLnE4ZzNXZyW	3tRmxSQyoyXXwcVDcUFQic	July (feat. Leon Bridges)	72
24ntSW3QVJzR79lHAAOTaY	2mVVjNmdjXZZDvhgQWiakk	4HFO9PDRxsdbcegkcNhxgz	Texas Sun	72
1Omt5bfz1tZUCqd26HxbS0	3qnGvpP8Yth1AqSBMqON5x	7J9fifadXb0PPSBWXctbi8	Beyond	71
65GbQI9VDTs7vo6MJL2iJA	3qnGvpP8Yth1AqSBMqON5x	21KIagsx1ZvYcv0sVkEAWv	Coming Home	68
3dvXRk7TZ929m21p49RR5P	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	Mariella	66
2DccHqTquzubziHAPZRdct	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	B-Side	65
1EUOby36hEzSkTVVKRAWQP	2mVVjNmdjXZZDvhgQWiakk	2Xs9xSBhvyo8F6daRc1npu	Chocolate Hills	62
7FxzgizJRGTQ3fxUqfvljg	3qnGvpP8Yth1AqSBMqON5x	7J9fifadXb0PPSBWXctbi8	Bad Bad News	62
7pnVHbcqbmP7LA1ey3ydvu	2mVVjNmdjXZZDvhgQWiakk	4HFO9PDRxsdbcegkcNhxgz	Midnight	61
3zBhihYUHBmGd2bcQIobrF	60df5JBRRPcnSpsIMxxwQm	03HMOcANauhLD0WNrMkmLU	(Sittin' On) the Dock of the Bay	75
1aj4GXfmEYXfdVZohCpNKu	60df5JBRRPcnSpsIMxxwQm	2BFOk5b8jjm2xmsbx7qXq3	Stand by Me	67
7FXuCkl1kfxwS5icDjTwbM	60df5JBRRPcnSpsIMxxwQm	3mdKPgJ2hyDF9ToznWuCn1	Hard to Handle	64
4skknrc3sJqaPTtUr2cwFq	60df5JBRRPcnSpsIMxxwQm	2BFOk5b8jjm2xmsbx7qXq3	These Arms of Mine	63
36AlMHDBFwSsD3FQOy1R81	60df5JBRRPcnSpsIMxxwQm	25uNcuL4dAoV62eKmr8Q0Y	Try a Little Tenderness	63
5zQyqgNXKzhifkivumzxDS	60df5JBRRPcnSpsIMxxwQm	68BCjMsHX4Gf11BJSkjwGz	My Girl	60
4pdLyulbYLCrPmDzWWeJIZ	60df5JBRRPcnSpsIMxxwQm	68BCjMsHX4Gf11BJSkjwGz	I've Been Loving You Too Long	59
4STCTQ1h0VuWfvDyhGOxkv	60df5JBRRPcnSpsIMxxwQm	004EYz2DQttcGvyTQGDmLp	Merry Christmas Baby	45
16dz1n3ctolQbuZPtvHVqH	60df5JBRRPcnSpsIMxxwQm	5K3FfkoIozJuEOhiwOm5SR	Love Man	57
7ycWLEP1GsNjVvcjawXz3z	13ubrt8QOOCPljQ2FL1Kca	3MATDdrpHmQCmuOcozZjDa	Praise The Lord (Da Shine) (feat. Skepta)	81
2aPTvyE09vUCRwVvj0I8WK	13ubrt8QOOCPljQ2FL1Kca	3AlyvIIMZyT5LjWFeK5LSl	Sundress	77
2N3U8uTYhjX2KwGT0pf5x0	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Everyday (feat. Rod Stewart, Miguel & Mark Ronson)	76
4X5f3vT8MRuXF68pfjNte5	13ubrt8QOOCPljQ2FL1Kca	6rzMufuu8sLkIizM4q9c7J	F**kin' Problems (feat. Drake, 2 Chainz & Kendrick Lamar)	75
7zjEyeBsaw9gV0jofJLfOM	50co4Is1HCEo8bhOyUWKpn	7IKkHmEk4It4cRdOYanyvW	Livin It Up (with Post Malone & A$AP Rocky)	73
4S7YHmlWwfwArgd8LfSPud	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	L$D	72
1jzIJcHCXneHw7ojC6LXiF	4V8LLVI7PbaPR0K2TGSxFF	02KFVEA5tnY0YnypmWY1tz	Potato Salad	71
2gAGWaK4wvt2xrFUlR4mK8	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Jukebox Joints (feat. Joe Fox & Kanye West)	70
1j6kDJttn6wbVyMaM42Nxm	13ubrt8QOOCPljQ2FL1Kca	3arNdjotCvtiiLFfjKngMc	Lord Pretty Flacko Jodye 2 (LPFJ2)	70
1AqemxWsT0iGg5Lvkm16Bt	13ubrt8QOOCPljQ2FL1Kca	3MATDdrpHmQCmuOcozZjDa	Fukk Sleep (feat. FKA twigs)	68
7KXjTSCq5nL1LoYtL7XAwS	2YZyLoL8N0Wb9xBt1NhZWg	4eLPsYPBmXABThSJ821sqY	HUMBLE.	83
3GCdLUSnKSMJhs4Tj6CV3s	2YZyLoL8N0Wb9xBt1NhZWg	3pLdWdkj83EYfDN6H2N8MR	All The Stars (with SZA)	83
6PGoSes0D9eUDeeAafB2As	2YZyLoL8N0Wb9xBt1NhZWg	4eLPsYPBmXABThSJ821sqY	LOVE. FEAT. ZACARI.	82
0fX4oNGBWO3dSGUZcVdVV2	2YZyLoL8N0Wb9xBt1NhZWg	79ONNoS4M9tfIA1mYLBYVX	N95	82
6IZvVAP7VPPnsGX6bvgkqg	2YZyLoL8N0Wb9xBt1NhZWg	4eLPsYPBmXABThSJ821sqY	PRIDE.	80
2g6tReTlM2Akp41g0HaeXN	2YZyLoL8N0Wb9xBt1NhZWg	79ONNoS4M9tfIA1mYLBYVX	Die Hard	80
2HbKqm4o0w5wEeEFXm2sD4	2YZyLoL8N0Wb9xBt1NhZWg	6PBZN8cbwkqm1ERj2BGXJ1	Money Trees	79
3iVcZ5G6tvkXZkZKlMpIUs	2YZyLoL8N0Wb9xBt1NhZWg	7ycBtnsMtyVbbwTfJwRjSP	Alright	79
3QFInJAm9eyaho5vBzxInN	5SXuuuRpukkTvsLuUknva1	3r46DPIQeBQbjvjjV5mXGg	family ties (with Kendrick Lamar)	79
6HZILIRieu8S0iqY8kIKhj	2YZyLoL8N0Wb9xBt1NhZWg	4eLPsYPBmXABThSJ821sqY	DNA.	79
0P2vjYoUjjHBeYArlQtRmf	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Floating Features	51
60JTA6msKu6uFlpvK8Tynn	6QRlkjrHz5A62mqeNZz7t3	3B2xgIcoHjm1HdHYDydoUu	Sure As Spring	44
1ZUTRq6PQhYfHJk3qeP7FR	6QRlkjrHz5A62mqeNZz7t3	1b42c8tkc0fLhiLprU1jiX	I Can't Speak	39
3Gb1M4i5UlDauEnaLJF2HT	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	Watching Cartoons	36
3AIt9LB3C7Jz99OnvVjbyv	6QRlkjrHz5A62mqeNZz7t3	1kSTHq1yseNNxYpM48o3ry	Endless Afternoon	36
4viHP6kRmImqmVGQjE8sks	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Don't Leave Me on the Earth	36
20OiuevLsmNprmh6wZKljU	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	The Pines	35
2kkJY0ENKaDX5Np8fjyYLM	6QRlkjrHz5A62mqeNZz7t3	0hMh7RDyxuRD5AoTdh72DN	Loose Teeth	34
1uSkFxzLIEtObyJtROqbnl	6QRlkjrHz5A62mqeNZz7t3	3B2xgIcoHjm1HdHYDydoUu	Call Me in the Day	34
0J0UZpA2Ivp4qaXe3QzCrT	6QRlkjrHz5A62mqeNZz7t3	17WOu1wHd6KdSO2Z0HRz6w	In the Country	34
0xFiDbmCNEcs8TE9hToHpa	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	For DOOM	44
0V6QNE31BWyMuiKlvDRnE9	5CuU6SRJjbbZL926nSGGxX	1VDnqZVFSg0xVF104kaIix	(How Could Anybody) Feel at Home	43
41t7RkFBjaEFoGvr29QhYL	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	79th and Stony Island	42
7fjLBPTsQrbkV2WRedi2bw	5CuU6SRJjbbZL926nSGGxX	7BlWNRjwKnLrf7yf0VdSvg	Ziggy Starfish (Anxiety Raps) [feat. Gold Panda]	41
1pHKJodnA1bOXyWj981Tmx	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	I'll Fight You	39
46lQe6895zxB3HRP6YPbnl	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	Multi-Game Arcade Cabinet	36
08rUqqyHYLORJvK6pqiUOM	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	CD Only Bonus Track	36
36iXvmiL3tsJX0QfhVZkhb	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	The Song with the Secret Name	36
4eJpFVLqB3SVzciiTdK82L	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	Circuit City	36
7EGZTx7rDYoSzUtqsETyxz	5CuU6SRJjbbZL926nSGGxX	7bvUQdrsKA3o6lkjV1ZRPk	Tdk Scribbled Intro	35
1WBSFlSLyOZnSa8fj7a5yC	6pmxr66tMAePxzOLfjGNcX	71udkw2yxFqNK4SNSYcCce	Nantes	61
7H0UxIN751StFi2tznmHlg	6pmxr66tMAePxzOLfjGNcX	4yP7cyoeE3F6EyJPZ9v47V	Postcards from Italy	57
5loVmc3MmtYGsTw12eDgcU	6pmxr66tMAePxzOLfjGNcX	26G7PfSLTyLiIcITVl7GAK	Elephant Gun	56
2bxQP85JNU11CQV4KXCnau	6pmxr66tMAePxzOLfjGNcX	7HYptJX2aQJPWbxXviXLwQ	Santa Fe	54
1xRzpBiy7nmgP0oVmnseNF	6pmxr66tMAePxzOLfjGNcX	6iAOkTDFRiWHVNNUjBqIxT	Perth	52
1dD6UAnqCJotTyU1bhCnDQ	6pmxr66tMAePxzOLfjGNcX	6iAOkTDFRiWHVNNUjBqIxT	No No No	52
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
6neF3KiuooS7xcTtj18PRL	1Tp7C6LzxZe9Mix6rn4zbI	4Tg1YeHrSMEUVsGiYfkSm3	Surefire - Gus alt-j Remix	55
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
3xKsf9qdS1CyvXSMEid6g8	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Pink + White	85
3GZD6HmiNUhxXYf8Gch723	2h93pZq0e7k5yf4dywlkpM	392p3shh2jkxUxY2VHvlH8	Lost	84
4osgfFTICMkcGbbigdsa53	2h93pZq0e7k5yf4dywlkpM	3RYdEXhGHojkTILUdtnRVJ	Novacane	80
2ZWlPOoWh0626oTaHrnl2a	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Ivy	80
7eqoqGkKwgOaWNNHx90uEZ	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Nights	78
4S4Mfvv03M1cHgIOJcbUCL	2h93pZq0e7k5yf4dywlkpM	71VX8yv9T2hNIYVZJVUWVp	In My Room	78
2LMkwUfqC6S6s6qDVlEuzV	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	White Ferrari	77
7DfFc7a6Rwfi3YQMRbDMau	2h93pZq0e7k5yf4dywlkpM	392p3shh2jkxUxY2VHvlH8	Thinkin Bout You	77
6Nle9hKrkL1wQpwNfEkxjh	2h93pZq0e7k5yf4dywlkpM	6OGzmhzHcjf0uN9j7dYvZH	Chanel	77
5GUYJTQap5F3RDQiCOJhrS	2h93pZq0e7k5yf4dywlkpM	3mH6qwIy9crq0I9YQbOuDf	Self Control	75
3vvnpqqg7Jbi2c2aOn6GHt	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Everything's Sweet	55
7zJHwxabKK5TqW7xrKEC73	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Are You Coming with Me?	52
4s8uPDOuyjoO6Rmn7Armjc	1zXCFUgH6FWS0iCiCKsH55	3XQya9tCptDZRNFU90qBiL	Euphoria	46
1dc7H76rkWGymUigYxQ4hp	1zXCFUgH6FWS0iCiCKsH55	6wRjGQayCybNhsUiTJdXcc	Chokin'	45
1G9pU58ocxSyaBTOfDE15F	1zXCFUgH6FWS0iCiCKsH55	4jWRGEF8uP4vadXsot9SwK	Drowning in the XXX	44
0hVU7w5aEVjqYVbMcnp1CS	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	My Soul Is Lemonade	43
4O4A5zbsLjBtN6Xsi2jLRt	1zXCFUgH6FWS0iCiCKsH55	1954USRP58YPbatjFxSphC	Megaphone	42
67mBvvGurWeq8ILhG2Zyj5	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Imagination	41
6ErgLGql7HUEVbkQQJbjJt	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Motor Mouth	41
1uX4eg17USq3HclX45P8Kf	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Show Them Who It Made You	40
0iizrCBnUUJuAwCPJaWWY0	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Suede	59
6QdcmLnJLkOhfN2y9KKt7k	17Zu03OgBVxgLxWmRUyNOJ	0YePXgGfk39Rd1OWgqFKRS	itkanbe[sonice]	56
5mtfHX4VyY5D81WMaOHgHV	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	What More Can I Say	54
02sagHhK9h0nODtzjF33yP	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Lyk Dis	52
5lYXMlzWEc8uDbMd1v0V35	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Scared Money	48
08VNThwlDByBAaZUNZj1aS	6PEMFpe3PTOksdV4ZXUpbE	0gpxUkqSnLwD50aaRir6jH	Get Bigger / Do U Luv	46
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
2K2M0TcglCRLLpFOzKeFZA	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	Sunshine Of Your Love	69
3Xls4cNOwy01dtrNXb1inG	74oJ4qxwOZvX6oSsu1DGnw	0zrtTZC7yY2TOEhnbJzSb9	White Room	68
47bXIv24jthL4vzZy3j7CY	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	Strange Brew	59
62nYkaIBesfvQSSwTjPnYS	74oJ4qxwOZvX6oSsu1DGnw	6iyKqDoL9pRSHUsDBYemlB	I Feel Free	57
6PUabSMXmPnZna361Wwmf7	74oJ4qxwOZvX6oSsu1DGnw	0zrtTZC7yY2TOEhnbJzSb9	Crossroads - Live	57
0GxV3poTM7Z7fKSUqy5qFw	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	Tales Of Brave Ulysses	55
3oaSvU9VBBmyfPA4lbibQM	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	Outside Woman Blues	53
08xsXR637CEqbxJmpFcuSA	74oJ4qxwOZvX6oSsu1DGnw	2tVc8PhqDSRkpgiGOw7Ukb	Badge	52
2JbS4ZDBIUcXavA9mfb2nC	74oJ4qxwOZvX6oSsu1DGnw	3W6CI0Lw7lElAPID2Fd3B4	SWLABR	49
2uxsnsH0XzOBZkMrSFVmll	74oJ4qxwOZvX6oSsu1DGnw	0zrtTZC7yY2TOEhnbJzSb9	Born Under A Bad Sign	49
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
2JvzF1RMd7lE3KmFlsyZD8	6l3HvQ5sa6mXTsMTB19rO5	3XzSOIE6zGLliuqsVGLmUc	MIDDLE CHILD	81
2wAJTrFhCnQyNSD3oUgTZO	6l3HvQ5sa6mXTsMTB19rO5	0fhmJYVhW0e4i33pCLPA5i	Work Out	80
49TIT8O6KR9rdfgVBwdbac	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	Summertime	54
5W8jRrZ6tWrTrqnKRtIQBf	6l3HvQ5sa6mXTsMTB19rO5	4JAvwK4APPArjIsOdGoJXX	p r i d e . i s . t h e . d e v i l (with Lil Baby)	77
1D3z6HTiQsNmZxjl7F7eoG	6l3HvQ5sa6mXTsMTB19rO5	4JAvwK4APPArjIsOdGoJXX	m y . l i f e (with 21 Savage & Morray)	77
2uwnP6tZVVmTovzX5ELooy	6l3HvQ5sa6mXTsMTB19rO5	5FP9keIJnlSCKnkdVOf623	Power Trip (feat. Miguel)	77
2e3Ea0o24lReQFR4FA7yXH	6l3HvQ5sa6mXTsMTB19rO5	0UMMIkurRUmkruZ3KGBLtG	Love Yourz	75
6tZ3b7ik1QDXFAZlXib0YZ	6l3HvQ5sa6mXTsMTB19rO5	4Wv5UAieM1LDEYVq5WmqDd	Kevin’s Heart	74
2Srd8Jgif3kc6ou6Z4pSYJ	6RZUqkomCmb8zCRqc9eznB	4wxoPjHSYFYurNyKaEiZNT	Every You Every Me	54
0uYVJ8z5kgMayMNPJA6Cz9	6RZUqkomCmb8zCRqc9eznB	7kTsa1wUFrahJJf1cJEOpZ	Running Up That Hill	64
2yYASbXnAV71CLbNY1HCWf	6RZUqkomCmb8zCRqc9eznB	2toHnQWm3IbSocaWGYi9J4	The Bitter End	51
0AATuEhrQtGDevnhq9Nx2k	6RZUqkomCmb8zCRqc9eznB	2toHnQWm3IbSocaWGYi9J4	Special Needs	60
32F0zqsDgqpIEYApk2b8sr	6RZUqkomCmb8zCRqc9eznB	4wxoPjHSYFYurNyKaEiZNT	Pure Morning	49
6Vkn98iI3sfATzdacZ307z	6RZUqkomCmb8zCRqc9eznB	4rIT7o85FQB2KfTMMT4Pj0	Song to Say Goodbye	57
7pmahAnqScI4MjbQiZZqei	6RZUqkomCmb8zCRqc9eznB	2toHnQWm3IbSocaWGYi9J4	This Picture	45
0W6QtgkxPNJ7simo1UcBIr	6RZUqkomCmb8zCRqc9eznB	0PhJJToPch4jCjrfQjyarw	Special K	56
54s0TZeheZOxoVFxxmB3wA	6RZUqkomCmb8zCRqc9eznB	19upQOw6eZRsGUGqGe6zF1	Beautiful James	35
6Yg3J1OkP45uNcboiUg2Rw	6RZUqkomCmb8zCRqc9eznB	7kTsa1wUFrahJJf1cJEOpZ	Where Is My Mind? - XFM Live Version	53
39Yp9wwQiSRIDOvrVg7mbk	2PaZWGu5T5nHjY2xxAkFsT	7q6zjWaLw8bN5nYiBWjrus	THE SCOTTS	75
2ncLdwTd8qzkxiJjlbiOgC	0fA0VVWsXO9YnASrzqfmYu	0InO6eGRL47KErEYEoc2rP	Mr. Rager	72
5PX4uS1LqlWEPL69phPVQQ	0fA0VVWsXO9YnASrzqfmYu	38MFjDPIDJFfLF7IVpe1rv	Pursuit Of Happiness - Extended Steve Aoki Remix	74
6MtKObWYda2qnNIpJI21uD	0fA0VVWsXO9YnASrzqfmYu	2S8AWAM0nxyFy66YnUfIs3	Pursuit Of Happiness (Nightmare)	70
30KctD1WsHKTIYczXjip5a	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Tequila Shots	72
5wfllwdjglyQislkskYLBv	0fA0VVWsXO9YnASrzqfmYu	2S8AWAM0nxyFy66YnUfIs3	Day 'N' Nite (nightmare)	70
5XFoaqV1Z8XaLJidchVWhh	0fA0VVWsXO9YnASrzqfmYu	19ZYOtXGdqGpeeDS9SJccD	love.	71
6XkuklKiHYVTlVvWlTgQYP	0fA0VVWsXO9YnASrzqfmYu	08eM9GRdr5BCCHNqS3Wwud	Erase Me - Main	71
5CFJRZRq6sdKKtRwNPWbYv	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Show Out (with Skepta & Pop Smoke)	70
5OIz27S6SQOJtweneBd6QP	0fA0VVWsXO9YnASrzqfmYu	4aW4iDepQUl5ZCHd1Gli68	Do What I Want	69
3diqzmavbWJdQiIuIbvoWt	6ZK2nrW8aCTg8Bid7I7N10	6CL2rdgPpUEXwWsNjexAZ5	Flatlands	50
6dfWiUc39g9BjD01irYviR	6ZK2nrW8aCTg8Bid7I7N10	1nnenAgIzIipcodyg879Vx	16 Psyche	47
0ImjeKKMwhUNJwVe4JXEDy	6ZK2nrW8aCTg8Bid7I7N10	4rpm9Ez8nfVsQvNmHDbgyp	Feral Love	46
0Mg797QegnaC7LIRVU0WYh	0erhjm5MwzWpFRFuorXLT2	0lfEFhkPJdimjfkEIjRfZg	Be Free	43
4qGchgaW78B1Z9kmF9lt2w	6ZK2nrW8aCTg8Bid7I7N10	3Lm4wFlCjymVuRKZ0Z6X94	Anhedonia	43
4xTfQPuQR1VulbeAn63cgX	6ZK2nrW8aCTg8Bid7I7N10	4rpm9Ez8nfVsQvNmHDbgyp	House of Metal	42
0Fs7jajFWWfBcC4Mox3m7p	6ZK2nrW8aCTg8Bid7I7N10	6bpgmfwTWBLxT7VuS1phjL	Deranged for Rock & Roll	41
020Ur4viDDscjoH9IvpHRE	6ZK2nrW8aCTg8Bid7I7N10	1nnenAgIzIipcodyg879Vx	Vex	41
76nPiuy1rkMFQqWDFaScP4	6ZK2nrW8aCTg8Bid7I7N10	7L7IKHnLWh6gIIYNDnZtQ8	Oui Oui Marie	39
2UALJFCBhcFuknbnbOrN7E	6ZK2nrW8aCTg8Bid7I7N10	6GKPfddXwFKV5pmJANiIBx	Fight Like Gods	38
6W9rbkBueZQrwuzO24GHZ2	6TVVIyd0fsRDGg6WzHKyTP	3nZHH9trTO9xrV1XrW18cW	Witchoo	59
6kle4XS7gyiUIb0tmsyCf4	6TVVIyd0fsRDGg6WzHKyTP	3idaZ1PVAh5zF50jEipyEq	Is It Any Wonder?	58
5ZK62nSchTamBy8F6HIZov	6TVVIyd0fsRDGg6WzHKyTP	7FU0CDJvPwKDWRXtHYcsoY	Sea Gets Hotter	57
6KNV6L3b7beomEUnzWgw0X	6TVVIyd0fsRDGg6WzHKyTP	3nZHH9trTO9xrV1XrW18cW	Ride or Die	57
3XITcXbaKS08ardf8ahKqM	6TVVIyd0fsRDGg6WzHKyTP	1X0ZHwPLIpROo8arjBErDY	Cruisin to the Park	56
5Dxv2JoDim8FfyUzCbOqvQ	6TVVIyd0fsRDGg6WzHKyTP	3nZHH9trTO9xrV1XrW18cW	The Way That I Do	54
0jecTSpHjOy5CyqEdfod5c	6TVVIyd0fsRDGg6WzHKyTP	7FU0CDJvPwKDWRXtHYcsoY	Don’t You Know	54
4bQhGIHwo1ZpixP9MudUbV	6TVVIyd0fsRDGg6WzHKyTP	3nZHH9trTO9xrV1XrW18cW	Love Will Work It Out	52
1m6FCJ4TWoqCz2ubKdep0Z	6TVVIyd0fsRDGg6WzHKyTP	7FU0CDJvPwKDWRXtHYcsoY	Long Way Home	52
59FqreVbI6rLyFaxIUnAEg	6TVVIyd0fsRDGg6WzHKyTP	7FU0CDJvPwKDWRXtHYcsoY	Circles	51
5Gr3F9wpvAJ6jxjMKMhUvp	6tkrcmVfWoHC4WOhE7IDyq	6JaAs0LDI0AyrZhhx3kRJz	September Doves	49
1s26EtMcz12WYu7CyETg8w	6tkrcmVfWoHC4WOhE7IDyq	3xT7V16ZrX4TE7dWUQVesx	Carry On	44
6c4i2FZ8Ul9O7BriSjkH2k	6tkrcmVfWoHC4WOhE7IDyq	5hXIEmgAMoi1ZfFrRiq9Jj	War Inside of Me	42
7JG2ctxDwLvqT799vKFvWv	6tkrcmVfWoHC4WOhE7IDyq	5hXIEmgAMoi1ZfFrRiq9Jj	Terrible and True	42
5Ff4k65YPPlQjzZEr2a0oU	6tkrcmVfWoHC4WOhE7IDyq	6JaAs0LDI0AyrZhhx3kRJz	One Shot to Wake	41
1xqRfUNinqusubH9EnyQM8	6tkrcmVfWoHC4WOhE7IDyq	3xT7V16ZrX4TE7dWUQVesx	When I Went Down to Georgia	40
6MoVJYJzWDFtSJr4VqaFvN	6tkrcmVfWoHC4WOhE7IDyq	6JaAs0LDI0AyrZhhx3kRJz	Hell's Canyon	39
6UyWIB10XzRIfkKTBtiJCl	6tkrcmVfWoHC4WOhE7IDyq	5hXIEmgAMoi1ZfFrRiq9Jj	Bring Back Someday	39
07a6JUWUqw0EMKdhLvZQqS	6tkrcmVfWoHC4WOhE7IDyq	09UCMpTfN3XjdOAaEVRrUE	The Mountain	39
3SR15t0DS0T5K7jDtp31dh	6tkrcmVfWoHC4WOhE7IDyq	1MGJxZLXW7eDKyAvQYQrqa	Wyoming	37
13jJmDyFCslJf1rpJJGFsg	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Siin	39
14nAUobNnAo4nSJjXbQofp	600GgDUq9kzGJgNIrVsWfz	5mALDiU9ZL2klZNCrZPuwi	Angel Eyes	37
1jkdnGOfeWDMVUqX2xXxsw	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	I Got the Moves	36
3Xt9sp779WQWqLYPVbLU0q	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Sweetest Talk	35
6RyC5X1YGBBvNP0vKYYuvI	600GgDUq9kzGJgNIrVsWfz	7n2zrl9YRGAFsHpgCoAhXQ	Nice	34
5pU3F1qCcnYi6EAsEh9dvU	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Detroit Baby	31
2iZPHjqqRTnEspcty3sx2d	600GgDUq9kzGJgNIrVsWfz	5mALDiU9ZL2klZNCrZPuwi	Come My Habibi	26
7voNFu2PSUXeWbFYHYz5Kj	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Let Me In	26
6f0OgGA8oU8anD99LKvX0Z	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Far from Right	23
5RVO5uHpeQVveseIWQRfvI	600GgDUq9kzGJgNIrVsWfz	11vaCG8601u7A6ViFQIRXA	Tomboy	21
6hleUCx3E4gB2urwRvx1QT	2jgPkn6LuUazBoBk6vvjh5	6XqM4NINcx3oc7NhOUKxXp	Time of the Season - Mono Version	64
4Wzt8Dm4xpO3LjWDecP4bA	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	She's Not There	62
560OsnDa7tpsK2B0krVlOP	2jgPkn6LuUazBoBk6vvjh5	6XqM4NINcx3oc7NhOUKxXp	This Will Be Our Year	54
69GPTeIbtyU1Vd1NPYX95k	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	The Way I Feel Inside	51
5AxeiXkrfb2e4PsZ02CSyC	2jgPkn6LuUazBoBk6vvjh5	2ig7JTatcliu92WgxJKcxj	Tell Her No	49
7p1fSjOvkphYCqxJupK8Et	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	What More Can I Do	48
5Q08lzb2Uj4X9VVDGmUebR	2jgPkn6LuUazBoBk6vvjh5	1Sv2t548jDyfBDgvVzYJzw	Can't Nobody Love You	46
1SnTzsiSyLSbdO0DHVIZOw	2jgPkn6LuUazBoBk6vvjh5	6XqM4NINcx3oc7NhOUKxXp	Care Of Cell 44	45
2tv1TH489D5jYz96DeGwT3	2jgPkn6LuUazBoBk6vvjh5	76v4YlZ9Cbh984zti9Q8rp	Going Out Of My Head	43
0bIGNGUqgpB82sAksxonkZ	74ASZWbe4lXaubB36ztrGX	5OlEEw6gIk32eMhOqRlfGu	My Back Pages - Live at Madison Square Garden, New York, NY - October 1992	54
73uAQw29X3mrO1taWZaOvm	6v8FB84lnmJs434UJf2Mrm	3LIMxY8oQG9c70DWKe0iHN	Journey Through the Past	52
285vxuRky8WKTIrNP332sl	6v8FB84lnmJs434UJf2Mrm	31rLr6NpNw9wggFD4QGfhD	The Needle and The Damage Done - Live at John F. Kennedy Stadium, 13th July 1985	46
1HipTbE3pVedq6OGGjxhWj	6v8FB84lnmJs434UJf2Mrm	5OlEEw6gIk32eMhOqRlfGu	All Along the Watchtower - Live at Madison Square Garden, New York, NY - October 1992	45
7kwliM8TCIwdAXBXX0LJXd	6v8FB84lnmJs434UJf2Mrm	31rLr6NpNw9wggFD4QGfhD	Nothing Is Perfect - Live at John F. Kennedy Stadium, 13th July 1985	42
4Z65ex2SD2OblueL5FjRPT	5M0lbkGluOPXLeFjApw8r8	1AWbIu7wKGqsL7be4NlEyY	Campfire (with DRAM & Neil Young)	41
3gXMNdXzS4KkS8DQJbXxdN	6v8FB84lnmJs434UJf2Mrm	15t7NAV9KXOtPo7HefS39H	Four Strong Winds - Live at Live 8, Molson Park, Barrie, 2nd July 2005	39
5T1mYdPKZjnpD8n6HLt2W5	6v8FB84lnmJs434UJf2Mrm	0zwNzImUq6DykNGghNGffs	Mr. Soul	39
0yooAzGi7j1BFEQmJHXDbc	6v8FB84lnmJs434UJf2Mrm	5OlEEw6gIk32eMhOqRlfGu	Just Like Tom Thumb's Blues - Live at Madison Square Garden, New York, NY - October 1992	34
6pPrIe2PQWqwq0CHGcjYVq	7nqSDaZKccpnUqjzedyZF4	4ErXAsdor9LnNuLW4xyzRI	Needle and the Damage Done	32
1pJsmr01tzKnFfjeCvzcdc	3QTDHixorJelOLxoxcjqGx	6r5e7Kryn9PUFiwofr19K0	Nothing Even Matters	66
0wY9rA9fJkuESyYm9uzVK5	3QTDHixorJelOLxoxcjqGx	5zdFKRmlSDwAMZ5NFVGbx9	D'Evils	65
5ibTi2YwtvbB1bTOv2I93d	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	John Redcorn	64
4sFzG7iUlyPmuyASCkre9A	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	Hair Down (feat. Kendrick Lamar)	62
0hZIaQMGqu41dozEwqVa1b	3QTDHixorJelOLxoxcjqGx	2rMvlXjrgjenPKNBK6ze0q	Satisfaction	60
5LKzqs734Xs528hqK8bGS1	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	You Can't Save Me	60
4bxr2sOVZSLjIN7tQx53ir	3QTDHixorJelOLxoxcjqGx	6rdfmpRVrUn1B7Q8rSCHZj	Life Is Good (feat. Scribz Riley)	60
3Ku9kSWtDQPC8bSWpHR7z0	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	That's Why I Love You (feat. Sabrina Claudio)	58
33fgHbTXA4hVRriK2W1khx	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	The Recipe	57
3J5fFQ0PxfKQU5putEvUoM	3QTDHixorJelOLxoxcjqGx	5zUDvKAyEKkrhYLWJJWGPQ	New Sky (feat. Kadhja Bonet)	56
2wiV5iKq5F5A0KUee4OrlK	0qu422H5MOoQxGjd4IzHbS	1YbSlMGiAAaTfR9Kk9HNxk	Limerence	60
5YixskhSGNwmqjUrG0DTEY	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Romanticist	60
4sbsJMnW6k7TuLhVmodlFx	0qu422H5MOoQxGjd4IzHbS	3A290H1hI6mUv3uxGDrLlr	God Is a Circle	57
46LX0sSwIU4GFLcj23ZfMA	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Gospel For A New Century	55
0FqkI0vR3Z28v6GSudbKXj	3rWZHrfrsPBxVy692yAIxF	0oMXn0MNLNyvB4iJPZXOuV	Perfectly Not Close To Me (ft. Yves Tumor)	55
4chSRXrdadYm2ujaCyP3Cf	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Super Stars	53
3pihS07XVQEavaS9n7kObt	0qu422H5MOoQxGjd4IzHbS	1IpYZkYoYCjXTYMDEW8Ksk	Licking An Orchid	50
6Ucrht7JfguIXoa4hF9Leo	0qu422H5MOoQxGjd4IzHbS	2julo3Z5rNzSod7DoEuTz7	Secrecy Is Incredibly Important To The Both of Them	48
6DJdXo8oT7kTA9mYpvpJRk	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Strawberry Privilege	48
51rPRW8NjxZoWPPjnRGzHw	3ycxRkcZ67ALN3GQJ57Vig	2wqG59dVVQlJaxoO7N0LJt	Tadow	74
0bkTdkWwGk3OGFX0afD3Wj	3ycxRkcZ67ALN3GQJ57Vig	1S0yIZRDiFmqCQyTIEV175	Mystery Lady	69
6zWU7YALeEDMcPGhKKZJhV	3ycxRkcZ67ALN3GQJ57Vig	5DxMTCWwHlaz4Hx1og50xL	Navajo	67
1xTYy3K3hiTcoZfoD7culn	3ycxRkcZ67ALN3GQJ57Vig	0jKDicrmgUCTSNGRYXffXm	Say You Want Me	64
6T3Ebo7EOh8cUOyE4OhFpp	5Vuvs6Py2JRU7WiFDVsI7J	3myUd2MqJKr3rfUrAf41Us	Good & Plenty - Remix	63
5z2XleKRbvbiytGucM5v2D	3ycxRkcZ67ALN3GQJ57Vig	45IpQ6F0GYcas0yFGMzvac	Flight 99	60
5tkR9JkBj3Ueeo8W4k8IZD	3ycxRkcZ67ALN3GQJ57Vig	2wqG59dVVQlJaxoO7N0LJt	Queen Tings	60
1VAKnb1btGrQXcVZVSRkPe	7E2ioKxoxI2J94tUkIx6As	53FhNZMrcBim6Ec9mp8ifl	Good & Plenty	58
0QUbiLQySWPq5Lh3f7A9bN	0cGUm45nv7Z6M6qdXYQGTX	6ROLwnmW9pOioLned0DaP3	Hate The Club (feat. Masego)	58
5KaIIT6ijzJvlZPPiJby36	3ycxRkcZ67ALN3GQJ57Vig	2wqG59dVVQlJaxoO7N0LJt	Prone	58
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
1wJCQOm2LmQVTfO0d2Ax87	5NYEE4kgrEZPlM3DxUsTyc	6wKzNT7iuR06KiXJBTpkuV	Let's Have A Satanic Orgy	48
3VAIsHnHts4Q50xC0U389K	5NYEE4kgrEZPlM3DxUsTyc	0lFpGD5pdC8Ofbs1MvS0Pg	Satan's a Woman	42
4QdF1Ph72wZ9yWmK8TsDnJ	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	Lucifer, My Love	41
0Xpwy9bUKl1vKBAL55rdSk	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	The Devil (Didn't Make Me Do It)	40
2nHrv8WYddyiom6o7xbE6d	5NYEE4kgrEZPlM3DxUsTyc	5KbpmB5vJUBpHKpy9j2AYa	Babalon	39
0mUs7SDoJPWCgNv0Tmdg97	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	Sex Magick	39
3kp9ibchTs1RKlXnxlmooG	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	I'm Wicked	38
7zcDDM8zY0icYDU2r90JRo	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	I Know How to Hex You	37
3HOJK8zgaNqcK0HuTrdL4s	5NYEE4kgrEZPlM3DxUsTyc	4fynbs9l2M5gcBvHMqYGfa	I Am a Witch	37
1yTjpC27Sbdn5gcNeQF2qU	5NYEE4kgrEZPlM3DxUsTyc	5wopjMxpL3Bq6UE3oZ9Sun	Let's Hang Together	35
5wCVLW9qMtIY9IkBeyYnh6	75dQReiBOHN37fQgWQrIAJ	0ORZb7kyr8aaP2LpL3mhuY	When Am I Gonna Lose You	61
7LZN7FkxHZk6maiN6NdI2i	75dQReiBOHN37fQgWQrIAJ	2qiPY1CqHGexT4yWrQ5uX0	Dark Days	60
6ZMYbLF33jIECoG2MClauD	75dQReiBOHN37fQgWQrIAJ	4DZlJSUZnQUFMv4nW6Ijgv	Dark Days [Feat. Sylvan Esso]	57
5AKYyNPYhumqKeOMhdEgQO	75dQReiBOHN37fQgWQrIAJ	5OWYHfYE5Pf06BEkSLPV2W	I Saw You Close Your Eyes	55
3fIblK7WOWpnT39WIjP8tD	75dQReiBOHN37fQgWQrIAJ	6xfQHjndhrWjgENyEK0z7x	Just Before The Morning	54
53I7CviVHhNYEKth717RLG	75dQReiBOHN37fQgWQrIAJ	2qiPY1CqHGexT4yWrQ5uX0	Coins	52
44DnIGEvTlhDkGv3xLSDcp	75dQReiBOHN37fQgWQrIAJ	2cIpJDijNEoHv88jJKwDID	Wide Eyes	52
0BVZY0wh4lUICV71haiBR4	75dQReiBOHN37fQgWQrIAJ	5M50Jray1eYGOW5gkTzUjT	Desert Snow	51
1lTlQGQzaZoNX8SDNqYtUi	75dQReiBOHN37fQgWQrIAJ	1Zmq4tEgCSyTkud2ahysrq	Ceilings	51
6D5ALH11CwnnUaVqyyGmUS	75dQReiBOHN37fQgWQrIAJ	2WedBViHbzk10PflnQhNOg	Right Down The Line	50
5O7M9Ef0F5orV3UNJ4URNx	2pAajGWerK3ghwToNWFENS	2gUufHW7CcgULEywXTQHk4	Conditions Of My Parole	55
69GE6yPZZldvqtgBHrKXxg	2pAajGWerK3ghwToNWFENS	5dKl1Mg0MWV7m4Yhu76b9F	The Humbling River	54
6vX3f406IBBmI6mAHLARGa	2pAajGWerK3ghwToNWFENS	6yDwA52kX9NSG21aNTWAuW	Momma Sed	52
57ULv0uC3dyWCxqh8AtOh8	2pAajGWerK3ghwToNWFENS	6MyJhSzVSOravLjL5hpFMk	The Remedy	51
6WpBbL2UkFz4QQNpQuG9qD	2pAajGWerK3ghwToNWFENS	5dKl1Mg0MWV7m4Yhu76b9F	Potions - Deliverance Mix	51
5RVMaBTIAr8PM2keeeZlnZ	2pAajGWerK3ghwToNWFENS	2gUufHW7CcgULEywXTQHk4	Green Valley	48
7oF9EZknm2mlqJeiS5FlKt	2pAajGWerK3ghwToNWFENS	67tFctzjZBBPEU0E8QJwUp	The Mission - M Is For Milla Mix	47
2pw4svMKO3dMCbagNki1MG	2pAajGWerK3ghwToNWFENS	6SZJfUHQDgW9GVXr3mmQIT	Dear Brother	47
3KaDyCGZ4sRvtDDjJ0IUyW	2pAajGWerK3ghwToNWFENS	64tP0vzCmjHKKJY3PnoLZM	Rev 22:20 - Don't Shoot The Messenger Version	47
2q93bHAeQ1X3mpJbldnVzK	2pAajGWerK3ghwToNWFENS	4eYJzO460ZGaEFNJ4YCizR	Bullet Train To Iowa	46
63T7DJ1AFDD6Bn8VzG6JE8	22bE4uQ6baNwSHPVcDxLCe	72qrnM4yUNMDDlWiqKc8iY	Paint It, Black	80
6H3kDe7CGoWYBabAeVWGiD	22bE4uQ6baNwSHPVcDxLCe	4l4u9e9jSbotSXNjYfOugy	Gimme Shelter	76
7HKez549fwJQDzx3zLjHKC	22bE4uQ6baNwSHPVcDxLCe	15XNBzVWARPMlu0sEbfBjJ	Start Me Up - Remastered 2009	76
2PzU4IB8Dr6mxV3lHuaG34	22bE4uQ6baNwSHPVcDxLCe	2Q5MwpTmtjscaS34mJFXQQ	(I Can't Get No) Satisfaction - Mono Version	76
1Ud6moTC0KyXMq1Oxfien0	22bE4uQ6baNwSHPVcDxLCe	6OHri5qNxwCdVSdyCslspd	Sympathy For The Devil - 50th Anniversary Edition	73
77oU2rjC5XbjQfNe3bD6so	22bE4uQ6baNwSHPVcDxLCe	1Jv2AqzhgsduUik2p4k3cS	Beast Of Burden - Remastered 1994	72
1GcVa4jFySlun4jLSuMhiq	22bE4uQ6baNwSHPVcDxLCe	6iVOz2hudE6dv5Yrcsw2c9	Angie	71
3hJLKtTpgct9Y9wKww0BiR	22bE4uQ6baNwSHPVcDxLCe	1Jv2AqzhgsduUik2p4k3cS	Miss You - Remastered	69
52dm9op3rbfAkc1LGXgipW	22bE4uQ6baNwSHPVcDxLCe	29m6DinzdaD0OPqWKGyMdz	Wild Horses - 2009 Mix	68
6lFZbCc7pn6Lme1NP7qQqQ	22bE4uQ6baNwSHPVcDxLCe	4l4u9e9jSbotSXNjYfOugy	You Can't Always Get What You Want	67
54X78diSLoUDI3joC2bjMz	5a2EaR3hamoenG9rDuVn8j	7nXJ5k4XgRj5OLg9m8V3zc	Purple Rain	74
62LJFaYihsdVrrkgUOJC05	5a2EaR3hamoenG9rDuVn8j	54DjkEN3wdCQgfCTZ9WjdB	Kiss	72
51H2y6YrNNXcy3dfc3qSbA	5a2EaR3hamoenG9rDuVn8j	7nXJ5k4XgRj5OLg9m8V3zc	When Doves Cry	69
2I1W3hcSsPIsEJfD69pHrW	5a2EaR3hamoenG9rDuVn8j	27SA4Pkelh2pbwbVEORPOM	Raspberry Beret	63
0QeI79sp1vS8L3JgpEO7mD	5a2EaR3hamoenG9rDuVn8j	7nXJ5k4XgRj5OLg9m8V3zc	Let's Go Crazy	64
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
3Fwe3XoPOiyWUPYdBKMTqV	6Ghvu1VvMGScGpOUJBAHNH	7o4UsmV37Sg5It2Eb7vHzu	Around the Fur	67
2jSJm3Gv6GLxduWLenmjKS	6Ghvu1VvMGScGpOUJBAHNH	5LEXck3kfixFaA3CqVE7bC	Digital Bath	66
2GiJYvgVaD2HtM8GqD9EgQ	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Electric Love	80
4AewKenHXKBt643p473xCk	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	American Money	66
1Dr5JexwA15wmKe7Y7maA9	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Past Lives	63
00Ci0EXS4fNPnkTbS6wkOh	1KP6TWI40m7p3QBTU6u2xo	2Y81I8p6wKD13rSgp9aujA	Electric Love - Oliver Remix	56
62ZXL1CWLJDiDWUZUhfLfU	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Dopamine	56
2CzXAeABCmbEB52ZziuMsH	1KP6TWI40m7p3QBTU6u2xo	46Mmmgl5yZhchLWhEef7gA	Seeing Stars	54
03YZnK3XQWKpvo9TyNZzXf	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	The Emotion	53
4JEhFF1J95HoXuuXkyxMyS	1KP6TWI40m7p3QBTU6u2xo	0mzh0tCNFhxE2mSWxB4ufh	Blue Madonna	52
5rwQGBi5mdmU7dqNM7x9Oo	4n0gvapwYbRpzU5Ov68B6P	3BEUHeIQ39AlivVvDkwzNW	Love You So	56
00XrSeoUJusUuWvqd08lyF	4n0gvapwYbRpzU5Ov68B6P	7DP9LpHXZ4Ak560LIqDsFT	I’ll Be Loving You	43
16zn1yeH0Ia8JJJZh1fe1P	4n0gvapwYbRpzU5Ov68B6P	1RCFd3FwvpOMk0PzShzN5A	Alone Again	35
1ZXZQqS5hNvnKvhK8Q6Vz3	4n0gvapwYbRpzU5Ov68B6P	4NVwqWBq007KCMjfIPu3Bu	I'll Never Belong	34
5kMxNkoBH6XZfmfIqWmkHo	4n0gvapwYbRpzU5Ov68B6P	4NVwqWBq007KCMjfIPu3Bu	Zombies	32
5vWqMMqif5Vm1e1TK8NgbY	4n0gvapwYbRpzU5Ov68B6P	4NVwqWBq007KCMjfIPu3Bu	Why Don't You Lie?	31
5WENROwBwUlSPqfP6qiuBv	4n0gvapwYbRpzU5Ov68B6P	0UpIQtXECkZpGtBh0szbNT	Going Down	30
777LjHoW3blYhduQVUrCPk	4n0gvapwYbRpzU5Ov68B6P	6Ap1PVkQ93MHggcPjQ0vuE	Fishfight	29
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
1nynzV70VzfWjcCX9u64QV	6AWdGez5g1jxpfl9XD4wI3	0UMK3JacVsx29KjQuvBWcL	Reset	41
0Eet41iyLiVDtBmLp447pA	6AWdGez5g1jxpfl9XD4wI3	1k3MYSTe3zls106XkVRhuW	FREE	39
2VZDujZxmIDhW1G2sPsKqQ	6AWdGez5g1jxpfl9XD4wI3	2VmrjWEPK3PZ4WOkz4v65p	Romeo	37
0C42kuXV8DNlXzJTIUNFFE	6AWdGez5g1jxpfl9XD4wI3	0UMK3JacVsx29KjQuvBWcL	If I Jump	37
2JbNx2R6LaF2dZ2CYA1kDV	6AWdGez5g1jxpfl9XD4wI3	1jkGweRc6Ek8tqoBNW8snj	Happening	35
2XvpMAHHUVuKodlo7BKqpv	7HeVXdOdMhLslVputGTZFQ	79bRQkpKURXEnggeLVVxFq	Demon Host	42
3kpRgTtMnArQ5Gay0JxElf	7HeVXdOdMhLslVputGTZFQ	2U1BUKvsYIkUik7xEhAP0C	Hot Dreams	42
0AwLsPPWgYkib7HCrayqwy	7HeVXdOdMhLslVputGTZFQ	2U1BUKvsYIkUik7xEhAP0C	Run From Me	40
7BT2BsgZZffGmiENrzxCzy	7HeVXdOdMhLslVputGTZFQ	1peaWfJtqMtLmqKK79Cpxu	Magic Arrow	39
14lFMWrwM30Q8FiijmxWVz	7HeVXdOdMhLslVputGTZFQ	2tWkGlUTyWZcVsqryi8U1q	Bad Ritual	39
5Y8IMaCAPl996kjC4uo9Tx	7HeVXdOdMhLslVputGTZFQ	49I6QGpLjGJYC9WlyMEPhG	Velvet Gloves & Spit	38
2rsswxxShjBqoEj7dbr4Sb	7HeVXdOdMhLslVputGTZFQ	49I6QGpLjGJYC9WlyMEPhG	Grifting	36
3rly0zvX18j9J00wh5bs5S	7HeVXdOdMhLslVputGTZFQ	5xINyvUV0bHyJxBdFTT8xI	Dissociation	36
0s5VgEWaorOXCP0XdgTGXM	6CWTBjOJK75cTE8Xv8u1kj	4hTlbmXBvgkbvOmvKJFVP3	Homage	35
4lzPv33jwjnTJ7b2LMAmpG	7HeVXdOdMhLslVputGTZFQ	7lWcFkeeWhnaEFJygxwvg9	Like a Mountain	34
2NF8A7C6tICScdRaZ0BrEe	4AKwRarlmsUlLjIwt38NLw	7fJMKBNqYWhvWDs560x6nn	Katchi - Ofenbach vs. Nick Waterhouse	62
5qVVPptGHVCPMci6NCbLCq	5wFXmYsg3KFJ8BDsQudJ4f	0QgLeJOCYZN6V9kUTlgNHu	The Gold - Nick Waterhouse Remix	47
09uXepY9uC1cUlvZ6kbOy6	0V7uVrIYr4FwFvUN9S4kYr	1gzWphTk6PqMZ5qWbVaBk4	Katchi	43
3JlInp87C2VJ86UUrXkTM0	0V7uVrIYr4FwFvUN9S4kYr	1gzWphTk6PqMZ5qWbVaBk4	La Turnaround	40
0yfxzBChrAXXoUKuUvSgzm	0V7uVrIYr4FwFvUN9S4kYr	1NVwXCp6SlwgEnZ27QN1cP	Dead Room	38
3CI8Y7vvCYUKo8kjZteCrz	0V7uVrIYr4FwFvUN9S4kYr	1e1FoOAXam30VAJJb4q4Zk	Thought & Act	37
6naEBVsSQonTSqTOsquBA9	0V7uVrIYr4FwFvUN9S4kYr	2ttSZFH721F5dC6fbZznTb	Monterey	37
501jsSXfxhgClQe4UDrofk	0V7uVrIYr4FwFvUN9S4kYr	1e1FoOAXam30VAJJb4q4Zk	I Feel an Urge Coming On	36
5mqop2IekTZWc2hRE7NpmW	0V7uVrIYr4FwFvUN9S4kYr	1e1FoOAXam30VAJJb4q4Zk	Song for Winners	36
1Zi74xhSWk5R13oGceGsfm	0V7uVrIYr4FwFvUN9S4kYr	0PHH7ZnpTBkek9iQtGNBno	Place Names	33
7N15WWy12QAMpGAh6QMAej	6hnWRPzGGKiapVX1UCdEAC	2Dpw2XUAsBvuNdNLarNzz8	(What A) Wonderful World	62
0KOE1hat4SIer491XKk4Pa	6hnWRPzGGKiapVX1UCdEAC	2NFd4ApYFitFtJhGTSfDdP	A Change Is Gonna Come	66
5EoYc5wvRYOtkudLfrjsL1	6hnWRPzGGKiapVX1UCdEAC	2Dpw2XUAsBvuNdNLarNzz8	Bring It On Home to Me	62
7FS541dJh3iQAEXEZoDhE6	6hnWRPzGGKiapVX1UCdEAC	406RCIvK6uh49XviqAI6kY	Twistin' the Night Away	61
6e6Kxot9nHyZ4I8GgmGKII	6hnWRPzGGKiapVX1UCdEAC	1rEYwOdpVc2W39d0uxf0va	Nothing Can Change This Love	60
5z8DiKSG4EwxmO6gUi12rZ	6hnWRPzGGKiapVX1UCdEAC	2NFd4ApYFitFtJhGTSfDdP	Another Saturday Night	57
24lvdbt9pS7DFEjhEWSl49	6hnWRPzGGKiapVX1UCdEAC	0cvF6655OPZeLDYeU8UqL6	You Send Me	55
7uIaBPSTlBaAQr1asfZ3B4	6hnWRPzGGKiapVX1UCdEAC	1rEYwOdpVc2W39d0uxf0va	I Wish You Love	54
4UcxTnA6C5vCW79PIZ38Vx	6hnWRPzGGKiapVX1UCdEAC	2NFd4ApYFitFtJhGTSfDdP	Good Times	54
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
3HUCTp20rxqMnCtdyU7JgU	1fZpYWNWdL5Z3wrDtISFUH	5ZetO1qY0okdczkZzAQEBL	If Not For You (Demo)	48
5wDkzGnw8nsQUbgMryKWBl	1fZpYWNWdL5Z3wrDtISFUH	3JsZjfjVa95IMuZ50eX7BU	Late July - Audiotree Live Version	48
5a2yG11mx2vNBcOo6UMIel	1fZpYWNWdL5Z3wrDtISFUH	6gujv1pAaPxIvDbv1hYq18	Built To Roam	48
2UODQhPzz51lssoMPOlfy5	7ITd48RbLVpUfheE7B86o2	3hd8GiXOy4KUTxVDVUDT5F	Don't Carry It All	53
721tATaNQPPGSuC3dYEI3h	7ITd48RbLVpUfheE7B86o2	4qvFBtRrwbSgoH3nyVlTCp	Sons & Daughters	50
0IwXp8V7wgFCIthRh2z8Ot	7ITd48RbLVpUfheE7B86o2	4qvFBtRrwbSgoH3nyVlTCp	The Crane Wife 3	50
7IxWqdG1zG0gaAFYq2q0Iy	7ITd48RbLVpUfheE7B86o2	3hd8GiXOy4KUTxVDVUDT5F	Down By The Water	49
221bl0jrSfJ1LMgUw36zRJ	7ITd48RbLVpUfheE7B86o2	4qvFBtRrwbSgoH3nyVlTCp	O Valencia!	49
2GRbFpacyEnbA3Mk7KcfM4	7ITd48RbLVpUfheE7B86o2	51OgvNl5EtB6iNevPXxiCc	Here I Dreamt I Was an Architect	48
5eltlS3CM4xGNkL6VhpTDm	7ITd48RbLVpUfheE7B86o2	1ofGOFzgt22AGMi9yQIOMq	The Mariner's Revenge Song	48
1bvERTuePaoVjQ3NpJq9aH	7ITd48RbLVpUfheE7B86o2	3hd8GiXOy4KUTxVDVUDT5F	June Hymn	47
38psZM2gA6UWA7rqqgOjGL	7ITd48RbLVpUfheE7B86o2	2aCFve5jvcVkJ9JFcNeHc6	Severed	47
7m3fyN4mYVxLeYHTgWJiPB	7ITd48RbLVpUfheE7B86o2	3hd8GiXOy4KUTxVDVUDT5F	Calamity Song	45
2hnMS47jN0etwvFPzYk11f	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Santeria	76
3B4q6KbHbGV51HO3GznBFF	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	What I Got	72
4eamJr2k9YDH8j58RSTmSc	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Doin' Time	66
2PdIo7ewQPuAsP99LVg9uy	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Wrong Way	65
4paJ10JPNCyOaLtz2cY928	0EdvGhlC1FkGItLOWQzG4J	02VqlfUtNMogzTh1lckGOF	Badfish	65
0Jur3mZsQba3vqSpcmsOPm	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	Smoke Two Joints	62
2JKlf0IYz5oWsT3OCLyjpO	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Caress Me Down	59
0vtJ9Dq53hfXE3KyP1yPni	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	40oz. To Freedom	58
3kGt9uxpJzKTxwp2uJHrU5	0EdvGhlC1FkGItLOWQzG4J	14eK347GdWO4mBBx78tsut	Same In The End	57
7FLQo89iaS5gf2hnIEW7P9	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	Date Rape	57
2lwwrWVKdf3LR9lbbhnr6R	1yAwtBaoHLEDWAnWR87hBT	0TGTGuc2vXv6ZECoAf52N0	Float On	72
0Fe3WxeO6lZZxj7ytvbDUh	1yAwtBaoHLEDWAnWR87hBT	2lXBCL76UL5PCPbfAqKBkz	Dashboard	62
5vtRk4rYxiy4cj95cmJ5Ma	1yAwtBaoHLEDWAnWR87hBT	3PTktNuj2FItJr8afuiieo	Dramamine	58
4asjU3sDnn3002bTJIg2vZ	1yAwtBaoHLEDWAnWR87hBT	2lXBCL76UL5PCPbfAqKBkz	Missed the Boat	57
5op53ANI4exiWqFHKuwWxd	1yAwtBaoHLEDWAnWR87hBT	0TGTGuc2vXv6ZECoAf52N0	The World At Large	56
5jJ69cMDMC0aeWPjZo6VP2	1yAwtBaoHLEDWAnWR87hBT	6iKqPv9C5oU29LR82N8lJf	Lampshades on Fire	55
4ToYlykhwpW98KtMIGnWQK	1yAwtBaoHLEDWAnWR87hBT	0TGTGuc2vXv6ZECoAf52N0	Ocean Breathes Salty	55
1pPqVrG2RCHXx81Aw4xp99	1yAwtBaoHLEDWAnWR87hBT	5SbcupirEParczvqqyUPXL	Gravity Rides Everything	53
5EsM3rVaMDRsOXJq7oe3tY	1yAwtBaoHLEDWAnWR87hBT	5mvHTVy1iUIkAflIufoOpj	Polar Opposites	51
7Gi8kaILAUgjYqgdee9410	1yAwtBaoHLEDWAnWR87hBT	5SbcupirEParczvqqyUPXL	3rd Planet	50
113bLFbp3F9MVN0w2KJ1ma	6LufpoVlIYKQCu9Gjpk8B7	1xwNW7Q1daqJ8LNgymY04y	How Long Do I Have to Wait for You?	67
46qpQWRt75ZlVPLtlwQvty	6LufpoVlIYKQCu9Gjpk8B7	5AaBCtOPHVJMYcDyLgu5BD	Nobody's Baby	64
4inbFqrP4CS3Ig99dIwfQ1	6LufpoVlIYKQCu9Gjpk8B7	5AaBCtOPHVJMYcDyLgu5BD	Tell Me	60
30lSYnB1aJjmxuJFXhJuhD	6LufpoVlIYKQCu9Gjpk8B7	1xwNW7Q1daqJ8LNgymY04y	How Do I Let a Good Man Down?	60
5RlLg00cYLUNOBo1edu51Z	6LufpoVlIYKQCu9Gjpk8B7	5AaBCtOPHVJMYcDyLgu5BD	Be Easy	59
1lDrb5N8RmfD1USPQYPpUu	6LufpoVlIYKQCu9Gjpk8B7	4FZCwaWGcFqd2CBiJUcHnx	Better Things	59
0THjXAVqAVDyIcihu1FKL8	6LufpoVlIYKQCu9Gjpk8B7	6aihw9128hBziSMwsKncpT	Midnight Rider	57
69YW4FrGpsjzt9lr517bUz	6LufpoVlIYKQCu9Gjpk8B7	5AaBCtOPHVJMYcDyLgu5BD	100 Days, 100 Nights	55
1fEUMHp0jSNrZfzINtXCq6	6LufpoVlIYKQCu9Gjpk8B7	6HsAPYyRSAmzyNeBZJMC4q	Making Up and Breaking Up (And Making Up and Breaking Up Over Again)	53
6oobvM9iZY1OF18kC36llz	6LufpoVlIYKQCu9Gjpk8B7	6dQ4PANge8QXfOywlHNd2J	Come and Be a Winner	52
7Jh1bpe76CNTCgdgAdBw4Z	0oSGxfWSnnOXhD2fKuz2Gy	4I5zzKYd2SKDgZ9DRf5LVk	Heroes - 2017 Remaster	76
0pQskrTITgmCMyr85tb9qq	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Starman - 2012 Remaster	76
2EC9IJj7g0mN1Q5VrZkiYY	0oSGxfWSnnOXhD2fKuz2Gy	72mfhbEsMtXR6s7v9UhKe3	Rebel Rebel - 2016 Remaster	72
72Z17vmmeQKAg8bptWvpVG	0oSGxfWSnnOXhD2fKuz2Gy	1ay9Z4R5ZYI2TY7WiDhNYQ	Space Oddity - 2015 Remaster	71
3ZE3wv8V3w2T2f7nOCjV0N	0oSGxfWSnnOXhD2fKuz2Gy	6fQElzBNTiEMGdIeY0hy5l	Life on Mars? - 2015 Remaster	71
3ix6K4wZY29bCujrSznwFZ	0oSGxfWSnnOXhD2fKuz2Gy	4NwG11AsDJluT732lSjMrV	Let's Dance - 2018 Remaster	69
6mib3N4E8PZHAGQ3xy7bho	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Moonage Daydream - 2012 Remaster	68
0LrwgdLsFaWh9VXIjBRe8t	0oSGxfWSnnOXhD2fKuz2Gy	6fQElzBNTiEMGdIeY0hy5l	Changes - 2015 Remaster	68
3gxEZXUjrNbl3TlSrTGbR5	0oSGxfWSnnOXhD2fKuz2Gy	4NwG11AsDJluT732lSjMrV	Modern Love - 2018 Remaster	68
5IyL3XOaRPpTgxVjRIAxXU	0oSGxfWSnnOXhD2fKuz2Gy	48D1hRORqJq52qsnUYZX56	Ziggy Stardust - 2012 Remaster	65
0Z57YWES04xGh3AImDz6Qr	2kGBy2WHvF0VdZyqiVCkDT	75614DWrksimeV4oXUhaYP	Real Love Baby	66
77RNVzAVwqWiZrZuWqMV2i	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	Nancy From Now On	59
3O30ywyRk6EKT68sBvVqOP	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	Hollywood Forever Cemetery Sings	57
7qqrGV5WpQnMKqVTsDZd9J	00FQb4jTyendYWaN8pK0wa	3hL6ZIcwV6zUfqRiPLPBLJ	Buddy's Rendezvous	56
3wfF0Nw234zHY1vdIWIc2g	2kGBy2WHvF0VdZyqiVCkDT	4vTEFCLgDEgKIQXTrsmS6F	Chateau Lobby #4 (in C for Two Virgins)	55
7ydJaSdC8Au68eYgspNznY	2kGBy2WHvF0VdZyqiVCkDT	2tfg6zi5pwuYeQ0IHYnOBz	Goodbye Mr. Blue	55
2gUwnJ5cpl40TSlqmjfqAC	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	I'm Writing a Novel	51
0rGB4l2BHJhL4C1s8w6jZG	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	O I Long to Feel Your Arms Around Me	49
5AHYDez7G9xD3CIReL88yU	2kGBy2WHvF0VdZyqiVCkDT	2CXVonfqGwTQu8dgr2qkNS	Funtimes in Babylon	48
5jLMFDMUkGpzIgPF2sxWkB	2kGBy2WHvF0VdZyqiVCkDT	4vTEFCLgDEgKIQXTrsmS6F	I Love You, Honeybear	47
4uQ7wYsuL0DryknoDc11Hk	68kEuyFKyqrdQQLLsmiatm	4Csoz10NhNJOrCTUoPBdUD	Norf Norf	64
0lqAn1YfFVQ3SdoF7tRZO2	68kEuyFKyqrdQQLLsmiatm	2G549zeda2XNICgLmU0pNW	THE BEACH	64
3Vj8RQkFwOmDvUrwu6MtQZ	68kEuyFKyqrdQQLLsmiatm	09VyQ2zwUx0EBKTJNBUZv1	Yo Love - From "Queen & Slim: The Soundtrack"	63
5OFEJMirg4NPz7G1zgXDYu	68kEuyFKyqrdQQLLsmiatm	2suR5CCbtL2Wq8ShFo8rFr	ARE YOU WITH THAT?	63
1jhdCONafFj1hzJsPvZx27	68kEuyFKyqrdQQLLsmiatm	2G549zeda2XNICgLmU0pNW	WHEN SPARKS FLY	60
7uX3gufAoBVqKVoD3dBLLD	6qqNVTkY8uBg9cP3Jd7DAH	6eQpKhYCtvD0TwXQVHsgC2	&burn (with Vince Staples)	59
7pBsquIkbED6W6uSQJGbkn	68kEuyFKyqrdQQLLsmiatm	35s58BRTGAEWztPo9WqCIs	Home	58
7bUcBztfGqO7cSI2gMZeCI	68kEuyFKyqrdQQLLsmiatm	3pLdWdkj83EYfDN6H2N8MR	Opps (with Yugen Blakrok)	58
6eL1ncVDtQHgSm3E288TS7	68kEuyFKyqrdQQLLsmiatm	5h3WJG0aZjNOrayFu3MhCS	Big Fish	57
7jN5Abri3a1crehbnlWa1F	68kEuyFKyqrdQQLLsmiatm	2G549zeda2XNICgLmU0pNW	MAGIC	56
6vECYJHxYmm3Ydt3fF01pE	1hzfo8twXdOegF3xireCYs	5D20ZzsNB377xbshIFP9Nb	Stolen Dance	73
3GXgrEjBjonrQrPEEi13yU	1hzfo8twXdOegF3xireCYs	3anT3sq943fma4yCM5FhvG	Synchronize	62
7HNpXPaTcX5CoNBjTAEWBr	1hzfo8twXdOegF3xireCYs	5D20ZzsNB377xbshIFP9Nb	Down By The River	56
5mpLcXEsk3jjzLFGuNKk5I	1hzfo8twXdOegF3xireCYs	5D20ZzsNB377xbshIFP9Nb	Flashed Junk Mind	61
35iR1qzexmbcUSgA01S4gI	1hzfo8twXdOegF3xireCYs	707cK3j40hIquI15sOcYXP	Colorado	60
2zR85boqjMOKPygjdDbGbC	1hzfo8twXdOegF3xireCYs	62rE0W1Vy1v48FTO9hxPzx	Unknown Song	62
0RtXNY1EREFz5sO94TIHM9	1hzfo8twXdOegF3xireCYs	3anT3sq943fma4yCM5FhvG	Troubled Man	59
6XWsIlOw94W4lT5Xu0MdRf	1hzfo8twXdOegF3xireCYs	3anT3sq943fma4yCM5FhvG	Table for Two	61
0ZYok0WAPtc97pzHuDwW1f	1hzfo8twXdOegF3xireCYs	3anT3sq943fma4yCM5FhvG	As It Was	60
1X6Kmaa2Yq70vF0cIQ6V0f	1hzfo8twXdOegF3xireCYs	707cK3j40hIquI15sOcYXP	Save Your Tears	59
3HOXNIj8NjlgjQiBd3YVIi	251UrhgNbMr15NLzQ2KyKq	72YUTJrAuTuSHSVrgixbor	Yellow Eyes	60
40DGtj95w54IDSbA7BWn3o	251UrhgNbMr15NLzQ2KyKq	26n1VRHY8iKUGgRneKSOud	Olivia	56
6H96yLcXFKuBYTFEEi4Vl2	251UrhgNbMr15NLzQ2KyKq	26n1VRHY8iKUGgRneKSOud	Willy's Song	53
5aXYNj2v1ut661U0HLT6fP	251UrhgNbMr15NLzQ2KyKq	72YUTJrAuTuSHSVrgixbor	Mr. Rodriguez	50
3BkBTso1LQicQOkU1ga0xY	251UrhgNbMr15NLzQ2KyKq	43sgLebubxZtXox2i0QiVA	Without Me	50
6FR7CxgunBBN1jYJxsX8uZ	251UrhgNbMr15NLzQ2KyKq	2JZRyLhDpddo6XUwtb2ZJA	Bad Things	48
1Wi0vXVg2cAXmfkrHwoQx4	251UrhgNbMr15NLzQ2KyKq	3FoDNOhHqVS1c9mw6NJW3T	Small Worlds	48
5thEuYF5DJK0KPk3eFUVXe	251UrhgNbMr15NLzQ2KyKq	11R59ESDiW114ngszKUkyH	My Argentina	43
1b3UY0WcVkxQvPDGo7T36s	251UrhgNbMr15NLzQ2KyKq	43sgLebubxZtXox2i0QiVA	Angeline	43
6lzjz4VBXtloniJwMXWicE	251UrhgNbMr15NLzQ2KyKq	43sgLebubxZtXox2i0QiVA	Let It All Go, Man	43
1FvDJ9KGxcqwv1utyPL3JZ	3yY2gUcIsjMr8hjo51PoJ8	6cI1XoZsOhkyrCwtuI70CN	This Charming Man - 2011 Remaster	76
1xaTREM89RbIxkcjlpf4Uw	3yY2gUcIsjMr8hjo51PoJ8	1j57Q5ntVi7crpibb0h4sv	Heaven Knows I'm Miserable Now - 2011 Remaster	75
6LUGvXEAK8WxIBYK43uoTb	3yY2gUcIsjMr8hjo51PoJ8	45StnugV9WQMQwk4rRoTy8	Back to the Old House - 2011 Remaster	72
1YrnDTqvcnUKxAIeXyaEmU	3yY2gUcIsjMr8hjo51PoJ8	1j57Q5ntVi7crpibb0h4sv	How Soon Is Now? - 2011 Remaster	70
6BrMEbPSSj55nQhkgf6DnE	3yY2gUcIsjMr8hjo51PoJ8	1j57Q5ntVi7crpibb0h4sv	Please, Please, Please, Let Me Get What I Want - 2011 Remaster	70
69Kzq3FMkDwiSFBQzRckFD	3yY2gUcIsjMr8hjo51PoJ8	1j57Q5ntVi7crpibb0h4sv	This Night Has Opened My Eyes - 2011 Remaster	69
2OErSh4oVVAUll0vHxdr6p	3yY2gUcIsjMr8hjo51PoJ8	5Y0p2XCgRRIjna91aQE8q7	Bigmouth Strikes Again - 2011 Remaster	69
3M2bD9SMYnJIPdrTKUnBd3	3yY2gUcIsjMr8hjo51PoJ8	5Y0p2XCgRRIjna91aQE8q7	I Know It's Over - 2011 Remaster	66
64D3dzWyj0GpQT1AHx4kbK	3yY2gUcIsjMr8hjo51PoJ8	45StnugV9WQMQwk4rRoTy8	Panic - 2011 Remaster	65
5KDNFlHAdDJ84fhK27c35X	4DFhHyjvGYa9wxdHUjtDkc	0GeWd0yUKXHbCXVag1mJvO	Judith	66
6CqYhhUPJORx1vvdTNc8jv	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	The Outsider	63
5kHkaBN8OEQlmXfQkACxSt	4DFhHyjvGYa9wxdHUjtDkc	0GeWd0yUKXHbCXVag1mJvO	3 Libras	61
7gDVjl5fEw2OPAtjbW4LzR	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	Weak And Powerless	60
27msmgcdSRniJHfocEf6EH	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	Pet	60
4XDBEoD6QFnzDY5oMmNVXN	4DFhHyjvGYa9wxdHUjtDkc	0GeWd0yUKXHbCXVag1mJvO	The Hollow	58
7slyp653Si99N4yQcJ2E9T	4DFhHyjvGYa9wxdHUjtDkc	2UAin9VEGxiZRfe9Q7SKg4	Passive	56
6lvNLD1XRU5paMwWH0RGRI	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	The Noose	54
47HJ7biEuVZxoPkauczu2R	4DFhHyjvGYa9wxdHUjtDkc	0GeWd0yUKXHbCXVag1mJvO	Magdalena	53
6tgTTBaIf0tO6lvDhoXfMg	4DFhHyjvGYa9wxdHUjtDkc	49K6hYDEr5M3GxIBBxlPf9	Blue	52
0zO8ctW0UiuOefR87OeJOZ	5IcR3N7QB1j6KBL8eImZ8m	7Et3bSTLLqdABO1qCxUplS	Collard Greens	76
5SsR3wtCOafDmZgvIdRhSm	5IcR3N7QB1j6KBL8eImZ8m	7Et3bSTLLqdABO1qCxUplS	Man Of The Year	70
29gsi1zZrZxdStACmTQB0Z	5IcR3N7QB1j6KBL8eImZ8m	7Et3bSTLLqdABO1qCxUplS	Studio	67
4LmAnpjlhWTahvRkYR8xJa	5IcR3N7QB1j6KBL8eImZ8m	3pLdWdkj83EYfDN6H2N8MR	X (with 2 Chainz & Saudi)	66
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
0iCmSNHh2SaJPa6G3Mx105	3D4qYDvoPn5cQxtBm4oseo	1NAKevr9Io1J3isYJFtUiH	Every Thought A Thought Of You	36
6FciQamZ49aqlmn06yJjYx	3D4qYDvoPn5cQxtBm4oseo	5mlCtfr6NLphHzAaXIuXz4	Torches Together	35
5IOjHxhDVsW9hCebpWIjkq	3D4qYDvoPn5cQxtBm4oseo	4yItCYzksCSiB8RcUsAdSg	Wolf Am I! (And Shadow)	34
4IDOe60g0rR3hQqpAluLgN	3D4qYDvoPn5cQxtBm4oseo	1NAKevr9Io1J3isYJFtUiH	The King Beetle On A Coconut Estate	33
24gpcyxzfyE8DI89FXFHLh	3D4qYDvoPn5cQxtBm4oseo	2rErxidCuRG9OAFv2WPMKA	Bullet To Binary	33
6Vi3zrYtd2n53YUiYLTnNC	3tJ9PkBOrG7hFkHeNM2tbw	7lFxuWjTe0JxXka9tjzGXm	Vem meu amor	48
0Xt2ZJpiBRYnExG0k2Zk9b	7dzq55YG3wjViqexDwiycQ	0BGtZFqDInZuJJvJa8jChx	Faraó Divindade Do Egito / Ladeira Do Pelô / Doce Obsessão - Ao Vivo	46
7c60MUlDMw6ZI1Ft4LxLBY	3tJ9PkBOrG7hFkHeNM2tbw	7lFxuWjTe0JxXka9tjzGXm	Deusa do amor - Ao vivo	44
1wHNSciCOxqs4dft2EWrIC	3qvcCP2J0fWi0m0uQDUf6r	2hC2wtKkPe5Jdkx8g2IJPe	SOFRENDO FEITO UM LOUCO - SUMMER VERSION	44
3vdevXZtf1T08rQubQcwY4	3tJ9PkBOrG7hFkHeNM2tbw	5haiFJR9CxVYTS3MpZX1NQ	I Miss Her	36
1uJKTRjp5WxzrWwfElOZDp	3tJ9PkBOrG7hFkHeNM2tbw	4RPiOtWQymIOwQhazukSAu	Várias Queixas	40
2gVRDshVuLTKslwTequSO1	3tJ9PkBOrG7hFkHeNM2tbw	7bY4SH61zQPK4bnffxu64P	Requebra - Ao vivo	39
632pAox1NgFyiubpHzps90	3tJ9PkBOrG7hFkHeNM2tbw	4Pjo3KsaX35V2VHKER39T2	Madagáscar olodum	22
42zb6MpkTpMhuV3C3OeFXK	3tJ9PkBOrG7hFkHeNM2tbw	06Atso1IAfXUpWakHGZdjh	Requebra	21
35SwFntBxtKFFOFKurhesr	3tJ9PkBOrG7hFkHeNM2tbw	4Pjo3KsaX35V2VHKER39T2	Faraó divindade do Egito	28
3mtIUX9LrCpIUiAAv9SD4a	2ApaG60P4r0yhBoDCGD8YG	6KMdn9HDIqcBPaaok0K34K	Between the Bars	60
5AMrnF761nziCWUfjBgRUI	2ApaG60P4r0yhBoDCGD8YG	1zOxlHQGGV6EH7n4OIFTyh	Waltz #2 (XO)	59
2uwN3PDudlRkAKE3wA0OqJ	2ApaG60P4r0yhBoDCGD8YG	6KMdn9HDIqcBPaaok0K34K	Angeles	54
3XtkcPHbYX0BImTQLlbSVN	2ApaG60P4r0yhBoDCGD8YG	6KMdn9HDIqcBPaaok0K34K	Say Yes	57
4xfAVJL8R7mVYbDk8a9xOY	2ApaG60P4r0yhBoDCGD8YG	7DC0pE943VR5tAKIvQXHts	Somebody That I Used To Know	56
6WuRo5MdVrpKCl6lkKIAlp	2ApaG60P4r0yhBoDCGD8YG	60C4r1YwIxsliktUL6eXfw	Needle In The Hay	53
1Q0sk7b7PAGjgC3R5zyuWt	2ApaG60P4r0yhBoDCGD8YG	1zOxlHQGGV6EH7n4OIFTyh	Pitseleh	54
4zetUxeSCCDwrr1jJT0SuD	2ApaG60P4r0yhBoDCGD8YG	3uLHeL4d8aILBRlfpWNPYM	Miss Misery	53
3nkdVXnH4xC6f3YZS0C8pC	2ApaG60P4r0yhBoDCGD8YG	7DC0pE943VR5tAKIvQXHts	Everything Reminds Me Of Her	53
6tPiCU4LFsXUQPRIykOAnl	2ApaG60P4r0yhBoDCGD8YG	7DC0pE943VR5tAKIvQXHts	Son Of Sam	53
14246VCxRDGZHqlMlqWSz4	20qISvAhX20dpIbOOzGK3q	1tiCHRx9AI11hfcLmkGEXT	Wave Gods	60
5taqLrLouA4vCjM7ZQpEtW	4RnBFZRiMLRyZy0AzzTg2C	6cx4GVNs03Pu4ZczRnWiLd	ooh la la (feat. Greg Nice & DJ Premier)	57
1NfIOF8pH2auEaGq4roP2I	4xRYI6VqpkE3UwrDrAZL8L	0RTHMVF27KRMHIGnF7iLru	Vinyl Days (feat. DJ Premier)	50
3rSiXFJlhhhy36761mj9js	6GEykX11lQqp92UVOQQCC7	3YQRfcAxfqX4KJt4o0yCTm	The Root of All (feat. Slick Rick & Lil Wayne)	48
5Wt2UAS92w2ZyDqX2dOEBg	165ZgPlLkK7bf5bDoFc6Sb	5mi7FKaWE5CtcOjdyxScA7	Getcha Groove On - Dirt Road Mix	46
5UcJZVvqgX9dnjq161bGQ4	3s7WzrEs4FkNObqj4WyfQm	0L9rBwT5kUeKlwg7HOqwUU	Times Is Rough	42
0lRhj7HyP2KObeyFPUOPRA	6GEykX11lQqp92UVOQQCC7	2PXyfq0RX8BpA1NfOhnFaJ	Our Streets (feat. A$AP Ferg) (feat. A$AP Ferg)	45
34rwJDeFgvZXd9KtiBkQKI	6GEykX11lQqp92UVOQQCC7	3YQRfcAxfqX4KJt4o0yCTm	Beat Breaks (feat. Nas)	45
04jxZHjzLOknmIJSgjefyZ	6GEykX11lQqp92UVOQQCC7	4mLRYZaEEXZn5Ze3gxqtsf	Headlines (feat. Westside Gunn, Conway & Benny)	45
3TPvrMAd1hbPRXuHCRX0Pl	4nvFFLtv7ZqoTr83387uK4	6SFd0NeIrUfZoqCSjoFpe8	AEAO	44
7jIAttgQTpLDoNtykIQXjH	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Blister In The Sun	69
5fj76kVAnqRKKhAw5d06jj	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Kiss Off	55
7mVoBnU3mxV5Q6n4DmOv6K	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Gone Daddy Gone	54
61QW3AcU1jm5ttPOn8eZhn	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Add It Up	54
21F39lpBdWHu5aRy68V8xj	0rpMdBzQXf7aYRnu5fDBJy	1P29pi4JtRPZfpMPnEhCLS	American Music	50
7ccurrFI92e3hBtU02WgTL	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Good Feeling	46
4sxVoAf7uvxCSgTCRNDohP	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Please Do Not Go	46
6jcYInRCmQcUdRVjm4kRoh	0rpMdBzQXf7aYRnu5fDBJy	69BYin03rGTRdyDChYBxfr	Color Me Once	45
1kqBAV3R35lVIRvhYmSI6s	0rpMdBzQXf7aYRnu5fDBJy	2nb3J8l5RKHOU3R4oTQP9u	Country Death Song	41
2vU1H8XKsK6bUff94gTorE	0rpMdBzQXf7aYRnu5fDBJy	0Ojio25IPzIrw1rUmgrhrG	Prove My Love	40
6PuoZT4kgw5DrUEdnQ6e01	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	This Must Be The Place	64
0aPX1AXz8Tp51Nak6B04ij	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	Friends	56
7rNnqDOzc3Qoom2VhIyuxx	1anAI9P9iSzc9qzLv6AtHZ	31t6VcIOZ3WqsSH2F9Zcy0	Funky Galileo	44
0tN5MAdqjjhYS4HE2JnfzJ	1anAI9P9iSzc9qzLv6AtHZ	25gXJ8YPQpkC9fUEF5Wxlt	Warm Animal	53
3YSefJ4OGYCIHNVowuSx7O	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	Fat Lady	52
7c0AtG5G1kbVUrBYxREGXv	1anAI9P9iSzc9qzLv6AtHZ	22rxIV4YCzp5LpFPDt95Kc	The Caller	48
1wDBglPaH5ehDDNiNWCHp0	1anAI9P9iSzc9qzLv6AtHZ	31t6VcIOZ3WqsSH2F9Zcy0	California High	48
7dW6aiHZG0A8xApW0Xg40G	1anAI9P9iSzc9qzLv6AtHZ	31t6VcIOZ3WqsSH2F9Zcy0	Lonely One	47
0CNJyQiyzYxbsuMGTQlria	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	Giants	47
0m9TcZ6H1tdRQ2zpdZybaZ	1anAI9P9iSzc9qzLv6AtHZ	7EfgATnOllXJ96s4sSdzei	New Biome	44
48EjSdYh8wz2gBxxqzrsLe	2auiVi8sUZo17dLy1HwrTU	3Yko2SxDk4hc6fncIBQlcM	Cranes in the Sky	64
6IAgarq2wDeYzpsY2Kx0Hw	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Almeda	63
7yvdp8dqmxExSJwT2fn6Xq	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Binz	62
6GCIYIWUBSLontW6divqsw	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Stay Flo	61
22DHmfJa31hKpc2Lg0gVBV	2auiVi8sUZo17dLy1HwrTU	3Yko2SxDk4hc6fncIBQlcM	Mad (feat. Lil Wayne)	55
0deHsjyrgcKGMZzIuvawq3	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Dreams	54
688iitLNSV6Iik1QESqvth	2auiVi8sUZo17dLy1HwrTU	3Yko2SxDk4hc6fncIBQlcM	Rise	52
2TyCAfhwu5tRqFW8VnGMIL	2auiVi8sUZo17dLy1HwrTU	3Yko2SxDk4hc6fncIBQlcM	Don't Touch My Hair (feat. Sampha)	52
4o8Rk1YzdkTxsSEXd3YhAK	2auiVi8sUZo17dLy1HwrTU	4WF4HvVT7VjGnVjxjoCR6w	Sound of Rain	51
5hR0wTnydz6lmErOV4c0sp	2auiVi8sUZo17dLy1HwrTU	6VCjvboIlNJ3N881Xja6ng	Losing You	50
7wCmS9TTVUcIhRalDYFgPy	6zvul52xwTWzilBZl6BUbT	50j4Wm1b9hLpSpPIA39Vp9	Where Is My Mind? - Remastered	78
4IvZLDtwBHmBmwgDIUbuwa	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Here Comes Your Man	69
0p5eZCY0R7uNCZS1YDtIYI	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Hey	68
3NfqN997u9A3YAAafgzhIa	6zvul52xwTWzilBZl6BUbT	5F9YYEKDxenkRpyuovdqZe	All I Think About Now	65
6BT7qiDY4A5tOyklohjQuW	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Monkey Gone to Heaven	63
5cy5IStIn7OSHDEIgXeDyq	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Debaser	62
7oDDV1cal0M0RIjr4HuuJ9	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Gouge Away	62
16EKGMPGE3f6X3p18CjtkB	6zvul52xwTWzilBZl6BUbT	1EzLdeSngJNnzM94BHBtK2	The Thing	61
51Z2IzJvLCnZaIpBV0IYRr	6zvul52xwTWzilBZl6BUbT	0DQyTVcDhK9wm0f6RaErWO	Wave Of Mutilation	59
4lSqfVzoGBmBGnBZrSrKOJ	6zvul52xwTWzilBZl6BUbT	0BK1LxNNcaNUtAqTBQAOR8	Ana	57
39shmbIHICJ2Wxnk1fPSdz	3RGLhK1IP9jnYFH4BRFJBS	1ZH5g1RDq3GY1OvyD0w0s2	Should I Stay or Should I Go - Remastered	78
5jzma6gCzYtKB1DbEwFZKH	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	London Calling - Remastered	72
6ITuEsxEy2qPhqMowdDAeI	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	Train in Vain (Stand by Me) - Remastered	66
5dAxeuDkIkpa6wZpMOuG9i	3RGLhK1IP9jnYFH4BRFJBS	26zldGZFvob9Lj0kXZ6v7u	I Fought the Law	61
0jnFDxgNhS156vu6roUVco	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	The Guns of Brixton - Remastered	59
72boGlgSwUK01n44O2tOCv	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	Lost in the Supermarket - Remastered	59
7FYkZkF9fog6WS818wJnhl	3RGLhK1IP9jnYFH4BRFJBS	6FCzvataOZh68j8OKzOt9a	Brand New Cadillac - Remastered	56
6IMlcKjsIM3l3yXWykTa3y	3RGLhK1IP9jnYFH4BRFJBS	49kzgMsxHU5CTeb2XmFHjo	Police & Thieves - Remastered	55
2ax1vei61BzRGsEn6ckEdL	3RGLhK1IP9jnYFH4BRFJBS	1ZH5g1RDq3GY1OvyD0w0s2	Straight to Hell - Remastered	55
25z7NYgTEt6MiA5qExNSH2	2bToe6WyGvADJftreuXh2K	02j4VRhJ7MKK0Jf3FtBBsD	Never Be Another You	55
1emxi7e5EWFsJmwSKTuUDH	2bToe6WyGvADJftreuXh2K	7ElHdWPD6YbkbltJQgCiDc	Honey Dove	54
6iNHWlOLt4NuDi9iSvtznO	2bToe6WyGvADJftreuXh2K	7ElHdWPD6YbkbltJQgCiDc	Ladies	53
2axJJQBO4KbFsx0Twvb8mn	2bToe6WyGvADJftreuXh2K	6sPPhqjKQHveRVqR6Ijf8s	It Rains Love	47
5ZmpzweHaXXOa1lndt3vDj	2bToe6WyGvADJftreuXh2K	1mtrVXhx0JBuv53GqqJbiG	Wish You Were Here (Instrumental)	32
2vroaTJq214LCxTtRGzrFf	2bToe6WyGvADJftreuXh2K	2uKHclIQ4IphYCgJyKfSCe	Thinking About You	45
6eFsavqVXRlyeSnlX75pc4	2bToe6WyGvADJftreuXh2K	2uKHclIQ4IphYCgJyKfSCe	Regenerate	43
6Tn9J7LOj5CuytqzORpkrz	2bToe6WyGvADJftreuXh2K	6sPPhqjKQHveRVqR6Ijf8s	Blessed with the Best	42
2mGWmvIIvs7jKEXxyh7Wfb	2bToe6WyGvADJftreuXh2K	3u38Zm1pGlCrGZSsUk2396	All I Need	39
6gZkoHTufo7bTuMHFyppWv	2bToe6WyGvADJftreuXh2K	1mtrVXhx0JBuv53GqqJbiG	You're the Kind of Girl (Instrumental)	38
34iOH7LY3vme5rQxsVILZ4	432R46LaYsJZV2Gmc4jUV5	0u0CJa9zwFbGSU8JWQYS5G	Love Will Tear Us Apart - 2020 Remaster	69
5fbQCQt91LsVgXusFS0CCD	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	Disorder - 2007 Remaster	68
4ZuC5MfGjRQs3pZtPxqMYP	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	Shadowplay - 2007 Remaster	58
0rcLhYRihks3t4lFPtHhQV	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	She's Lost Control - 2007 Remaster	57
1Bq65xKgu0kjSUMUlfWyPl	432R46LaYsJZV2Gmc4jUV5	51BKPr5L8cGZGk9bl9Jf5L	Transmission - 2020 Digital Remaster	57
5EabbLQZbdhCqG6aK9PFLU	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	New Dawn Fades - 2007 Remaster	53
58vvxoXqQicDlUFJHfOuEs	432R46LaYsJZV2Gmc4jUV5	2KPhpTUihx9KRWRwBtpTeJ	Warsaw - 2010 Remaster	53
3iMq9V0Ece9ubjWAYVcMwj	432R46LaYsJZV2Gmc4jUV5	33qkK1brpt6t8unIpeM2Oy	Interzone - 2007 Remaster	52
7k42ztYdHyKWrKrENxwjkV	432R46LaYsJZV2Gmc4jUV5	5bXAysvuhQbyWllgYuahwt	Atmosphere - 2020 Digital Remaster	52
4lmYkAt0bgbNW2BhMXLWpa	432R46LaYsJZV2Gmc4jUV5	2KPhpTUihx9KRWRwBtpTeJ	Digital - 2010 Remaster	44
2Y3x5VcEAxLNmVHxQOE0jB	1PryMSya1JnSAlcwYawCxp	0X9oLn2APMvGOIsogM1TSp	Queens Highway	64
5nqd51nD2UACz5JQ83v878	1PryMSya1JnSAlcwYawCxp	54XBNTrXWfYgYhPbWVRLpX	There's a New Day Coming	57
1bZH8L8V2m454tdcSPEIl7	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	The Traitor	56
1xDeDsNoBNyBidVQKPnWXE	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	Home Again	52
18OzYEBhFuusiRbvkhf6Zl	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	Make the Road By Walking	50
4evkhyjgx4eLgyvujGWSTc	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	The Contender	47
5aqR0sE4AVaycHGVVjoZmx	1PryMSya1JnSAlcwYawCxp	1MY3VMNUb73QNJhZB92uGB	Lights Out	45
4EGhtRnsa6DoGImFOzVzLd	1PryMSya1JnSAlcwYawCxp	1MY3VMNUb73QNJhZB92uGB	Every Day a Dream	44
74gBEukHVsGBlEdYWiwLWK	1PryMSya1JnSAlcwYawCxp	0X9oLn2APMvGOIsogM1TSp	Midnight Morning	42
4rNOFDkStRndjL08iV8f4D	1PryMSya1JnSAlcwYawCxp	6wdxaAC6P7f6w05QadHFcB	Tired of Fighting	41
2Gzg7PlsNS1XunWQFJBVt9	1nGqKVGfPPiVgxMdx8hYOI	3a7wlGYi97AWoOBZxgjp77	Junk Food Chimney	56
0vmxiz1Zx3OP8C5CjfhIXK	1nGqKVGfPPiVgxMdx8hYOI	51BUgK2KdAD7Jtm4nIbKdO	I Love You Too	45
4nIVHPwEXljxt1D8hxEXgO	1nGqKVGfPPiVgxMdx8hYOI	17udU4Qibj6l4h0HWNd0EO	Let's Move to Vietnam	44
5yqEdgJawICKIDA5cQZBOn	1nGqKVGfPPiVgxMdx8hYOI	17udU4Qibj6l4h0HWNd0EO	Don't Just Sit Here and Drink Yourself to Death	44
5jKBxNnQEs2gOtQkyBJF2z	1nGqKVGfPPiVgxMdx8hYOI	17udU4Qibj6l4h0HWNd0EO	They Think We're Stupid	39
0Qdti49fC0gs6nhWjEWXGp	1nGqKVGfPPiVgxMdx8hYOI	3a7wlGYi97AWoOBZxgjp77	May the Road	37
0EYe1EIFXb5Ob9hgDtCj0w	1nGqKVGfPPiVgxMdx8hYOI	3a7wlGYi97AWoOBZxgjp77	Goat's Milk	36
1Qc9iyuYBNMvlooaz4GRfN	1nGqKVGfPPiVgxMdx8hYOI	51kJncbEEq7mLs3J8C2dII	his first and last sounds	36
6ixvtEJ8wDs6Rg41ttIVqa	1nGqKVGfPPiVgxMdx8hYOI	6ZsUkdYEqcFuVVfqsnPLSK	The 5-Year Binge	35
3P2q1CHk8hVmu1IXjr8Us4	1nGqKVGfPPiVgxMdx8hYOI	3a7wlGYi97AWoOBZxgjp77	Pick a Place and Read	35
0elCmyfISzkP5tAYTVuYjS	7FKTg75ADVMZgY3P9ZMRtH	7iTm9yZznLHb1GBOVm5IB1	August	63
2BedHMJWiW5CuiTd2wza1u	7FKTg75ADVMZgY3P9ZMRtH	1gu4P2JcclHD1BvDXx2pqq	Sad Disco	56
2JXiyD1zucGdFmnTeYb5Ry	7FKTg75ADVMZgY3P9ZMRtH	6uGsmECvPd2VoQI5OfnSPL	August (Acoustic)	55
2BIfG6wL1t5wk1KixoK2BV	7FKTg75ADVMZgY3P9ZMRtH	6tM8YvhhXemdO5xjsmS8Ro	Chicago	53
21lfQ6cXJF15ubyPLB6qHz	7FKTg75ADVMZgY3P9ZMRtH	6tM8YvhhXemdO5xjsmS8Ro	Vanilla	53
7r5elbHLaVama2WsDQpDp6	7FKTg75ADVMZgY3P9ZMRtH	7iTm9yZznLHb1GBOVm5IB1	Hippies	51
0cUGSqx7MfnjiVwDzpYdYo	7FKTg75ADVMZgY3P9ZMRtH	1gu4P2JcclHD1BvDXx2pqq	Whales	49
2rpbbxk3EtstH1flOZcvVd	7FKTg75ADVMZgY3P9ZMRtH	3GSahG4letshmP6jWif5rh	Churches	48
3FRJFImdfX5NSY3QH3jI4u	7FKTg75ADVMZgY3P9ZMRtH	4cZhiGqIqqqlHxWOC9r7Jp	Glistening	47
2gxYpg3ruB8p9DFWvnTHNX	7FKTg75ADVMZgY3P9ZMRtH	7iTm9yZznLHb1GBOVm5IB1	Six Below	46
4dneV7C1yDt9UtyxrQY375	7bu3H8JO7d0UbMoVzbo70s	7gPql7GFpBMOxeO80vMMsC	Boys Don't Cry - Single Version	65
263aNAQCeFSWipk896byo6	7bu3H8JO7d0UbMoVzbo70s	3x1CmNdXWU0DzpTZXFFRZu	Friday I'm in Love	68
76GlO5H5RT6g7y0gev86Nk	7bu3H8JO7d0UbMoVzbo70s	37Q22g0n9PzBLX6lNddrIa	Just like Heaven	68
7ABE6G4uQxbNtYgVrpBBPA	7bu3H8JO7d0UbMoVzbo70s	6HhpmJekzDCRu2K64ZbWqw	Close to Me - 2006 Remaster	60
07CyrZF9eVd02zzIse7tZA	7bu3H8JO7d0UbMoVzbo70s	4Uq47onfCEj5en94jpHovk	In Between Days - 2006 Remaster	60
0X5C4WjQNubRysTkHOubz3	7bu3H8JO7d0UbMoVzbo70s	6vQB3ZBxnQPP3jQcGV2qzg	Lovesong - 2010 Remaster	61
4d4oXk7O2lEhZ83ivV93li	7bu3H8JO7d0UbMoVzbo70s	6vQB3ZBxnQPP3jQcGV2qzg	Lullaby - 2010 Remaster	55
3O4TPMOgChXOerSdB5WENH	7bu3H8JO7d0UbMoVzbo70s	1T7A6Dt7KktX7pOw4I4Jzj	A Forest - 2006 Remaster	54
5rzr3lYGJiw3OXEg8imWgH	7bu3H8JO7d0UbMoVzbo70s	6fFTxlpJPGQbO3CbVz9MOS	The Lovecats	49
1tuwC1Ob5vnYZhvg3zyzJg	7bu3H8JO7d0UbMoVzbo70s	6vQB3ZBxnQPP3jQcGV2qzg	Pictures of You - 2010 Remaster	56
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
5nrmGFJ87crVoJF5xdRqwn	1SQRv42e4PjEYfPhS0Tk9E	5ktMgVAJtsv4HagfFliWpR	Waterloo Sunset	62
5e3isD5st7PGYzSJuoRSIV	1SQRv42e4PjEYfPhS0Tk9E	73anEcke1iGiFLxWhXnco8	A Well Respected Man	57
1LH9QyMF3YIqYRoVsoXihB	1SQRv42e4PjEYfPhS0Tk9E	70kpGi2o0I7NY4DfwIN2p0	Strangers - 2020 Stereo Remaster	55
6UTxpt4Fn0cRBZlki1dRFq	1SQRv42e4PjEYfPhS0Tk9E	1WprYNkzlwjeBzByXIZARq	Lola - Live at Providence Civic Center, September 1979	53
0aGkeYwsDGqtsjzOQnmVAB	1SQRv42e4PjEYfPhS0Tk9E	3sccYVndePjnjJHpfVsOoU	Supersonic Rocket Ship	51
0cTwMCvozZBj8jCq6o27nk	1SQRv42e4PjEYfPhS0Tk9E	7aKN7yS7Z9mDtPioRPmcqX	Come Dancing	51
6Zz846CtUmQGP5z4F7sccA	0oL26Dn9y761yfJgNb3vfu	7nqQxq17r4eUTqsDAdrL6v	Misery	57
6zvpLxTrTKDzdeQ9OLshpQ	0oL26Dn9y761yfJgNb3vfu	2ZwK8x38X6dRgBTZNSACVU	Let Down	54
29WtjZlOl5MbzC3lhllMNv	0oL26Dn9y761yfJgNb3vfu	3LuBghNdV7Z1WSiN53P9OI	Nineties	54
72tFZO4vGmXJvjG62rnpWI	0oL26Dn9y761yfJgNb3vfu	20k8V0vHdLxnkTaJjXGcFE	The Other Way	51
1f8G4jvkONnLMxJMx7V2Ck	0oL26Dn9y761yfJgNb3vfu	2p70Xer2HAT9Ro0qiBVHOc	Stay Out Of It	48
3NsIAWbfXNKbwC0UfvzyrK	0oL26Dn9y761yfJgNb3vfu	67DyTWAldohmwTvFvJCJpQ	East Chicago, IN	48
2C93EaiXnfll8oL9TWqQTA	0oL26Dn9y761yfJgNb3vfu	3akwfKkhkypQRsK18KURaA	Better	47
2DPTXclMay45uBj9bKEq9B	0oL26Dn9y761yfJgNb3vfu	1fOUybYJNec1lhpwWIln83	Ohio Forever	45
2qNdBOuOlZaML9ZEktD6mi	0oL26Dn9y761yfJgNb3vfu	0bwOZcIDnfGPTDN6CGkA1D	Snow in Montana	41
79MMMdYL00iwKVHBSAUkLY	4BFMTELQyWJU1SwqcXMBm3	0Z1Y5L90NjqUD351YUQWdA	I Wanna Be Your Dog - 2019 Remaster	58
00sydAz6PeOxYzwG1dRIPi	4BFMTELQyWJU1SwqcXMBm3	6mxbG8KrOTZIxlP4gzaliM	Search and Destroy - Iggy Pop Mix	52
2ukIOcbkpWR5pjDtCRHCcX	4BFMTELQyWJU1SwqcXMBm3	2jIzYmu0kYyj2NeO9p5Sx5	Louie Louie - Remastered Studio	48
3NpnrlBcEwRIgBs8tUrhyb	4BFMTELQyWJU1SwqcXMBm3	3FTcomSFg2zWSqWLRgBYpv	Down on the Street - 2005 Remaster	47
74CcP6fDBFdH8Xjo2F6Nb4	4BFMTELQyWJU1SwqcXMBm3	6vHqopioDuXtXTDoJhQZls	Gimme Danger - Bowie Mix	47
4bscUDqkO6soLEFXMr22ji	4BFMTELQyWJU1SwqcXMBm3	0Z1Y5L90NjqUD351YUQWdA	1969 - 2019 Remaster	41
6hAOC89VqirgFxREaQoGDQ	4BFMTELQyWJU1SwqcXMBm3	0Z1Y5L90NjqUD351YUQWdA	No Fun - 2019 Remaster	40
21xrImrAULwa0VT8n4BJoA	4BFMTELQyWJU1SwqcXMBm3	5qhXaVIC5BdE4a5Kq1FMZG	Dirt	39
4giZRI3pgupzawIJXLx7T9	4BFMTELQyWJU1SwqcXMBm3	5qhXaVIC5BdE4a5Kq1FMZG	Loose	39
406huHGjSj2bz0cnoeGI8j	4BFMTELQyWJU1SwqcXMBm3	5S38cTeAWT2aqlArzdWbuc	My Idea Of Fun	38
6qNuZL98ZSFOzIuG5zJrAj	0v6gOfGBclTSGu6agfXb23	2IpHSccHdJGTncaiuSKBjI	Eye Of The Tiger	42
4nVfmii8T3OKMm8zRBPCiO	0v6gOfGBclTSGu6agfXb23	5X27E81cePL9bNER4QEjmO	Don't Haunt This Place	41
0qA28TWVwPoIf8GuFO7O1V	0v6gOfGBclTSGu6agfXb23	5X27E81cePL9bNER4QEjmO	Frank, AB	37
1tErORKj41UML6EhV2g63R	0v6gOfGBclTSGu6agfXb23	0yuaRX2zpvhm3lq6cppVRI	Brother	35
4Vcs4KDTuIs1ogt2i6T2aG	0v6gOfGBclTSGu6agfXb23	0yuaRX2zpvhm3lq6cppVRI	White Lights	27
0EwnZr3b2hDTjnciMacmaA	0v6gOfGBclTSGu6agfXb23	5X27E81cePL9bNER4QEjmO	In The Summertime	35
703ov0hqV8reMGlX7dIpUv	0v6gOfGBclTSGu6agfXb23	0yuaRX2zpvhm3lq6cppVRI	Bad Luck Again	28
6NcVekIpjSmZQjj7Odk3d2	0v6gOfGBclTSGu6agfXb23	0yuaRX2zpvhm3lq6cppVRI	Alright	32
1ST1bodYfLasETDkH67ZrR	0v6gOfGBclTSGu6agfXb23	4txZYOVE0XqRYVzvcMGXdK	Tornado '87	29
3TU3qRbVu8jSv6IrfY0FoV	0v6gOfGBclTSGu6agfXb23	5X27E81cePL9bNER4QEjmO	The Ballad Of The RAA	30
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
5Z0MrFDEIDB075We9w9276	4fXkvh05wFhuH77MfD4m9o	6BN0KczNzSrfmKoQzd6lMS	Call Me	61
2eM4Ew20VXdjBhm6a6Cs9l	4fXkvh05wFhuH77MfD4m9o	2fRc3TJSXKXGFdnmcm17p2	Flow with It (You Got Me Feeling Like)	57
4lhhYqzREcts4uOOqWHjRJ	4fXkvh05wFhuH77MfD4m9o	4EN9bVE0g7gUvQlNdPrUhL	Apollo	56
1NwyJs8dFvkV5cvvehav7s	4fXkvh05wFhuH77MfD4m9o	6BN0KczNzSrfmKoQzd6lMS	Half the City	52
26icLILupXJtsQq5EtZdwn	4fXkvh05wFhuH77MfD4m9o	2fRc3TJSXKXGFdnmcm17p2	Is It Me	49
59s5vTB8LNV4tyZPp9HM3f	4fXkvh05wFhuH77MfD4m9o	4EN9bVE0g7gUvQlNdPrUhL	GotItBad	49
3ItddtEzeCE37ScY8o3Tbg	4fXkvh05wFhuH77MfD4m9o	6BN0KczNzSrfmKoQzd6lMS	Like a Mighty River	48
2rNVmfuyXAfmvZfg8O9D92	4fXkvh05wFhuH77MfD4m9o	6BN0KczNzSrfmKoQzd6lMS	Grass Is Greener	47
26Vcf2qFrnaa0pFJkGFh61	4fXkvh05wFhuH77MfD4m9o	2fRc3TJSXKXGFdnmcm17p2	Sanctify	46
2z6qRBkf6jjWUuzLA9CXO0	4fXkvh05wFhuH77MfD4m9o	36YdveJJhT49E0blTQODsS	A Change Is Gonna Come (feat. Lizzo) - Live at SXSW 2013	45
1i6N76fftMZhijOzFQ5ZtL	2x9SpqnPi8rlE9pjHBwmSC	5eqcF7pWzHgWpGdEmHgeSN	Psycho Killer - 2005 Remaster	78
6aBUnkXuCEQQHAlTokv9or	2x9SpqnPi8rlE9pjHBwmSC	4sLCQxMRfn3gAHrBNZtbTH	This Must Be the Place (Naive Melody) - 2005 Remaster	70
38Ngied9rBORlAbLYNCl4k	2x9SpqnPi8rlE9pjHBwmSC	3AQgdwMNCiN7awXch5fAaG	Once in a Lifetime - 2005 Remaster	67
2VNfJpwdEQBLyXajaa6LWT	2x9SpqnPi8rlE9pjHBwmSC	1invpprZoPxP2H3CfGgSfJ	Burning Down the House	64
5gS8whHdcpbkdz0qonQZF8	2x9SpqnPi8rlE9pjHBwmSC	7IMqoztesjFDgyeibke8Jz	Road to Nowhere	54
5JwK7v6XhG0YgqDuCgzOy8	2x9SpqnPi8rlE9pjHBwmSC	7IMqoztesjFDgyeibke8Jz	And She Was	59
7CqleiaEqHVazV19P532X9	2x9SpqnPi8rlE9pjHBwmSC	5dVZpNJraoqCo3BssinMoo	Life During Wartime - 2005 Remaster	58
1oV1tu8utgHQjLJsEK9sVl	2x9SpqnPi8rlE9pjHBwmSC	01RJdKvXyz515O37itqMIJ	Take Me to the River - 2005 Remaster	57
1Tr4K5MU5XYE44umXGDndd	2x9SpqnPi8rlE9pjHBwmSC	1JvXxLsm0PxlGH4LXzqMGq	Once in a Lifetime	55
3yO1OjqT59JyjHaQZcCYDX	2x9SpqnPi8rlE9pjHBwmSC	4sLCQxMRfn3gAHrBNZtbTH	Burning Down the House - 2005 Remaster	55
0NslHuacjxQYfUTOW3HCIV	4LG4Bs1Gadht7TCrMytQUO	5XmhHMj5LZLWo32aA6ntKE	New Slang - 2021 Remaster	69
47TQjzeG4KI0XWWb0wkbri	4LG4Bs1Gadht7TCrMytQUO	4Tm0dXi3s3aSAqng2DACHr	Australia	62
48bo7uexDvAThcRDvEB2W7	4LG4Bs1Gadht7TCrMytQUO	4ZTcGoOrNro2aCAStXEjZi	Simple Song	60
1d1Uc9yNUMvUb0RbakGDt0	4LG4Bs1Gadht7TCrMytQUO	5XmhHMj5LZLWo32aA6ntKE	Caring Is Creepy - 2021 Remaster	56
3Bz3lj6E9VFBk1Wj1hC8vw	4LG4Bs1Gadht7TCrMytQUO	4Tm0dXi3s3aSAqng2DACHr	Sleeping Lessons	55
3NPiFBw3mA9qbJfo0nhk6X	4LG4Bs1Gadht7TCrMytQUO	4Tm0dXi3s3aSAqng2DACHr	Phantom Limb	54
6Q0ah7m011fAcNTFJBjQGI	4LG4Bs1Gadht7TCrMytQUO	05APAIA6c0Qf7QtFQYZAKm	Gone for Good	54
4Omfr1OV4e0eaLcPe5JFRa	4LG4Bs1Gadht7TCrMytQUO	5XmhHMj5LZLWo32aA6ntKE	The Past and Pending - 2021 Remaster	51
6WBNQSfB047hAZ7tusGhqB	4LG4Bs1Gadht7TCrMytQUO	05APAIA6c0Qf7QtFQYZAKm	So Says I	50
4RMoPuik89bh3vHz2IUaku	4LG4Bs1Gadht7TCrMytQUO	4Tm0dXi3s3aSAqng2DACHr	Turn On Me	48
7MbVZOLSUloG4J3nH3Tnos	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Surefire	52
3o5K1YmFz9i9KluRGJusd1	1Tp7C6LzxZe9Mix6rn4zbI	62C9L1UCLOvvlu7Jb2FRRE	Rubble To Rubble	57
3C3KF3yVvF7iIsGxkmr6VB	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Take Some Time	50
3cHo4JYNEprRGPtunpABIK	1Tp7C6LzxZe9Mix6rn4zbI	02ib3HsTaZRxvPnSV3w4vC	Surefire - Piano	54
6hokBBgD7caSiEXJxPmryn	1Tp7C6LzxZe9Mix6rn4zbI	62C9L1UCLOvvlu7Jb2FRRE	Wheat	53
65LAG4XH7Oq0mZhFdPYqO4	1Tp7C6LzxZe9Mix6rn4zbI	62C9L1UCLOvvlu7Jb2FRRE	Morning Light	49
7JsrgtynTsvDBuzUJ82o89	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Head Right	40
564vp2eEPOegtvHjnkhnhs	1Tp7C6LzxZe9Mix6rn4zbI	4jPnb0rdxEawWMlO8RfzJP	Help Me Down	41
723gxwUYsB0XH2MTzYNiMB	1Tp7C6LzxZe9Mix6rn4zbI	1dSQSvPzdvdoOe8jYTrZk4	Sorrow - Acoustic	43
1uWp3OTBE1pryDJ4igGD1q	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	Get Down	58
7EDmkAQSnaGYk0ZoXbqvIM	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	God of Death	48
7k6Ia6hsrweMKk1LiObkC9	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	Good Right Now	47
43Rh4q9wWgIEETAt0F2zCu	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	Life Is Suffering	46
0epaptkWK7BHkHJheQJtZ4	7foyQbi7GKriLiv1GPVEwt	5BMjWYvNyJDfdW5Gzfyc21	Jah Werx	44
37eZez9K3jcLUha0byAI4m	7foyQbi7GKriLiv1GPVEwt	7waoPlopLlOLdZnY6PkW5S	Friends, Lovers, Ex-Lovers: Whatever	44
0Vc56o8yGFp7Sm2z62lGQA	7foyQbi7GKriLiv1GPVEwt	4zDxvE6VjZfELyXA13kLmn	Summertime	42
4FMeyMuT6Rk1B34v0AzV9q	7foyQbi7GKriLiv1GPVEwt	5BMjWYvNyJDfdW5Gzfyc21	Cosmic Cowboy	40
5n6BdIWBSpkfjZ29JP7WzK	7foyQbi7GKriLiv1GPVEwt	07Lss95oyQ0H0UP5i87G0A	If I Was	40
4mOmMccRWthpaUtjPhiQm8	7foyQbi7GKriLiv1GPVEwt	752tNJJGYbjlnFfSZBO9ju	Weather Balloons [Feat. Frances Cone]	39
7lIiKyRg4KumhJ4xf5VTFt	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	In the Night	52
6NgoSSG4H4LyMQGbHulkcm	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Hot Shot	51
2X1D6fTtA76LsJh5JxB9c8	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Big Wheel	51
0S9zKOWiIwsR9Vla8NVYJd	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Sunshine (You're Blowin' My Cool)	36
5Wl6Nt74mR9RYy7R7GOWNa	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Gonna Make Time	34
2KaRGgJ1qMsFOOWvUL7aD2	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Look Closer (Can't You See the Signs?)	27
723j4ubztPUgRKvQfflQNy	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Dear Mr. Teddy	26
2VHbTftHVMguJfRpi5lsSt	6m4tJuf67jwVSvMP34hrck	5TJvbSps6D0gy3DHqeb8FP	Another Love Like Mine	25
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
29engDqjmMr3VLqMm0c0WE	1nJvji2KIlWSseXRSlNYsC	4xwx0x7k6c5VuThz5qVqmV	Venus In Furs	55
4gsR34XSIE2fUY4odwZqym	32Ko3nL0210QAt14S3Rs4Y	4BrJEabBSw59bwSjKZl25p	Seventeen	64
0H6hMpN8zxZT3ToOelM5Cl	32Ko3nL0210QAt14S3Rs4Y	7HxeuvcM84U4sWEtOSlePG	Snow White	59
56PgQIFxAvXcEtXNYrsB0w	32Ko3nL0210QAt14S3Rs4Y	0C0Oq2jJhJ4Rs6IwgCe0Ob	I Don't Know	58
41oqThgUF4yiNz77TazXtl	32Ko3nL0210QAt14S3Rs4Y	6uR4bPGGdQHDphbyubK9zc	Now & Then	56
03rZ4jEeqvKjrqdRHPZmpp	32Ko3nL0210QAt14S3Rs4Y	0dsp6TeaD2da6UvQy4CZ2C	Change	56
4ulOJhLqbDeBFEbYVX6yjG	32Ko3nL0210QAt14S3Rs4Y	4cGpiQWYOPtHRB3mQLDWCC	Human Condition	54
2oBzsiZT8qmlovYS1FMf06	32Ko3nL0210QAt14S3Rs4Y	6a9bsIUvtXmqj6HaEOIAq3	Better Off	51
1EmUW3D8vAfp2miQJTMupc	32Ko3nL0210QAt14S3Rs4Y	7HxeuvcM84U4sWEtOSlePG	What Goes Around	48
3dJSC3yIV69Afxvme5qf5d	32Ko3nL0210QAt14S3Rs4Y	2HatDWFqyd2cFNHX7wX7Yp	Drifty	45
4UDBvtxDnUjzVu0HopFsZ8	32Ko3nL0210QAt14S3Rs4Y	5RkPNFjpGpN5KiTRpTRjzv	High Beam	43
70LcF31zb1H0PyJoS1Sx1r	4Z8W4fKeB5YxbusRsdQVPb	3gBVdu4a1MMJVMy6vwPEb8	Creep	85
10nyNJ6zNy2YVYLrcwLccB	4Z8W4fKeB5YxbusRsdQVPb	6dVIqQ8qmQ5GBnJ9shOYGE	No Surprises	81
63OQupATfueTdZMWTxW03A	4Z8W4fKeB5YxbusRsdQVPb	6dVIqQ8qmQ5GBnJ9shOYGE	Karma Police	75
2a1iMaoWQ5MnvLFBDv4qkf	4Z8W4fKeB5YxbusRsdQVPb	35UJLpClj5EDrhpNIi4DFg	High and Dry	74
0z1o5L7HJx562xZSATcIpY	4Z8W4fKeB5YxbusRsdQVPb	6dVIqQ8qmQ5GBnJ9shOYGE	Exit Music (For A Film)	72
73CKjW3vsUXRpy3NnX4H7F	4Z8W4fKeB5YxbusRsdQVPb	35UJLpClj5EDrhpNIi4DFg	Fake Plastic Trees	71
4wajJ1o7jWIg62YqpkHC7S	4Z8W4fKeB5YxbusRsdQVPb	5vkqYmiPBYLaalcmjujWxK	Weird Fishes/ Arpeggi	70
1dyTcli07c77mtQK3ahUZR	4Z8W4fKeB5YxbusRsdQVPb	35UJLpClj5EDrhpNIi4DFg	Just	70
0YJ9FWWHn9EfnN0lHwbzvV	4Z8W4fKeB5YxbusRsdQVPb	5vkqYmiPBYLaalcmjujWxK	Jigsaw Falling Into Place	69
6LgJvl0Xdtc73RJ1mmpotq	4Z8W4fKeB5YxbusRsdQVPb	6dVIqQ8qmQ5GBnJ9shOYGE	Paranoid Android	69
1ceeCjdsXB1PRoUQ5EKvZj	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	I'll Take the Long Road	41
34Yd2MzccdIpLaGEWdL4I4	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	What Have You Done	39
7MR20mD5bWffs5yNmtmvnK	4zsrUnozu6zRlVELQezaBn	57mOAqbdhcMncLg0rjaY7w	Sinner	26
6x6xL8nI9uj94pd4cUyiHB	4zsrUnozu6zRlVELQezaBn	4WlxosPPabfbXUJ1w9gpKc	You Gotta Move	19
3igY2JZg3xnyuZIEaZAE2Q	4zsrUnozu6zRlVELQezaBn	57mOAqbdhcMncLg0rjaY7w	Everybody Knows (River Song)	17
1sOaZDQR1VSJZqxkD55ZtP	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	By Your Side	17
2XdlLaMNZKmh8bqA4yK7pO	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	What More Can I Do?	17
0Kj3JOdo5iWJcOic035iNs	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	Lift My Burdens	14
7grHWewXZi12Qn941ePu4A	4zsrUnozu6zRlVELQezaBn	57mOAqbdhcMncLg0rjaY7w	Movin'	14
339AymorMFeh9GvJahQvnq	4zsrUnozu6zRlVELQezaBn	7tZbEknszSim0Ug0Zv3pxf	Am I Asking Too Much?	13
5QTxFnGygVM4jFQiBovmRo	00tVTdpEhQQw1bqdu8RCx2	6C9WzlQANeoD0GW5B41YJt	(Don't Fear) The Reaper	76
3fkPMWQ6cBNBLuFcPyMS8s	00tVTdpEhQQw1bqdu8RCx2	7v4kEpVtppoMm80m43lGzt	Burnin' for You	66
6N0AnkdDFZUetw8KAGHV7e	00tVTdpEhQQw1bqdu8RCx2	105oUsR7H8AJNELy43XF3w	Godzilla	63
60TYdVs6TWIsAJ1MPRdv59	00tVTdpEhQQw1bqdu8RCx2	6xxUsZyckaV0shjOJ0cVpf	Then Came the Last Days of May	61
0M7oqERflkrJVHD3IAZqxo	00tVTdpEhQQw1bqdu8RCx2	6xxUsZyckaV0shjOJ0cVpf	Cities On Flame with Rock and Roll	53
3G3PQdcOUZTCgvhvfNGfbv	00tVTdpEhQQw1bqdu8RCx2	0QWjK3wGoCug92yQIeBdxu	(Don't Fear) The Reaper - Single Version	52
1bPUK3zBMK73QXmCLzqffn	00tVTdpEhQQw1bqdu8RCx2	7v4kEpVtppoMm80m43lGzt	Veteran of the Psychic Wars	49
2g02rt0UFudctbAnmJsm22	00tVTdpEhQQw1bqdu8RCx2	0cs4Eli5HS6BomzJ9yfrAw	Astronomy	47
7gzbnBiHnGBpruEIWTSh1X	00tVTdpEhQQw1bqdu8RCx2	35RIka08weHJaKXqn4ZEHI	Burning for You - Remastered	46
6zdMlZyo0XyRNclXyQvVAl	00tVTdpEhQQw1bqdu8RCx2	7jQs5baTMHitYnJJX6JJMU	Take Me Away	43
6G7MHIvSDR3ehXPkuDFAlM	0vqkz1b2qBkoYrGMj2CUWq	1Kw0H84LL5YuP37Kh8lbzY	California Dreamin'	65
2zyTP97uGsIc1C4KNNEkyn	0vqkz1b2qBkoYrGMj2CUWq	7eVKCG0KD8FCvIlx8E1pBG	Across 110th Street	60
2qhR4aymUGDfacDT6pzWf7	0vqkz1b2qBkoYrGMj2CUWq	1Kw0H84LL5YuP37Kh8lbzY	Fly Me To The Moon (In Other Words)	58
6BSHpKBd2pc3A9WQfRWzyM	0vqkz1b2qBkoYrGMj2CUWq	3b4FRQBIqULkm6vudUXkcS	If You Think You're Lonely Now	53
0cD5w3qEDDNtoi30sP6LaA	0vqkz1b2qBkoYrGMj2CUWq	1Kw0H84LL5YuP37Kh8lbzY	I'm A Midnight Mover	49
3vzFv7gTQq6CXzY4uO9JJN	0vqkz1b2qBkoYrGMj2CUWq	6szJ4kcqwQvLfXN5IqV9T4	Woman's Gotta Have It	40
5R6QKzF87itE05T7Ht3G2x	0vqkz1b2qBkoYrGMj2CUWq	1Kw0H84LL5YuP37Kh8lbzY	Baby! You Oughta Think It Over	46
3TPjX6hEANO8qGrxYtabkh	0vqkz1b2qBkoYrGMj2CUWq	5RavdrN0me6xkp4okXQWNI	Dayglo Reflection - Orchestral Version	44
01wi82GHedsBUjSKf2hJQ0	0vqkz1b2qBkoYrGMj2CUWq	1d0vqL31qzWAWB8cxyfvuP	Dayglo Reflection	41
48TcYDiPXXsOmoqwnl522G	0vqkz1b2qBkoYrGMj2CUWq	6aBN9OWwAcB49LWlI95ekd	Daylight	40
0MHXrqn909p0LRTPsNsGEi	2AV6XDIs32ofIJhkkDevjm	2EwoYRFQRJqw7BTVG6GlTw	Move on Up - Single Edit	69
01gDLZsi0j5fWC28FLPNO8	2AV6XDIs32ofIJhkkDevjm	3tgJmEz0R0ZsRSrpwafp4R	Move on Up - Extended Version	61
7zrPswSV1yxrill5OyCuaU	2AV6XDIs32ofIJhkkDevjm	5QuvlU7nCUZZJauMvhlWR4	Pusherman	54
4XsH9zBWPOCdXoH9ZDdS8r	2AV6XDIs32ofIJhkkDevjm	5ljIGCRRvS48V4ADzPGav2	Superfly	53
1Mq4vRRox3bcruJA75M4D9	2AV6XDIs32ofIJhkkDevjm	3tgJmEz0R0ZsRSrpwafp4R	The Makings of You	48
0zBNc7XcWXNHxeszwFsKiL	2AV6XDIs32ofIJhkkDevjm	4M8Zce860gRCdyv1hXOK32	Here but I'm Gone	47
2ouFIPC3O1HNBcVTw1d9AN	2AV6XDIs32ofIJhkkDevjm	5QuvlU7nCUZZJauMvhlWR4	Freddie's Dead	45
7gmB6hVMsv0XbjfiTgpATI	2AV6XDIs32ofIJhkkDevjm	3Jm5rknuSOa0tTFDLpJbCg	So in Love	45
5wdlG60d0WHoo8P3QzrlbG	2AV6XDIs32ofIJhkkDevjm	3tgJmEz0R0ZsRSrpwafp4R	(Don't Worry) If There Is a Hell Below, We're All Going to Go	42
4xWggCcJgtUWw1yxJAXZR9	2AV6XDIs32ofIJhkkDevjm	7tIqCuFn9DqkHE1lRj9C6L	Keep on Keeping On	40
1CS7Sd1u5tWkstBhpssyjP	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Take Me to Church	75
46nvQpUDsxpS08UTFOeKTA	0xRXCcSX89eobfrshSVdyu	27rVuwJ0g0eKRpnvEhQl3G	Tell It To My Heart	74
57V4uc2b2diZ4RPHXWecb9	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Like Real People Do	70
1yTTMcUhL7rtz08Dsgb7Qb	6WY7D3jk8zTrHtmkqqo5GI	6HzebUNgGlzC1AMBwHGIkH	The Bones - with Hozier	69
3JtVtwLYCy9WXcHLQyzRnl	2FXC3k01G6Gw61bmprjgqS	5aO7IZl8KxtyCeke37Jvk4	Swan Upon Leda	69
37zuIvk4KBkAxxLJsxJaHq	2FXC3k01G6Gw61bmprjgqS	2c7gFThUYyo2t6ogAgIYNw	Would That I	68
2DNXgvkyv35vTWvdgjs7qn	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Someone New	67
5Apvsk0suoivI1H8CmBglv	2FXC3k01G6Gw61bmprjgqS	2c7gFThUYyo2t6ogAgIYNw	Almost (Sweet Music)	67
1C042FLYy7rP3MfnkOcnha	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Cherry Wine - Live	67
5TgEJ62DOzBpGxZ7WRsrqb	2FXC3k01G6Gw61bmprjgqS	4Pv7m8D82A1Xun7xNCKZjJ	Work Song	66
2uXkW8uJcOIhlbUatEPLPs	2g3PKH7Z1Ofn5oGR6oDjLy	4vqaqoTEbNyeeSHJA6KpdM	Have Love Will Travel	55
6ae38qMdEC86XRa2LaOguu	2g3PKH7Z1Ofn5oGR6oDjLy	3FeFoMQnGxb8D9FKkCC5ES	Shot Down	43
6u7UrwiZERRglVNSpgmxNf	2g3PKH7Z1Ofn5oGR6oDjLy	4vqaqoTEbNyeeSHJA6KpdM	Strychnine	43
77DvhwGhnmfrXWwiJzeIMC	2g3PKH7Z1Ofn5oGR6oDjLy	5joOZaTA1gkFmw0eLM8ASR	Psycho	42
18k49mXvNPtKlcT6Ky39pe	2g3PKH7Z1Ofn5oGR6oDjLy	2EmUijeHFyILSHUC2kzxXv	The Witch	42
5IY9xXJ6E1o6IiCc8ykDro	2g3PKH7Z1Ofn5oGR6oDjLy	4vqaqoTEbNyeeSHJA6KpdM	The Witch	34
5chnuVLLyZgfVAHgWPwvTv	2g3PKH7Z1Ofn5oGR6oDjLy	2P1FIwA6kUTaacKrKoKl1o	I Don't Need No Doctor	31
6qBYciZgi7JqSoNf8g7NpY	2g3PKH7Z1Ofn5oGR6oDjLy	4vqaqoTEbNyeeSHJA6KpdM	Money	30
3bbZNvBuGRVElpRLENwa3J	2g3PKH7Z1Ofn5oGR6oDjLy	4vqaqoTEbNyeeSHJA6KpdM	Psycho	29
1pPGQdGD3gXLZm2Y1DgiHo	2g3PKH7Z1Ofn5oGR6oDjLy	4vqaqoTEbNyeeSHJA6KpdM	Walkin' the Dog	28
7CUkeiG7QtB7tPU9f8SANS	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	hand crushed by a mallet	61
734xplxSpoW22U5OeeZcr8	68kEuyFKyqrdQQLLsmiatm	4Csoz10NhNJOrCTUoPBdUD	Señorita	44
65ENznU4hwrR04whyJboxr	5vSQUyT33qxr1xAX2Tkf3A	7Amrg2WughWQXMEmUfjhl3	All Nite (feat. Vince Staples)	41
0fIffclhgJC5h8AdMMVvkp	0eDvMgVFoNV3TpwtrVCoTj	6d1vGZsr6Uy3h9IigBpPAf	Welcome To The Party	71
4rc2WNOt2w8BHfQjBC8PO0	6guC9FqvlVboSKTI77NG2k	75Z98z7kl42oWcT0UvtO6e	We Own The Night	63
2XU0oxnq2qxCpomAAuJY8K	2NjfBq1NflQcKSeiDooVjY	0UywfDKYlyiu1b38DRrzYD	Dance Monkey	77
61bwFjzXGG1x2aZsANdLyl	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	money machine	64
0nbXyq5TXYPCO7pr3N8S4I	757aE44tKEUQEqRuT6GnEB	52u4anZbHd6UInnmHRFzba	The Box	80
4jM6Tl8062cc9gTJgTZTpx	6XyY86QOPPrYVGvF9ch6wz	0kJJubTbpBWH9dwHmRl4qR	One Step Closer - 100 gecs Reanimation	49
2SY8qCm2nwl2JK3BBOhBrl	422qjlzkDtxmaeeOLhnE6A	2LlKseD9In6F377qHat4uZ	HOLE	21
7aiClxsDWFRQ0Kzk5KI5ku	2cFrymmkijnjDg9SS92EPM	37CqAwxTungNxKpIK5vSgE	hot girl bummer	5
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
4EFy48vEJNG3xQf5Er4scn	3PfyosblIBaNJNH88MUkgM	7jBYJQJTLhKJVADOtpN2q0	Drifting	40
6ORqU0bHbVCRjXm9AjyHyZ	7oPftvlwr6VrsViSDV7fJY	3x2uer6Xh0d5rF8toWpRDA	Good Riddance (Time of Your Life)	76
2fwz9mBaELJCzXuEEEe35Y	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	745 sticky	47
22VdIZQfgXJea34mQxlt81	1Xyo4u8uXC1ZmMpatF05PJ	0P3oVJBFOv3TDXlYRhGL7s	Can't Feel My Face	81
0yhGTljYYHyP7phuxoKWiJ	738wLrAtLtCtFOLvQBXOXp	6Ax8Neb7dEif3KUlJwj2P8	Get Free	54
2QbGvQssb0VLLS4x5NOmyJ	6fxyWrfmjcbj5d12gXeiNV	6PkSBdx19zarn4ae1D08gA	RICKY	63
7vaFuClNKe02pjKYbXEJ46	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	xXXi_wud_nvrstøp_ÜXXx	48
6L89mwZXSOwYl76YXfX13s	7oPftvlwr6VrsViSDV7fJY	4uG8q3GPuWHQlRbswMIRS6	Basket Case	80
1G6CIweqjfKzFyEfTH4V3u	6kDMoHTcBICPILP2aclPWZ	0XJiBmyMDELqCXwZUaG3Rf	She Spider	21
0z5oHDjD9vMsck14zoAQOc	21dooacK2WGBB5amYvKyfM	1pPpRk6AF8EL19sgm2MkSD	What I Please (feat. Denzel Curry)	52
0KV4Ax6L10oSTWqC8607K4	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	São Bento Grande	21
6myUpr3GDR80Dg3zqNTmmG	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Another Day	59
1xzUQMiCoY5pdego0pHMeV	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	She Knows This	58
3ImnbJHoSy5uUhC0ydBVI9	1r59KUMNZRw0M8FDnrHq0o	6YnEvQjRcWyAAxm7dXNEfs	Come Check This	59
5V5BHmvpylV0nSc2Yu2Mu4	0dlDsD7y6ccmDm8tuWCU6F	41kOXEHM7PivRjZj4WX2Dl	All Alone	74
40mjsnRjCpycdUw3xhS20g	7A8S43ryYdbWpJKeHRZRcq	1Sf8GsXG32t0jNrX11xqWx	GATTI	75
4nuAslShoN77tq12fzwjUq	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Sad People	63
6LyAwkJsHlW7RQ8S1cYAtM	0iEtIxbK0KxaSlF7G42ZOp	3IO8IPjwXuzPJnoaqkwYrj	Overdue (with Travis Scott)	75
4IIuCotvqijraSdnVLaFnM	0fA0VVWsXO9YnASrzqfmYu	64nbgEEIcY4g1ElVLONJ0w	Beautiful Trip	49
6gBFPUFcJLzWGx4lenP6h2	0Y5tJX1MQlPlqiwlOH1tJY	42WVQWuf1teDysXiOupIZt	goosebumps	83
3mRlFZHUyvJbPTlkzg4LyJ	0H39MdGGX6dbnnQPt6NQkZ	6SInUyQqx0RZaVTSEioHkD	Roses	61
5B3b5qszWCl22HlzitMh7x	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Seu Tempo	18
1tX1GK4bLfoS9oDIIbhYAv	5m9PQtVJ9ZZVWgb3t2nTMN	4kN9CRrkFvXfiadphIZhwX	Keep Riding Me	54
4xSY7Pxe3bveG1WOIIcYdr	4RKYu5o9e1MSd5eq3SYr9I	4STLPZr5CqrG9yHUvXP665	4loko	39
2cYqizR4lgvp4Qu6IQ3qGN	0Y5tJX1MQlPlqiwlOH1tJY	41GuZcammIkupMPKH2OJ6I	BUTTERFLY EFFECT	78
46M2hXnaQpueG7vSvgVtVH	0dlDsD7y6ccmDm8tuWCU6F	4KvTJJPmcAd1XJaO3UrARG	GTG	76
6AomCkEOQUODCYzQwH4SWC	5dHt1vcEm9qb8fCyLcB3HL	6bI4IQKBcLX0KsTjQ9NR97	Floor Seats	61
2p23H2gdnWEiGUEymqarpJ	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Jura de Vingança - Ao Vivo	26
24jP9hAAauSG4IH5zGji8a	0H39MdGGX6dbnnQPt6NQkZ	3FmLXejluSVOx2Gm8waHFs	Roses	27
3eekarcy7kvN4yt5ZFzltW	0Y5tJX1MQlPlqiwlOH1tJY	2uDTi1PlpSpvAv7IRAoAEU	HIGHEST IN THE ROOM	82
1ZM8toCOlnfBKJdvR8GqUq	0ONHkAv9pCAFxb0zJwDNTy	6o38CdD7CUlZDCFhjZYLDH	Rock N Roll (feat. Kanye West & Kid Cudi)	63
14eDzYfNRuqs1kf7zfIFJW	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	E Mirê Mirê - Ao Vivo	25
1dQtt3K8GyPmH7ZD1LJ2ox	7kA4sEagpoNK91I7wr9tYr	2HFagfqzSWiinz9jqcj4Q2	Hit List	43
1fewSx2d5KIZ04wsooEBOz	0iEtIxbK0KxaSlF7G42ZOp	3IO8IPjwXuzPJnoaqkwYrj	Space Cadet (feat. Gunna)	80
2Guz1b911CbpG8L92cnglI	1SImpQO0GbjRgvlwCcCtFo	6TyPSzd5rA2rQ9yLJJ1Gg2	Your Guardian Angel	65
4gmmRb6bZJffOOiww1JGTO	1URnnhqYAYcrqrcwql10ft	4I3EcXD4e3KcEoDJfFEZ5b	No Heart	73
7sO5G9EABYOXQKNPNiE9NR	4DdkRBBYG6Yk9Ka8tdJ9BW	0MV1yCXcNNQBfwApqAVkH0	Ric Flair Drip (with Metro Boomin)	82
2MLuFz9Y3Vg3PF0Yf93M5c	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	800 db cloud	50
1x5ihkusmVWsQWtvSCtW9q	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	O Que é Ser Bom	15
0XLQyCwYu8dhhzWAKSs3wr	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	Paranauê / Corridos Regional	18
1tzTiTLSRisnQiOnhgAdtF	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Lembranca do Mestre	14
1wAdcYWWPbcqiUcum9brWw	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Luta e Dança	7
2dy2C0StZ3yiEeb0Aoolcn	5CCwRZC6euC8Odo6y9X8jr	4xeVBTBwaVNQhUdIRC4G9s	Bang Bang	53
3WKrSWltDbNcY5M3haaFxQ	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Pedir o Axe Ii	9
1vvBUZseJ7fwYPX1NedOLd	0dlDsD7y6ccmDm8tuWCU6F	2SUBknzxng0iqBpKT9vzns	Cha Cha	71
4FeBA1bxkUae1aDsplsmrv	6PfSUFtkMVoDkx4MQkzOi3	0qnExDZfz0kVeBjixPsyjS	gec 2 Ü (Remix) [feat. Dorian Electra]	37
5SWnsxjhdcEDc7LJjq9UHk	1URnnhqYAYcrqrcwql10ft	6wTyGUWGCilBFZ837k5aRi	Runnin	79
643PW82aBMUa1FiWi5VQY7	13ubrt8QOOCPljQ2FL1Kca	3zOkSAbg9o7gQ3yXtZhx5v	Babushka Boi	66
23Dapn8107GgxvXDIsPwWm	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	stupid horse	56
2Tdkz4mLxN8szqcMeNWcI8	6PfSUFtkMVoDkx4MQkzOi3	3zy8FiB9URB4b2yNOwMM36	mememe	55
3VHiIVQe8Sc6gtSsTp3pDz	6PfSUFtkMVoDkx4MQkzOi3	2uhB1KivbFnlkARpbd0Cvu	ringtone	52
2WzWwYoxWIqyjzIaazsqYV	6PfSUFtkMVoDkx4MQkzOi3	1LWmE7Dy299uuwFo8wcOPC	Doritos & Fritos	50
2T93MtJuKMzcGRTR8fdizV	6PfSUFtkMVoDkx4MQkzOi3	0qnExDZfz0kVeBjixPsyjS	ringtone (Remix) [feat. Charli XCX, Rico Nasty, Kero Kero Bonito]	50
5Mm2CJzNRiICC5MWRWQnBo	6PfSUFtkMVoDkx4MQkzOi3	0qnExDZfz0kVeBjixPsyjS	hand crushed by a mallet (Remix) [feat. Fall Out Boy, Craig Owens, Nicole Dollanganger]	49
0O6u0VJ46W86TxN9wgyqDj	246dkjvS1zLTtiykXe5h60	3HHNR44YbP7XogMVwzbodx	I Like You (A Happier Song) (with Doja Cat)	89
21jGcNKet2qwijlDFuPiPb	246dkjvS1zLTtiykXe5h60	4g1ZRSobMefqF6nelkgibi	Circles	85
0e7ipj03S05BNilyu5bRzt	246dkjvS1zLTtiykXe5h60	6trNtQUgC8cgbWcqoMYkOR	rockstar (feat. 21 Savage)	84
0RiRZpuVRbi7oqRdSMwhQY	246dkjvS1zLTtiykXe5h60	4g1ZRSobMefqF6nelkgibi	Sunflower - Spider-Man: Into the Spider-Verse	80
3a1lNhkSLSkpJE4MSHpDu9	246dkjvS1zLTtiykXe5h60	5s0rmjP8XOPhP6HhqOhuyC	Congratulations	81
7xQAfvXzm3AkraOtGPWIZg	246dkjvS1zLTtiykXe5h60	4g1ZRSobMefqF6nelkgibi	Wow.	81
7dt6x5M1jzdTEt8oCbisTK	246dkjvS1zLTtiykXe5h60	6trNtQUgC8cgbWcqoMYkOR	Better Now	80
0t3ZvGKlmYmVsDzBJAXK8C	246dkjvS1zLTtiykXe5h60	4g1ZRSobMefqF6nelkgibi	Goodbyes (feat. Young Thug)	79
75ZvA4QfFiZvzhj2xkaWAh	246dkjvS1zLTtiykXe5h60	5s0rmjP8XOPhP6HhqOhuyC	I Fall Apart	79
1nltpRhEiXikwDlVn4UADk	246dkjvS1zLTtiykXe5h60	3HHNR44YbP7XogMVwzbodx	One Right Now (with The Weeknd)	73
3Z7CaxQkqbIs1rewKi6v4W	2o5jDhtHVPhrJdv3cEQ99Z	6R7Yy0sY9N8PNUhseegr2Q	Hot In It	82
6Dy1jexKYriXAVG6evyUTJ	6DgP9otnZw5z6daOntINxp	5wJb3DBSoSMKYJA8TrNKi8	OUT OUT (feat. Charli XCX & Saweetie)	79
11M8c9SHQYpd8DOrmcu25k	25uiPmTg16RbhZWAqwLBy5	1QqipMXWzJhr6yfcNKTp8B	Beg For You (feat. Rina Sawayama)	64
2grSOc6HNTXQQXNoRKt9UM	25uiPmTg16RbhZWAqwLBy5	1QqipMXWzJhr6yfcNKTp8B	Good Ones	66
5dry5tz8yLcLuOJ3l6ZEQd	25uiPmTg16RbhZWAqwLBy5	1QqipMXWzJhr6yfcNKTp8B	Used To Know Me	66
5cYEuFqzITZlZzpoR1sHvu	25uiPmTg16RbhZWAqwLBy5	1QqipMXWzJhr6yfcNKTp8B	Yuck	65
0FZUbqZ1x2G71vl027d8Ud	25uiPmTg16RbhZWAqwLBy5	5A0U5x6tAfyQaG5lnOL0fA	Hot Girl (Bodies Bodies Bodies)	63
5hyq3LBlCfjRQAFkdQwe8o	25uiPmTg16RbhZWAqwLBy5	261QvR3MgGdyL2HyYIlgfd	Vroom Vroom	63
3qGHAKgjQruzj6doKkyEb5	25uiPmTg16RbhZWAqwLBy5	2HIwUmdxEl7SeWa1ndH5wC	Unlock it (Lock It) - feat. Kim Petras and Jay Park	62
0TejbZNnypwBQDwkUPjPrT	2o5jDhtHVPhrJdv3cEQ99Z	4KjlM0sPFZS7TmcgYw7pD4	Hot In It - Tiësto’s Hotter Mix	62
3AydAydLzyyZutA0375XIz	5BvJzeQpmsdsFp4HGUYUEx	7n8NJkGKAl2np1bXiRn0CY	A-Punk	67
0G88ZH0qqBCBbtrHnEDqrn	7HGNYPmbDrMkylWqeFCOIQ	49cBF5iGpJ7nx6EAR8BLga	Triste Bahia	19
7lzfMZak2HjNPXXSxksjPB	3qZ2n5keOAat1SoF6bHwmb	1SYy6QlPiObmtHW2PqpZWu	Camarão Que Dorme a Onda Leva	62
02a8cGumnKuEPgoCzmalJp	7HGNYPmbDrMkylWqeFCOIQ	4HCs1WxdaCTb8S1TlgUG9C	Sozinho - Ao Vivo	63
1Hn0iEB1FPfJzJPK49qVtH	7HGNYPmbDrMkylWqeFCOIQ	49cBF5iGpJ7nx6EAR8BLga	Mora Na Filosofia	20
6giaOyDFbE4J8iclhCdW7E	09U6hmCerKcIJrixubiBjm	3716y3qiVChUSJv24nvCUB	Poesia Acústica 11: Nada Mudou	69
044fQ35cLbMVwta0KyN5dM	7HGNYPmbDrMkylWqeFCOIQ	1EggMJbrddGeSyNjDzDRMI	Samba E Amor	41
2BvDFQOl4JieEGK2cgKOey	7oEkUINVIj1Nr3Wnj8tzqr	3eXCgCBM4BS6H83xmxKdL6	Andar com fé	60
3QKJELWORZZ7rUZDWeMWSA	5rX2c1zow6hCph8PnnU3kF	6haDxdERWK3rdVCGc2jr8E	Água de Beber	62
3zcBNmJH6ToRCI0WNEIuES	7oEkUINVIj1Nr3Wnj8tzqr	5tPEQtkCVKj17B9RlxDIKC	Esperando na janela	58
50c0knPGjaJAuE4hRg28Qq	1b8kpp4DUwt1hWaxTiWQhD	5NnAoeNFYhB4ypfoEX8e6H	Quando Você Olha Pra Ela	59
5JuWx9sV8TbtIMhiiPVbnz	7HGNYPmbDrMkylWqeFCOIQ	1EggMJbrddGeSyNjDzDRMI	Qualquer Coisa	46
5YctcwZCRMxlIHDpTuqKOE	1b8kpp4DUwt1hWaxTiWQhD	5Tk4wmf1IgEPPq36yD4G7Z	Baby - Ao Vivo	61
6Sm4XdGI7GhHG7sjVcVrI2	1AldSIJ8ANuZVbjKIhpKKq	6FdbVYfwhJjaUOzYB7J9Uj	Capoeira Não Pode Parar	13
6sKopGG4r21ObTE8V6pD6x	1b8kpp4DUwt1hWaxTiWQhD	1Vjf7xPNvBhqKnAR4rAXR2	Força Estranha	60
78I8jaChZbPu72bIGGPMKk	1b8kpp4DUwt1hWaxTiWQhD	4jY3KTb8z9OZiIM92pTuNe	Lágrimas Negras	57
5Ikos3uiBfPYAf7EZfz8t3	2FW6Zt8gyIF7Fb7O3TGxnE	1wG4O32OX2POpj77Cstqk7	Sonho Meu	60
2wL88cvKXUOfHuYVd62hji	7oEkUINVIj1Nr3Wnj8tzqr	3qoUU8sm4eBT5POFHQSl5L	Palco	53
43HM6P2yX7ls3q92qrkhL4	1AldSIJ8ANuZVbjKIhpKKq	3TCEm1O6JANZ1H55BPZ48L	Pimenta	3
1O5pf5R8xvppS2pD03HVy5	0Mz5XE0kb1GBnbLQm2VbcO	5gK2l2LgWY0BA4p9uy27z6	May-December	39
20I1Mickm2w7qGxk7uzOKr	0av074qUwLn5eyzwqoq3xh	7gkngZkZ51RJBzWUkU8uZ4	Graffiti on a High School Wall	40
465hVdgg75kPgRdpJfEFFT	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Seven	57
4mn5HdatHKN7iFGDes9G8i	2PmIyxmEFsNfQJjEifPDZC	1VGVJdmvOSRK2w9RKXk18A	Who's Ready for Tomorrow	76
7cEfPAbju7glmdAgT4e1AU	7HGNYPmbDrMkylWqeFCOIQ	64JvR5shy7j04mTiX0wfNp	Cajuína - Remixed Original Album	55
0JL9TZip7mL7iwC5EOkALS	3Rq3YOF9YG9YfCWD4D56RZ	5FrjDW96mCYw9ECc74c637	Lady Brown (feat. Cise Starr from CYNE)	58
0Nkp56EKreoWMYxpXJqUNZ	23cC3RI0hgD5sWmXKPAJuG	1uGIwfw9F1lR7TDDukbNyQ	Wandering Ways	53
0ZQfn5nh2TnVE6Q0AT8eXr	1xHQO9GJIW9OXHxGBISYc5	2QTg7XF8hHMHexJLCKsqdA	Down	58
0eEXcw3JLVXcRxYrVYMy68	09hVIj6vWgoCDtT03h8ZCa	3FAK4h4t9uV4JxzESXllAU	Electric Relaxation	67
126HWk9JuCt4PHZJAAsgOv	1MBqzcu6aiY7GzP5BfG56T	3cM2sVPdaob0zL1rbrMyG2	Thé à la menthe (The Lazer Dance Version) [Instrumental]	48
1IkE3IsuP4HNU073wsE6T5	1WxunfiOh9Ws0uu2JoDmjL	7yjltYU5q9KQKZLfI2JZEY	Água de Beber	56
1MPmF4py7FxbeqFGpKn09C	4hz8tIajF2INpgM0qzPJz2	6mpcR3BhEw39pZGVMCKS5e	All's Well That Ends - Live from Athens Georgia	31
1XjFyPzU5z3zbYJQETYGiZ	5JYtpnUKxAzXfHEYpOeeit	3xWp6y0HGsHZlXljNs7VRy	Balança Pema	58
1brWhQEoBoT9tMnNfcRsjr	1gIa65d5ICT2xVWiUJ3u27	2jOgajtpXNsinBpwg2dUjH	A felicidade	44
29Lq5UKpHBGxQTDxsPKwFz	1gIa65d5ICT2xVWiUJ3u27	4g9eq1iulwITLm6N0xttpW	Augusta, Angélica e Consolação	43
2VBN5kSs1fyiE5fnOYeKsG	7HGNYPmbDrMkylWqeFCOIQ	2cgr7ZBd3X3gs99433bgES	Sampa	55
2YXpMdEMEoy48OPr6VTzpI	1gIa65d5ICT2xVWiUJ3u27	2jOgajtpXNsinBpwg2dUjH	Tô	47
2dCBXxXNur85q9gGIpsAdr	1gIa65d5ICT2xVWiUJ3u27	4g9eq1iulwITLm6N0xttpW	Happy End	45
5nujrmhLynf4yMoMtj8AQF	6M2wZ9GZgrQXHCFfjv46we	5lKlFlReHOLShQKyRv6AL9	Levitating (feat. DaBaby)	84
7ytR5pFWmSjzHJIeQkgog4	4r63FhuTkUYltbVAg5TQnk	623PL2MBg50Br5dLXC9E9e	ROCKSTAR (feat. Roddy Ricch)	79
5MPPttjfGap2C6j6eKcO6J	6i392l38cR3uBPF0DbNs7S	59zpaLOByFkJhc9D5Xqna9	Baby (Lil Baby feat. DaBaby)	76
6Ozh9Ok6h4Oi1wUSLtBseN	4r63FhuTkUYltbVAg5TQnk	1NsTSXjVNE7XmZ8PmyW0wl	BOP	75
0cu0rhnlCnJ7JIeHRiLpj3	4r63FhuTkUYltbVAg5TQnk	6N9oICOUm4QT2YpWdKwUlu	Ball If I Want To	72
6r9xnueU24r4eoG3HXC87E	4r63FhuTkUYltbVAg5TQnk	1X4W9ApaYSS9ZsmUhIVDD3	Bestie	71
2gwkD6igEhQbDQegRCcdoB	4r63FhuTkUYltbVAg5TQnk	0O1PJ0t69iTO5yWrIeIga0	Suge	71
1YDebgap5OFwXEBG18NJvy	4r63FhuTkUYltbVAg5TQnk	2u1Wc12FWm7X2ueUHCHxJC	Red Light Green Light	70
26UxwWl9xCb83OynXELJcL	4r63FhuTkUYltbVAg5TQnk	6kaYDcX9dNmJE5OU71IUby	Masterpiece	70
0fySG6A6qLE8IvDpayb5bM	4r63FhuTkUYltbVAg5TQnk	1NsTSXjVNE7XmZ8PmyW0wl	VIBEZ	69
2tznHmp70DxMyr2XhWLOW0	26T3LtbuGT1Fu9m0eRq5X3	4EK8gtQfdVsmDTji7gBFlz	Cigarette Daydreams	77
3Pzh926pXggbMe2ZpXyMV7	26T3LtbuGT1Fu9m0eRq5X3	7H814Cg8HV0qpoMheYbhNn	Ain't No Rest for the Wicked	74
4sebUbjqbcgDSwG6PbSGI0	26T3LtbuGT1Fu9m0eRq5X3	4EK8gtQfdVsmDTji7gBFlz	Come a Little Closer	73
5n0CTysih20NYdT2S0Wpe8	26T3LtbuGT1Fu9m0eRq5X3	0nW0w37lrQ87k7PLZvC4qJ	Trouble	71
1Q3t9fWvHUXKsMmpD2XpUu	26T3LtbuGT1Fu9m0eRq5X3	0nW0w37lrQ87k7PLZvC4qJ	Cold Cold Cold	68
1KuVdyg8d6NlRhbpHxg5UF	26T3LtbuGT1Fu9m0eRq5X3	2VuZJsJBPLwg9BeQFQle8G	Social Cues	65
0tkBOcK7oRVXQJY97zzSvr	26T3LtbuGT1Fu9m0eRq5X3	4EK8gtQfdVsmDTji7gBFlz	Telescope	64
4Y6GIje3GErVRIq1Ff5BJq	26T3LtbuGT1Fu9m0eRq5X3	2VuZJsJBPLwg9BeQFQle8G	Black Madonna	63
4dpEYOPcmHNfvERbiajp3G	26T3LtbuGT1Fu9m0eRq5X3	0nW0w37lrQ87k7PLZvC4qJ	Sweetie Little Jean	62
5r5Lj2MkgwQJz6TaBdL865	26T3LtbuGT1Fu9m0eRq5X3	4EK8gtQfdVsmDTji7gBFlz	Spiderhead	62
6QgjcU0zLnzq5OrUoSZ3OK	4kI8Ie27vjvonwaB2ePh8T	4VzzEviJGYUtAeSsJlI9QB	Feel It Still	76
60eOMEt3WNVX1m1jmApmnX	4kI8Ie27vjvonwaB2ePh8T	4VzzEviJGYUtAeSsJlI9QB	Live in the Moment	61
4SNtyKNyYJ8ERT7YLlnFBr	4kI8Ie27vjvonwaB2ePh8T	4VzzEviJGYUtAeSsJlI9QB	So Young	60
0ePX6rVjeql7Bt1KurTbAG	4kI8Ie27vjvonwaB2ePh8T	6S5j1iJ4B4jknYDr4xOXcA	What, Me Worry?	58
7iOyMOxdOULvXqUqC26spJ	4kI8Ie27vjvonwaB2ePh8T	6VoOCCv0bXPrTHDncJyIgF	Modern Jesus	56
0WTq8iUzSlGDAbowEdRKKD	4kI8Ie27vjvonwaB2ePh8T	72uoxpSaDs7keunx3LbvrX	People Say	55
4WMuY659P2MKnoW40oGXe8	4kI8Ie27vjvonwaB2ePh8T	6VoOCCv0bXPrTHDncJyIgF	Purple Yellow Red and Blue	54
384TqRlwlMfeUAODhXfF3O	4kI8Ie27vjvonwaB2ePh8T	4VzzEviJGYUtAeSsJlI9QB	Tidal Wave	52
0595RikX32pk1tk7cO7K7H	4kI8Ie27vjvonwaB2ePh8T	6wK4nx3a3x32QVfFohfjl1	Feel It Still - Ofenbach Remix	41
43QhrhgRrH9NWy6eoUro4X	4kI8Ie27vjvonwaB2ePh8T	6VoOCCv0bXPrTHDncJyIgF	Atomic Man	50
6fTgbkBiMITtHUmik95ClX	24XtlMhEMNdi822vi0MhY1	3t5ZnNa4NdyldNHZcFhETb	MakeDamnSure	69
6OyKBwLzq4h15XmxeWf5n4	24XtlMhEMNdi822vi0MhY1	0gBSoXYKsE3HHZNbgMPnEg	Cute Without The 'E' (Cut From The Team) - Remastered	66
0IPKskRI33eRXjUhNUr9b5	4o0pNHbyj36LPvukNqEug0	2tgx0FJj6dtx3GzTm1Jbbd	Loved You A Little (with Taking Back Sunday and Charlotte Sands)	62
6um5ccNzX7k3SRsVnLupvI	24XtlMhEMNdi822vi0MhY1	6D1rTYBev0y8ZKE5tD7OP9	A Decade Under The Influence	59
5om8idoAx58nxbReNe7HwL	77AiFEVeAVj2ORpC85QVJs	3gZolcYVh9Gm1cM5t335mj	Cute Without The E (Ziri)	30
0cY6CAgB5wShSOTT3lQl2t	24XtlMhEMNdi822vi0MhY1	0gBSoXYKsE3HHZNbgMPnEg	You're So Last Summer - Remastered	58
5heRy6IDNiQXDJf1tZ6SUc	24XtlMhEMNdi822vi0MhY1	3t5ZnNa4NdyldNHZcFhETb	Liar (It Takes One To Know One)	57
3m1OyPw3fzMPAwDMcYcM6Z	24XtlMhEMNdi822vi0MhY1	6D1rTYBev0y8ZKE5tD7OP9	This Photograph Is Proof (I Know You Know)	51
1JFPraHovseDzutd6BOIry	24XtlMhEMNdi822vi0MhY1	0gBSoXYKsE3HHZNbgMPnEg	Timberwolves At New Jersey - Remastered	49
376GmAj8YF8fIJLe5IwOoH	24XtlMhEMNdi822vi0MhY1	3t5ZnNa4NdyldNHZcFhETb	What's It Feel Like To Be A Ghost?	49
10xV5l9nhLvFpR8mqzs0bL	64KEffDW9EtZ1y2vBYgq8T	3SBeYxkc3Ce7lanK0f3epk	Numb	85
4qu63nuBpdn0qHUHuObEj1	64KEffDW9EtZ1y2vBYgq8T	66JuK41D3LpkbX3HCTGcQk	Leave Before You Love Me (with Jonas Brothers)	84
6XO8RlYuJCiI0v3IA48FeJ	64KEffDW9EtZ1y2vBYgq8T	1oKYKiAwR31eJvkRwpQVrb	Bye Bye	83
2dpaYNEQHiRxtZbfNsse99	64KEffDW9EtZ1y2vBYgq8T	78EicdHZr5XBWD7llEZ1Jh	Happier	82
7vGuf3Y35N4wmASOKLUVVU	64KEffDW9EtZ1y2vBYgq8T	2bw00gRKNKbTFOqCkohbSh	Silence	80
0tBbt8CrmxbjRP0pueQkyU	0C8ZW7ezQVs4URX5aX7Kqx	5gQZvWM1o8NkQndueJtZcP	Wolves	79
2Y0wPrPQBrGhoLn14xRYCG	4MCBfE4596Uoi2O4DtmEMz	6n9DKpOxwifT5hOXtgLZSL	Come & Go (with Marshmello)	79
08bNPGLD8AhKpnnERrAc6G	64KEffDW9EtZ1y2vBYgq8T	1BmxOYHjQv1dKZRr13YRZM	FRIENDS	78
3Z8FwOEN59mRMxDCtb8N0A	64KEffDW9EtZ1y2vBYgq8T	1eleCBhP2R8TXEDquvybwC	Be Kind (with Halsey)	76
0ada5XsQGLPUVbmTCkAP49	4MCBfE4596Uoi2O4DtmEMz	6n9DKpOxwifT5hOXtgLZSL	Hate The Other Side (with Marshmello & The Kid Laroi)	74
3CRDbSIZ4r5MsZ0YwxuEkn	3YQKmKGau1PzlVlkL1iodx	3cQO7jp5S9qLBoIVtbkSM1	Stressed Out	84
23OXdR7YuUBVWh5hSnYJau	3YQKmKGau1PzlVlkL1iodx	621cXqrTSSJi1WqDMSLmbL	Chlorine	74
3bnVBN67NBEzedqQuWrpP4	3YQKmKGau1PzlVlkL1iodx	3cQO7jp5S9qLBoIVtbkSM1	Tear in My Heart	73
2nG54Y4a3sH9YpfxMolOyi	3YQKmKGau1PzlVlkL1iodx	0Q5XBpCYFgUWiG9DUWyAmJ	Shy Away	70
5cbpoIu3YjoOwbBDGUEp3P	3YQKmKGau1PzlVlkL1iodx	2r2r78NE05YjyHyVbVgqFn	Car Radio	70
7i9763l5SSfOnqZ35VOcfy	3YQKmKGau1PzlVlkL1iodx	3cQO7jp5S9qLBoIVtbkSM1	Heavydirtysoul	69
36tghkPg1AO4HsAzo6YpPp	3YQKmKGau1PzlVlkL1iodx	2r2r78NE05YjyHyVbVgqFn	House of Gold	68
5HeKOKc4phmLn8e4I7EkzD	3YQKmKGau1PzlVlkL1iodx	621cXqrTSSJi1WqDMSLmbL	My Blood	68
5TXDeTFVRVY7Cvt0Dw4vWW	15UsOTVnJzReFVN1VCnxy4	5VdyJkLe3yvOs0l4xXbWp0	Revenge	87
2ZRo7axmMPeSVUvDbGkJah	15UsOTVnJzReFVN1VCnxy4	2Ti79nwTsont5ZHfdxIzAm	Hope	85
3GVkPk8mqxz0itaAriG1L7	15UsOTVnJzReFVN1VCnxy4	5VdyJkLe3yvOs0l4xXbWp0	Everybody Dies In Their Nightmares	84
7m9OqQk4RVRkw9JJdeAw96	15UsOTVnJzReFVN1VCnxy4	5VdyJkLe3yvOs0l4xXbWp0	Jocelyn Flores	83
3ee8Jmje8o58CHK66QrVC2	15UsOTVnJzReFVN1VCnxy4	2Ti79nwTsont5ZHfdxIzAm	SAD!	82
7AQim7LbvFVZJE3O8TYgf2	15UsOTVnJzReFVN1VCnxy4	5VdyJkLe3yvOs0l4xXbWp0	Fuck Love (feat. Trippie Redd)	82
0JP9xo3adEtGSdUEISiszL	15UsOTVnJzReFVN1VCnxy4	2Ti79nwTsont5ZHfdxIzAm	Moonlight	82
7floNISpH8VF4z4459Qo18	15UsOTVnJzReFVN1VCnxy4	3cyyJALrHc8LawnQNFYRWL	Look At Me!	81
06JvOZ39sK8D8SqiqfaxDU	5K4W6rqBFWDnAN6FQUkS6x	1YA0gAfV91LkDq1DODSCbc	True Love	80
4jvjzW7Hm0yK4LvvE0Paz9	2kCcBybjl3SAtIcwdWpUe3	52JymrguPgkmmwLaWIusst	Falling Down - Bonus Track	80
0hquQWY3xvYqN4qtiquniF	5cj0lLjcoR7YOSnhnX0Po5	2Q5DPv9uliinOBSdNooIe3	Vegas (From the Original Motion Picture Soundtrack ELVIS)	87
6Uj1ctrBOjOas8xZXGqKk4	5cj0lLjcoR7YOSnhnX0Po5	1nAQbHeOWTfQzbOoFrvndW	Woman	87
3Vi5XqYrmQgOYBajMWSvCi	5cj0lLjcoR7YOSnhnX0Po5	1nAQbHeOWTfQzbOoFrvndW	Need to Know	82
0k4d5YPDr1r7FX77VdqWez	5cj0lLjcoR7YOSnhnX0Po5	1nAQbHeOWTfQzbOoFrvndW	You Right	82
60ynsPSSKe6O3sfwRnIBRf	5cj0lLjcoR7YOSnhnX0Po5	1MmVkhiwTH0BkNOU3nw5d3	Streets	82
3DarAbFujv6eYNliUTyqtz	5cj0lLjcoR7YOSnhnX0Po5	1nAQbHeOWTfQzbOoFrvndW	Kiss Me More (feat. SZA)	80
0W6I02J9xcqK8MtSeosEXb	5cj0lLjcoR7YOSnhnX0Po5	1nAQbHeOWTfQzbOoFrvndW	Get Into It (Yuh)	79
5lAnYvAIkSDNXqfo7DyFUm	5cj0lLjcoR7YOSnhnX0Po5	1nAQbHeOWTfQzbOoFrvndW	Ain't Shit	78
3Dv1eDb0MEgF93GpLXlucZ	5cj0lLjcoR7YOSnhnX0Po5	1MmVkhiwTH0BkNOU3nw5d3	Say So	78
0u2P5u6lvoDfwTYjAADbn4	6qqNVTkY8uBg9cP3Jd7DAH	2sBB17RXTamvj7Ncps15AK	lovely (with Khalid)	88
4RVwu0g32PAqgUiJoXsdF8	6qqNVTkY8uBg9cP3Jd7DAH	0JGOiO34nwfUdDrD612dOp	Happier Than Ever	87
3GYlZ7tbxLOxe6ewMNVTkw	6qqNVTkY8uBg9cP3Jd7DAH	1YPWxMpQEC8kcOuefgXbhj	TV	85
3ZCTVFBt2Brf31RLEnCkWJ	6qqNVTkY8uBg9cP3Jd7DAH	4i3rAwPw7Ln2YrKDusaWyT	everything i wanted	84
04sN26COy28wTXYj3dMoiZ	6qqNVTkY8uBg9cP3Jd7DAH	4iyJ8i3eKbez8JXDbsHIdZ	Bored	84
2Fxmhks0bxGSBdJ92vM42m	6qqNVTkY8uBg9cP3Jd7DAH	0S0KGZnfBGSIssfF54WSJh	bad guy	83
43zdsphuZLzwA9k4DJhU0I	6qqNVTkY8uBg9cP3Jd7DAH	0S0KGZnfBGSIssfF54WSJh	when the party's over	83
32BeYxKPrig1LefHsC0Xuo	6qqNVTkY8uBg9cP3Jd7DAH	2kzPJWrTjVKEYWWhowXLnz	Happier Than Ever - Edit	81
41zXlQxzTi6cGAjpOXyLYH	6qqNVTkY8uBg9cP3Jd7DAH	7fRrTyKvE4Skh93v97gtcU	idontwannabeyouanymore	80
6CcJMwBtXByIz4zQLzFkKc	6qqNVTkY8uBg9cP3Jd7DAH	0S0KGZnfBGSIssfF54WSJh	i love you	80
4G21jWo0Cm6lOIUNnZ2mUI	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	Such Great Heights - Remastered	62
3l14MJpQB4tFFgKLqUqtV3	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	The District Sleeps Alone Tonight - Remastered	53
5TS9LZZ3nf3W0EPZKZiYFX	5yV1qdnmxyIYiSFB02wpDj	1BSwkKATGVCMgNuN8ve7mz	Nothing Better	47
0xn9WsyWhNbfI82Ipnpwqa	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	We Will Become Silhouettes - Remastered	46
0bWtmYrWat7IWlpx3rmuwc	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	Sleeping In - Remastered	45
4gW0C3SyybbjP9cAKZVUBh	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	Brand New Colony - Remastered	42
0CHRgDidZqHau44aQpQcBG	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	Clark Gable - Remastered	40
30s3cW1xHDYjsN6giTJ8F0	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	Against All Odds (Take a Look At Me Now) - Remastered	39
5N89h6717o32ZseUAeUKtz	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	Recycled Air - Remastered	38
71RakHH2tdYRLFM2RniO5K	5yV1qdnmxyIYiSFB02wpDj	5MoaDbFw4nrm2P7Om1on3b	This Place Is a Prison - Remastered	37
0VUiaSYJJgUF0JvweD6Mr9	41rVuRHYAiH7ltBTHVR9We	24SclrXmcuFi7wwD8UZoy3	PEW PEW	55
3Fpd2bYU5uc0C5DvIzsMzw	41rVuRHYAiH7ltBTHVR9We	6dwrAsvDJ3qpogoK1jxzAE	All I Need	44
3YVj9LLq5GMvBvoKubnUp0	41rVuRHYAiH7ltBTHVR9We	04ebYhavcGBpHqImHLMyml	LUV U NEED U	53
3XlHlWFhlI4OZiguOMcuuc	41rVuRHYAiH7ltBTHVR9We	5QAitMOxUFNdCzmbpkdGwt	Sober	52
7ppz0b5ecGXM8xHg5yGDhK	41rVuRHYAiH7ltBTHVR9We	7DGYrxmgYPEnsnKxP78n5F	So Long (feat. Madi)	49
27WOAkJrAYagnYj7Y2tsFw	66CXWjxzNUsdJxJ2JdwvnR	6I3a9Dp8ZrsVWhbQja7xBz	Side To Side - Slushii Remix	47
7cpnqcFMN6Z7yiSOZyzGMU	41rVuRHYAiH7ltBTHVR9We	2tfC2UydNyC7Y0jz6FoEKv	All I Need - VIP	47
7D3KNbOAbyR7dYLX0BZuyU	41rVuRHYAiH7ltBTHVR9We	60nbfXLI18M2vTXVwgsdT3	Test Me	46
2vP8axvS6mqgnPwwxMARPs	41rVuRHYAiH7ltBTHVR9We	6dwrAsvDJ3qpogoK1jxzAE	Carousel	45
2jt1zmAB5VEY9TLNNiXLKW	64KEffDW9EtZ1y2vBYgq8T	33sPuo5hSSOvyjduFVIOtL	Silence - Slushii Remix	45
0zLCBJZSiELJf02ucPP9wb	0H39MdGGX6dbnnQPt6NQkZ	1OmWlObj9gAwNnTNgxBUmz	Roses - Imanbek Remix	66
6OboXrS1zbfCmh7uDFCIQ5	0H39MdGGX6dbnnQPt6NQkZ	1Eoy1ADRQDviO2WX2V2vyP	The Best Part of Life (Imanbek Remix)	65
2Y8hY4rRRQQjdaZkkwzpd9	0H39MdGGX6dbnnQPt6NQkZ	0ufGvePLRPce9olVIZhRyE	Trap (feat. Lil Baby)	65
4hTErxf8ZqFNGH0hZqEoAI	0H39MdGGX6dbnnQPt6NQkZ	0ufGvePLRPce9olVIZhRyE	Monica Lewinsky (feat. A Boogie Wit da Hoodie)	64
0kUz4NuENHYVUChlthlNaB	0H39MdGGX6dbnnQPt6NQkZ	3TrtHC3Pq5wtbbiGspOxWq	The Best Part of Life	64
0B3FovCVaGKS5w1FTidEUP	3XV0lFzNs8BCTwhJTcMiBr	552zi1M53PQAX5OH4FIdTx	BROWN SKIN GIRL	62
691df0fYjhhszUgQH3FGvP	0H39MdGGX6dbnnQPt6NQkZ	0ufGvePLRPce9olVIZhRyE	94 Bentley	60
2HhJ0b1AwX5Vgcnf3zzx1p	0H39MdGGX6dbnnQPt6NQkZ	6SInUyQqx0RZaVTSEioHkD	Reflex	59
3q0U6eqmHObU2cy0O6VHGS	0H39MdGGX6dbnnQPt6NQkZ	6SInUyQqx0RZaVTSEioHkD	I Heard You Got Too Litt Last Night	58
3R9j8urSPiBbapNbyuSYkE	0EeQBlQJFiAfJeVN2vT9s0	6rcbbhcm8Os7EiVRHP9Aef	Grinding All My Life	66
4iVD0fTHGxV9JWloujsL3s	0EeQBlQJFiAfJeVN2vT9s0	6rcbbhcm8Os7EiVRHP9Aef	Double Up (feat. Belly and Dom Kennedy)	63
6ya8ejoKgw906Y8LWclqrp	0EeQBlQJFiAfJeVN2vT9s0	6a2c06GAsKigzV53VyzBXk	Racks in the Middle (feat. Roddy Ricch and Hit-Boy)	63
2hVtGnJeHOo0EqjzYXNFg5	0EeQBlQJFiAfJeVN2vT9s0	6rcbbhcm8Os7EiVRHP9Aef	Hussle & Motivate	62
6hkQ6OQ6nhe7QCckH91aGa	0EeQBlQJFiAfJeVN2vT9s0	6rcbbhcm8Os7EiVRHP9Aef	Victory Lap (feat. Stacy Barthe)	59
6fIjnWrv46njJHLDAY2JdC	0EeQBlQJFiAfJeVN2vT9s0	6rcbbhcm8Os7EiVRHP9Aef	Dedication (feat. Kendrick Lamar)	59
39xWBHPM4E9MwzEy5gbM7p	0EeQBlQJFiAfJeVN2vT9s0	6rcbbhcm8Os7EiVRHP9Aef	Last Time That I Checc'd (feat. YG)	58
7yB6GF5kgPEoeGE4EAWiJU	0EeQBlQJFiAfJeVN2vT9s0	6rcbbhcm8Os7EiVRHP9Aef	Blue Laces 2	57
0A1owXuxPwqTQPqOJcmUGz	0EeQBlQJFiAfJeVN2vT9s0	1C5gVWv1k7r0LxsrIL8OL8	Face the World	54
1f0tj0IQ28OXq7hS0Rz0LH	0EeQBlQJFiAfJeVN2vT9s0	6pAP6aJ2SUmhE9VXB8bm02	Ocean Views	53
6jq6rcOikCZAmjliAgAmfT	0jNDKefhfSbLR9sFvcPLHo	4k2ygY7kW4n1eVtR2i0F0H	Light	60
6Dg3ArDiJcseYoeeTZZXK6	0jNDKefhfSbLR9sFvcPLHo	4Z9aZaIeSiKBVOf7v7oHCI	All The Highs	57
6VpRQDOM7nQ6viuVUSXWGn	0jNDKefhfSbLR9sFvcPLHo	5Pz41jv4xOHJzn93rhHWle	We Will Meet Again	55
7uSZPbd8DxdkmSauCKnITY	0jNDKefhfSbLR9sFvcPLHo	1fgSS7d1R3fin79TUkhuxW	We Rise	55
3LnoLo62GjfKDYIN7eJpPB	0jNDKefhfSbLR9sFvcPLHo	046wH7DEfUumC5h9ykIEkd	you’ve changed, i’ve changed	47
7snnEDYwv30hRtmifVni8P	0jNDKefhfSbLR9sFvcPLHo	3KHPqtzQKRPKup29xEQWtg	lift me from the ground	51
1k3J7o5b0tDUzbllLycVUJ	0jNDKefhfSbLR9sFvcPLHo	7t6TgWkJUkrtbMtcpk7sh0	Honest	50
3H8h60jhdQNu5s9HHTLdFr	0jNDKefhfSbLR9sFvcPLHo	046wH7DEfUumC5h9ykIEkd	IT HURTS!	49
4AqH4V7PEC5BTK29FVmXQd	0u18Cq5stIQLUoIaULzDmA	025njwSJ67gymZaZ7i3rHh	Lines of the Broken	47
1rS3g0pYnbnwTtj3A4OvXP	0jNDKefhfSbLR9sFvcPLHo	3KHPqtzQKRPKup29xEQWtg	show me	45
0sGTf0ZhFsJqS3h48oVAY5	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Mae Amanha Eu Vou Mae Amanha Chego La - Ao Vivo	24
1heBExZeADNocdIDP9vE8E	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Historia Que Conto - Ao Vivo	24
0n7K7V7ni5VBL65TzDMVwn	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Mataram Besouro - Ao Vivo	23
4E7M4Yz0kFfidlGnllvuTI	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	No Alto do Cruzeiro - Ao Vivo	23
05BnyatUof9QNcvTXzdtW4	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Atirei Mas Nao Matei - Ao Vivo	23
7BYIzRTZDMMWrUYOJAtj19	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	O Fila Lá Eoo - Ao Vivo	23
7ICqkvo7Md45yI1XEYQBsw	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Besouro Cordao de Ouro - Ao Vivo	22
5eqpyyK2p7CbMofum6rRQK	18hl4QMrybIXbkGi2BzXcf	5olInc6PT2TULCztcT0Csl	Como Vai Como Vai Você - Ao Vivo	22
1X4x5dsB2OhY4CctleooV2	7boQqq2hUcz9kHcQOecG4j	2Sy70AVTYlyrcRePSm4ext	Jungle	46
0NWwLNAS3Xfy1WRleGrmaV	7boQqq2hUcz9kHcQOecG4j	1OR946caqAWK0EIW49hJJW	4am - Bay Bridge Music	45
51Fhx9LB9isxUbvEFvDTh7	7boQqq2hUcz9kHcQOecG4j	5hLV6kxqvWQdRDqlt8DT5T	Ayo For Yayo (feat. San Quinn)	45
3UssRQyQL6OEuYXWkDmYmr	7boQqq2hUcz9kHcQOecG4j	2LFMmRSOgUHxXS4QCPr4zW	My Homeboys Chevy	45
5FmjAvHSzqXiuyiq1Ds7Ml	7boQqq2hUcz9kHcQOecG4j	1HG9bFZMfC6MLSEbOiI8ME	Killa Whale	44
7aw2aLN4VypvfP90ns4Oqs	4mPPxTpWqDR5rmOrTOh4nk	4Uvk0aRsCz0kt8IQoTTCko	Y-U-Smilin	42
2iLLM4nKqHLUqYFZZIVWJ4	7boQqq2hUcz9kHcQOecG4j	2LFMmRSOgUHxXS4QCPr4zW	AndreNAndre	41
1ZbvEfR0gXKeuDSEtwdrwH	7boQqq2hUcz9kHcQOecG4j	1HG9bFZMfC6MLSEbOiI8ME	Fillmoe	39
4arFkQK84KZjA7UPpunJ2y	7boQqq2hUcz9kHcQOecG4j	5hLV6kxqvWQdRDqlt8DT5T	Dice Of Life (The Battle)	39
5KdWhOz7etD59lB2ehc6xo	7boQqq2hUcz9kHcQOecG4j	15mPPPMuN4jpwU0NqKE2DT	Scottie 15	39
0tgVpDi06FyKpA1z0VMD4v	6eUKZXaKkcviH0Ku9w2n3V	3T4tUhGYeRNVUGevb0wThu	Perfect	86
3rmo8F54jFF8OgYsqTxm5d	6eUKZXaKkcviH0Ku9w2n3V	32iAEBstCjauDhyKpGjTuq	Bad Habits	86
50nfwKoDiSYg8zOCREWAm5	6eUKZXaKkcviH0Ku9w2n3V	32iAEBstCjauDhyKpGjTuq	Shivers	86
7qiZfU4dY1lWllzX7mPBI3	6eUKZXaKkcviH0Ku9w2n3V	3T4tUhGYeRNVUGevb0wThu	Shape of You	85
1eNrlXlW7Cj1QB1YUcZmpb	5BvJzeQpmsdsFp4HGUYUEx	7n8NJkGKAl2np1bXiRn0CY	Campus	63
4dRqYKhLVujxiBXcq50YzG	5BvJzeQpmsdsFp4HGUYUEx	1A3nVEWRJ8yvlPzawHI1pQ	This Life	60
39exKIvycQDgs4T6uXdyu0	5BvJzeQpmsdsFp4HGUYUEx	1A3nVEWRJ8yvlPzawHI1pQ	Harmony Hall	60
51DZ0wUocQ8sQfjnibXVcD	5BvJzeQpmsdsFp4HGUYUEx	1GXMNFfoHF4sN7lG8gZq1j	Unbelievers	59
607EA1HsuzrqqaPuxyNqpD	5BvJzeQpmsdsFp4HGUYUEx	1GXMNFfoHF4sN7lG8gZq1j	Step	58
0ful4PHfTIxzXiZSZsXQ0H	5BvJzeQpmsdsFp4HGUYUEx	7n8NJkGKAl2np1bXiRn0CY	Oxford Comma	57
53KFMdxzi8IJDewiql1Qo3	5BvJzeQpmsdsFp4HGUYUEx	1A3nVEWRJ8yvlPzawHI1pQ	Sunflower (feat. Steve Lacy)	56
10f0hrbCBiQk9STrFG3EU7	5BvJzeQpmsdsFp4HGUYUEx	1GXMNFfoHF4sN7lG8gZq1j	Diane Young	55
6AY1M1akbsVaQN3ATVyzH7	5BvJzeQpmsdsFp4HGUYUEx	1GXMNFfoHF4sN7lG8gZq1j	Hannah Hunt	53
37F7E7BKEw2E4O2L7u0IEp	0dlDsD7y6ccmDm8tuWCU6F	2ll6KONxe4F87GJku1ZZrl	Limbo	80
3omcH1HGghFtzaFGgazoy8	0dlDsD7y6ccmDm8tuWCU6F	4WLWbEhOq5kphrWF5oEEou	Devil's Work	74
6J9UUQSQ9Vm9fh6vZgLlzu	0dlDsD7y6ccmDm8tuWCU6F	4WLWbEhOq5kphrWF5oEEou	WTH	72
5WbKBMz6y0FbUdZl18XlJO	0dlDsD7y6ccmDm8tuWCU6F	2ll6KONxe4F87GJku1ZZrl	Wrath	69
2qOfyyZc41LfQ63U9p3GVV	0dlDsD7y6ccmDm8tuWCU6F	43Xd3k45L0OgtJzJoQmUDD	Killin' On Demand	70
7hARdySaXWuTLeqBrYP2xf	0dlDsD7y6ccmDm8tuWCU6F	7pTr1AQkGqPlyZl9tS8Xg8	Ditty	69
519nSwwD1B5g1nw4iZkqsh	0dlDsD7y6ccmDm8tuWCU6F	4WLWbEhOq5kphrWF5oEEou	Stunna	66
285pBltuF7vW8TeWk8hdRR	4MCBfE4596Uoi2O4DtmEMz	6tkjU4Umpo79wwkgPMV3nZ	Lucid Dreams	84
2RJAKIw6nIkgZVsAIKhmqz	4MCBfE4596Uoi2O4DtmEMz	4I00tpvL54vnWy49vH5fRK	In My Head	84
4VXIryQMWpIdGgYR4TrjT1	4MCBfE4596Uoi2O4DtmEMz	6tkjU4Umpo79wwkgPMV3nZ	All Girls Are The Same	83
6iaSML1PIYq936g62BDtBq	4MCBfE4596Uoi2O4DtmEMz	1btu0SV2DOI5HoFsvUd78F	Robbery	81
2U5WueTLIK5WJLD7mvDODv	4MCBfE4596Uoi2O4DtmEMz	6n9DKpOxwifT5hOXtgLZSL	Wishing Well	79
3oDkdAySo1VQQG0ptV7uwa	4MCBfE4596Uoi2O4DtmEMz	6tkjU4Umpo79wwkgPMV3nZ	Lean Wit Me	79
3wwo0bJvDSorOpNfzEkfXx	4MCBfE4596Uoi2O4DtmEMz	5wi0oKiF99ZVACf6oTTsp2	Let Me Know (I Wonder Why Freestyle)	78
5wujBwqG7INdStqGd4tRMX	4MCBfE4596Uoi2O4DtmEMz	6tkjU4Umpo79wwkgPMV3nZ	Armed And Dangerous	77
1lsHg7CSPitu1R3VjLTFUv	2EhUXeszBQRApbBmTOXlKU	4fN1wqKk72NNFja1oi9WEV	Ligeiros	18
44em4VSTU8NBYyUZmYIOar	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Pedir o Axe	17
1vtQFjkIN1chP0iLDgATQ0	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Ouvi Falar	12
4eKd0hwevnvwxTUCKApZe4	7G6BVdBZ9lTjGEH37zbxmA	1XYOxycEbEE2Ce9eDwREpS	Obrigado Mestre	11
6BOpez82pPBooERz4yvdYP	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Faca Amolada	11
5jRiMVtNu3XF45niBV1QY4	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Sou Capoeira	10
1KdHNhK8yloNM4Cr5bndbg	2EhUXeszBQRApbBmTOXlKU	1RmE807F6wsfWzoaxF2qWH	Danca Guerreira	10
092uPpAF9zVl7WbpVdSJFL	2EhUXeszBQRApbBmTOXlKU	4fN1wqKk72NNFja1oi9WEV	Andante	8
0ct6r3EGTcMLPtrXHDvVjc	1vCWHaC5f2uS3yhpwWbIA6	0h2knr6qpiAq0tV5ri5JMF	The Nights	85
0nrRP2bk19rLc0orkWPQk2	1vCWHaC5f2uS3yhpwWbIA6	2H6i2CrWgXE1HookLu8Au0	Wake Me Up	84
2P4OICZRVAQcYAV2JReRfj	1vCWHaC5f2uS3yhpwWbIA6	7dqftJ3kas6D0VAdmt3k3V	Waiting For Love	80
5UqCQaDshqbIk3pkhy4Pjg	1vCWHaC5f2uS3yhpwWbIA6	1OEGfToF7QbjUgyxMAnGXg	Levels - Radio Edit	78
6Pgkp4qUoTmJIPn7ReaGxL	1vCWHaC5f2uS3yhpwWbIA6	1m3mf7xkXIwssVriaaTjOS	Without You (feat. Sandro Cavazza)	77
4lhqb6JvbHId48OUJGwymk	1vCWHaC5f2uS3yhpwWbIA6	2H6i2CrWgXE1HookLu8Au0	Hey Brother	76
2x0RZdkZcD8QRI53XT4GI5	1vCWHaC5f2uS3yhpwWbIA6	6Ad1E9vl75ZB3Ir87zwXIJ	SOS (feat. Aloe Blacc)	71
4eDYMhIin1pSLIG96f1aD0	1vCWHaC5f2uS3yhpwWbIA6	2H6i2CrWgXE1HookLu8Au0	Addicted To You	70
75NhhYjHO43mvZgYtnXgti	1vCWHaC5f2uS3yhpwWbIA6	1m3mf7xkXIwssVriaaTjOS	Lonely Together (feat. Rita Ora)	69
591nHHHzZl1NLt9PMKpinM	1vCWHaC5f2uS3yhpwWbIA6	292ltz2MxXuFZw9FaEbaZ3	I Could Be The One (Avicii Vs. Nicky Romero) - Radio Edit	61
1bDbXMyjaUIooNwFE9wn0N	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	Rich Flex	93
3F5CgOj3wFlRv51JsHbxhe	3TVXtAsR1Inumwj472S9r4	3cf4iSSKd8ffTncbtKljXw	Jimmy Cooks (feat. 21 Savage)	90
46s57QULU02Voy0Kup6UEb	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	Major Distribution	90
2KLwPaRDOB87XOYAT2fgxh	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	Pussy & Millions (feat. Travis Scott)	90
34tz0eDhGuFErIuW3q4mPX	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	On BS	89
59nOXPmaKlBfGMDeOVGrIK	1RyvyyTE3xzB2ZywiAwp0i	6tE9Dnp2zInFij4jKssysL	WAIT FOR U (feat. Drake & Tems)	88
7GeTsDIc5ykNB6lORO6Cee	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	Circo Loco	88
2ZL7WZcjuYKi1KUDtp4kCC	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	Spin Bout U	87
7l2nxyx7IkBX5orhkALg0V	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	Privileged Rappers	87
0wshkEEcJUQU33RSRBb5dv	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	BackOutsideBoyz	87
2Y0iGXY6m6immVb2ktbseM	0SwO7SWeDHJijQ3XNS7xEE	7GjVWG39IOj4viyWplJV4H	Little Dark Age	82
1jJci4qxiYcOHhQR247rEU	0SwO7SWeDHJijQ3XNS7xEE	6mm1Skz3JE6AXneya9Nyiv	Kids	77
3FtYbEfBqAlGO46NUDQSAt	0SwO7SWeDHJijQ3XNS7xEE	6mm1Skz3JE6AXneya9Nyiv	Electric Feel	76
4iG2gAwKXsOcijVaVXzRPW	0SwO7SWeDHJijQ3XNS7xEE	6mm1Skz3JE6AXneya9Nyiv	Time to Pretend	70
3td69vL9Py7Ai9wfXYnvji	0SwO7SWeDHJijQ3XNS7xEE	7GjVWG39IOj4viyWplJV4H	When You Die	66
0t4z0WaQomQqPONghWn8c2	0SwO7SWeDHJijQ3XNS7xEE	7GjVWG39IOj4viyWplJV4H	Me and Michael	60
6kblAEj0T0312fv5QWsXzo	0SwO7SWeDHJijQ3XNS7xEE	3HA1Ru1gEAgaxTywkJmBOL	Congratulations	58
19K3lUMJmOdeuOBTrbLm19	0SwO7SWeDHJijQ3XNS7xEE	6mm1Skz3JE6AXneya9Nyiv	Weekend Wars	53
3XOKU8CKSiQsuQHD5vhzo5	0SwO7SWeDHJijQ3XNS7xEE	7GjVWG39IOj4viyWplJV4H	She Works Out Too Much	53
0wYPM5pexJu96AClrozpIh	0SwO7SWeDHJijQ3XNS7xEE	6AccJKWLGTkv1KVFjZW4A8	Indie Rokkers	52
40iJIUlhi6renaREYGeIDS	3TVXtAsR1Inumwj472S9r4	3SpBlxme9WbeQdI9kx7KAV	Fair Trade (with Travis Scott)	82
2xLMifQCjDGFmkHkpNLD9h	0Y5tJX1MQlPlqiwlOH1tJY	41GuZcammIkupMPKH2OJ6I	SICKO MODE	81
5uEYRdEIh9Bo4fpjDd4Na9	0Y5tJX1MQlPlqiwlOH1tJY	3SdFuYwyWoq7kuaHdTDcyD	Goosebumps - Remix	80
51EC3I1nQXpec4gDk0mQyP	0Y5tJX1MQlPlqiwlOH1tJY	4PWBTB6NYSKQwfo79I3prg	90210 (feat. Kacy Hill)	78
11kDth1aKUEUMq9r1pqyds	0Y5tJX1MQlPlqiwlOH1tJY	41GuZcammIkupMPKH2OJ6I	5% TINT	78
2DB4DdfCFMw1iaR6JaR03a	4nDoRrQiYLoBzwC5BhVJzF	4urxMitPAkjyey14LeuWSX	Bam Bam (feat. Ed Sheeran)	80
6fxVffaTuwjgEk5h9QyRjy	6eUKZXaKkcviH0Ku9w2n3V	6NoBzYmh5gUusGPCfg0pct	Photograph	65
4zrKN5Sv8JS5mqnbVcsul7	6eUKZXaKkcviH0Ku9w2n3V	2W5VVBPNkGAduaArE4sX29	Celestial	84
1Slwb6dOYkBlWal1PGtnNg	6eUKZXaKkcviH0Ku9w2n3V	6NoBzYmh5gUusGPCfg0pct	Thinking out Loud	64
0HaRLPnr887lcQM2YQzkff	3wcj11K77LjEY1PkEazffa	6kgDkAupBVRSqbJPUaTJwQ	For My Hand (feat. Ed Sheeran)	82
2RttW7RAu5nOAfq6YFvApB	6eUKZXaKkcviH0Ku9w2n3V	3T4tUhGYeRNVUGevb0wThu	Happier	79
3ymSzAIqvWTxKYD0BBODbH	5r4anprO9Hg9CBlmdkwFdE	3w8hDKDqyNFKwTuB2G15Sk	A Maré a Maré	24
6nAYtpcRsku5JoBUhXk5EA	5r4anprO9Hg9CBlmdkwFdE	3w8hDKDqyNFKwTuB2G15Sk	Hoje Me Leva	21
2hsjrCNUjG5vPLN2IcigtS	5r4anprO9Hg9CBlmdkwFdE	3w8hDKDqyNFKwTuB2G15Sk	Amor É Meu Amor	21
32eVHUmKEixGAX4hdNj5pR	5r4anprO9Hg9CBlmdkwFdE	3w8hDKDqyNFKwTuB2G15Sk	O Vento Levou o Mar	19
2rCB7ynjLw7iD1ZOI5zXvC	5r4anprO9Hg9CBlmdkwFdE	0iyPnXukC40URPczeXVvha	Movido Pela Capoeira	18
6hlxA75xLIaazYhqjFAGXq	5r4anprO9Hg9CBlmdkwFdE	5V5iUFc3nj3Y92QeHzWGfH	Chora Berimbau Viola	18
0OCFtx3jwLYfGxZ6Wcn7Aj	5r4anprO9Hg9CBlmdkwFdE	2cX8LwExMxThOI19CdW8cX	Arte e Luta	18
1WgOf7lU1lGH7wHsam8rCH	5r4anprO9Hg9CBlmdkwFdE	3w8hDKDqyNFKwTuB2G15Sk	Eu Levo a Vida	17
36yAonKXZwKGJ6YVtkITRT	5r4anprO9Hg9CBlmdkwFdE	2cX8LwExMxThOI19CdW8cX	Sonho Lindo	15
4NCwg4UvOsir3Vvozx0QFM	5r4anprO9Hg9CBlmdkwFdE	2cX8LwExMxThOI19CdW8cX	Já Quer Correr	13
0xta6Gah3inmeHbj0e3F9a	6aaMZ3fcfLv4tEbmY7bjRM	6TQ8nqw43uUOWu7Yqp58ko	Headshots (4r Da Locals)	66
6BiCjPFN5rM9JPy5eP5mCs	6aaMZ3fcfLv4tEbmY7bjRM	6TQ8nqw43uUOWu7Yqp58ko	RIP Young	66
2RPbEp0DyBVlkRvvYKopO7	6aaMZ3fcfLv4tEbmY7bjRM	6jjX8mGrsWtrpYpFhGMrg1	Wat's Wrong (feat. Zacari & Kendrick Lamar)	65
0Gt4nGWoATcQFL38a1NRao	6aaMZ3fcfLv4tEbmY7bjRM	6JF49ixyHmOgS0Rsda2k42	West Savannah (feat. SZA)	62
0VYchQkqpeEyh95D1pWqy2	6aaMZ3fcfLv4tEbmY7bjRM	6TQ8nqw43uUOWu7Yqp58ko	Wat U Sed (feat. Doechii & Kal Banx)	62
5f6esnDQcBiFAm8iMfkw12	6aaMZ3fcfLv4tEbmY7bjRM	6jjX8mGrsWtrpYpFhGMrg1	Silkk da Shocka (feat. Syd)	61
71lyUtIPCMAYjTwwwxy2jW	6aaMZ3fcfLv4tEbmY7bjRM	6jjX8mGrsWtrpYpFhGMrg1	4r Da Squaw	60
5FX89IUKm9QJT9ymrmyK4k	6aaMZ3fcfLv4tEbmY7bjRM	6jjX8mGrsWtrpYpFhGMrg1	Free Lunch	59
4OWhcwHOnB7ZLGJI0Fo4oN	4yYYCSCDUTypErQMZv5iSg	1sjsLTzS0WxitdFmqvPpUW	Dawg House	59
0qLt7pQhm8LDxFgI0YXdlY	6aaMZ3fcfLv4tEbmY7bjRM	6JF49ixyHmOgS0Rsda2k42	Heavenly Father	59
6HL03eZbvf3OA81tUZEyh0	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Eu Vou Dizer a Meu Senhor	30
22hUmBHDGOUv5wGSgdL8n6	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Escola Viva	27
4de69eAJNEpQQSjilA9d4a	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Louvação	26
6nkyoFpw96gRuCto4B8uzw	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Besouro	25
4VPVkg5yKgMKH4LczJEHwH	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Pastinha Tem Dois Meninos	25
0mALRdpqjWgYqT6psEvCRo	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	A Àgua do Rio Invadiu o Mar	25
3wJOOOjEuoF7JLwZASAr3U	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Sinha e Meu Boi	25
1I9hUdCQaLcdQr9MtqY20k	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Venha, Senta Aí	23
3FhJkEJjDb54FGauk92KBl	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Delegado Me Intimou	22
6x4IkaBTb9UN2TkF0Z5eYL	7hi7sNBb4AWmzHRjFCs94V	6kAQmWSprYKeBpSEVC4dxa	Nego Nago	22
4cktbXiXOapiLBMprHFErI	04gDigrS5kc9YWfZHwBETP	1pCA38N6MkLlthXtAOvZTU	Memories	84
4P0osvTXoSYZZC2n8IFH3c	04gDigrS5kc9YWfZHwBETP	2pjfMmH52fryXVQuWTWOgP	Payphone	71
4gbVRS8gloEluzf0GzDOFc	04gDigrS5kc9YWfZHwBETP	2Auw0pTT6EcQdvHNimhLQI	Maps	83
5zFglKYiknIxks8geR8rcL	04gDigrS5kc9YWfZHwBETP	1pCA38N6MkLlthXtAOvZTU	Beautiful Mistakes (feat. Megan Thee Stallion)	80
2iuZJX9X9P0GKaE93xcPjk	04gDigrS5kc9YWfZHwBETP	2Auw0pTT6EcQdvHNimhLQI	Sugar	80
2bL2gyO6kBdLkNSkxXNh6x	04gDigrS5kc9YWfZHwBETP	2Auw0pTT6EcQdvHNimhLQI	Animals	80
6ECp64rv50XVz93WvxXMGF	04gDigrS5kc9YWfZHwBETP	5zClcGCSWj926AMjvBNSLc	This Love	79
7LcfRTgAVTs5pQGEQgUEzN	04gDigrS5kc9YWfZHwBETP	7strNUlU6xZqlVWBNUdOYv	Moves Like Jagger - Studio Recording From "The Voice" Performance	70
4llK75pXNWZz6KAho2Gp16	04gDigrS5kc9YWfZHwBETP	5zClcGCSWj926AMjvBNSLc	She Will Be Loved - Radio Mix	78
4XNrMwGx1SqP01sqkGTDmo	04gDigrS5kc9YWfZHwBETP	2pjfMmH52fryXVQuWTWOgP	One More Night	70
36GK0zhH2G52EJTP6FCG86	6BIltkF2V7p0PHLtUyc7re	1rVb8baDpWBzuO7Ndc6g4v	Um Par de Asas	25
1Gb8fNgiPnJFuC9yAmUN32	6BIltkF2V7p0PHLtUyc7re	1rVb8baDpWBzuO7Ndc6g4v	A Chuva Que Deu Ontem	24
7bysuZQRmiZF5f0ylO1PW3	6BIltkF2V7p0PHLtUyc7re	1rVb8baDpWBzuO7Ndc6g4v	Quando Eu Morrer	22
6bn9gXjHKqHUdCpzOC9GUZ	6BIltkF2V7p0PHLtUyc7re	1rVb8baDpWBzuO7Ndc6g4v	Fui a Santa Catarina	22
0Tcv6S71vFaRktNG9TX8kr	6BIltkF2V7p0PHLtUyc7re	1rVb8baDpWBzuO7Ndc6g4v	Homenagem a Dona Bel	21
6VfZMviYxr1fXHshHSpUCC	6BIltkF2V7p0PHLtUyc7re	1rVb8baDpWBzuO7Ndc6g4v	Quando For Falar de Mim	21
7FJ69qi4X4ZlzsW1ikQFpb	6BIltkF2V7p0PHLtUyc7re	1rVb8baDpWBzuO7Ndc6g4v	Em Casa de Marimbondo	20
6v4UVEpozyMwetw9NOvJee	5h6l7v8Ecxw1BKVBLrjFfE	13XcJE12Oyc3N9g7LZFCRu	Homenagem ao Mestre Ananias - Ao Vivo	19
5iWX0JLUmdOdxl8IwWVoLB	6BIltkF2V7p0PHLtUyc7re	0RnMuJpfEHHq0yDpSP6K48	Quem Quiser Saber de Mim	19
6Gh4DYlRKid8w5zNbR8M98	5h6l7v8Ecxw1BKVBLrjFfE	13XcJE12Oyc3N9g7LZFCRu	Sou Filho da Torre Alta - Ao Vivo	18
1S1bZVv8sqYY39S6KWchuk	5zfEatKLDdRkgbw6sdLBAQ	7KsMCyObKQhX37pocZEUcQ	Papi Chulo	66
3Hha9pVZsWGwQiFKvsMrwS	39XT9gMoNmMCOlvTTR273m	1kiTzXHYN9CC5BfKrkjKbT	Warm - Remix	66
11RIJRbBfyLlJut96itSFd	2p1fiYHYiXz9qi0JJyxBzN	6c2FMAZeFKi8pui6dlZqXB	Energy (Stay Far Away)	64
0Z5HVNSXGXHf7MDb0zJHVW	3tVQdUvClmAT7URs9V3rsp	73rKiFhHZatrwJL0B1F6hY	Wow (feat. Skepta & Naira Marley)	64
3nG784YlxS4VQOF0qiHKVP	2p1fiYHYiXz9qi0JJyxBzN	22zpCX6Nb9ppOVklalvGec	Greaze Mode	62
44GokgCa37BTZP2NU2zkoJ	2p1fiYHYiXz9qi0JJyxBzN	6s4vWWWxNrGcKhrOFYRZzk	Shutdown	61
2Jy4EdqIZswDZvVDh5dx3A	3NbqBIc16CNAe5nYSmHR3p	0Zp33hB1LZhbpMQCNfzeVF	Dimension (feat. Skepta & Rema)	61
3tTDOodJcr6vKF2DASlwMZ	2p1fiYHYiXz9qi0JJyxBzN	6s4vWWWxNrGcKhrOFYRZzk	That's Not Me	59
0kmxWw7KjktV4V1ZpbOeru	2p1fiYHYiXz9qi0JJyxBzN	22zpCX6Nb9ppOVklalvGec	Glow In The Dark	57
6gi6y1xwmVszDWkUqab1qw	7A8S43ryYdbWpJKeHRZRcq	1Sf8GsXG32t0jNrX11xqWx	OUT WEST (feat. Young Thug)	76
0d28khcov6AiegSCpG5TuT	3AA28KZvwAUcZuOKwyblJQ	0bUTHlWbkSQysoM3VsWldT	Feel Good Inc.	83
64dLd6rVqDLtkXFYrEUHIU	3AA28KZvwAUcZuOKwyblJQ	4V9YFKLqZ5h8nQFTvDQscC	New Gold (feat. Tame Impala and Bootie Brown)	79
1foMv2HQwfQ2vntFf9HFeG	3AA28KZvwAUcZuOKwyblJQ	2dIGnmEIy1WZIcZCFSj6i8	Rhinestone Eyes	79
0q6LuUqGLUiCPP1cbdwFs3	3AA28KZvwAUcZuOKwyblJQ	2dIGnmEIy1WZIcZCFSj6i8	On Melancholy Hill	76
7yMiX7n9SBvadzox8T5jzT	3AA28KZvwAUcZuOKwyblJQ	0YvYmLBFFwYxgI4U9KKgUm	Clint Eastwood	70
4Hff1IjRbLGeLgFgxvHflk	3AA28KZvwAUcZuOKwyblJQ	0bUTHlWbkSQysoM3VsWldT	DARE	75
3lIxtCaROdRDuTnNBDm3n2	3AA28KZvwAUcZuOKwyblJQ	0NvirtaDCaZU5PAW1O5FDE	She's My Collar (feat. Kali Uchis)	73
2W3ZpQg9i6lE6kmHbcdu9N	3AA28KZvwAUcZuOKwyblJQ	3488fiYQcGSfkKKpr3ttCD	Cracker Island (feat. Thundercat)	73
0dFwiyWPwC2yML3ZH7B56V	3AA28KZvwAUcZuOKwyblJQ	6WHjLRAwmnJv2cHqVZrmOt	Baby Queen	71
2bfGNzdiRa1jXZRdfssSzR	3AA28KZvwAUcZuOKwyblJQ	0bUTHlWbkSQysoM3VsWldT	Dirty Harry	71
51pshtuYkgUQnt5huMPbKL	4LLpKhyESsyAXpc4laK94U	0WzOtZBpXvWdNdH7hCJ4qo	The Spins	80
0N9C80kcgL0xXGduKnYKWi	4LLpKhyESsyAXpc4laK94U	1XEycvgUklYgcYEUf7vbij	Love Lost	79
5bJ1DrEM4hNCafcDd1oxHx	4LLpKhyESsyAXpc4laK94U	5wtE5aLX5r7jOosmPhJhhk	Self Care	79
6GnhWMhgJb7uyiiPEiEkDA	4LLpKhyESsyAXpc4laK94U	2Tyx5dLhHYkx6zeAdVaTzN	Weekend (feat. Miguel)	76
1OubIZ0ARYCUq5kceYUQiO	4LLpKhyESsyAXpc4laK94U	6f6tko6NWoH00cyFOl4VYQ	Congratulations (feat. Bilal)	76
4gT3mNJA8lnlkYFqGZ8IA2	4LLpKhyESsyAXpc4laK94U	5wtE5aLX5r7jOosmPhJhhk	Small Worlds	74
2hwOoMtWPtTSSn6WHV7Vp5	4LLpKhyESsyAXpc4laK94U	5sY6UIQ32GqwMLAfSNEaXb	Blue World	74
1DWZUa5Mzf2BwzpHtgbHPY	4LLpKhyESsyAXpc4laK94U	5sY6UIQ32GqwMLAfSNEaXb	Good News	74
01z2fBGB8Hl3Jd3zXe4IXR	4LLpKhyESsyAXpc4laK94U	5wtE5aLX5r7jOosmPhJhhk	Come Back to Earth	74
5iUQMwxUPdJBFeGkePtM66	4LLpKhyESsyAXpc4laK94U	6f6tko6NWoH00cyFOl4VYQ	Dang! (feat. Anderson .Paak)	72
7kdyc52WSOnaYetBSS4mE5	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Brilha o Mundo	16
5edZrk1cC6VFtlryFT0QDx	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Medo da Mare	15
61qCCgptAHVqP8DLzDdDWS	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Deus Sem Você	10
3OefJy3MhpFwc3I8dj1A5n	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Me da um Beijo	8
0MJcKr4SRFFPAj7h8T8Y2u	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Sandalha	8
1gxuZDZ3iD4umJebIEAQ5c	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Ilha da Magia	1
4qtZIirGU2wcP2faEv0jry	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Nega Rose	1
2JMJMtzG0shNuHmaJ1uk6q	6Q1ggxOPVDbMyqlhv0tmT4	2BxVymXnPiWgxA8k6PWqCS	Faz Um Tempo	1
4Amw1lKBUbmaanUTGzv77U	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	Marinheiro Só	29
4RXnp2ZTi0CyetuM6xTcjg	4kEcRrHPFKoSlsHIhuCN2f	3fAptQHHbsV4bHHNjcGDG0	Malandragem	28
4q8CVsKQcAeNZ3RguQjmTU	1AldSIJ8ANuZVbjKIhpKKq	6FdbVYfwhJjaUOzYB7J9Uj	Iemanjá Rainha do Mar	19
1EIWddhCtay8sMJeu58lvm	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	A Hora É Essa / Um Dia na Senzala	23
7z8F1kHqUvh8jA4hztNeU8	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	Eu Já Vivo Enjoado / Corridos de Angola	18
7eiI2R22MxDNVLN7S9VqVH	1AldSIJ8ANuZVbjKIhpKKq	7b1LmekvPCy9410bKFoMRS	Puxada de Rede	20
2xmOKduEJr0OwXim7ngrGG	1AldSIJ8ANuZVbjKIhpKKq	2MQvu0dayEtaR5Y2uxX056	Axé	19
4cy68Rp4tdkCVoo8lj30F5	1AldSIJ8ANuZVbjKIhpKKq	3kUdjvoJpl53A2BLu56OvA	Chico Parauê	19
6wiM5H4NW3WIOBoXhQ4dj9	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Branca	3
77QQcQ7wIeaKL6Qs7Xxd08	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Potpourri 2	2
3ATP7JXuBSLUXkZqzRYFoC	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Menino Danado	2
3OevO7P8qXFaxB5R6GIfn0	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Potpourri 1	1
1CimagjBZShN4Tju88HJZ0	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Capoeira Besouro Convite	1
5iUP22DajCVfhuesgQT8Cz	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	A Minha História	1
2y1Zu0XQcOmX90TCj1q40v	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Na Palma da Mão	1
15uf8cMOumUbwio2InLSRD	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Dito Popular	1
2bSnBMXCNPP7WyGoCzDGc8	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Besouro Capoeira	1
0OpfYRVsgQ9LHX8oLtkMLO	0I11U609NiFEdpvNix7oNl	1nLj3uvuO1twD5Vzp1tQyh	Mandingueiro Viajante	1
0hQbovQO5Cui5Imze8Q3oo	7HGNYPmbDrMkylWqeFCOIQ	4UOAwKUc79FtTSK6NmRFB3	Voce E Linda - Remixed Original Album	57
1wuB9MID26ep43OlkOtBXd	1b8kpp4DUwt1hWaxTiWQhD	5ZVLLME05cmciSZz4IGcZu	Que Pena (Ele Já Não Gosta Mais De Mim)	55
0C13P4IghHNFPjt4zIJ8vX	1b8kpp4DUwt1hWaxTiWQhD	5ZVLLME05cmciSZz4IGcZu	Baby	55
3ejU8JMenktibKkNz9dPBL	7HGNYPmbDrMkylWqeFCOIQ	3PlAbFQa9MEymxTgQC51wv	O Leãozinho - Ao Vivo Em São Paulo / 2017	54
6kCjKljGsnyzXaKKH9Cbgu	7HGNYPmbDrMkylWqeFCOIQ	1xAQ6kW7DQZxTghyepHtzm	Sonhos	52
5X7YQ1Wp36sNprUKZSPLFK	7HGNYPmbDrMkylWqeFCOIQ	2AdVzfrkaWXUMJql8MIleu	Nao enche	23
0L1yQFYhyqNAWcBgIUV67g	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	Banguela	20
0SFPOFERSw2S0LHZKn1922	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	Santa Maria	18
2i9zvqrXQG26kEu2NTS7O5	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	Iuna	18
2pNPgdqUPD1o8hINF6wGqu	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	Amazonas	18
2A3yr7MEP0nuNUDILrcUzb	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	Quadras	17
2wwvaVeLrZoMXyoZka0Lhg	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	Cavalaria	17
4ikNVocxDbLrZaEZsF3OlG	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	Idalina	15
37o6Qp0N3sM45KuWrmggJU	7Im2r58zlLJIDfamqDjEE6	07VnhmPw4Ws1rvCN1z1rUz	Corridos	14
1NhN6IoHQgig0OBC2PhhK0	7Im2r58zlLJIDfamqDjEE6	52rJNDZsccAEI4HzSgFg2c	Saudação a Oxum	12
16G3MldzNlwg0Z5f3QqgqD	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	A morte do capoeira	26
1Zv4IM34qfZDUAXphMsgKy	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	Luana é	25
4MGnJCU8aFXT6LzQ7WHOzE	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	Capoeira de são salvador	24
4P2SJB4mGJ0DpusrKbrGBV	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	Cânticos de capoeira	23
0iSPxBpIugjKUCtaA09lJ9	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	Pisa caboclo	21
4KWBI1Wahst6TL5nCtdYco	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	São bento grande	20
7jqm2nYr4bgr5k3mPdO3Of	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	Iúna	20
77nHLoT85IkKuq8f0HOerE	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	Areia do mar - Samba de roda	20
2vI5ny3qb8S3sXdlxMl5P0	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	Cavalaria	19
28UlfpwBBPTpvu9nsgHp2g	6xQwC94a61f3bZwyl4UJXD	21qADgVDiEKEITcniQYFRW	Quando eu morrer, disse bezouro	16
1fEGtTZjrjJW8eUeewnNJR	4M5nCE77Qaxayuhp3fVn4V	3fzjXU2SSKero9gVMcPivX	Flightless Bird, American Mouth	68
5JEM7lT9uSyhUsKFXwGfSm	4M5nCE77Qaxayuhp3fVn4V	5NovnTHEYZjadICACf4yPo	Time After Time	65
1MxHIIzcTeFnaNsDGY3pfj	4M5nCE77Qaxayuhp3fVn4V	33zayrSBdboyCyGTjtQrsw	Call It Dreaming	62
6HbxpoChDH9ThadFOSAnma	4M5nCE77Qaxayuhp3fVn4V	7HsQnwEa1RXoPanfrRPbb3	Autumn Town Leaves	61
6UIxGIqWlO5wsddY44AV1R	4M5nCE77Qaxayuhp3fVn4V	169vCBCFaW2na816P8Ir7m	Naked as We Came	61
0QYgtwYCftkAqunXmvkZtr	1EI0NtLHoh9KBziYCeN1vM	6Q7WssoFXDJoqNEkn8LnWN	Forever Young - From NBC's Parenthood	57
6dDxgfvM8pJm7AzmLZB1nN	4M5nCE77Qaxayuhp3fVn4V	5tOzXq44rU4yCCVY94f6m7	Such Great Heights	56
7dP4k5nDDwI1qMDoz5m0f6	4M5nCE77Qaxayuhp3fVn4V	0jMBAo2pk2cEE0aJ3WseMl	This Must Be The Place	53
2xa9PoO42d7VjT0KqG5d3I	4M5nCE77Qaxayuhp3fVn4V	169vCBCFaW2na816P8Ir7m	Each Coming Night	52
6iw32k0OUKHildYsQTRnVB	4M5nCE77Qaxayuhp3fVn4V	1iGIqDBXm5HpTqHCvdc4QP	Flightless Bird, American Mouth - Wedding Version	46
45pUWUeEWGoSdH6UF162G8	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	Broke Boys	86
0sSRLXxknVTQDStgU1NqpY	3TVXtAsR1Inumwj472S9r4	5MS3MvWHJ3lOZPLiMxzOU6	Hours In Silence	85
7MiZjKawmXTsTNePyTfPyL	4dM6NDYSfLcspt8GLoT5aE	1RVXVo1puacM8aQ6hgQahi	Devil Eyes	77
62N2JSA0jHmSH7Va9t7hIf	4NHQUGzhtTLFvgF5SZesLK	47C7w4o1resDhr7jvYEpxE	Habits (Stay High) - Hippie Sabotage Remix	63
0uYmQ3X53P03KWj83u5I59	4dM6NDYSfLcspt8GLoT5aE	2EfibOMCoqEvr86D9dvAg8	Trust Nobody	64
4aVbFYIU67P8F5pqPakaXQ	4dM6NDYSfLcspt8GLoT5aE	7qjUz8e7jzTUPLbg17J8zc	Waiting Too Long	62
3kKbRNJmzSWdDgfKqJ9Eck	4dM6NDYSfLcspt8GLoT5aE	3ryK3lfTB9KcFC876ykgAy	Options	61
6ZT3coOj97F6CVvruPtnox	4dM6NDYSfLcspt8GLoT5aE	2VmLk5bAd5QjLtX7cHm594	Your Soul	60
4U9kJBr61UhO5srPib7zyz	4dM6NDYSfLcspt8GLoT5aE	3xdTckJjSyCfWePM4DrTOc	Running Miles	59
0TxPln0uhql4ucFGk1XISM	4dM6NDYSfLcspt8GLoT5aE	3a6or8qwEaFtPZFhEWVOTQ	Wrong Time	57
3bjLA6ukBcGtvhe5tybxp7	4dM6NDYSfLcspt8GLoT5aE	6cbYPzA3cmYlQD0JqsOjEQ	Different	57
1DehtVbbTjUQjxGaXd5PnH	4dM6NDYSfLcspt8GLoT5aE	6cbYPzA3cmYlQD0JqsOjEQ	Drifter	57
3EmNjy3zFszmAOCikiKxCd	1KEUVZo7CMTSJoM8doulOT	4t8bZNqNroLlMNj8p908VL	Bottom of a Bottle	56
7ryIN2iKJiWvvIgEUAZieL	1KEUVZo7CMTSJoM8doulOT	6f25XUNJkOsTg5XrX32q0w	Don't Ever Leave	46
7GXxHj3tEDoJJbeoiAFL5H	1KEUVZo7CMTSJoM8doulOT	32vTTEq3dQDej4V6vdNQUd	songbird	46
5mMbj4tHHK7rKA5xsjpxgy	1KEUVZo7CMTSJoM8doulOT	0Weyfoz5UL4BaLmqjrwY2r	a storm is coming	45
0hH4tifGuOUFfosHyWYksB	1KEUVZo7CMTSJoM8doulOT	32vTTEq3dQDej4V6vdNQUd	prophecy fulfilled	44
5OSxX2OPiEN4Y9xmxVbCuV	1KEUVZo7CMTSJoM8doulOT	4t8bZNqNroLlMNj8p908VL	Silhouettes	44
6BAsBBihclKUFYHFgfblVs	1KEUVZo7CMTSJoM8doulOT	32vTTEq3dQDej4V6vdNQUd	denial	43
2WABC8g95w3gco43ssbnZS	1KEUVZo7CMTSJoM8doulOT	7ff2gTB2vu17vAN59nutfR	Manifesto	29
7BwOeJFK3isNQjk0OSydYW	1KEUVZo7CMTSJoM8doulOT	35bHrnMSA8aZ0P5nemqhIp	Finding Myself	37
4Th8cKZu3Cv86XkVy0MvEC	1KEUVZo7CMTSJoM8doulOT	601sChSWKcqDH4qXKLWHVq	False Alarm	37
1yvZL7uOOShmjYNR16LUhf	67p5GMYQZOgaAfx1YyttQk	30DksLC22nJQRff9cd32Kq	Pomba voou	0
075IuZsbrbseQft103cyGf	67p5GMYQZOgaAfx1YyttQk	2vAbN8GEBdXE0cX7pfOHxR	Zum Zum Zum	4
3DWaW63wUHFFd3uPb3zxOG	67p5GMYQZOgaAfx1YyttQk	2vAbN8GEBdXE0cX7pfOHxR	Marinheiro	2
6wKFvNbzWbDYF3l8zhHG9Y	67p5GMYQZOgaAfx1YyttQk	30DksLC22nJQRff9cd32Kq	Finta na Ginga	0
4c0sQihy8sC6seVq58flWk	67p5GMYQZOgaAfx1YyttQk	78AINSlgE7iolq1bmGfBCH	Santa Maria Bossa	1
6OQbZkUt3lrAL5IxpnfWl2	67p5GMYQZOgaAfx1YyttQk	78AINSlgE7iolq1bmGfBCH	Berimbau Viola Soul	0
4GN2wb0tsbw6bYy547NVLz	67p5GMYQZOgaAfx1YyttQk	78AINSlgE7iolq1bmGfBCH	Capoeira Swing	0
76DHj55PsSlbUmBgtJFW19	67p5GMYQZOgaAfx1YyttQk	2vAbN8GEBdXE0cX7pfOHxR	Benguela Typhon	0
78Vr6h9qESHnTkN60Uiyak	67p5GMYQZOgaAfx1YyttQk	78AINSlgE7iolq1bmGfBCH	São Bento's Journey	0
1PNpMSjXiBDvcPGU72ZPPh	67p5GMYQZOgaAfx1YyttQk	2oFrL4aAUeQI9rHyUQ48bo	Angola Dream	0
4DxRJQrvZOwj3qcw8M6buA	6dGRShw3EqULdxZl9EEJYv	6hzBCRXB9kFWZQJ7CJiUl2	Valor da Capoeira	32
4mCBnL9grVQwl5CqBaWtfL	6dGRShw3EqULdxZl9EEJYv	2Af5jyVN1dvDTgeQGCFeVu	Paraneuê Paraná	30
3vUKsxHqRk4QLXPTiZrLVP	6dGRShw3EqULdxZl9EEJYv	5yB1c8G5CYXZh3kE5Mu8I7	Balaio de Café	31
4sjEulO9EpD7w41TaWx5Xr	6dGRShw3EqULdxZl9EEJYv	5yB1c8G5CYXZh3kE5Mu8I7	Essa Noite Eu Tive um Sonho	26
2lzigdrNwf0ORO1NcxOoUO	6dGRShw3EqULdxZl9EEJYv	2jNTcuGR3TVjOr5N9pPpQk	Na Beira do Mar	22
0hD3LwiqNdE3a8yVgFAUnA	6dGRShw3EqULdxZl9EEJYv	7gr2DDEXceRwPDpFst30zJ	Vou Ver Meu Mestre	22
44kQN9hPguaYxVoFa3Q8sv	6dGRShw3EqULdxZl9EEJYv	5yB1c8G5CYXZh3kE5Mu8I7	Mestre Bimba	22
4RXZnPwSSISh7uYWvJ1fth	6dGRShw3EqULdxZl9EEJYv	6hzBCRXB9kFWZQJ7CJiUl2	É Hora de Vadiar	21
4ZPWz8Lme2naqa1YLeUUk8	6dGRShw3EqULdxZl9EEJYv	7gr2DDEXceRwPDpFst30zJ	Negro Que Veio de Angola	21
3HwUZwgi9hxqd0FzcJ7WAs	6dGRShw3EqULdxZl9EEJYv	3vo2sB3t9FaGIbpohfrM1J	Riachão Tava Cantando	17
0ENvhTTww1MVOulrzuxSmu	7oEkUINVIj1Nr3Wnj8tzqr	7dBoyhnlxf1DvmWxtgQPLr	Toda Menina Baiana	55
7CjSjWTdVPD0ov82Qz55Xb	7oEkUINVIj1Nr3Wnj8tzqr	53eqd316Rs3te41yGRovYz	Aquele Abraço	52
5jKg6K5LjLH4RkVpxXqO6W	7oEkUINVIj1Nr3Wnj8tzqr	525oSOShPTFiuHE1DIZttf	A paz - Ao vivo	52
1G3tT3xLodVLyZV7MQDXin	7oEkUINVIj1Nr3Wnj8tzqr	4CzqCaWsFEzNWWugq0EfUV	Aos Pés da Cruz	51
48QajhR9A10V7uM2UbIWxO	2d9LRvQJnAXRijqIJDDs2K	0ucGkC2GM4IBycOIAw9eBj	É tudo pra ontem	21
6j7cLMzPmnmlP5f6qQk9Cl	7oEkUINVIj1Nr3Wnj8tzqr	6IIhhDMiY6Abab01TmzLiV	Se Eu Quiser Falar Com Deus	50
38c0b6ZOc5g8WRZe8ssqlU	6qgc4bSHhzZxnJ01WDEAHt	3FQ9S9YvMGYzNMvXve9ulB	Siri De Mangue	27
0OSvRcSUm7LcDqpUeM69p9	6qgc4bSHhzZxnJ01WDEAHt	6p83U6vuMZYV1kkhUbyMIG	Como Vai Você	26
1n7VhRXtAIrzJFyQgs1rHv	6qgc4bSHhzZxnJ01WDEAHt	6p83U6vuMZYV1kkhUbyMIG	Sou Capoeira	26
6tTsNfuUnA8JbGY8GvupSt	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	Lá Na Bahia	16
45uq0gzKNTbLQz9vNJCnff	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	Não É Brincadeira	3
4zMROpckk80sLKjw6tkawT	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	Livre Como Vento	3
6Fnn1LaX3P2Cp5v8j4xKus	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	Jogo de Dentro	2
3C20qDtHYaVtofa6LhzNa1	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	O Segredo da Ginga	2
1Dpy0E104inl2X65Ql3Y6V	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	Aruanda	2
3ji7Cq0BDAyOZqeRJpDzie	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	O Berimbau Chorou	1
5tW7ndPplZCfvI1MOHHUmu	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	É Valente	0
0EzVzowY6rIB8VpiLLsRYK	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	Samba de Roda	0
2b8YEV18sPCRStHLIK3aUg	7qJAk8CiXUgDPPUF3REKr2	78AINSlgE7iolq1bmGfBCH	Banguela	0
26qUQwpITcSERRQHKoAOVC	5SKEXbgzIdRl3gQJ23CnUP	57XEL26edJ9dAhxH9thg20	Paranauê - Bonus Track	27
48cO0bR6orzUT4csoMLNNn	5SKEXbgzIdRl3gQJ23CnUP	57XEL26edJ9dAhxH9thg20	Maré da Beira Mar	20
3LldLxInVpaT0AgIDpn4vw	5SKEXbgzIdRl3gQJ23CnUP	57XEL26edJ9dAhxH9thg20	Paranuê Pomba Voou - Bonus Track	16
3G2r49FbOhh7osxOwLFFBX	5SKEXbgzIdRl3gQJ23CnUP	57XEL26edJ9dAhxH9thg20	Zoom Zoom Zoom	16
7Li7QfaykOzZn1M2kExVft	5SKEXbgzIdRl3gQJ23CnUP	57XEL26edJ9dAhxH9thg20	Capoeria Funk Carioca	15
3XxM98K1e0HSdNIbpYhOVQ	5SKEXbgzIdRl3gQJ23CnUP	23xCA877rpNuH1YOehpm3Q	Marinheiro	13
7rgjTkoEzielkTQH5txOTC	5SKEXbgzIdRl3gQJ23CnUP	34IaQdgkecjJn1XuFGb1kF	Potpourri 2	12
49Pbi6nYfpkBZLjLE41LW8	5SKEXbgzIdRl3gQJ23CnUP	57XEL26edJ9dAhxH9thg20	Marinheiro D&B	9
4zegu7nLeNfg61wxkOMY8C	5SKEXbgzIdRl3gQJ23CnUP	23xCA877rpNuH1YOehpm3Q	Santa Maria Bossa	9
1IGh7ZesvXXgiNlViqVqh8	5SKEXbgzIdRl3gQJ23CnUP	57XEL26edJ9dAhxH9thg20	O Canto do Berimbau	9
2M2itA0spt6ZXit7l21WMJ	1cIz2h3ERs72r60yw78Deu	1YTS3nXEQvTSKnJK8ccN0C	Lights Go Down	61
0c7OcnAQz6H3IIzQA3MP6C	1cIz2h3ERs72r60yw78Deu	7DrcBhY34PI4wgF16iY2E5	More To Give	43
7xonaZK7T4Z18vpx8LMNV2	1cIz2h3ERs72r60yw78Deu	3FGBDhlwrAPNv486sGmYSS	Exhale	42
7lrPlOCR3zXpXR9ZNHAOkX	1cIz2h3ERs72r60yw78Deu	2m9mAypAFaG33u60S6fYWJ	You'll Be There	40
6SmvawO0Gp3P6B7b1A9dme	1cIz2h3ERs72r60yw78Deu	073ct5hRKoMoyYgTtZ6omK	Movies	38
18K5KELzE7eOlNSJK331T5	1cIz2h3ERs72r60yw78Deu	5pNSuaEliVDmgJEWZoopSh	Planes	35
44Yt3A3eD9WuFpSAMNcN9M	1cIz2h3ERs72r60yw78Deu	5XoxmvsEqRrsHMooW6DLyx	Comply	34
22gwoAmeEcuEXRykQYkCEg	1cIz2h3ERs72r60yw78Deu	5r1COi4fv9t1woJqdnfz3A	Like Me	34
3PdwZoy7TJcPGw7GI8GI4u	1cIz2h3ERs72r60yw78Deu	7vNlIGuuwVCwO4YhDojVdx	More To Give - VIP	34
6dB6hoCnZMh8HHnDwC6uzq	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	No Clarão	13
3UJi2gDm3F83DzoKpXQmK6	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Adeus Adeus	13
5nD10SsobH1vinpLywA2v0	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Quero Ver Cair	10
0SaX3d0lQxVk10l0BogLm6	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Capoeira Matou Um	4
5EpJgg2VVcY4d3eXr1xGfa	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	A Lição	3
4pWGuSvx4lsYz2TNAfddMN	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Eu Não Sou Daqui	3
745opsndWgiHRATVJnr9G8	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Mandei Benzer	2
31q8oDJXYeGeOToU7T1uDH	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Corre Agua Sem Chover	1
4p4TOJ0NSSZAviCvBZPiqs	4CrK2BAeyd3DIt2M2ELPJ4	78AINSlgE7iolq1bmGfBCH	Na Bahia Tem Capoeira	1
2Xy1UIVfOlukyye6Fd0wrI	20gsENnposVs2I4rQ5kvrf	63P6lbTxTP2OpbC7SOrIfK	Follow Me	72
73QyyUMMvtNELmULI4FOsp	1IueXOQyABrMOprrzwQJWN	2iylTVQEMYGQ9CUgn9MAAT	You for Me	72
73ucpKq91TuejrLHgzDNHK	5CCwRZC6euC8Odo6y9X8jr	6hKHpD9mnIjiJWmAunnQT8	Poison	66
0FEk8LwY8h4rAR63ggfhV0	2o5jDhtHVPhrJdv3cEQ99Z	1BsVW2iNL53ZJY573fjHKK	Ritual	61
5Fla3zyOCcIRqrDoKLU0DP	5CCwRZC6euC8Odo6y9X8jr	6Vn8F3hERVHYYz5RfKmsAN	Let You Love Me	65
2ia7iiEtpiOL2ZVuWxBZGB	5CCwRZC6euC8Odo6y9X8jr	415fhs8Ft2VMFY0rWLK4BD	I Will Never Let You Down	65
5rlMVKnvE6ZSzNCs8ZyHqU	5pUo3fmmHT8bhCyHE52hA6	5pbvTLpIZB3XWRuUS9ZxHm	For You (With Rita Ora)	65
46xkXPGjR9Ig9BcaTUNus3	5CCwRZC6euC8Odo6y9X8jr	6Vn8F3hERVHYYz5RfKmsAN	Your Song	63
3y3brCCecHC3Db18aIOnny	23fqKkggKUBHNkbKtXEls4	1Z7WbPmn7QFoJ2DrNfEehz	Carry On (from the Original Motion Picture "POKÉMON Detective Pikachu")	63
6Xy72HZ9nf2jx48dQuF1mA	5CCwRZC6euC8Odo6y9X8jr	6Vn8F3hERVHYYz5RfKmsAN	Anywhere	59
2DgAknj9a6riqm4h7mZdGD	1b8kpp4DUwt1hWaxTiWQhD	1K9kdxE8GhOHuOnFYxoBco	Cuidando de Longe	58
4vrW1O3nZJM8QQN8gzXubU	1b8kpp4DUwt1hWaxTiWQhD	1LpG0vjBhKLcUOcgGlPJ1a	Chuva de Prata - Ao Vivo	56
1WhWizm70M63k5UVIHX1Fe	1b8kpp4DUwt1hWaxTiWQhD	1K9kdxE8GhOHuOnFYxoBco	Palavras No Corpo	51
4OID5ZgFFWJzAH5jdetEAn	1b8kpp4DUwt1hWaxTiWQhD	1pvPrGENPU0yj9ocp0Zvpd	Corcovado - Live	56
0l9BjXMUwxN8QHmD8n7hFF	1b8kpp4DUwt1hWaxTiWQhD	7eSEnOlFor4HMoblLfwLXz	Pérola Negra - Ao Vivo	55
6yVSp9H2STyLeOs7pjy2w4	4ERtgeBbWRkFzIz6LaFCeY	3I4DmkyMBifLVwrCT3eQ82	Hands Down	62
1EotcFbWTbMCXeKFVEtX6Y	4ERtgeBbWRkFzIz6LaFCeY	6HNDip6KYIQapVTDziA91U	Vindicated	59
6A4cQ6n7R5Kws0Gsan7gCF	4ERtgeBbWRkFzIz6LaFCeY	4RV8fgalH0XgEMg4CWWDrw	Stolen	42
1fZhHANKVFNZ9W8iSh76gF	4ERtgeBbWRkFzIz6LaFCeY	6HNDip6KYIQapVTDziA91U	Stolen	51
1VViTGNqiNV8zwe3b3tE09	4ERtgeBbWRkFzIz6LaFCeY	2b6f60fUMb0wSWWyFXBLfv	Screaming Infidelities	48
4NEAoEh4hZF1Tgp1QXrUHC	4ERtgeBbWRkFzIz6LaFCeY	0qByP4IV1nNHhLs3RfDrGB	Heart Beat Here	47
1w5dZMSwIM242ymwTv0PAi	7FngGIEGgN3Iwauw1MvO4P	0pPPbYqZd2Qtf5kqrQNKue	Hopes Up (feat. Dashboard Confessional)	45
7jvp8DZy7FtHeXdN1k8w2s	4ERtgeBbWRkFzIz6LaFCeY	7r7aUbWwuf3y0GY5ZUsQeW	Belle Of The Boulevard	45
2zpXEpZbAgQdhNyy6iwPwZ	4ERtgeBbWRkFzIz6LaFCeY	17z7tsbs0gZi7ASeae9saS	Circles - Recorded at Electric Lady Studios NYC, 2020	43
3aouFaljxig7RLEmPLFtnj	70TsVY28EcEUYSGG5Yw7mp	2TEE1RnUqjfSdOK5gxuswa	Bittersweet (Feat. Dashboard Confessional)	42
4QWceg3uZikNjrTu7WdAIo	6qgc4bSHhzZxnJ01WDEAHt	6p83U6vuMZYV1kkhUbyMIG	Sabiá Cantou	26
2O23IqySHayho5Vz6utLUj	6qgc4bSHhzZxnJ01WDEAHt	6p83U6vuMZYV1kkhUbyMIG	Capoeira Camará	25
6lZyOeja5VnjLcJXID5Hg8	6qgc4bSHhzZxnJ01WDEAHt	3FQ9S9YvMGYzNMvXve9ulB	Maculelê	24
3eikIG2eUqhYNKD9oMTuye	6qgc4bSHhzZxnJ01WDEAHt	6p83U6vuMZYV1kkhUbyMIG	Capoeira São Salvador	22
4Xs7u89f7XGy4Ayr7qMJ9g	6qgc4bSHhzZxnJ01WDEAHt	0kh4iDfosdAu9wYYCWuADE	Quem Vem Lá	20
23nUrTSlZxZcBepKnV1awN	6qgc4bSHhzZxnJ01WDEAHt	6p83U6vuMZYV1kkhUbyMIG	Ai Ai Ai Ai O Lelê	20
36ZakwjewtzwQBkC3quEeI	6qgc4bSHhzZxnJ01WDEAHt	0kh4iDfosdAu9wYYCWuADE	África Brasil	19
5tt394udRU89Pn2s3qPGaQ	1gIa65d5ICT2xVWiUJ3u27	5EatIo50si8CoN3ARke59W	Vai (Menina Amanhã de Manhã)	47
4tTZq61IKisspn9NhoJtYn	1gIa65d5ICT2xVWiUJ3u27	0hEDr5IFbF4mZBHffTZl61	Jimmy, Renda-Se	40
6A7bFw2HCDcINCCQc8YrMb	1gIa65d5ICT2xVWiUJ3u27	2jOgajtpXNsinBpwg2dUjH	Vai (Menina amanhã de manhã)	40
3wyElammb2nsBW3C9fAkIk	1gIa65d5ICT2xVWiUJ3u27	40jH4AC1hwNv8DpLqqLeK9	Xiquexique	38
5kl98MGNOGnEeFCu4yjq9e	1gIa65d5ICT2xVWiUJ3u27	4g9eq1iulwITLm6N0xttpW	Menina, amanha de manha - O sonho voltou	38
5fwEN7ftDTrqTpxOwadeIX	1gIa65d5ICT2xVWiUJ3u27	3bHozwj5kK03Wk7vXyzqup	Lá Vem a Onda	37
1OVkk2RSizr8K76vJ5I4fH	5ZfHVIBVoMg0VjgUBU0alH	208EfBvaP5XUYayo4jb2kA	Kalundu	25
3eylvPuZoAkWdifEKCa1oQ	5ZfHVIBVoMg0VjgUBU0alH	208EfBvaP5XUYayo4jb2kA	Brincando na roda	23
1UYcrnSD8Rnoq2WF63bm1p	5ZfHVIBVoMg0VjgUBU0alH	00R7lDfWhAQcv72jlCni1P	Ladainha: Rei Zumbi dos Palmares	23
5YHU5831C6bRvOa6CVCM06	5ZfHVIBVoMg0VjgUBU0alH	00R7lDfWhAQcv72jlCni1P	Ladainha: História do Mestre Pastinha	23
5nB2JGElpjz3S1mvuRqtmt	5ZfHVIBVoMg0VjgUBU0alH	00R7lDfWhAQcv72jlCni1P	Rei Zumbi dos Palmares: Tim, Tim Lá Vai Viola	22
5OHtcQ9E8yBPMkBJErXq2X	5ZfHVIBVoMg0VjgUBU0alH	00R7lDfWhAQcv72jlCni1P	Rei Zumbi dos Palmares: Côco no Dente	22
3PiXFYaUEppQNIVd4oUHtm	5ZfHVIBVoMg0VjgUBU0alH	00R7lDfWhAQcv72jlCni1P	Retrato de Salvador: A Manteiga Derramou	21
5CnE8fSmlzy5lqRlMQLN8H	5ZfHVIBVoMg0VjgUBU0alH	00R7lDfWhAQcv72jlCni1P	Rei Zumbi dos Palmares: Tem Dendê, Tem Dendê	21
30HDhoUonXtlCNbCf0Ba2K	5ZfHVIBVoMg0VjgUBU0alH	00R7lDfWhAQcv72jlCni1P	Toques Tradicionais: Angola	20
7yipsQk69cuYXLUhNfjVAI	5ZfHVIBVoMg0VjgUBU0alH	00R7lDfWhAQcv72jlCni1P	História do Mestre Pastinha: Chula	20
27bGm75UZl3dAoAU7LNMia	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Luna	26
17OgIIdvc0KymFYcor26Gq	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Eu Sou Capoeira	24
6y9HlkxnspyN5oR72nq8fR	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Benguela	21
2LujgCdmK3q7E1MUoQtqDQ	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Cantigas de Capoeira São Bento Grande de Angola	21
0DOEEDHu8u8WibYECqV3jP	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Amazonas	20
44Lfg5afznXp2hPRJnSzOw	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Cavalaria	19
2pywyi09scGdkNi867SC5L	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Cantigas de Capoeira Regional	17
2SE3og1vCHpzjeoCavKhAm	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Toques Tradicionais de Capoeira Regional, São Bento Grande	17
2h57VIrvd8hOcN0y0Sys2v	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Santa Maria	17
0CQjhFLfrrTjKqulms4Qdw	5nJ5xDXFO4czh2gJ9f4wto	3birV9Fqgob9yiPaz2cQ8u	Idalina	16
4Jm9RwZ2C46J06ARRllUs5	5sEDTHJJyDEWVFx99hGSIb	4gecrZPdDxMlVxBtpobpxr	Thor: Ragnarok	46
6ksqO0S2mvvwpyMhVpVYFx	5sEDTHJJyDEWVFx99hGSIb	4gecrZPdDxMlVxBtpobpxr	What Heroes Do	37
646yYgVW5sZWJloaGEW728	5sEDTHJJyDEWVFx99hGSIb	4gecrZPdDxMlVxBtpobpxr	Ragnarok Suite	36
30xHm3p2stFpmHyq0Rfm9x	5sEDTHJJyDEWVFx99hGSIb	5y3IHg8hVlbfbFgIUWtCeL	The Sims 2 Theme	35
0CqbwdoEU3YHSC6yYAdd5c	5sEDTHJJyDEWVFx99hGSIb	4gecrZPdDxMlVxBtpobpxr	Planet Sakaar	34
4MJ5RyJXc0COLaoeBxvgpw	5sEDTHJJyDEWVFx99hGSIb	4Dq65Lwt50IB0eAKuT10nC	Rift Apart	34
4wANVTeoqbvjEExHqcbJzp	5sEDTHJJyDEWVFx99hGSIb	4gecrZPdDxMlVxBtpobpxr	Where To?	33
4dSLsmWv6qn6HMM4UeX7Yr	5sEDTHJJyDEWVFx99hGSIb	5y3IHg8hVlbfbFgIUWtCeL	Sim Time Sim Place	32
3il2koOrabDw2G0CqelDmO	5sEDTHJJyDEWVFx99hGSIb	5y3IHg8hVlbfbFgIUWtCeL	Sim Heaven	32
2a78kBS0eSbDZGExEI6sFp	5sEDTHJJyDEWVFx99hGSIb	5y3IHg8hVlbfbFgIUWtCeL	Makeover	32
2Gf5quhybNaFtyuqjkuaQM	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Orquestra Nzinga de Berimbaus - Versão 3	19
2og2K6jY8pt5sfVtqLz4UC	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Camugere	18
1FKDd7KScFEpz7QJRDYDoq	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Menino Preste Atenção	18
4yuOEKDCj0yJko2uo12zBv	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Corpo Fechado	18
6zadj5fkeetxH07dVbeiQZ	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Vou Embora pra Angola	16
7FfxbaoWXc3vEhXChEhNpO	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Chula	16
1JsGPnxkxlGGAnFtYmtNSj	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Jogo de Dentro, Jogo de Fora	15
0gs7nB5nWGLx80u4Xmhdaq	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Santo Antonio É Protetor	15
67bdhgDvzzWeoXwe3Nd2dM	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Pisei na Folha Seca	15
1ACxSxd20k2neg8hmUp01j	1K9pNfOfxZFfbEgoOmjV13	4BtGSQwvM9K67Gx9VanBFy	Ave Maria Meu Deus	15
1mCNkrKh9NEgxJWUqHnEgo	4Lm0pUvmisUHMdoky5ch2I	728y0VvMcIuamGmKhDpa6X	Not Strong Enough	61
1WxF4gMsFXnKCyh48CW2RI	4Lm0pUvmisUHMdoky5ch2I	1rmhml18o2KDLUpYMXq6VQ	I Don't Care	59
1JrtC2ubRFV2xB79J3UY1Z	4Lm0pUvmisUHMdoky5ch2I	1rcVwAd9FXK9ONouJVeRSF	I'm Not Jesus - International Version	58
3bAoghFUTVwGYXYnzRqhCf	4Lm0pUvmisUHMdoky5ch2I	3SZrExQkv0QGbNV9MJUna0	I Don't Care - US Version	57
00i9VF7sjSaTqblAuKFBDO	4Lm0pUvmisUHMdoky5ch2I	3W8ep9kCGVEf5TLFtRRB2T	Talk To Me (feat. Lzzy Hale)	52
3uErbNGaNIPJkRlMrLxR9Z	4Lm0pUvmisUHMdoky5ch2I	6leqa6QQESn76w64IdN9yQ	Nothing Else Matters	52
6Tkzu1nvzb5tHVsjiu8IDF	4Lm0pUvmisUHMdoky5ch2I	728y0VvMcIuamGmKhDpa6X	End of Me	52
2mPpPlCJKhjojKylWEs4ZC	4Lm0pUvmisUHMdoky5ch2I	728y0VvMcIuamGmKhDpa6X	Broken Pieces	51
2a8ND713OfNIdlJD1p8jB3	2xiIXseIJcq3nG7C8fHeBj	4drZZN0HTkJzcdlPmmQyqG	Someone To Talk To (feat. Apocalyptica)	50
6W4pRJhZhyO3rz9vTITKRB	3o2dn2O0FCVsWDFSh8qxgG	3slBXddUn27FSk2rOB1Uy1	Angels Calling	47
5QZKcQDp0tCcvMdyqEciBV	1MXZ0hsGic96dWRDKwAwdr	2PFiZ23ZyPTcgwmXk4X6o0	Tommy Lee (feat. Post Malone)	67
5DPASDOoVakOcD8EIhb46T	1MXZ0hsGic96dWRDKwAwdr	0imwCieoxougGmptrN1WAx	High Right Now (feat. Wiz Khalifa) - Remix	65
341lTIxmhybbQsgydwJiFx	1MXZ0hsGic96dWRDKwAwdr	0ntJqUFZt7XQmRycj6typz	Stuntin' On You (feat. DaBaby)	64
18LhA0zBzAa2YnhcN3hWGa	1MXZ0hsGic96dWRDKwAwdr	37m9KwQ4yNWbsThepwDvAK	High Right Now	61
3McTpsUQfEDrlNd2ikro2E	1MXZ0hsGic96dWRDKwAwdr	0N6FHcZaScT0eCiBNfP3qd	All the Smoke (feat. Gunna & Wiz Khalifa)	58
7sMGW6lb6zKVvLA9IHUCgG	1MXZ0hsGic96dWRDKwAwdr	7oKFm1hLdLjPv9fMmmiY6h	Understand Me	55
3tfxO1TvXXQ7HymM15lGt1	1MXZ0hsGic96dWRDKwAwdr	37m9KwQ4yNWbsThepwDvAK	They Ain't You	55
5jDx8OLmJpnLKiDStY8US7	1MXZ0hsGic96dWRDKwAwdr	51XUjHEsoH2qrZs2D79gdC	Sex Symbol	53
4Rq2BMG5VWMhb2whSx8bf4	1MXZ0hsGic96dWRDKwAwdr	4JS5yC6k5oNfbzy2FexLBU	Tommy Lee (feat. SAINt JHN & Post Malone) - Remix	52
2OGfK0dPkEdALPwrmYXrVE	7mX72Bq2iXNr8fZdu23fQL	79YZv5y3Heiw4QZ6i77FTE	DENY (feat. Tyla Yaweh)	52
0a9uf4gKoAXwCuAjxt90Sz	14ep6TM2JzapH5nk7vaora	5zSfOxsBE4yFfcbc2gRd4q	Mind Control	16
6yxPd3usemvhanh73TzwXi	14ep6TM2JzapH5nk7vaora	5zSfOxsBE4yFfcbc2gRd4q	Good	24
6VCC4JE3vE8c2szV0SWld9	14ep6TM2JzapH5nk7vaora	5zSfOxsBE4yFfcbc2gRd4q	There Must Be Discipline	27
4lEOGsYnc9wdxkJGkHuXAm	14ep6TM2JzapH5nk7vaora	3nbCR6OsvvZTYI0yXNGxFA	Any Dream You Wanted	0
4pj2L6WbBAlevdxx6jgm32	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	As Above, So Below	52
6UgmF3c0nWYeqVs7prJo9C	14ep6TM2JzapH5nk7vaora	5zSfOxsBE4yFfcbc2gRd4q	Discipline Equals Freedom	26
2JiNqhSpFgkxgHNFRYjpDC	14ep6TM2JzapH5nk7vaora	5zSfOxsBE4yFfcbc2gRd4q	Unbroken	14
5wBaNy59nK8hJnx8AB2zRe	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Roots	54
44QQarpAdUDdAidS5ddJIL	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Salvation	31
0nLOl4fSiBZKGFla5pLUtf	2yEwvVSSSUkcLeSTNyHKh8	6yWMN087PgSimbcVmHLEwG	Ænema	61
1HNRXicnRXw34nouoSQi3c	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	River of Fire	46
3WZiHsjugLgasZW7wGemNN	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	The In-Between	55
6AzrwTzu1Vhl2t13h3fNVh	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Half God Half Devil	48
01NVKlabAce8Nw70qxgY3d	14ep6TM2JzapH5nk7vaora	0pC7lxDWdDQntOfCPfvbj6	Be the Hero	14
6AioOohg4bQZFA4jIYQQ2r	2yEwvVSSSUkcLeSTNyHKh8	6yWMN087PgSimbcVmHLEwG	Forty Six & 2	67
269xqcgGTN9PlivhUkOLhX	00FQb4jTyendYWaN8pK0wa	7xYiTrbTL57QO0bb4hXIKo	In My Feelings	66
3zUwwYcmob803s2Bkck8GY	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Black Wedding (feat. Rob Halford)	59
3jg7Dbq8xxUGLNeUe8TUYv	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	No Me Importa	39
54sEj5GIx2EW78nRDyC58R	6tbLPxj1uQ6vsRQZI2YFCT	7jMxSZ332lLfENKNEFAd9P	The Fighter	48
2Kerz9H9IejzeIpjhDJoYG	00FQb4jTyendYWaN8pK0wa	7xYiTrbTL57QO0bb4hXIKo	Love	68
3AOcpwgy3V2Fwg7B8PZfKl	5HYNPEO2NNBONQkp3Mvwvc	36z4UWQiasJxyuePtCH5Ij	Creep	58
1PfkFgRDLuSggFQAd8uvXp	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	The Beginning - Interlude	30
0mt02gJ425Xjm7c3jYkOBn	00FQb4jTyendYWaN8pK0wa	7xYiTrbTL57QO0bb4hXIKo	Lust For Life (with The Weeknd)	71
6wl8vrSR56Tm7GSXjAVP91	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	In the Air Tonight	47
45OFlmffEQJWlHu8Yf6Q1R	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Joan of Arc	42
0kgXAjZ2y0kGjKUekY0H8t	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	Mother	40
0W8oh1Zst7Y1GczYEDOIuS	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Oh Lord	49
2g4x7SwGAU05mTQqLKroFg	14ep6TM2JzapH5nk7vaora	3aTXBCkLau3VP53JXez2hB	Good	0
12f3kgz9J1vU0Sd3qISMuJ	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	Legacy	39
3J84AjpIGKYHL1NDKmM2pB	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Witching Hour	43
4LKieNzKrd4nk25Mq8dkfu	14ep6TM2JzapH5nk7vaora	3aTXBCkLau3VP53JXez2hB	There Must Be Discipline	0
5mkGfmJGFZpwK9nA5amOhv	7AQzXO3NPNQsI7oNu5rC3r	5dR0fhE3oveLRSUMMQ3oRB	Sex & Candy	70
1lATXTBJDHwawvT1UfxWu3	2yEwvVSSSUkcLeSTNyHKh8	1fvWYcbjuycyHpzNPH1Vfk	The Pot	68
4S0oduY2t0ajpZQ6T9kAq1	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	Born In Flames	33
5WW76v0NDWK5Wy5tfai5G8	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	Fly Like An Eagle	40
76AYOdnKWcSLviCsKDXyS1	6tbLPxj1uQ6vsRQZI2YFCT	7jMxSZ332lLfENKNEFAd9P	Sick Like Me	53
79D6ftjlstX0zTqag7jw4z	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Twin Flames	36
1Ym6aMuT5bliaZMC67AmPp	00FQb4jTyendYWaN8pK0wa	7xYiTrbTL57QO0bb4hXIKo	Cherry	73
3aARLhAch8wF1wDMzkL7nJ	6tbLPxj1uQ6vsRQZI2YFCT	1JIIc6FIetBaCAzWkCSBjL	Lay Your Gun Down	32
5QqyRUZeBE04yJxsD1OC0I	00FQb4jTyendYWaN8pK0wa	7xYiTrbTL57QO0bb4hXIKo	Summer Bummer (feat. A$AP Rocky & Playboi Carti)	65
5V2Tg65HSuF0hB22SlNRoa	6tbLPxj1uQ6vsRQZI2YFCT	7jMxSZ332lLfENKNEFAd9P	Natural Born Sinner	41
6eygbzyL6hY8jFQTARDuo9	00FQb4jTyendYWaN8pK0wa	7xYiTrbTL57QO0bb4hXIKo	White Mustang	66
0qSVzDIOLWqIoOHjUUjv8c	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	God Is She	36
0QB98b4YFxtW4NQ9narHQM	6tbLPxj1uQ6vsRQZI2YFCT	7jMxSZ332lLfENKNEFAd9P	Big Bad Wolf	55
3ZKRAzNAsiJrBGUM2BX9av	00FQb4jTyendYWaN8pK0wa	7xYiTrbTL57QO0bb4hXIKo	13 Beaches	64
3ltS4rlFrCYkdQqGzVjXBi	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	We Will Rock You (feat. Maria Brink, Lzzy Hale and Taylor Momsen)	50
7x2jq2kAhxDH3M6FcgJKbs	6tbLPxj1uQ6vsRQZI2YFCT	28IlwCwIt69Xh627BwUC8F	The Red Crusade - Interlude	29
5gbxjsBPzpjZuPvIptYvPi	6tbLPxj1uQ6vsRQZI2YFCT	7jMxSZ332lLfENKNEFAd9P	Bones	39
7lSdUlVf8k6kxklKkskb1m	00FQb4jTyendYWaN8pK0wa	7xYiTrbTL57QO0bb4hXIKo	Heroin	63
03sEzk1VyrUZSgyhoQR0LZ	2yEwvVSSSUkcLeSTNyHKh8	7acEciVtnuTzmwKptkjth5	Pneuma	63
1JkZg3eMQTmTn93E8Yd3UL	1LB8qB5BPb3MHQrfkvifXU	2sXJQdHykPYcRQ7xFhwzMR	I Want You to Want Me	68
0lP4HYLmvowOKdsQ7CVkuq	0RqtSIYZmd4fiBKVFqyIqD	5sHvTCk793vr9EkSKcD7IT	The Kill	75
50Re2bLgXqG9qN7v2QHNTm	5KDIH2gF0VpelTqyQS7udb	2JHjVEvYNVQ9FUUMB2LcMl	Outside	61
1u8lE1YTkgQrXnMpPpVUC6	77aDWNQLrjzW7i6YBRhCbQ	5X7aXBpPLFxNvQGlZv7Nl6	Fuck Me	33
2YwlwV98tjcKF664eEAAyV	5HYNPEO2NNBONQkp3Mvwvc	36z4UWQiasJxyuePtCH5Ij	Take Me To Church	42
58AwxWLaRHn2lTqqH9dLkU	2MqhkhX4npxDZ62ObR5ELO	6471rrLPKqZgXQ6TqN5AgU	The Reason	51
7yWEPokjQeePPTZD9RqxP4	5HYNPEO2NNBONQkp3Mvwvc	36z4UWQiasJxyuePtCH5Ij	All About That Bass - 2015 European Cast	41
32j279x3imcBWBu9OaHX2n	1KCSPY1glIKqW2TotWuXOR	7hwhuEQT4Fp5bzwLlYZtiz	I Am Here	57
0aTiUssEOy0Mt69bsavj6K	2yEwvVSSSUkcLeSTNyHKh8	7acEciVtnuTzmwKptkjth5	Descending	56
0cKk8BKEi7zXbdrYdyqBP5	67ea9eGLXYMsO2eYQRui3w	5MqyhhHbT13zsloD3uHhlQ	Behind Blue Eyes	69
0eZBeB2xFIS65jQHerispi	3TOqt5oJwL9BE2NG9MEwDa	1ROVEUk4lc2vD4a0IN1TWS	The Sound of Silence	70
2ae6mkuD2gJnJQADl488et	2yEwvVSSSUkcLeSTNyHKh8	1fvWYcbjuycyHpzNPH1Vfk	Intension	47
2iy4qPWFbtzGSDT8xzKIMb	3G5WkIXbDxdNoGWHZbXDjI	7mTxBqXEBsSmtTOk8N6NIp	T*ts Up Mask On	24
3MGJF1CDFGfjXESL2Heva0	1KCSPY1glIKqW2TotWuXOR	2dpS2uYlkzDsPjl3IZbNjD	F**kin' Perfect	66
4hTg9q0AnxtH4yZKeRcMin	74eX4C98E4FCrAMl39qRsJ	3KHkCXWAJANXQztdpMmKt4	Hallelujah	54
51G4UdHXjcNrdLueS1ohzU	6CwfuxIqcltXDGjfZsMd9A	3yIfX4ZW0sYJyw1EMVvfWr	Purge The Poison (feat. Pussy Riot)	43
5xrHvVmSF3ui0EKI8FArv3	5HYNPEO2NNBONQkp3Mvwvc	36z4UWQiasJxyuePtCH5Ij	Bad Romance	43
70C4NyhjD5OZUMzvWZ3njJ	6zFYqv1mOsgBRQbae3JJ9e	69wjSAZXZiD2EBia3b3gxL	Piano Man	75
5Pj9iXYfe607U62YwSF5rC	4QM5QCHicznALtX885CnZC	3GWdoCGEZLjrsofidLFwgV	Daddy AF	55
0eHxqgbpr2ptXQtw8Ab3ve	5nGIFgo0shDenQYSE0Sn7c	3lFQ9ihSNR5YD0yi0yTzdC	Good Enough	51
4l52LL7FmhrUXF1F9zV62c	5HYNPEO2NNBONQkp3Mvwvc	36z4UWQiasJxyuePtCH5Ij	Gangsta's Paradise	46
170yBuCB3FvhMG2DMSQ4IG	5qa31A9HySw3T7MKWI9bGg	1cppTra3p7ByUGqNsv3Qla	Shh...Don't Say It	53
2tAzcTFry1OhmNERFjUR93	6tbLPxj1uQ6vsRQZI2YFCT	3u8UbYIIZkOtawXLDuu57l	Whore	64
0PhhFpOOM0dOJhMsjHtypt	3G5WkIXbDxdNoGWHZbXDjI	29omXgzwHznEed7roEZgRM	Don't Be A Ball Sack	22
0V7c0zElQpTNGUwyC18YMM	5HYNPEO2NNBONQkp3Mvwvc	36z4UWQiasJxyuePtCH5Ij	I Believe in a Thing Called Love	32
1YQY7ODoHmrfDwzgshRBKq	5HYNPEO2NNBONQkp3Mvwvc	36z4UWQiasJxyuePtCH5Ij	Paper Planes	31
2Dqg2mRbfIVKhBZleNrgmH	2yEwvVSSSUkcLeSTNyHKh8	6yWMN087PgSimbcVmHLEwG	Third Eye	48
3H8BLMeJCoXQsozaXi2xzy	1AwO9pWEBSBoWdEZu28XDC	19ZUoDOWmYb59rG5p5WoSW	I Want to Be Evil	44
5C5gvDZsl6d8bh89URfKHr	4yvcSjfu4PC0CYQyLy4wSq	6qb9MDR0lfsN9a2pw77uJy	Pork Soda	62
0UdBCetwMDQO7JIhi7Waik	1moxjboGR7GNWYIMWsRjgG	2FgknX5e7fJlriQtxvpLhZ	Girl With One Eye	48
1lqTpQzSgGZZ850bimyxMP	1caBfBEapzw8z2Qz9q0OaQ	0jHGiwT6YJhI1OV75cbnlW	New Devil (feat. Maria Brink of In This Moment)	53
272Z4tzaSMMcgrZ0R494S2	0vYkHhJ48Bs3jWcvZXvOrP	7xg7u99lilTCPbaRfnYuy6	Gloria: In Excelsis Deo	50
4KWntZBFeQOdoYNgPwcEGe	1ET1wIkDmuCBC80XcTr3Sg	6Ymyr8aoX1jHVvrbGpyL24	Kill! Kill! Kill!	38
7qzNc93sUMR3vHt5WADmOa	6tbLPxj1uQ6vsRQZI2YFCT	3u8UbYIIZkOtawXLDuu57l	Blood	58
06WohfoFEUa5faNy8f9S5N	6tbLPxj1uQ6vsRQZI2YFCT	3u8UbYIIZkOtawXLDuu57l	Adrenalize	57
08M4WOUOlAHeZEmj9gEyKt	6tbLPxj1uQ6vsRQZI2YFCT	4oWkraZHpmMWsR96zVKaOT	Adrenalize 1983	48
0CUbuoOBaYAGSYmjjSlNON	7gcUMQcBkw833YqXciq0WB	4HyW5B0Xi7iY0rV6q9tlVs	NERVOUS	35
0Yg1hSAUgd2AAneReFOVzS	7x3f7c0fBanNlQwpx1255g	0TcP4beTgxQmREuHJ7BBY2	Tous les garçons et les filles - Slow	57
0cELvuwJW1acISUHYB6suj	4iHNK0tOyZPYnBU7nGAgpQ	0SHpIbyBLUugMXsl3yNkUz	Emotions	62
0eHIMJCzU1QV0R6OHeLOuR	6tbLPxj1uQ6vsRQZI2YFCT	7jMxSZ332lLfENKNEFAd9P	Bloody Creature Poster Girl	44
0q6WphTLKGQksoPMiNB1LJ	75xNYf2GU5wtQqBrd74SlY	12wZUFIsldyDhaPneJX9iU	Whore of Babylon	48
0tvw5vooI7iT74m2x1T7HU	49aaHxvAJ0tCh0F15OnwIl	6RoosIKwrQCNYyAw5xidRl	Fiction Feels Good	24
1ZpcR68PKaoz8DpQDRqFEE	4SdIXLzfabqU61iK7SnKAU	2ZPgzxiWsWCmCaC9jzNumu	GAY 4 ME (feat. Lauren Sanderson)	57
1eNThMHqjtDhoyGXytVBvh	6tbLPxj1uQ6vsRQZI2YFCT	5ErztBSKEEKJDYzmlAbOy2	Lost At Sea	39
1gsYCXkisSnnjBb3qwYZoc	7jZMxhsB8djyIbYmoiJSTs	5vQaqB1ZfaOW6BSEGuQ8HC	Ur Best Friend (with Kehlani)	60
1gxdWpeOUBpvB908fiZs4D	00FQb4jTyendYWaN8pK0wa	6QeosPQpJckkW0Obir5RT8	Let Me Love You Like A Woman	63
1kYR2wTYZUsZ2Gcx7yPYSZ	6tbLPxj1uQ6vsRQZI2YFCT	7jMxSZ332lLfENKNEFAd9P	Dirty Pretty	46
1w1hr8DdUGqGF4qyhCvGhP	0cGUm45nv7Z6M6qdXYQGTX	1on2vSrrLw2LJfbqSgocJ6	Honey	31
26nwOFTFf5JLDBFOK1MMe1	3ZJxEmjYZd5VOqZ8o3aXiL	7n7QlAD8PJQswHuWW8Xdm8	COME 4 ME	42
2IHcAcZ4D6QRGZgmWGgGhc	11T0XSkxSB5KUPTe8P8BOl	5D6nWYP4m00b3LsXYOkzir	Seedy Tricks	33
2MaWDFu5l9SKXNDd6qCIx6	5qa31A9HySw3T7MKWI9bGg	1cppTra3p7ByUGqNsv3Qla	The One	48
2i9yWmgHVqWW1vmXtxUaN9	202HZzqKvPsMHcbwnDZx7u	2QFXjy3u6Bl6ctdK9FS9eF	M'Lady	46
2m17BTWlZq0wtS9cpJsCfM	4Gzfk9Lxm67nBs7E9BZjzG	2HtT4gawEGgOvAPUO7tiU2	Kill Of The Night	57
2p1Cjaderx0MeKrAoHwchx	0Xkd9GsWwOYETVF0kPXZIG	6tjA8CqgIYfPoBMBansXBi	Follow Me	24
2ptbBxMTCbFBefVMXwrdSC	2cAXhrWAztXGwk6r15ibW2	5l7whBWhClQiC0pFLpPcRi	Dress	60
2zsWRxMcUdGjj8TnWkVKw0	100sLnojEpcadRx4edEBA6	600XgAY1N6sRPVczmBogiF	Hypnotic	64
39oHEZp6LFEmXLy8tKHcYf	3VjZEaHXvNbCmV5jc0VfZR	2AqpuNC4IqjOWfRIMOMczq	Cali God	43
3DiRdaZtPrVdb4U2RIuRWm	4tpUmLEVLCGFr93o8hFFIB	25eZFwT2UvVK1kxC3wMoSW	One Way Or Another	52
3HBZdyG6QHhrEdwLQYXjfU	6tbLPxj1uQ6vsRQZI2YFCT	4oWkraZHpmMWsR96zVKaOT	Burn 1983	44
3NYq7c5AIUiubPz9UZl82h	3rWZHrfrsPBxVy692yAIxF	4B2pV5Zds6478QOqA8yqdj	PrettyGirlz	49
3e90JC8EKLsSDUHmPpxkfp	3rWZHrfrsPBxVy692yAIxF	5cAJxOFxRwXkCihLMQJYtl	9	61
3eIDFlBvKsssIpKeTSKEO6	6tbLPxj1uQ6vsRQZI2YFCT	1qPnZBLqLtVw6ER90x84Wb	Beautiful Tragedy	42
3ejS3PKnKnLiI1CIKM5E4K	6tbLPxj1uQ6vsRQZI2YFCT	4JupbzBjFWUQVT8uQ8FF3p	Whore 1983	47
4191RXFPa7Ge9XkA4cWlna	6qqNVTkY8uBg9cP3Jd7DAH	0JGOiO34nwfUdDrD612dOp	Lost Cause	71
46SZJUs1Qnutjk3QlNcnKY	6E8uXyNsUKeGOgRqAOcgBa	1aQLXLo5hr1l3l9h7EVJWM	KIss Of Fire	41
4Cbrtoamv6acNiHNAUKnj0	6blEmsLU25ewy8hHtgZaSL	2SVRzumTLUTdoHgYNQ4Rh9	Princess Castle	53
4K6QbaU4KdvYJAOncr2Iu0	6tbLPxj1uQ6vsRQZI2YFCT	2byvabkqGEA7G4viYaoOlp	The Promise	42
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.users (user_id, display_name, profile_photo, created, last_login) FROM stdin;
the_real_wjdhollow	the_real_wjdhollow	https://i.scdn.co/image/ab6775700000ee85d1872696f7133856770fdc4c	1668801050	1668801224
12163992542	Christina	https://i.scdn.co/image/ab6775700000ee854734dc6670bfaaed615b7edf	1668800851	1668810835
\.


--
-- Name: artists_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cnicosia
--

SELECT pg_catalog.setval('public.artists_genres_id_seq', 1351, true);


--
-- Name: friends_friend_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cnicosia
--

SELECT pg_catalog.setval('public.friends_friend_id_seq', 2, true);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cnicosia
--

SELECT pg_catalog.setval('public.items_id_seq', 781, true);


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
-- Name: friends friends_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (friend_id);


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
-- Name: friends friends_f1_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_f1_id_fkey FOREIGN KEY (f1_id) REFERENCES public.users(user_id);


--
-- Name: friends friends_f2_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_f2_id_fkey FOREIGN KEY (f2_id) REFERENCES public.users(user_id);


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

