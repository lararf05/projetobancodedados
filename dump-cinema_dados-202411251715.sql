PGDMP                   
    |           cinema_dados    16.6    16.6 ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    cinema_dados    DATABASE     �   CREATE DATABASE cinema_dados WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE cinema_dados;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16400    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome character varying(100) NOT NULL,
    telefone character varying(20),
    identidade character varying(20) NOT NULL,
    email character varying(255) NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    4            �            1259    16399    cliente_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_id_cliente_seq;
       public          postgres    false    4    216            �           0    0    cliente_id_cliente_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;
          public          postgres    false    215            �            1259    24594    filme    TABLE       CREATE TABLE public.filme (
    id_filme integer NOT NULL,
    nome character varying(100) NOT NULL,
    genero character varying(20) NOT NULL,
    classificacao character varying(20) NOT NULL,
    sinopse text,
    duracao time without time zone NOT NULL
);
    DROP TABLE public.filme;
       public         heap    postgres    false    4            �            1259    24593    filme_id_filme_seq    SEQUENCE     �   CREATE SEQUENCE public.filme_id_filme_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.filme_id_filme_seq;
       public          postgres    false    222    4            �           0    0    filme_id_filme_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.filme_id_filme_seq OWNED BY public.filme.id_filme;
          public          postgres    false    221            �            1259    24603    ingresso    TABLE     �   CREATE TABLE public.ingresso (
    id_ingresso integer NOT NULL,
    tipo character varying(50) NOT NULL,
    id_cliente integer,
    id_sessao integer,
    preco numeric(10,2) NOT NULL
);
    DROP TABLE public.ingresso;
       public         heap    postgres    false    4            �            1259    24602    ingresso_id_ingresso_seq    SEQUENCE     �   CREATE SEQUENCE public.ingresso_id_ingresso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ingresso_id_ingresso_seq;
       public          postgres    false    224    4            �           0    0    ingresso_id_ingresso_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ingresso_id_ingresso_seq OWNED BY public.ingresso.id_ingresso;
          public          postgres    false    223            �            1259    16481    sala    TABLE     �   CREATE TABLE public.sala (
    id_sala integer NOT NULL,
    nome character varying(50) NOT NULL,
    capacidade integer NOT NULL,
    tipo character varying(50) NOT NULL
);
    DROP TABLE public.sala;
       public         heap    postgres    false    4            �            1259    16480    sala_id_sala_seq    SEQUENCE     �   CREATE SEQUENCE public.sala_id_sala_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.sala_id_sala_seq;
       public          postgres    false    220    4            �           0    0    sala_id_sala_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.sala_id_sala_seq OWNED BY public.sala.id_sala;
          public          postgres    false    219            �            1259    16423    sessao    TABLE     �   CREATE TABLE public.sessao (
    id_sessao integer NOT NULL,
    id_filme integer,
    id_sala integer,
    data date NOT NULL,
    hora time without time zone NOT NULL
);
    DROP TABLE public.sessao;
       public         heap    postgres    false    4            �            1259    16422    sessao_id_sessao_seq    SEQUENCE     �   CREATE SEQUENCE public.sessao_id_sessao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sessao_id_sessao_seq;
       public          postgres    false    218    4            �           0    0    sessao_id_sessao_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sessao_id_sessao_seq OWNED BY public.sessao.id_sessao;
          public          postgres    false    217            
           2604    16403    cliente id_cliente    DEFAULT     x   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    215    216    216                       2604    24597    filme id_filme    DEFAULT     p   ALTER TABLE ONLY public.filme ALTER COLUMN id_filme SET DEFAULT nextval('public.filme_id_filme_seq'::regclass);
 =   ALTER TABLE public.filme ALTER COLUMN id_filme DROP DEFAULT;
       public          postgres    false    222    221    222                       2604    24606    ingresso id_ingresso    DEFAULT     |   ALTER TABLE ONLY public.ingresso ALTER COLUMN id_ingresso SET DEFAULT nextval('public.ingresso_id_ingresso_seq'::regclass);
 C   ALTER TABLE public.ingresso ALTER COLUMN id_ingresso DROP DEFAULT;
       public          postgres    false    223    224    224                       2604    16484    sala id_sala    DEFAULT     l   ALTER TABLE ONLY public.sala ALTER COLUMN id_sala SET DEFAULT nextval('public.sala_id_sala_seq'::regclass);
 ;   ALTER TABLE public.sala ALTER COLUMN id_sala DROP DEFAULT;
       public          postgres    false    219    220    220                       2604    16426    sessao id_sessao    DEFAULT     t   ALTER TABLE ONLY public.sessao ALTER COLUMN id_sessao SET DEFAULT nextval('public.sessao_id_sessao_seq'::regclass);
 ?   ALTER TABLE public.sessao ALTER COLUMN id_sessao DROP DEFAULT;
       public          postgres    false    217    218    218            �          0    16400    cliente 
   TABLE DATA           P   COPY public.cliente (id_cliente, nome, telefone, identidade, email) FROM stdin;
    public          postgres    false    216   �0       �          0    24594    filme 
   TABLE DATA           X   COPY public.filme (id_filme, nome, genero, classificacao, sinopse, duracao) FROM stdin;
    public          postgres    false    222   �1       �          0    24603    ingresso 
   TABLE DATA           S   COPY public.ingresso (id_ingresso, tipo, id_cliente, id_sessao, preco) FROM stdin;
    public          postgres    false    224   3       �          0    16481    sala 
   TABLE DATA           ?   COPY public.sala (id_sala, nome, capacidade, tipo) FROM stdin;
    public          postgres    false    220   �3       �          0    16423    sessao 
   TABLE DATA           J   COPY public.sessao (id_sessao, id_filme, id_sala, data, hora) FROM stdin;
    public          postgres    false    218   v4       �           0    0    cliente_id_cliente_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 4, true);
          public          postgres    false    215            �           0    0    filme_id_filme_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.filme_id_filme_seq', 4, true);
          public          postgres    false    221            �           0    0    ingresso_id_ingresso_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.ingresso_id_ingresso_seq', 8, true);
          public          postgres    false    223            �           0    0    sala_id_sala_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sala_id_sala_seq', 4, true);
          public          postgres    false    219            �           0    0    sessao_id_sessao_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sessao_id_sessao_seq', 4, true);
          public          postgres    false    217                       2606    16405    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    216                       2606    24601    filme filme_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.filme
    ADD CONSTRAINT filme_pkey PRIMARY KEY (id_filme);
 :   ALTER TABLE ONLY public.filme DROP CONSTRAINT filme_pkey;
       public            postgres    false    222                       2606    24608    ingresso ingresso_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ingresso
    ADD CONSTRAINT ingresso_pkey PRIMARY KEY (id_ingresso);
 @   ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_pkey;
       public            postgres    false    224                       2606    16486    sala sala_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.sala
    ADD CONSTRAINT sala_pkey PRIMARY KEY (id_sala);
 8   ALTER TABLE ONLY public.sala DROP CONSTRAINT sala_pkey;
       public            postgres    false    220                       2606    16428    sessao sessao_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.sessao
    ADD CONSTRAINT sessao_pkey PRIMARY KEY (id_sessao);
 <   ALTER TABLE ONLY public.sessao DROP CONSTRAINT sessao_pkey;
       public            postgres    false    218                       2606    16440    sessao unique_session 
   CONSTRAINT     i   ALTER TABLE ONLY public.sessao
    ADD CONSTRAINT unique_session UNIQUE (id_filme, id_sala, data, hora);
 ?   ALTER TABLE ONLY public.sessao DROP CONSTRAINT unique_session;
       public            postgres    false    218    218    218    218                       2606    24609 !   ingresso ingresso_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingresso
    ADD CONSTRAINT ingresso_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 K   ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_id_cliente_fkey;
       public          postgres    false    224    4624    216                       2606    24614     ingresso ingresso_id_sessao_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingresso
    ADD CONSTRAINT ingresso_id_sessao_fkey FOREIGN KEY (id_sessao) REFERENCES public.sessao(id_sessao);
 J   ALTER TABLE ONLY public.ingresso DROP CONSTRAINT ingresso_id_sessao_fkey;
       public          postgres    false    4626    224    218            �   ;   1	Sofia Cardoso	(83) 9897-3421	123456789	sofia13@gmail.com
 =   2	Ana Clara M.	(83) 8976-4532	987654321	anaclara23@gmail.com
 <   3	João Silva	(83) 1234-5678	234567890	joao.silva@gmail.com
 ?   4	Mariana Lima	(83) 4321-8765	112233445	mariana.lima@gmail.com
    \.


      �   L   1	Zootopia	Ação e aventura	12 anos	Descrição do filme Zootopia	02:42:00
 d   2	Velozes e furiosos 5	Ação e aventura	18 anos	Descrição do filme Velozes e furiosos 5	02:11:00
 <   3	Avatar	Drama	14 anos	Descrição do filme Avatar	02:42:00
 I   4	Harry Potter	Terror	17 anos	Descrição do filme Harry Potter	02:32:00
    \.


      �      1	Inteira	1	1	20.00
    2	Meia	1	1	10.00
    3	Inteira	2	2	25.00
    4	Meia	2	2	12.50
    5	Inteira	3	3	30.00
    6	Meia	3	3	15.00
    7	Inteira	4	4	40.00
    8	Meia	4	4	20.00
    \.


      �      1	Sala1	100	Sala Padrão
    2	Sala 2	300	Sala IMAX
    3	Sala3	150	Sala 4D
    4	Sala VIP	50	Sala D-BOX
    \.


      �      1	1	1	2024-10-25	14:00:00
    2	2	2	2024-10-15	18:00:00
    3	3	3	2024-10-21	19:00:00
    4	4	4	2024-10-25	22:00:00
    \.


     