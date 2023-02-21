--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: discoveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discoveries (
    discovery_id integer NOT NULL,
    celestial_body_id integer NOT NULL,
    celestial_body_type character varying(20) NOT NULL,
    person_id integer NOT NULL,
    discovery_year integer,
    notes text
);


ALTER TABLE public.discoveries OWNER TO postgres;

--
-- Name: discoveries_discovery_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discoveries_discovery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discoveries_discovery_id_seq OWNER TO postgres;

--
-- Name: discoveries_discovery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discoveries_discovery_id_seq OWNED BY public.discoveries.discovery_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    constellation character varying(40),
    galaxy_type character varying(40),
    approx_number_of_stars_billion numeric(10,2),
    diameter_billion_km numeric(10,2),
    distance_in_light_years_million numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    has_prograde_orbit boolean
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.people (
    person_id integer NOT NULL,
    name character varying(40) NOT NULL,
    country character varying(40),
    date_of_birth date,
    date_of_death date,
    notes text
);


ALTER TABLE public.people OWNER TO postgres;

--
-- Name: people_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.people_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_person_id_seq OWNER TO postgres;

--
-- Name: people_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.people_person_id_seq OWNED BY public.people.person_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    description text,
    planet_type character varying(40),
    order_from_star integer,
    has_life boolean,
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    apparent_magnitude numeric(5,2),
    absolute_magnitude numeric(5,2),
    distance_in_light_years numeric(10,2),
    spectral_type character varying(40),
    mass_10_to_30_kg numeric(10,2)
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: discoveries discovery_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discoveries ALTER COLUMN discovery_id SET DEFAULT nextval('public.discoveries_discovery_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: people person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people ALTER COLUMN person_id SET DEFAULT nextval('public.people_person_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: discoveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discoveries (discovery_id, celestial_body_id, celestial_body_type, person_id, discovery_year, notes) FROM stdin;
1	2	galaxy	1	964	\N
2	15	galaxy	1	964	\N
3	3	galaxy	2	1968	\N
4	6	galaxy	3	1781	\N
5	16	galaxy	3	1779	\N
6	7	galaxy	4	1774	\N
7	14	galaxy	4	1774	\N
8	9	galaxy	5	1773	\N
9	11	galaxy	6	1785	\N
10	13	galaxy	7	1779	\N
11	3	star	8	1915	\N
12	5	star	9	1916	\N
13	2	star	10	2013	\N
14	11	planet	10	2013	\N
15	10	planet	11	2005	\N
16	2	moon	12	1877	\N
17	3	moon	13	1877	\N
18	8	moon	14	1610	\N
19	9	moon	14	1610	\N
20	10	moon	14	1610	\N
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galaxy (galaxy_id, name, description, constellation, galaxy_type, approx_number_of_stars_billion, diameter_billion_km, distance_in_light_years_million) FROM stdin;
1	Milky Way	The galaxy containing the sun and its solar system.	Sagittarius	spiral	400.00	100000.00	\N
2	Andromeda Galaxy (M31)	The closest galaxy to the Milky Way.	Andromeda	spiral	1000.00	220000.00	2.50
3	Maffei 1	The closest elliptical galaxy to the Milky Way.	Cassiopeia	elliptical	\N	40000.00	3.20
4	Large Magellanic Cloud	\N	Dorado-Mensa	spiral	10.00	14000.00	160.00
5	Small Magellanic Cloud	\N	Tucana-Hydrus	irregular	7.00	7000.00	200.00
6	Pinwheel Galaxy	\N	Ursa Major	spiral	21.00	70000.00	21.00
7	Cigar Galaxy (M82)	\N	Ursa Major	starburst	10.00	12000.00	12.00
8	Sombrero Galaxy (M104)	\N	Virgo	spiral	1.00	50000.00	28.00
10	Tadpole Galaxy	\N	Draco	spiral	10.00	60000.00	420.00
11	Antennae Galaxies (NGC 4038/NGC 4039)	\N	Corvus	starburst	10.00	40000.00	45.00
12	Backward Galaxies	\N	Centaurus	spiral	\N	70000.00	120.00
13	Black Eye Galaxy	\N	Coma Berenices	spiral	10.00	20000.00	17.00
14	Bode's Galaxy	\N	Ursa Major	spiral	10.00	30000.00	11.80
15	Triangulum Galaxy (M33)	\N	Triangulum	spiral	40.00	50000.00	3.00
16	Sunflower Galaxy (M63)	\N	Canes Venatici	spiral	10.00	70000.00	27.00
17	Condor Galaxy (NGC6872)	\N	Pavo	spiral	\N	250000.00	230.00
9	Whirlpool Galaxy	\N	Canes Venatici	spiral	50.00	60000.00	31.00
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moon (moon_id, name, planet_id, has_prograde_orbit) FROM stdin;
1	The Moon	1	t
2	Phobos	4	t
3	Metis	4	t
4	Adrastea	5	t
5	Amalthea	5	t
6	Thebe	5	t
7	Io	5	t
8	Europa	5	t
9	Ganymede	5	t
10	Callisto	5	t
11	Themisto	5	t
12	Leda	5	t
13	Himalia	5	t
14	Lysithea	5	t
15	Elara	5	t
16	Dia	5	t
17	Carpo	5	t
18	Euporie	5	t
19	S/2003 J 2	5	t
20	S/2003 J 3	5	t
21	S/2003 J 4	5	t
22	S/2003 J 5	5	t
23	S/2003 J 9	5	t
24	S/2003 J 10	5	t
25	S/2003 J 12	5	t
26	Valetudo	5	t
27	Sinope	5	f
28	Ananke	5	f
29	Carme	5	f
30	Pasiphae	5	f
31	Megaclite	5	f
32	Callirrhoe	5	f
33	Kalyke	5	f
34	Iocaste	5	f
35	Erinome	5	f
36	Isonoe	5	f
37	Praxidike	5	f
38	Harpalyke	5	f
39	Anthe	5	f
40	Thyone	5	f
41	Hermippe	5	f
42	Mneme	5	f
43	Thelxinoe	5	f
44	Helike	5	f
45	Orthosie	5	f
46	Euanthe	5	f
47	Eurydome	5	f
48	S/2003 J 18	5	f
49	S/2010 J 1	5	f
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.people (person_id, name, country, date_of_birth, date_of_death, notes) FROM stdin;
1	Al-Sufi	Persia	0903-12-07	0986-05-25	\N
2	Paolo Maffei	Italy	1926-01-02	2009-03-01	\N
3	Pierre Méchain	France	1774-08-16	1804-09-20	\N
4	Johann Elert Bode	Germany	1747-01-19	1826-11-23	\N
5	Charles Messier	France	1730-06-26	1817-04-12	\N
6	William Herschel	England	1738-11-15	1822-08-25	\N
7	Edward Pigott	England	\N	1825-06-27	\N
8	Robert T.A. Innes	Scotland	1861-11-10	1933-03-13	\N
9	Edward Emerson Barnard	USA	1857-12-16	1923-02-06	\N
10	NASA	USA	\N	\N	\N
11	California Institute of Techology	USA	\N	\N	\N
12	Asaph Hall III	USA	1829-10-15	1907-11-22	\N
13	Pierre-Simon Laplace	France	1749-03-23	1827-03-05	\N
14	Galileo Galilei	Italy	1564-02-15	1642-01-08	\N
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planet (planet_id, name, star_id, description, planet_type, order_from_star, has_life, has_rings) FROM stdin;
1	Earth	1	\N	terrestrial	3	t	f
2	Mercury	1	\N	terrestrial	1	f	f
3	Venus	1	\N	terrestrial	2	f	f
4	Mars	1	\N	terrestrial	4	f	f
5	Jupiter	1	\N	gas giant	5	f	t
6	Saturn	1	\N	gas giant	6	f	t
7	Uranus	1	\N	ice giant	7	f	t
8	Neptune	1	\N	ice giant	8	f	t
9	Pluto	1	Dwarf planet.	terrestrial	9	f	f
10	Eris	1	Dwarf Planet.	terrestrial	10	f	f
11	Kepler-69c	2	Originally thought to be in the circumstellar habitable zone (CHZ), now thought to be too hot.	terrestrial	\N	f	f
12	Kepler-186f	2	Orbits in the habitable zone.	terrestrial	\N	f	f
13	Proxima Centauri b	3	Closest exoplanet to Earth.	terrestrial	\N	f	f
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star (star_id, name, galaxy_id, apparent_magnitude, absolute_magnitude, distance_in_light_years, spectral_type, mass_10_to_30_kg) FROM stdin;
1	The Sun	1	-26.83	4.83	0.00	G-type main-sequence star (G dwarf)	1.99
2	Kepler-69	1	13.70	4.30	2430.00	G-type main-sequence star (G dwarf)	1.04
3	Proxima Centauri	1	10.43	15.60	4.25	M-type red dwarf	0.12
4	Betelgeuse	1	0.58	-5.14	640.00	M-type red supergiant	8.00
5	Barnard's Star	1	9.51	13.20	6.00	M-type red dwarf	0.14
6	Sirius	1	-1.44	1.45	8.60	A-type main-sequence star (A dwarf)	2.06
7	Canopus	1	-0.62	-5.53	310.00	F-type supergiant	4.40
8	Arcturus	1	-0.04	0.20	37.00	K-type giant star	1.10
9	Vega	1	0.03	0.58	25.00	A-type main-sequence star (A dwarf)	2.10
10	Rigil Kentaurus	1	-0.27	4.34	4.36	G-type main-sequence star (G dwarf)	1.10
11	Toliman	1	1.33	5.71	4.36	G-type main-sequence star (G dwarf)	1.10
\.


--
-- Name: discoveries_discovery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discoveries_discovery_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 19, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 49, true);


--
-- Name: people_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.people_person_id_seq', 14, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: discoveries discoveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_pkey PRIMARY KEY (discovery_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (person_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: discoveries discoveries_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discoveries
    ADD CONSTRAINT discoveries_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.people(person_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

