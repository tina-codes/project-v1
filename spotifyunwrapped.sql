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
    name character varying(50) NOT NULL,
    release_year integer,
    img_url character varying
);


ALTER TABLE public.albums OWNER TO cnicosia;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: cnicosia
--

CREATE TABLE public.artists (
    artist_id character varying(22) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.artists OWNER TO cnicosia;

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
    name character varying(50) NOT NULL,
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
2aaWMtuGxw17AZpKhZGdXQ	4hz8tIajF2INpgM0qzPJz2	RKS	2015	https://i.scdn.co/image/ab67616d0000b2739e16f54ce1b5f9e1d8196ba3
17l7MIu0Jh0tdgK7or9ovw	1KP6TWI40m7p3QBTU6u2xo	Dopamine	2015	https://i.scdn.co/image/ab67616d0000b273cc2cf912462d8ae4ef856434
15RYnRTIMHrCB6X3HjK2mC	4hz8tIajF2INpgM0qzPJz2	Mary (b-sides)	2019	https://i.scdn.co/image/ab67616d0000b273e81cd26a5fc0e1106cc5c747
4hruYceqit29o6m4arpAql	5wFXmYsg3KFJ8BDsQudJ4f	A Black Mile To The Surface	2017	https://i.scdn.co/image/ab67616d0000b2736827146a676dafc0357fa665
4lGNpgFI67TUq5BMfnPe3Z	4hz8tIajF2INpgM0qzPJz2	Seven + Mary	2013	https://i.scdn.co/image/ab67616d0000b27317d131d429c783666c929d6b
0vVekV45lOaVKs6RZQQNob	2ooIqOf4X2uz4mMptXCtie	In the Aeroplane Over the Sea	1998	https://i.scdn.co/image/ab67616d0000b273589ce9a911c6e65b1f80c558
0y3tRiTDYzj5IuQb0Kk86x	1MIe1z4RdqLqHSJsb7EBMm	It’s Not All That Bad	2015	https://i.scdn.co/image/ab67616d0000b273069740bb736206138c87f7e8
3JsZjfjVa95IMuZ50eX7BU	1fZpYWNWdL5Z3wrDtISFUH	Shakey Graves on Audiotree Live (2013)	2013	https://i.scdn.co/image/ab67616d0000b27323f53d45b6b71f48231ad2f0
05LEST8E8mkEIl2LRfUkcI	360IAlyVv4PCEVjgyMZrxK	War & Leisure	2017	https://i.scdn.co/image/ab67616d0000b2735e9dff10c31ac14c6c6c920d
5xiePX6kXj5ZsmUsqIqzeD	6ltzsmQQbmdoHHbLZ4ZN25	Long Lost	2021	https://i.scdn.co/image/ab67616d0000b2731c18ab47e15a19af3246a792
2cLoHa7KlKFKdaRAUsChGs	6GEykX11lQqp92UVOQQCC7	2 LOVIN U	2017	https://i.scdn.co/image/ab67616d0000b2730548c524b484259ee59beb05
71jxid8dyhioxjrZ4OiLWQ	1zXCFUgH6FWS0iCiCKsH55	Illuminarium	2021	https://i.scdn.co/image/ab67616d0000b273f2c269ce77afc548e0aa4741
3pWJFrSX6apPzt4inM4zXt	4l1cKWYW591xnwEGxpUg3J	iii	2016	https://i.scdn.co/image/ab67616d0000b27306eda68098c2a886a43685a8
3yoNZlqerJnsnMN5EDwwBS	6ltzsmQQbmdoHHbLZ4ZN25	Strange Trails	2015	https://i.scdn.co/image/ab67616d0000b2739d2efe43d5b7ebc7cb60ca81
2PIWPTOIxbaVSjTnc30vXS	0YrtvWJMgSdVrk3SfNjTbx	Asphalt Meadows	2022	https://i.scdn.co/image/ab67616d0000b273b808f709e7d5ed8e79cec246
1XoE7ZirQ3gjxq8HIzTJU9	3U3zr5PCRa9ty74uN46iBa	COWBOY BEBOP (Original Motion Picture Soundtrack)	1998	https://i.scdn.co/image/ab67616d0000b273e90a54d6e31d9ff3f1d566fa
0vuwlanMPucXrYMGnOjhYL	0EdvGhlC1FkGItLOWQzG4J	40oz. To Freedom	1992	https://i.scdn.co/image/ab67616d0000b273d77299e3d29f44495cd7fbcb
0PHH7ZnpTBkek9iQtGNBno	0V7uVrIYr4FwFvUN9S4kYr	Promenade Blue	2021	https://i.scdn.co/image/ab67616d0000b273c7ec21eb68ca90d031b0d3db
7kb2GfJGvn8Gr0LCGBSQjZ	0AkmSuTOzM2pNCIOSP8ziv	Volume 1	2018	https://i.scdn.co/image/ab67616d0000b273440d3f67a167757157bfb050
0msliOKoJh1aYmcpuEoBn2	0CUpzKPDfIVzYqMn47jiV3	If Words Were Flowers	2021	https://i.scdn.co/image/ab67616d0000b273035f697ee8ef8648a3153453
4aW4iDepQUl5ZCHd1Gli68	0fA0VVWsXO9YnASrzqfmYu	Entergalactic	2022	https://i.scdn.co/image/ab67616d0000b27371cecf4c653a4bad539da13d
5mlCtfr6NLphHzAaXIuXz4	3D4qYDvoPn5cQxtBm4oseo	Catch For Us The Foxes	2004	https://i.scdn.co/image/ab67616d0000b2730c7a52516acf1393f6f75b2f
493HYe7N5pleudEZRyhE7R	360IAlyVv4PCEVjgyMZrxK	All I Want Is You	2010	https://i.scdn.co/image/ab67616d0000b273d5a8395b0d80b8c48a5d851c
5vRfIDOPJHy3W2wHWbzLlE	3A5tHz1SfngyOZM2gItYKu	Doris	2013	https://i.scdn.co/image/ab67616d0000b27346f9bf1154c7205b0e8b1667
7pLNHtWfSdcAaQ3QuGWttp	336wP75Xfy1WoqKRFt17IO	SKIN - EP	2016	https://i.scdn.co/image/ab67616d0000b27350f851e3afcc3ce87cf1bd6e
2K2u7usRIF03pywk6qxGlM	4wYk01oPJNfaEssVFL46oQ	Going Mainstream	2021	https://i.scdn.co/image/ab67616d0000b273eda96f4688e29241aaa0e9c3
3fzjXU2SSKero9gVMcPivX	4M5nCE77Qaxayuhp3fVn4V	The Shepherd's Dog	2007	https://i.scdn.co/image/ab67616d0000b273816243514f01ac30d0932622
5m1BQr6SaEOxEl7Pz6fba2	5VF0YkVLeVD4ytyiyVSIiF	The Socialites (Remixes)	2013	https://i.scdn.co/image/ab67616d0000b273313aeac150aaedbb3ed2e690
7BrlhEO8dHiNmU8A1Ep9RZ	66W9LaWS0DPdL7Sz8iYGYe	If the World Was Ending (feat. Julia Michaels)	2019	https://i.scdn.co/image/ab67616d0000b273dedbec8cca43642f06533476
6haDxdERWK3rdVCGc2jr8E	5rX2c1zow6hCph8PnnU3kF	The Astrud Gilberto Album	1965	https://i.scdn.co/image/ab67616d0000b273b48a079c5273b6141af2dc35
1zCNrbPpz5OLSr6mSpPdKm	7jy3rLJdDQY21OgRLCZ9sD	Greatest Hits	2009	https://i.scdn.co/image/ab67616d0000b273136d7250568820409f8fdd60
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.artists (artist_id, name) FROM stdin;
0qu422H5MOoQxGjd4IzHbS	Yves Tumor
65dGLGjkw3UbddUg2GKQoZ	BADBADNOTGOOD
4lujUKeO6nQAJXpq37Epn7	Son Little
6ltzsmQQbmdoHHbLZ4ZN25	Lord Huron
0YrtvWJMgSdVrk3SfNjTbx	Death Cab for Cutie
0bzfPKdbXL5ezYW2z3UGQj	Michael Kiwanuka
3M4ThdJR28z9eSMcQHAZ5G	The Fratellis
30DhU7BDmF4PH0JVhu8ZRg	Sabrina Claudio
360IAlyVv4PCEVjgyMZrxK	Miguel
34jw2BbxjoYalTp8cJFCPv	Heart
5Q81rlcTFh3k6DQJXPdsot	Mura Masa
2YZyLoL8N0Wb9xBt1NhZWg	Kendrick Lamar
4hz8tIajF2INpgM0qzPJz2	Rainbow Kitten Surprise
1Xyo4u8uXC1ZmMpatF05PJ	The Weeknd
7CyeXFnOrfC1N6z4naIpgo	The Ronettes
55VydwMyCuGcavwPuhutPL	The Used
08ct2eZF5lUPdJpHwNKWof	Hootie & The Blowfish
37w38cCSGgKLdayTRjna4W	Mazzy Star
4bthk9UfsYUYdcFyqxmSUU	Tears For Fears
4pejUc4iciQfgdX6OKulQn	Queens of the Stone Age
7qKoy46vPnmIxKCN6ewBG4	Butch Walker
1eClJfHLoDI4rZe5HxzBFv	INXS
2iul6etLF5hjjpxo43rzz7	Lera Lynn
73sIBHcqh3Z3NyqHKZ7FOL	Childish Gambino
4V8LLVI7PbaPR0K2TGSxFF	Tyler, The Creator
3oDbviiivRWhXwIE8hxkVV	The Beach Boys
6loBF9iQdE11WSX29fNKqY	Howard Jones
7guDJrEfX3qb6FEbdPA5qi	Stevie Wonder
0YHgnSkV3S5mvSSCTRWDi5	Poor Mans Poison
57bUPid8xztkieZfS7OlEV	The Supremes
0X380XXQSNBYuleKzav5UO	Nine Inch Nails
5eIbEEQnDM8yuDVB0bimSP	RL Grime
3pkmfqaBNsMqnXus05PNfP	Handsome Boy Modeling School
20wkVLutqVOYrc0kxFs7rA	Daniel Caesar
1mFX1QlezK1lNPKQJkhwWb	New Edition
0VbDAlm2KUlKI5UhXRBKWp	Henry Green
7KGqvFukcZRbQ7YFsYrgPa	Donnie & Joe Emerson
6PEMFpe3PTOksdV4ZXUpbE	NxWorries
1KP6TWI40m7p3QBTU6u2xo	BØRNS
5wFXmYsg3KFJ8BDsQudJ4f	Manchester Orchestra
2ooIqOf4X2uz4mMptXCtie	Neutral Milk Hotel
1MIe1z4RdqLqHSJsb7EBMm	The Greeting Committee
1fZpYWNWdL5Z3wrDtISFUH	Shakey Graves
6GEykX11lQqp92UVOQQCC7	DJ Premier
1zXCFUgH6FWS0iCiCKsH55	Kai Straw
4l1cKWYW591xnwEGxpUg3J	Miike Snow
3U3zr5PCRa9ty74uN46iBa	SEATBELTS
0EdvGhlC1FkGItLOWQzG4J	Sublime
0V7uVrIYr4FwFvUN9S4kYr	Nick Waterhouse
0AkmSuTOzM2pNCIOSP8ziv	Amigo the Devil
0CUpzKPDfIVzYqMn47jiV3	Curtis Harding
0fA0VVWsXO9YnASrzqfmYu	Kid Cudi
3D4qYDvoPn5cQxtBm4oseo	mewithoutYou
3A5tHz1SfngyOZM2gItYKu	Earl Sweatshirt
336wP75Xfy1WoqKRFt17IO	Goldilox
4wYk01oPJNfaEssVFL46oQ	Coast Modern
4M5nCE77Qaxayuhp3fVn4V	Iron & Wine
5VF0YkVLeVD4ytyiyVSIiF	Dirty Projectors
66W9LaWS0DPdL7Sz8iYGYe	JP Saxe
5rX2c1zow6hCph8PnnU3kF	Astrud Gilberto
7jy3rLJdDQY21OgRLCZ9sD	Foo Fighters
\.


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.features (track_id, danceability, energy, key, loudness, mode, speechiness, acousticness, instrumentalness, liveness, valence, tempo, time_signature, duration_ms) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.items (id, user_id, date, item_type, timespan, rank, spotify_id) FROM stdin;
1	12163992542	1666806455	track	long_term	1	1Kjw0LwdniCWran4PxJqPQ
2	12163992542	1666806455	track	long_term	2	1I40L32fTSSkBkPeArX9Ul
3	12163992542	1666806455	track	long_term	3	5fBjPtOxhgdpU6LNWLyVHv
4	12163992542	1666806455	track	long_term	4	4FE9SgxcOoCNuGnaaU8TXz
5	12163992542	1666806455	track	long_term	5	4FF4q2qyOsFhRavZ0bdVXT
6	12163992542	1666806455	track	long_term	6	0qprlw0jfsW4H9cG0FFE0Z
7	12163992542	1666806455	track	long_term	7	3jp7Ryj1sX3riA7NQaVlLd
8	12163992542	1666806455	track	long_term	8	2I88NEWpKrAPZuapXNV5G6
9	12163992542	1666806455	track	long_term	9	6YZQx90VEuzf0lRY9TYh7j
10	12163992542	1666806455	track	long_term	10	54b8qPFqYqIndfdxiLApea
11	12163992542	1666806455	track	long_term	11	3sTN90bIP2cJ1783ctHykO
12	12163992542	1666806455	track	long_term	12	2P3SLxeQHPqh8qKB6gtJY2
13	12163992542	1666806455	track	long_term	13	474uVhyGgK5MtY9gMcDgGl
14	12163992542	1666806455	track	long_term	14	16ro1is6DmDKkarlJMBbzV
15	12163992542	1666806455	track	long_term	15	4frLb7nWtsz2ymBE6k2GRP
16	12163992542	1666806455	track	long_term	16	2G2YzndIA6jeWFPBXhUjh5
17	12163992542	1666806455	track	long_term	17	5jZ1Z2GFTf2gwmFc3qiUxs
18	12163992542	1666806455	track	long_term	18	5vyt44455ipNNVSYq8fYY7
19	12163992542	1666806455	track	long_term	19	1OFKUn2VLafrHj7ybnap0Q
20	12163992542	1666806455	track	long_term	20	21oJ1K99GBJrE2GVQGVjA0
21	12163992542	1666806455	track	long_term	21	1LzNfuep1bnAUR9skqdHCK
22	12163992542	1666806455	track	long_term	22	748yv6bb3l3CcKS45a6SZ8
23	12163992542	1666806455	track	long_term	23	6NvRxjfYkkT2SpirAlmsjH
24	12163992542	1666806455	track	long_term	24	1ZaNp6b4cY3zcrciagi7td
25	12163992542	1666806455	track	long_term	25	1qQSRy9DjrGh3jtsSCU6B1
26	12163992542	1666806455	track	long_term	26	0hJS3EHWC4uL9sJ52ErpoN
27	12163992542	1666806455	track	long_term	27	3s8MBOMdUi5Vol77qq8KJJ
28	12163992542	1666806455	track	long_term	28	4j3GWI86JvSaF0BLdmgcfF
29	12163992542	1666806455	track	long_term	29	4f8Mh5wuWHOsfXtzjrJB3t
30	12163992542	1666806455	track	long_term	30	6VojZJpMyuKClbwyilWlQj
31	12163992542	1666806455	track	long_term	31	1TDdYSYLIXMJ4EiKO6ZCYk
32	12163992542	1666806455	track	long_term	32	1RbOObDFn7GOseR1w529Zj
33	12163992542	1666806455	track	long_term	33	0Hw6SCrtU9pFCjgAONpnGZ
34	12163992542	1666806455	track	long_term	34	0S29RwGLJutn4qnFJQL13n
35	12163992542	1666806455	track	long_term	35	5SCB7L1alKg7ZEeSw7Sq9f
36	12163992542	1666806455	track	long_term	36	3aN2V18W3EiW7eg5tHALpF
37	12163992542	1666806455	track	long_term	37	5hVghJ4KaYES3BFUATCYn0
38	12163992542	1666806455	track	long_term	38	3zJ5RDG0bLQAV2rntFgUtb
39	12163992542	1666806455	track	long_term	39	6iGU74CwXuT4XVepjc9Emf
40	12163992542	1666806455	track	long_term	40	6fc51JZVE0Yijdi6RuoLFv
41	12163992542	1666806455	track	long_term	41	7wdzLe2Gsx1RGqbvYZHASz
42	12163992542	1666806455	track	long_term	42	3imS277wRbz1CFoDySgTff
43	12163992542	1666806455	track	long_term	43	3mT1AONeTJDi1k8vH8pA2L
44	12163992542	1666806455	track	long_term	44	7Cu2COdH93MnuireuKNiS3
45	12163992542	1666806455	track	long_term	45	7JmPqImeW3kLoYVNBA9v11
46	12163992542	1666806455	track	long_term	46	2aCKBrLn7rbhStk5k4FwnF
47	12163992542	1666806455	track	long_term	47	0vJvCnuxXL2BCSRa1ZoeNl
48	12163992542	1666806455	track	long_term	48	1zkkvSLk5Nh4uoyKWwuie9
49	12163992542	1666806455	track	long_term	49	62wdQ5CInFr7cjISqrr46f
50	12163992542	1666806455	track	long_term	50	3iVp14VoAsAZkIdgQoRRAb
51	12163992542	1666806455	track	medium_term	1	16ro1is6DmDKkarlJMBbzV
52	12163992542	1666806455	track	medium_term	2	5vyt44455ipNNVSYq8fYY7
53	12163992542	1666806455	track	medium_term	3	474uVhyGgK5MtY9gMcDgGl
54	12163992542	1666806455	track	medium_term	4	0hJS3EHWC4uL9sJ52ErpoN
55	12163992542	1666806455	track	medium_term	5	1TDdYSYLIXMJ4EiKO6ZCYk
56	12163992542	1666806455	track	medium_term	6	5zzWx7oJ9zBmv76uFaFeYR
57	12163992542	1666806455	track	medium_term	7	1zkkvSLk5Nh4uoyKWwuie9
58	12163992542	1666806455	track	medium_term	8	41xaZ4WLlKD95U5PknoJrV
59	12163992542	1666806455	track	medium_term	9	04M3DsiMNyn8s5XQJrW5sL
60	12163992542	1666806455	track	medium_term	10	1k7aPYyAnNTjVbjw1YDNp1
61	12163992542	1666806455	track	medium_term	11	6fc51JZVE0Yijdi6RuoLFv
62	12163992542	1666806455	track	medium_term	12	4Fc62OkXYtEOjMmaSyJoQY
63	12163992542	1666806455	track	medium_term	13	2OeL43EXwaC205Xr1da1qJ
64	12163992542	1666806455	track	medium_term	14	1RzgWAFlI6KOenjOxJYcH0
65	12163992542	1666806455	track	medium_term	15	33vFhGNZa44VJ0I21AOGYe
66	12163992542	1666806455	track	medium_term	16	2pA4ip3VIEVcIa3qE02oAX
67	12163992542	1666806455	track	medium_term	17	5L7IgwUPhir2FJftGNXJDW
68	12163992542	1666806455	track	medium_term	18	63k361zOGEhmvgzBdzzSGP
69	12163992542	1666806455	track	medium_term	19	4FF4q2qyOsFhRavZ0bdVXT
70	12163992542	1666806455	track	medium_term	20	5do7Ql6G8N03fY6G9Y08Ec
71	12163992542	1666806455	track	medium_term	21	4FE9SgxcOoCNuGnaaU8TXz
72	12163992542	1666806455	track	medium_term	22	2g9LXMNIBCqmngHpH9nXv0
73	12163992542	1666806455	track	medium_term	23	35mL8keNDi2VLHrFXZCgJR
74	12163992542	1666806455	track	medium_term	24	5C90m8eM6GJR2SACiLAWHo
75	12163992542	1666806455	track	medium_term	25	50bmpfgcV29ouRVDfr5wOc
76	12163992542	1666806455	track	medium_term	26	3aN2V18W3EiW7eg5tHALpF
77	12163992542	1666806455	track	medium_term	27	5IRdIQNIZzVqE4XyBylkvd
78	12163992542	1666806455	track	medium_term	28	5rfT032kGmLvbxZzfHlu5D
79	12163992542	1666806455	track	medium_term	29	03v70ZBxmcPX3RWAZMzqaW
80	12163992542	1666806455	track	medium_term	30	0ZAbupc7jAQpG9IxojQ3s3
81	12163992542	1666806455	track	medium_term	31	37ZvpHeZKazqOnLfAGm9nb
82	12163992542	1666806455	track	medium_term	32	7HjkzXqYzUiz0gkjM0Wmkk
83	12163992542	1666806455	track	medium_term	33	244QS6446wyO1UfVTWlOlR
84	12163992542	1666806455	track	medium_term	34	5CU1bbfY1wUPm7fU255Dhf
85	12163992542	1666806455	track	medium_term	35	7trx783SvnHhKkmgSSTIFJ
86	12163992542	1666806455	track	medium_term	36	465hVdgg75kPgRdpJfEFFT
87	12163992542	1666806455	track	medium_term	37	7qHoVZ6076OGx18G6W5vQ9
88	12163992542	1666806455	track	medium_term	38	0dqJjKKxuKD5Dt3QH2n4CG
89	12163992542	1666806455	track	medium_term	39	6vyFAHVKIsp3pdyhlOKMAz
90	12163992542	1666806455	track	medium_term	40	4FMRToryd5E6dwGPh0hA26
91	12163992542	1666806455	track	medium_term	41	1Yxbxg5R6dQcYmOdjvlXP0
92	12163992542	1666806455	track	medium_term	42	3LcjZGk0GBlPRe5XhYVGgM
93	12163992542	1666806455	track	medium_term	43	6YZQx90VEuzf0lRY9TYh7j
94	12163992542	1666806455	track	medium_term	44	7xQg5QTx8eiQnsxEnfynPh
95	12163992542	1666806455	track	medium_term	45	5iE1kLZ5WkcNYsVvaarrOT
96	12163992542	1666806455	track	medium_term	46	3vvnpqqg7Jbi2c2aOn6GHt
97	12163992542	1666806455	track	medium_term	47	6MDijuuArPJv1vbp7K1x3f
98	12163992542	1666806455	track	medium_term	48	0HsGh7cboYz6cVMIyFrQ8j
99	12163992542	1666806455	track	medium_term	49	0qprlw0jfsW4H9cG0FFE0Z
100	12163992542	1666806455	track	medium_term	50	1bqrRn1pJWowNLA5N9L6uW
101	12163992542	1666806455	track	short_term	1	0b2vqB7QNT4z8nnaYqbuel
102	12163992542	1666806455	track	short_term	2	5p0bEz7DNsULez2X9yrNGa
103	12163992542	1666806455	track	short_term	3	1dxXQuExRVu77xF1r5YtRF
104	12163992542	1666806455	track	short_term	4	0wejso6CHHEEqvTD3f3gBz
105	12163992542	1666806455	track	short_term	5	23od4rorIdhvYeLL7YqP9n
106	12163992542	1666806455	track	short_term	6	2I3ZdIFXnRn1PSAdMC4w71
107	12163992542	1666806455	track	short_term	7	7Cva2EgJougx6O6M5xgWAq
108	12163992542	1666806455	track	short_term	8	7KR5uycb8gfQYRl1MTL8aB
109	12163992542	1666806455	track	short_term	9	7xjbn0bhs7zx7E1s0lCqT3
110	12163992542	1666806455	track	short_term	10	5vyt44455ipNNVSYq8fYY7
111	12163992542	1666806455	track	short_term	11	16ro1is6DmDKkarlJMBbzV
112	12163992542	1666806455	track	short_term	12	1AR58rtcLziNnRHTCmCywd
113	12163992542	1666806455	track	short_term	13	4J6JARDGkdc1fqLEflP94Z
114	12163992542	1666806455	track	short_term	14	1TDdYSYLIXMJ4EiKO6ZCYk
115	12163992542	1666806455	track	short_term	15	0hJS3EHWC4uL9sJ52ErpoN
116	12163992542	1666806455	track	short_term	16	0dqJjKKxuKD5Dt3QH2n4CG
117	12163992542	1666806455	track	short_term	17	474uVhyGgK5MtY9gMcDgGl
118	12163992542	1666806455	track	short_term	18	1k7aPYyAnNTjVbjw1YDNp1
119	12163992542	1666806455	track	short_term	19	6fc51JZVE0Yijdi6RuoLFv
120	12163992542	1666806455	track	short_term	20	1zkkvSLk5Nh4uoyKWwuie9
121	12163992542	1666806455	track	short_term	21	63k361zOGEhmvgzBdzzSGP
122	12163992542	1666806455	track	short_term	22	2OeL43EXwaC205Xr1da1qJ
123	12163992542	1666806455	track	short_term	23	6MDijuuArPJv1vbp7K1x3f
124	12163992542	1666806455	track	short_term	24	1RzgWAFlI6KOenjOxJYcH0
125	12163992542	1666806455	track	short_term	25	2Wi5ubKr8zSk8L3CLemyS4
126	12163992542	1666806455	track	short_term	26	33vFhGNZa44VJ0I21AOGYe
127	12163992542	1666806455	track	short_term	27	3Cx9j78Z0NE6jYwBWvvV3P
128	12163992542	1666806455	track	short_term	28	41xaZ4WLlKD95U5PknoJrV
129	12163992542	1666806455	track	short_term	29	6L0d6mtaVF8wnv2xsRKOcE
130	12163992542	1666806455	track	short_term	30	3mMPb6eqYTXOyjHV6pzsEf
131	12163992542	1666806455	track	short_term	31	1bSCJ56FRtaARZ2mdcMytb
132	12163992542	1666806455	track	short_term	32	2BZAAoMP6xQGseY8N6svso
133	12163992542	1666806455	track	short_term	33	3banchOoe2giyRK0jaO1c7
134	12163992542	1666806455	track	short_term	34	5cokzsk6shrhgziFlbElCe
135	12163992542	1666806455	track	short_term	35	6cJZx1AeXC7CIi6xZrJQq7
136	12163992542	1666806455	track	short_term	36	07eAdTT5UxoUV6l2QGfj0I
137	12163992542	1666806455	track	short_term	37	3aN2V18W3EiW7eg5tHALpF
138	12163992542	1666806455	track	short_term	38	7xENAAODeE2hKzdWFI6YaB
139	12163992542	1666806455	track	short_term	39	3jbBxMVCcTUnfAjsZWb9kh
140	12163992542	1666806455	track	short_term	40	3xUoruCgcXJGazMBYHKIx6
141	12163992542	1666806455	track	short_term	41	0BMzC3hYff1zj2MsllexiU
142	12163992542	1666806455	track	short_term	42	0JXXNGljqupsJaZsgSbMZV
143	12163992542	1666806455	track	short_term	43	0fAehaneUJdlSlWXYe1KZp
144	12163992542	1666806455	track	short_term	44	0fstAyTs1mb4OqpxE1CxZ1
145	12163992542	1666806455	track	short_term	45	0ncGfTV06HogJIgn2Ujjgb
146	12163992542	1666806455	track	short_term	46	1fEGtTZjrjJW8eUeewnNJR
147	12163992542	1666806455	track	short_term	47	1wgU78h61rVCbOsFAHv2Hw
148	12163992542	1666806455	track	short_term	48	2kJwzbxV2ppxnQoYw4GLBZ
149	12163992542	1666806455	track	short_term	49	3QKJELWORZZ7rUZDWeMWSA
150	12163992542	1666806455	track	short_term	50	3QmesrvdbPjwf7i40nht1D
\.


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.tracks (track_id, artist_id, album_id, name, popularity) FROM stdin;
1Kjw0LwdniCWran4PxJqPQ	0qu422H5MOoQxGjd4IzHbS	5wnCTZtzIZxasRSHzI1JeW	Kerosene!	57
1I40L32fTSSkBkPeArX9Ul	65dGLGjkw3UbddUg2GKQoZ	68HLpLmCtvFKUqwQpUCqwn	Time Moves Slow	2
5fBjPtOxhgdpU6LNWLyVHv	4lujUKeO6nQAJXpq37Epn7	6wYeJwJU9Y4fuLQVfGyJk9	Mad About You	60
4FE9SgxcOoCNuGnaaU8TXz	6ltzsmQQbmdoHHbLZ4ZN25	2oiJM8vFGpxrtGtFfJWhJv	When the Night is Over	60
4FF4q2qyOsFhRavZ0bdVXT	0YrtvWJMgSdVrk3SfNjTbx	4jQW2mhMH3TxtAOol3Djuf	Passenger Seat	50
0qprlw0jfsW4H9cG0FFE0Z	0bzfPKdbXL5ezYW2z3UGQj	0qxsfpy2VU0i4eDR9RTaAU	Cold Little Heart	65
3jp7Ryj1sX3riA7NQaVlLd	3M4ThdJR28z9eSMcQHAZ5G	6R6pjR9ocMYuqSuNx5e4mg	Whistle For The Choir	51
2I88NEWpKrAPZuapXNV5G6	30DhU7BDmF4PH0JVhu8ZRg	2ICdqEf91Kc9FwdlLtB748	Belong to You (feat. 6LACK)	62
6YZQx90VEuzf0lRY9TYh7j	360IAlyVv4PCEVjgyMZrxK	3fUHDbd0oujqAerhHZjdsj	Get You - Recorded at Spotify Studios NYC	47
54b8qPFqYqIndfdxiLApea	34jw2BbxjoYalTp8cJFCPv	56dfEbntfVTMCxjrjggL1e	Alone	74
3sTN90bIP2cJ1783ctHykO	5Q81rlcTFh3k6DQJXPdsot	0NBTBo1qrg554sAj79nEqD	Love$ick (feat. A$AP Rocky)	74
2P3SLxeQHPqh8qKB6gtJY2	2YZyLoL8N0Wb9xBt1NhZWg	3DGQ1iZ9XKUQxAUWjfC34w	Poetic Justice	72
474uVhyGgK5MtY9gMcDgGl	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	It's Called: Freefall	76
16ro1is6DmDKkarlJMBbzV	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	When It Lands	61
4frLb7nWtsz2ymBE6k2GRP	1Xyo4u8uXC1ZmMpatF05PJ	0P3oVJBFOv3TDXlYRhGL7s	Earned It (Fifty Shades Of Grey)	75
2G2YzndIA6jeWFPBXhUjh5	7CyeXFnOrfC1N6z4naIpgo	3vLFWR3fLqfY82WGvaLuyV	Be My Baby	68
5jZ1Z2GFTf2gwmFc3qiUxs	55VydwMyCuGcavwPuhutPL	57d5dFo7oN2yUyGfSKPrRv	The Taste of Ink	67
5vyt44455ipNNVSYq8fYY7	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Fever Pitch	56
1OFKUn2VLafrHj7ybnap0Q	08ct2eZF5lUPdJpHwNKWof	5AYmpTfdv1OoASUJ5rZB7K	Only Wanna Be with You	70
21oJ1K99GBJrE2GVQGVjA0	30DhU7BDmF4PH0JVhu8ZRg	2ICdqEf91Kc9FwdlLtB748	Frozen	61
1LzNfuep1bnAUR9skqdHCK	37w38cCSGgKLdayTRjna4W	5K18gTgac0q6Jma5HkV1vA	Fade Into You	79
748yv6bb3l3CcKS45a6SZ8	4bthk9UfsYUYdcFyqxmSUU	2HyJKdwnnaM156kvcPDwr8	Head Over Heels	69
6NvRxjfYkkT2SpirAlmsjH	4pejUc4iciQfgdX6OKulQn	58HZZpS0wxJKwGjoerg0mk	No One Knows	66
1ZaNp6b4cY3zcrciagi7td	7qKoy46vPnmIxKCN6ewBG4	0xAjncT0noqLbBH6iT4HjH	Cigarette Lighter Love Song - Live	15
1qQSRy9DjrGh3jtsSCU6B1	1eClJfHLoDI4rZe5HxzBFv	7cuwWzS0oiApEt2fpKafkX	Never Tear Us Apart	63
0hJS3EHWC4uL9sJ52ErpoN	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Hide	57
3s8MBOMdUi5Vol77qq8KJJ	2iul6etLF5hjjpxo43rzz7	05kYWbiEVwGcd2Y2wolwWz	Wolf Like Me ft. Shovels & Rope	0
4j3GWI86JvSaF0BLdmgcfF	73sIBHcqh3Z3NyqHKZ7FOL	15k99o4mZJ9mfpQGIOrZ45	Summertime Magic	63
4f8Mh5wuWHOsfXtzjrJB3t	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	I THINK	73
6VojZJpMyuKClbwyilWlQj	3oDbviiivRWhXwIE8hxkVV	2ninxvLuYGCb6H92qTaSFZ	Wouldn't It Be Nice	59
1TDdYSYLIXMJ4EiKO6ZCYk	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Mission to Mars	58
1RbOObDFn7GOseR1w529Zj	6loBF9iQdE11WSX29fNKqY	1V8qUSg1WAHf3dCrVYdJ5Z	Things Can Only Get Better	57
0Hw6SCrtU9pFCjgAONpnGZ	7guDJrEfX3qb6FEbdPA5qi	0qnHA4SDco9mPuWGzDqVDK	Uptight (Everything's Alright)	58
0S29RwGLJutn4qnFJQL13n	0YHgnSkV3S5mvSSCTRWDi5	511e7X2zYDqPWQGADatYz2	Georgia Law Man	44
5SCB7L1alKg7ZEeSw7Sq9f	57bUPid8xztkieZfS7OlEV	7vNmiLEdMqJYUlPxSx2zgg	I Hear A Symphony	49
3aN2V18W3EiW7eg5tHALpF	0X380XXQSNBYuleKzav5UO	4uiVwLbTzE6VMkXpaDAwB8	We're In This Together	56
5hVghJ4KaYES3BFUATCYn0	4V8LLVI7PbaPR0K2TGSxFF	5zi7WsKlIiUXv09tbGLKsE	EARFQUAKE	81
3zJ5RDG0bLQAV2rntFgUtb	0bzfPKdbXL5ezYW2z3UGQj	1yIqauTni1V7l7djYAKSsZ	You Ain't The Problem	54
6iGU74CwXuT4XVepjc9Emf	3oDbviiivRWhXwIE8hxkVV	6GphKx2QAPRoVGWE9D7ou8	God Only Knows - Mono / 1997 Remastered	68
6fc51JZVE0Yijdi6RuoLFv	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Painkillers	65
7wdzLe2Gsx1RGqbvYZHASz	2YZyLoL8N0Wb9xBt1NhZWg	51C65YqHrDODM1hD5FEL5x	i	64
3imS277wRbz1CFoDySgTff	5eIbEEQnDM8yuDVB0bimSP	7GpuEZzRrPT4IGiEuWaBzy	Light Me Up	46
3mT1AONeTJDi1k8vH8pA2L	3pkmfqaBNsMqnXus05PNfP	6XBKxM9rbzyOBP6gpE0qhd	I've Been Thinking	0
7Cu2COdH93MnuireuKNiS3	20wkVLutqVOYrc0kxFs7rA	4uP43hIpmEEDuW7aOfiU2C	Streetcar	68
7JmPqImeW3kLoYVNBA9v11	1mFX1QlezK1lNPKQJkhwWb	1bTjSqotSDtUjcwFfukTQP	If It Isn't Love	58
2aCKBrLn7rbhStk5k4FwnF	7guDJrEfX3qb6FEbdPA5qi	6thSjE17RxW8tJFtLyXA3B	I Was Made To Love Her	54
0vJvCnuxXL2BCSRa1ZoeNl	0VbDAlm2KUlKI5UhXRBKWp	5wpZhWqsoXKBcVwvcEtCvv	Electric Feel	0
1zkkvSLk5Nh4uoyKWwuie9	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Holy War	52
62wdQ5CInFr7cjISqrr46f	7KGqvFukcZRbQ7YFsYrgPa	4v9R5sk4HQ0X1krbEis34P	Baby	55
3iVp14VoAsAZkIdgQoRRAb	6PEMFpe3PTOksdV4ZXUpbE	0K3FiXt6ekJTWaUku3LpHL	Livvin	0
5zzWx7oJ9zBmv76uFaFeYR	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Counting Cards	47
41xaZ4WLlKD95U5PknoJrV	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Matchbox	50
04M3DsiMNyn8s5XQJrW5sL	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Cold Love	56
1k7aPYyAnNTjVbjw1YDNp1	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Moody Orange	50
4Fc62OkXYtEOjMmaSyJoQY	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Run	47
2OeL43EXwaC205Xr1da1qJ	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Polite Company	50
1RzgWAFlI6KOenjOxJYcH0	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Possum Queen	46
33vFhGNZa44VJ0I21AOGYe	4hz8tIajF2INpgM0qzPJz2	7vXiklrUeffx5o2F8VYwm3	Recktify	46
2pA4ip3VIEVcIa3qE02oAX	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	10,000 Emerald Pools	63
5L7IgwUPhir2FJftGNXJDW	4hz8tIajF2INpgM0qzPJz2	15RYnRTIMHrCB6X3HjK2mC	Heart	61
63k361zOGEhmvgzBdzzSGP	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Sunshine	62
5do7Ql6G8N03fY6G9Y08Ec	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Goodnight Chicago	58
2g9LXMNIBCqmngHpH9nXv0	6ltzsmQQbmdoHHbLZ4ZN25	2oiJM8vFGpxrtGtFfJWhJv	Wait by the River	56
35mL8keNDi2VLHrFXZCgJR	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Shameful Company	49
5C90m8eM6GJR2SACiLAWHo	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Wasted	58
50bmpfgcV29ouRVDfr5wOc	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Lady Lie	60
5IRdIQNIZzVqE4XyBylkvd	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	American Shoes	46
5rfT032kGmLvbxZzfHlu5D	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	In the Aeroplane Over the Sea	66
03v70ZBxmcPX3RWAZMzqaW	1KP6TWI40m7p3QBTU6u2xo	17l7MIu0Jh0tdgK7or9ovw	Clouds	62
0ZAbupc7jAQpG9IxojQ3s3	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Cocaine Jesus	71
37ZvpHeZKazqOnLfAGm9nb	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	All's Well That Ends	61
7HjkzXqYzUiz0gkjM0Wmkk	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Fail!	52
244QS6446wyO1UfVTWlOlR	5wFXmYsg3KFJ8BDsQudJ4f	4hruYceqit29o6m4arpAql	The Maze	49
5CU1bbfY1wUPm7fU255Dhf	2ooIqOf4X2uz4mMptXCtie	0vVekV45lOaVKs6RZQQNob	King of Carrot Flowers Pt. 1	60
7trx783SvnHhKkmgSSTIFJ	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	First Class	65
465hVdgg75kPgRdpJfEFFT	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Seven	57
7qHoVZ6076OGx18G6W5vQ9	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	Bare Bones	49
0dqJjKKxuKD5Dt3QH2n4CG	1MIe1z4RdqLqHSJsb7EBMm	0y3tRiTDYzj5IuQb0Kk86x	Hands Down	56
6vyFAHVKIsp3pdyhlOKMAz	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	All That and More (Sailboat)	63
4FMRToryd5E6dwGPh0hA26	4hz8tIajF2INpgM0qzPJz2	2aaWMtuGxw17AZpKhZGdXQ	The Comedown	46
1Yxbxg5R6dQcYmOdjvlXP0	1fZpYWNWdL5Z3wrDtISFUH	3JsZjfjVa95IMuZ50eX7BU	Roll The Bones - Audiotree Live Version	59
3LcjZGk0GBlPRe5XhYVGgM	360IAlyVv4PCEVjgyMZrxK	05LEST8E8mkEIl2LRfUkcI	Caramelo Duro (feat. Kali Uchis)	51
7xQg5QTx8eiQnsxEnfynPh	6ltzsmQQbmdoHHbLZ4ZN25	5xiePX6kXj5ZsmUsqIqzeD	I Lied (with Allison Ponthier)	63
5iE1kLZ5WkcNYsVvaarrOT	6GEykX11lQqp92UVOQQCC7	2cLoHa7KlKFKdaRAUsChGs	2 LOVIN U	31
3vvnpqqg7Jbi2c2aOn6GHt	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Everything's Sweet	56
6MDijuuArPJv1vbp7K1x3f	4l1cKWYW591xnwEGxpUg3J	3pWJFrSX6apPzt4inM4zXt	Genghis Khan	61
0HsGh7cboYz6cVMIyFrQ8j	4hz8tIajF2INpgM0qzPJz2	4lGNpgFI67TUq5BMfnPe3Z	Devil Like Me	67
1bqrRn1pJWowNLA5N9L6uW	6ltzsmQQbmdoHHbLZ4ZN25	3yoNZlqerJnsnMN5EDwwBS	Meet Me in the Woods	64
0b2vqB7QNT4z8nnaYqbuel	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I Don’t Know How I Survive	57
5p0bEz7DNsULez2X9yrNGa	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Pepper	54
1dxXQuExRVu77xF1r5YtRF	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Roman Candles	55
0wejso6CHHEEqvTD3f3gBz	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Rand McNally	53
23od4rorIdhvYeLL7YqP9n	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Foxglove Through The Clearcut	53
2I3ZdIFXnRn1PSAdMC4w71	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Wheat Like Waves	51
7Cva2EgJougx6O6M5xgWAq	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Here to Forever	62
7KR5uycb8gfQYRl1MTL8aB	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I Miss Strangers	51
7xjbn0bhs7zx7E1s0lCqT3	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Asphalt Meadows	58
1AR58rtcLziNnRHTCmCywd	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	I’ll Never Give Up On You	50
4J6JARDGkdc1fqLEflP94Z	0YrtvWJMgSdVrk3SfNjTbx	2PIWPTOIxbaVSjTnc30vXS	Fragments From the Decade	50
2Wi5ubKr8zSk8L3CLemyS4	3U3zr5PCRa9ty74uN46iBa	1XoE7ZirQ3gjxq8HIzTJU9	Tank!	62
3Cx9j78Z0NE6jYwBWvvV3P	0EdvGhlC1FkGItLOWQzG4J	0vuwlanMPucXrYMGnOjhYL	Waiting For My Ruca	55
6L0d6mtaVF8wnv2xsRKOcE	0V7uVrIYr4FwFvUN9S4kYr	0PHH7ZnpTBkek9iQtGNBno	B. Santa Ana, 1986	32
3mMPb6eqYTXOyjHV6pzsEf	0V7uVrIYr4FwFvUN9S4kYr	0PHH7ZnpTBkek9iQtGNBno	Silver Bracelet	20
1bSCJ56FRtaARZ2mdcMytb	0V7uVrIYr4FwFvUN9S4kYr	0PHH7ZnpTBkek9iQtGNBno	The Spanish Look	23
2BZAAoMP6xQGseY8N6svso	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	My Name Is Your Language	30
3banchOoe2giyRK0jaO1c7	0AkmSuTOzM2pNCIOSP8ziv	7kb2GfJGvn8Gr0LCGBSQjZ	Hell and You	57
5cokzsk6shrhgziFlbElCe	0V7uVrIYr4FwFvUN9S4kYr	0PHH7ZnpTBkek9iQtGNBno	To Tell	19
6cJZx1AeXC7CIi6xZrJQq7	0CUpzKPDfIVzYqMn47jiV3	0msliOKoJh1aYmcpuEoBn2	Can't Hide It	53
07eAdTT5UxoUV6l2QGfj0I	1zXCFUgH6FWS0iCiCKsH55	71jxid8dyhioxjrZ4OiLWQ	Light Speed	24
7xENAAODeE2hKzdWFI6YaB	0fA0VVWsXO9YnASrzqfmYu	4aW4iDepQUl5ZCHd1Gli68	Entergalactic Theme	66
3jbBxMVCcTUnfAjsZWb9kh	0V7uVrIYr4FwFvUN9S4kYr	0PHH7ZnpTBkek9iQtGNBno	Fugitive Lover	17
3xUoruCgcXJGazMBYHKIx6	0V7uVrIYr4FwFvUN9S4kYr	0PHH7ZnpTBkek9iQtGNBno	Vincentine	23
0BMzC3hYff1zj2MsllexiU	3D4qYDvoPn5cQxtBm4oseo	5mlCtfr6NLphHzAaXIuXz4	January 1979	47
0JXXNGljqupsJaZsgSbMZV	360IAlyVv4PCEVjgyMZrxK	493HYe7N5pleudEZRyhE7R	Sure Thing	80
0fAehaneUJdlSlWXYe1KZp	3A5tHz1SfngyOZM2gItYKu	5vRfIDOPJHy3W2wHWbzLlE	Sunday (feat. Frank Ocean)	62
0fstAyTs1mb4OqpxE1CxZ1	336wP75Xfy1WoqKRFt17IO	7pLNHtWfSdcAaQ3QuGWttp	100%	38
0ncGfTV06HogJIgn2Ujjgb	4wYk01oPJNfaEssVFL46oQ	2K2u7usRIF03pywk6qxGlM	Waterfalls	41
1fEGtTZjrjJW8eUeewnNJR	4M5nCE77Qaxayuhp3fVn4V	3fzjXU2SSKero9gVMcPivX	Flightless Bird, American Mouth	68
1wgU78h61rVCbOsFAHv2Hw	5VF0YkVLeVD4ytyiyVSIiF	5m1BQr6SaEOxEl7Pz6fba2	The Socialites - AlunaGeorge Remix	17
2kJwzbxV2ppxnQoYw4GLBZ	66W9LaWS0DPdL7Sz8iYGYe	7BrlhEO8dHiNmU8A1Ep9RZ	If the World Was Ending (feat. Julia Michaels)	78
3QKJELWORZZ7rUZDWeMWSA	5rX2c1zow6hCph8PnnU3kF	6haDxdERWK3rdVCGc2jr8E	Água de Beber	62
3QmesrvdbPjwf7i40nht1D	7jy3rLJdDQY21OgRLCZ9sD	1zCNrbPpz5OLSr6mSpPdKm	Everlong - Acoustic Version	69
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: cnicosia
--

COPY public.users (user_id, display_name, profile_photo) FROM stdin;
12163992542	Batty Brulée	https://scontent-ord5-1.xx.fbcdn.net/v/t1.18169-1/16831043_1799099963690897_4632021165186679885_n.jpg?stp=dst-jpg_p320x320&_nc_cat=100&ccb=1-7&_nc_sid=0c64ff&_nc_ohc=V5psUdpOA4sAX8Bzeb4&_nc_ht=scontent-ord5-1.xx&edm=AP4hL3IEAAAA&oh=00_AT9VaBR4tTqBEQ5j-EkfgHBzz62rVjzNlT0mE8rLKDUkdQ&oe=637D9154
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cnicosia
--

SELECT pg_catalog.setval('public.items_id_seq', 150, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: cnicosia
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


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

