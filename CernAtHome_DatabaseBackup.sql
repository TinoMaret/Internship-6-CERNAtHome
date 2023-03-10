PGDMP                         z            try3    15.1    15.1 F    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Y           1262    25008    try3    DATABASE     z   CREATE DATABASE try3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Croatian_Croatia.1250';
    DROP DATABASE try3;
                postgres    false            ?            1259    25027    acceleratorproject    TABLE     ]   CREATE TABLE public.acceleratorproject (
    acceleratorid integer,
    projectid integer
);
 &   DROP TABLE public.acceleratorproject;
       public         heap    postgres    false            ?            1259    25010    accelerators    TABLE     g   CREATE TABLE public.accelerators (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);
     DROP TABLE public.accelerators;
       public         heap    postgres    false            ?            1259    25009    accelerators_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.accelerators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.accelerators_id_seq;
       public          postgres    false    215            Z           0    0    accelerators_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.accelerators_id_seq OWNED BY public.accelerators.id;
          public          postgres    false    214            ?            1259    25041 	   countries    TABLE     ?   CREATE TABLE public.countries (
    id integer NOT NULL,
    country character varying(20) NOT NULL,
    population integer NOT NULL,
    gdp integer NOT NULL,
    CONSTRAINT countries_population_check CHECK ((population > 0))
);
    DROP TABLE public.countries;
       public         heap    postgres    false            ?            1259    25040    countries_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    220            [           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    219            ?            1259    25060    fields    TABLE     A  CREATE TABLE public.fields (
    id integer NOT NULL,
    field character varying(25) NOT NULL,
    CONSTRAINT fields_field_check CHECK (((field)::text = ANY ((ARRAY['Programer'::character varying, 'Fizičar'::character varying, 'Inžinjer'::character varying, 'Znanstvenik materijala'::character varying])::text[])))
);
    DROP TABLE public.fields;
       public         heap    postgres    false            ?            1259    25059    fields_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.fields_id_seq;
       public          postgres    false    224            \           0    0    fields_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.fields_id_seq OWNED BY public.fields.id;
          public          postgres    false    223            ?            1259    25051    hotels    TABLE     ?   CREATE TABLE public.hotels (
    id integer NOT NULL,
    hotel character varying(30) NOT NULL,
    city character varying(30) NOT NULL
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            ?            1259    25050    hotels_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.hotels_id_seq;
       public          postgres    false    222            ]           0    0    hotels_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;
          public          postgres    false    221            ?            1259    25019    projects    TABLE     f   CREATE TABLE public.projects (
    id integer NOT NULL,
    project character varying(30) NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    25018    projects_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projects_id_seq;
       public          postgres    false    217            ^           0    0    projects_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;
          public          postgres    false    216            ?            1259    25091 
   researches    TABLE     4  CREATE TABLE public.researches (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    amountofcitations integer NOT NULL,
    dateofpublishment timestamp without time zone NOT NULL,
    projectid integer,
    CONSTRAINT researches_amountofcitations_check CHECK ((amountofcitations >= 0))
);
    DROP TABLE public.researches;
       public         heap    postgres    false            ?            1259    25090    researches_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.researches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.researches_id_seq;
       public          postgres    false    228            _           0    0    researches_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.researches_id_seq OWNED BY public.researches.id;
          public          postgres    false    227            ?            1259    25068 
   scientists    TABLE     ?  CREATE TABLE public.scientists (
    id integer NOT NULL,
    firstname character varying(20) NOT NULL,
    lastname character varying(20) NOT NULL,
    dateofbirth timestamp without time zone NOT NULL,
    gender character varying(1) NOT NULL,
    countryid integer,
    fieldid integer,
    hotelid integer,
    CONSTRAINT scientists_gender_check CHECK (((gender)::text = ANY ((ARRAY['M'::character varying, 'Ž'::character varying, 'N'::character varying, 'O'::character varying])::text[])))
);
    DROP TABLE public.scientists;
       public         heap    postgres    false            ?            1259    25067    scientists_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.scientists_id_seq;
       public          postgres    false    226            `           0    0    scientists_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.scientists_id_seq OWNED BY public.scientists.id;
          public          postgres    false    225            ?            1259    25105 	   signature    TABLE     S   CREATE TABLE public.signature (
    scientistid integer,
    researchid integer
);
    DROP TABLE public.signature;
       public         heap    postgres    false            ?           2604    25013    accelerators id    DEFAULT     r   ALTER TABLE ONLY public.accelerators ALTER COLUMN id SET DEFAULT nextval('public.accelerators_id_seq'::regclass);
 >   ALTER TABLE public.accelerators ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            ?           2604    25044    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            ?           2604    25063 	   fields id    DEFAULT     f   ALTER TABLE ONLY public.fields ALTER COLUMN id SET DEFAULT nextval('public.fields_id_seq'::regclass);
 8   ALTER TABLE public.fields ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            ?           2604    25054 	   hotels id    DEFAULT     f   ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);
 8   ALTER TABLE public.hotels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ?           2604    25022    projects id    DEFAULT     j   ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);
 :   ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            ?           2604    25094    researches id    DEFAULT     n   ALTER TABLE ONLY public.researches ALTER COLUMN id SET DEFAULT nextval('public.researches_id_seq'::regclass);
 <   ALTER TABLE public.researches ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            ?           2604    25071    scientists id    DEFAULT     n   ALTER TABLE ONLY public.scientists ALTER COLUMN id SET DEFAULT nextval('public.scientists_id_seq'::regclass);
 <   ALTER TABLE public.scientists ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            H          0    25027    acceleratorproject 
   TABLE DATA           F   COPY public.acceleratorproject (acceleratorid, projectid) FROM stdin;
    public          postgres    false    218   ?P       E          0    25010    accelerators 
   TABLE DATA           0   COPY public.accelerators (id, name) FROM stdin;
    public          postgres    false    215   Q       J          0    25041 	   countries 
   TABLE DATA           A   COPY public.countries (id, country, population, gdp) FROM stdin;
    public          postgres    false    220   HQ       N          0    25060    fields 
   TABLE DATA           +   COPY public.fields (id, field) FROM stdin;
    public          postgres    false    224   ?Q       L          0    25051    hotels 
   TABLE DATA           1   COPY public.hotels (id, hotel, city) FROM stdin;
    public          postgres    false    222    R       G          0    25019    projects 
   TABLE DATA           /   COPY public.projects (id, project) FROM stdin;
    public          postgres    false    217   vR       R          0    25091 
   researches 
   TABLE DATA           _   COPY public.researches (id, name, amountofcitations, dateofpublishment, projectid) FROM stdin;
    public          postgres    false    228   ?R       P          0    25068 
   scientists 
   TABLE DATA           o   COPY public.scientists (id, firstname, lastname, dateofbirth, gender, countryid, fieldid, hotelid) FROM stdin;
    public          postgres    false    226   ?S       S          0    25105 	   signature 
   TABLE DATA           <   COPY public.signature (scientistid, researchid) FROM stdin;
    public          postgres    false    229   ?T       a           0    0    accelerators_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.accelerators_id_seq', 1, false);
          public          postgres    false    214            b           0    0    countries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.countries_id_seq', 1, false);
          public          postgres    false    219            c           0    0    fields_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.fields_id_seq', 1, false);
          public          postgres    false    223            d           0    0    hotels_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.hotels_id_seq', 1, false);
          public          postgres    false    221            e           0    0    projects_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.projects_id_seq', 1, false);
          public          postgres    false    216            f           0    0    researches_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.researches_id_seq', 1, false);
          public          postgres    false    227            g           0    0    scientists_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.scientists_id_seq', 1, false);
          public          postgres    false    225            ?           2606    25017 "   accelerators accelerators_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_name_key;
       public            postgres    false    215            ?           2606    25015    accelerators accelerators_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_pkey;
       public            postgres    false    215            ?           2606    25049    countries countries_country_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_key UNIQUE (country);
 I   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_country_key;
       public            postgres    false    220            ?           2606    25047    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    220            ?           2606    25066    fields fields_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.fields
    ADD CONSTRAINT fields_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.fields DROP CONSTRAINT fields_pkey;
       public            postgres    false    224            ?           2606    25058    hotels hotels_hotel_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_hotel_key UNIQUE (hotel);
 A   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_hotel_key;
       public            postgres    false    222            ?           2606    25056    hotels hotels_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    222            ?           2606    25024    projects projects_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    217            ?           2606    25026    projects projects_project_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_project_key UNIQUE (project);
 G   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_project_key;
       public            postgres    false    217            ?           2606    25099    researches researches_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.researches
    ADD CONSTRAINT researches_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.researches DROP CONSTRAINT researches_name_key;
       public            postgres    false    228            ?           2606    25097    researches researches_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.researches
    ADD CONSTRAINT researches_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.researches DROP CONSTRAINT researches_pkey;
       public            postgres    false    228            ?           2606    25074    scientists scientists_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_pkey;
       public            postgres    false    226            ?           2606    25030 8   acceleratorproject acceleratorproject_acceleratorid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorproject
    ADD CONSTRAINT acceleratorproject_acceleratorid_fkey FOREIGN KEY (acceleratorid) REFERENCES public.accelerators(id);
 b   ALTER TABLE ONLY public.acceleratorproject DROP CONSTRAINT acceleratorproject_acceleratorid_fkey;
       public          postgres    false    215    218    3225            ?           2606    25035 4   acceleratorproject acceleratorproject_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorproject
    ADD CONSTRAINT acceleratorproject_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(id);
 ^   ALTER TABLE ONLY public.acceleratorproject DROP CONSTRAINT acceleratorproject_projectid_fkey;
       public          postgres    false    218    217    3227            ?           2606    25100 $   researches researches_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.researches
    ADD CONSTRAINT researches_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(id);
 N   ALTER TABLE ONLY public.researches DROP CONSTRAINT researches_projectid_fkey;
       public          postgres    false    217    3227    228            ?           2606    25075 $   scientists scientists_countryid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(id);
 N   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_countryid_fkey;
       public          postgres    false    220    226    3233            ?           2606    25080 "   scientists scientists_fieldid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_fieldid_fkey FOREIGN KEY (fieldid) REFERENCES public.fields(id);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_fieldid_fkey;
       public          postgres    false    226    224    3239            ?           2606    25085 "   scientists scientists_hotelid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(id);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_hotelid_fkey;
       public          postgres    false    226    222    3237            ?           2606    25113 #   signature signature_researchid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.signature
    ADD CONSTRAINT signature_researchid_fkey FOREIGN KEY (researchid) REFERENCES public.researches(id);
 M   ALTER TABLE ONLY public.signature DROP CONSTRAINT signature_researchid_fkey;
       public          postgres    false    3245    228    229            ?           2606    25108 $   signature signature_scientistid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.signature
    ADD CONSTRAINT signature_scientistid_fkey FOREIGN KEY (scientistid) REFERENCES public.scientists(id);
 N   ALTER TABLE ONLY public.signature DROP CONSTRAINT signature_scientistid_fkey;
       public          postgres    false    229    3241    226            H      x?3?4?2?4?2??@???? K?      E      x?3?tLNN?1?2?0???!c?=... ???      J   P   x?3?<??,39??8;???????????Јˈӹ(??$3?????$jf?e??X???W????ibjah 7?4?????? (??      N   H   x?3?(?O/J?M-?2?tˬ?<қX?e???wt_f^P؄3*/1???,5/3[!7?$?(3+1'?+F??? ??K      L   f   x?3??M?KI,??S?/?L?+I??<?75/?,?ˈ3<??<39.b???_????T?Y\??Pi?雚?????Z? V??Z???Z?e?阜
????qqq j:)?      G      x?3?(??2?2?F\?`ژ+F??? on?      R   *  x?]??N?0E????y?W?.@K?J[??@bc?Xrr???=?n?fv???3?p?M;???????]Y?????J?Q*??????d
v????D??ݸ\qpu???PL?7???^!LH?B&??*??zؼ<??iQJ*")??2B[?+]ֆ?fa[jP??M???????>?<????g??ؒ"?B⒝???u? I?h3pI[Am???eI?x?m˽q?|C<?1?m??K??Ζj???⏝oi??;??cJC?[NC	o????'m?F{=ҥ???ɭ??c?L?u2      P     x?]?AN?0E??Sp#;???e??$6lؘfh-?]9T?ƒ{1?? {????HX??w?????
.??L?????7Hz??z???????	.????߁?SPG?]?p?1?8]??^?ɬX??#9?輝բ ???$??`}?g߬O?2?\?G?Mɤ.?4?????+?ӈl"Kh??XXE7??%?tZgxV.*?VP???a???5M?1?ɬ???#U??!i?q???9B
?	?WX?/??|͕\?X???c??g      S   :   x???  ???0??r???s??%???!??d?r5H?}ݲӔ?t?n?a???X     