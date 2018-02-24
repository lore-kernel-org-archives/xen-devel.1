From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3] tools: detect appropriate debug
	optimization level
Date: Fri, 23 Feb 2018 23:26:17 -0600
Message-ID: <26771eaa-0904-30bb-a728-096d18ab480f@cardoe.com>
References: <1461681525-12078-1-git-send-email-cardoe@cardoe.com>
 <20160428174049.GG18194@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1652470892662377210=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20160428174049.GG18194@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1652470892662377210==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="MOWgJNLqg7xdSdPAS54FxbJaX4atqU4xc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MOWgJNLqg7xdSdPAS54FxbJaX4atqU4xc
Content-Type: multipart/mixed; boundary="EWkynm1hdzJnithMrln3ELQXce85sNp8K";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xen.org, Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <26771eaa-0904-30bb-a728-096d18ab480f@cardoe.com>
Subject: Re: [PATCH v3] tools: detect appropriate debug optimization level
References: <1461681525-12078-1-git-send-email-cardoe@cardoe.com>
 <20160428174049.GG18194@citrix.com>
In-Reply-To: <20160428174049.GG18194@citrix.com>

--EWkynm1hdzJnithMrln3ELQXce85sNp8K
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/28/16 12:40 PM, Wei Liu wrote:
> On Tue, Apr 26, 2016 at 09:38:45AM -0500, Doug Goldstein wrote:
>> When building debug use -Og as the optimization level if its available=
,
>> otherwise retain the use of -O0. -Og has been added by GCC to enable a=
ll
>> optimizations that to not affect debugging while retaining full
>> debugability.
>>
>> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>> ---
>> change since v2:
>> - switch back to cc-option-add to not call cc-option on every invocati=
on
>> change since v1:
>> - switch to cc-option to only specify -O0 if -Og isn't supported
>> ---
>>  tools/Rules.mk | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/Rules.mk b/tools/Rules.mk
>> index 9ef0b47..1b79a6e 100644
>> --- a/tools/Rules.mk
>> +++ b/tools/Rules.mk
>> @@ -138,6 +138,7 @@ SHLIB_libxenvchan  =3D $(SHDEPS_libxenvchan) -Wl,-=
rpath-link=3D$(XEN_LIBVCHAN)
>>  ifeq ($(debug),y)
>>  # Disable optimizations and enable debugging information for macros
>>  CFLAGS +=3D -O0 -g3
>> +$(call cc-option-add,CFLAGS,CC,-Og)
>>  # But allow an override to -O0 in case Python enforces -D_FORTIFY_SOU=
RCE=3D<n>.
>>  PY_CFLAGS +=3D $(PY_NOOPT_CFLAGS)
>>  endif
>> --=20
>> 2.7.3
>=20
> Heh, this patch seems to has a (good) side effect. I will look into
> fixing that tomorrow.
>=20
> make[10]: Entering directory '/local/work/COMMITTER/xen.git/tools/firmw=
are/rombios/32bit/tcgbios'
> gcc   -O1 -fno-omit-frame-pointer -m32 -march=3Di686 -g -fno-strict-ali=
asing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statemen=
t -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O0 -g3 -Og -=
D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .t=
cgbios.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -fno-optimize-siblin=
g-calls -mno-tls-direct-seg-refs  -Werror -fno-stack-protector -fno-excep=
tions -fno-builtin -msoft-float -I/local/work/COMMITTER/xen.git/tools/fir=
mware/rombios/32bit/tcgbios/../../../../../tools/include -I.. -I../..  -c=
 -o tcgbios.o tcgbios.c=20
> gcc   -O1 -fno-omit-frame-pointer -m32 -march=3Di686 -g -fno-strict-ali=
asing -std=3Dgnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statemen=
t -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O0 -g3 -Og -=
D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF .t=
pm_drivers.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -fno-optimize-si=
bling-calls -mno-tls-direct-seg-refs  -Werror -fno-stack-protector -fno-e=
xceptions -fno-builtin -msoft-float -I/local/work/COMMITTER/xen.git/tools=
/firmware/rombios/32bit/tcgbios/../../../../../tools/include -I.. -I../..=
  -c -o tpm_drivers.o tpm_drivers.c=20
> tcgbios.c: In function =E2=80=98tcpa_extend_acpi_log=E2=80=99:
> tcgbios.c:362:3: error: =E2=80=98size=E2=80=99 may be used uninitialize=
d in this function [-Werror=3Dmaybe-uninitialized]
>    memcpy((char *)lasa_last, (char *)entry_ptr, size);
>    ^
> tcgbios.c: In function =E2=80=98HashLogEvent32=E2=80=99:
> tcgbios.c:1142:22: error: =E2=80=98entry=E2=80=99 may be used uninitial=
ized in this function [-Werror=3Dmaybe-uninitialized]
>     hleo->eventnumber =3D entry;
>                       ^
> tcgbios.c:1131:10: error: =E2=80=98logdataptr=E2=80=99 may be used unin=
itialized in this function [-Werror=3Dmaybe-uninitialized]
>     entry =3D tcpa_extend_acpi_log(logdataptr);
>           ^

This appears to be fixed with 0b5e769ae3ac81f8a8dfaf476147ccdf41caeb68
but the patch referenced here never landed. The patch doesn't apply
cleanly anymore (due to context) but its a one-liner so maybe someone
can fix it up as its committed?

--=20
Doug Goldstein


--EWkynm1hdzJnithMrln3ELQXce85sNp8K--

--MOWgJNLqg7xdSdPAS54FxbJaX4atqU4xc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqQ93lfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl1DQg//ap+dS5F2o3s1mV5lqXraMSWaGHKPy2kVi3hA+dnic8+YAb51MpZnxXp7
v53ob20TDxW99Wr2iDIgF6tjUxXToASIS0+J4MxYe6IS+OcFMEhMTeC2+Y6go7H/
OBHo7ZX5SwVu2180SD8AkMHDseU5riRu2p0uh5vlijCuPjXmX6gCNf5AXkfpOAzq
LbR9GWEvYBgqLuJvVqu8DNdbWuhuEacPvzkaa54xhgtT6Kpz4lbOZFgks+/ZXSrS
zisZp/JDj0pb9z418wMRqWbEEo1ZW6Tuudt38yGasWZjWPpw+gvbZgmlIUWEHqBG
isG578fCvyo4NtG692EG8InV9HnLYSp4BZq9o8EEvu7ddVWdKDFPvMjTpAszz0d+
k8RpxevhBb8gCUNpdIwd8SBBzwIzSVwsT0YapXo2vPUnNDGj/i3aj0pnlKmCRq8T
m02Mp8H72VZSuI2X+wZtjtgL+W0ys2vnS1yunwhactasdyGTwQOUBYQSAZSPf7lG
yich3Q45sFj+9p93N8cvAOIOOrnwNJDpypt5Tmt7ZhkJ0XxEioexCRMsk/894csB
kz4hSdq4A9DTR0FE9I0hnnbHf+tDLCvUjm8uD6Uos3TeIEX7S1z+o/mTYouqkIwr
9snL00bTDIZ/NrTmdmllkXpn8iepgfkHp9Ug5avzPji7X9RXOEU=
=207g
-----END PGP SIGNATURE-----

--MOWgJNLqg7xdSdPAS54FxbJaX4atqU4xc--


--===============1652470892662377210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1652470892662377210==--
