From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3] tools: detect appropriate debug
	optimization level
Date: Sat, 10 Mar 2018 23:08:21 -0600
Message-ID: <3a1f2f6c-bbbb-874b-1b73-35a8a1784ce9@cardoe.com>
References: <1461681525-12078-1-git-send-email-cardoe@cardoe.com>
 <20160428174049.GG18194@citrix.com>
 <26771eaa-0904-30bb-a728-096d18ab480f@cardoe.com>
 <20180302124621.7egzn7kr7lxyz5lm@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8246932695298988846=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180302124621.7egzn7kr7lxyz5lm@citrix.com>
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
--===============8246932695298988846==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="yIrlqdDhpt2Wh9pPRFe7mmICr50chW1Im"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yIrlqdDhpt2Wh9pPRFe7mmICr50chW1Im
Content-Type: multipart/mixed; boundary="C6DR4PNJY0f5N4bGlvrm3scCowAsaHDVc";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xen.org, Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <3a1f2f6c-bbbb-874b-1b73-35a8a1784ce9@cardoe.com>
Subject: Re: [PATCH v3] tools: detect appropriate debug optimization level
References: <1461681525-12078-1-git-send-email-cardoe@cardoe.com>
 <20160428174049.GG18194@citrix.com>
 <26771eaa-0904-30bb-a728-096d18ab480f@cardoe.com>
 <20180302124621.7egzn7kr7lxyz5lm@citrix.com>
In-Reply-To: <20180302124621.7egzn7kr7lxyz5lm@citrix.com>

--C6DR4PNJY0f5N4bGlvrm3scCowAsaHDVc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/2/18 6:46 AM, Wei Liu wrote:
> On Fri, Feb 23, 2018 at 11:26:17PM -0600, Doug Goldstein wrote:
>> On 4/28/16 12:40 PM, Wei Liu wrote:
>>> On Tue, Apr 26, 2016 at 09:38:45AM -0500, Doug Goldstein wrote:
>>>> When building debug use -Og as the optimization level if its availab=
le,
>>>> otherwise retain the use of -O0. -Og has been added by GCC to enable=
 all
>>>> optimizations that to not affect debugging while retaining full
>>>> debugability.
>>>>
>>>> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>>>> ---
>>>> change since v2:
>>>> - switch back to cc-option-add to not call cc-option on every invoca=
tion
>>>> change since v1:
>>>> - switch to cc-option to only specify -O0 if -Og isn't supported
>>>> ---
>>>>  tools/Rules.mk | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/tools/Rules.mk b/tools/Rules.mk
>>>> index 9ef0b47..1b79a6e 100644
>>>> --- a/tools/Rules.mk
>>>> +++ b/tools/Rules.mk
>>>> @@ -138,6 +138,7 @@ SHLIB_libxenvchan  =3D $(SHDEPS_libxenvchan) -Wl=
,-rpath-link=3D$(XEN_LIBVCHAN)
>>>>  ifeq ($(debug),y)
>>>>  # Disable optimizations and enable debugging information for macros=

>>>>  CFLAGS +=3D -O0 -g3
>>>> +$(call cc-option-add,CFLAGS,CC,-Og)
>=20
> Though -Og will supersede -O0 because it comes later, I would rather yo=
u
> use cc-option to selectively add one of the two, like:
>=20
> CFLAGS +=3D $(cc-option,CC,-Og,-O0)
>=20
> Wei.
>=20

Wei,

It was like that in v2 but I changed it per Ian's request to this
version. See:
https://lists.xenproject.org/archives/html/xen-devel/2016-04/msg02822.htm=
l
for reference.

--=20
Doug Goldstein


--C6DR4PNJY0f5N4bGlvrm3scCowAsaHDVc--

--yIrlqdDhpt2Wh9pPRFe7mmICr50chW1Im
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqkuclfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3jqQ/9FBTAPEKVCYb/15wsVjba10sO6fVpyaVq708ThlXdj2e0b0xtXKfMppI+
b0ZVcmkQ3DQKfkfqgKEXAcQ9K2EPjJ/+9o+ym4utX89hLgSrEVtxV3kU57TmbuQ0
FkKFEyhXVWaX2Zgxu2VH0fKfTCV7BfJRP49jEMtS6ym6eqcW9AHbpHZhhNSwO6Cy
ERMo4k2NEctCjBXeDO7PUNXZRPeZZUr5zJ56PcVwzs92tlwwSyG8hlnAcByWS42Z
lOmk7khIsdpZ6mQBLd+L8tfaJNeI8QDPG0CocVCPVY0paRb9KhXSXl/Z6/GldnaJ
INc+l7MTCzHUa/rtE0R0m9I0qdKMGB3PlvzWL6ZB09KEKmNmpOGM8VLALbYvbJC0
uwEQuv8ib7quzq9kx3V3+1+u9zL+MKuwe5OTGbcxoXZlViCYa8UL2ytdYsoCBESG
dW1uGUpanL5Rind1Fd1blr1LYp/erFbELPIGBaCPsVhqkFKPE+63jTa2KR13m/x+
5pcHolIVMiMe531WEOioQ0reMoiu6ba+h2R6mtjmzknP0xod49Eiph0JIqLsidj9
ukAfVZsOf2IkD120SzlXwzVDF5ryo4vVgYhzleza4zgGS+llHYhjBrVEqyZXxESq
T35SCt/m2I8iJ5MudmOye70texLLMJEAwaP8B+JvZ2bdxAYbnkI=
=HeQg
-----END PGP SIGNATURE-----

--yIrlqdDhpt2Wh9pPRFe7mmICr50chW1Im--


--===============8246932695298988846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8246932695298988846==--
