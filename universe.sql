--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter integer NOT NULL,
    has_tail boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    has_life boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    temperature integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 11, true, 'Famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 60, true, 'Very bright comet');
INSERT INTO public.comet VALUES (3, 'Encke', 4, true, 'Short-period comet');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, true, 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, false, 'Nearest major spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 3000000, false, 'A small spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8000, 23000000, false, 'A classic spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9000, 29000000, false, 'Bright galaxy with a central bulge');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 5000, 500000000, false, 'Ring galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (61, 'Moon', 3474, 4500, true, 'Earth moon', 15);
INSERT INTO public.moon VALUES (62, 'Phobos', 22, 4500, false, 'Moon of Mars', 16);
INSERT INTO public.moon VALUES (63, 'Deimos', 12, 4500, false, 'Moon of Mars', 16);
INSERT INTO public.moon VALUES (64, 'Io', 3643, 4500, true, 'Moon of Jupiter', 17);
INSERT INTO public.moon VALUES (65, 'Europa', 3122, 4500, true, 'Moon of Jupiter', 17);
INSERT INTO public.moon VALUES (66, 'Ganymede', 5268, 4500, true, 'Largest moon of Jupiter', 17);
INSERT INTO public.moon VALUES (67, 'Callisto', 4821, 4500, true, 'Moon of Jupiter', 17);
INSERT INTO public.moon VALUES (68, 'Titan', 5150, 4500, true, 'Largest moon of Saturn', 18);
INSERT INTO public.moon VALUES (69, 'Rhea', 1528, 4500, true, 'Moon of Saturn', 18);
INSERT INTO public.moon VALUES (70, 'Iapetus', 1469, 4500, true, 'Moon of Saturn', 18);
INSERT INTO public.moon VALUES (71, 'Dione', 1123, 4500, true, 'Moon of Saturn', 18);
INSERT INTO public.moon VALUES (72, 'Tethys', 1062, 4500, true, 'Moon of Saturn', 18);
INSERT INTO public.moon VALUES (73, 'Enceladus', 504, 4500, true, 'Moon of Saturn', 18);
INSERT INTO public.moon VALUES (74, 'Mimas', 396, 4500, true, 'Moon of Saturn', 18);
INSERT INTO public.moon VALUES (75, 'Miranda', 471, 4500, true, 'Moon of Uranus', 19);
INSERT INTO public.moon VALUES (76, 'Ariel', 1158, 4500, true, 'Moon of Uranus', 19);
INSERT INTO public.moon VALUES (77, 'Umbriel', 1169, 4500, true, 'Moon of Uranus', 19);
INSERT INTO public.moon VALUES (78, 'Titania', 1578, 4500, true, 'Moon of Uranus', 19);
INSERT INTO public.moon VALUES (79, 'Oberon', 1523, 4500, true, 'Moon of Uranus', 19);
INSERT INTO public.moon VALUES (80, 'Triton', 2707, 4500, true, 'Moon of Neptune', 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 4500, 4879, false, true, 'Small rocky planet', 1);
INSERT INTO public.planet VALUES (14, 'Venus', 4500, 12104, false, true, 'Hot rocky planet', 1);
INSERT INTO public.planet VALUES (15, 'Earth', 4500, 12742, true, true, 'Our home planet', 1);
INSERT INTO public.planet VALUES (16, 'Mars', 4500, 6779, false, true, 'The red planet', 1);
INSERT INTO public.planet VALUES (17, 'Jupiter', 4500, 139820, false, false, 'Largest planet in the solar system', 2);
INSERT INTO public.planet VALUES (18, 'Saturn', 4500, 116460, false, false, 'Planet with rings', 2);
INSERT INTO public.planet VALUES (19, 'Uranus', 4500, 50724, false, false, 'Ice giant planet', 3);
INSERT INTO public.planet VALUES (20, 'Neptune', 4500, 49244, false, false, 'Farthest giant planet', 3);
INSERT INTO public.planet VALUES (21, 'Kepler-22b', 2000, 14000, false, true, 'Exoplanet candidate', 4);
INSERT INTO public.planet VALUES (22, 'Proxima b', 4800, 12000, false, true, 'Nearby exoplanet', 5);
INSERT INTO public.planet VALUES (23, 'Gliese 581g', 5000, 13000, false, true, 'Possibly habitable exoplanet', 6);
INSERT INTO public.planet VALUES (24, 'TRAPPIST-1e', 500, 11000, true, true, 'Rocky exoplanet', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, true, 1, 'Our star', 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 242, true, 1, 'Brightest star in the night sky', 9940);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 100, true, 2, 'Red supergiant star', 3500);
INSERT INTO public.star VALUES (4, 'Rigel', 8, true, 2, 'Blue supergiant star', 12100);
INSERT INTO public.star VALUES (5, 'Polaris', 70, true, 3, 'North star', 6015);
INSERT INTO public.star VALUES (6, 'Vega', 455, true, 4, 'Bright star in Lyra', 9602);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 80, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

