From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] xen/tools: support Python 2 and Python 3
Date: Thu, 22 Feb 2018 10:47:27 -0600
Message-ID: <e67f5bf3-1db6-0b74-c4b1-0f111125c940@cardoe.com>
References: <20180222055246.32522-1-cardoe@cardoe.com>
 <30c4e0c3-ad4b-82c2-ba75-44fab36d0d49@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1090157841089621772=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ke/x=fq=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eou1u-0000ZM-7E
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 16:47:34 +0000
Received: by mail-qk0-x243.google.com with SMTP id h129so7230663qke.8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2018 08:47:32 -0800 (PST)
In-Reply-To: <30c4e0c3-ad4b-82c2-ba75-44fab36d0d49@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1090157841089621772==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Af4fPevFWUsEwJ6FMuDfjapj7LLxZES42"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Af4fPevFWUsEwJ6FMuDfjapj7LLxZES42
Content-Type: multipart/mixed; boundary="MOAcJqc3yH68pNeWpER4A0hebRwkQK1aB";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wei.liu2@citrix.com>
Message-ID: <e67f5bf3-1db6-0b74-c4b1-0f111125c940@cardoe.com>
Subject: Re: [PATCH] xen/tools: support Python 2 and Python 3
References: <20180222055246.32522-1-cardoe@cardoe.com>
 <30c4e0c3-ad4b-82c2-ba75-44fab36d0d49@citrix.com>
In-Reply-To: <30c4e0c3-ad4b-82c2-ba75-44fab36d0d49@citrix.com>

--MOAcJqc3yH68pNeWpER4A0hebRwkQK1aB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2/22/18 6:54 AM, Andrew Cooper wrote:
> On 22/02/18 05:52, Doug Goldstein wrote:
>> These changes should make it possible to support modern Pythons as wel=
l
>> as the oldest Python 2 still supported.
>>
>> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>=20
> To the overall effect, this is definitely a good thing.=C2=A0 Some quer=
ies
> however...
>=20

>> diff --git a/xen/tools/compat-build-header.py b/xen/tools/compat-build=
-header.py
>> index 32421b645b..546371225d 100755
>> --- a/xen/tools/compat-build-header.py
>> +++ b/xen/tools/compat-build-header.py
>> @@ -23,4 +23,4 @@ pats =3D [
>>  for line in sys.stdin.readlines():
>>      for pat in pats:
>>          line =3D re.subn(pat[0], pat[1], line)[0]
>> -    print line.rstrip()
>> +    sys.stdout.write(line.rstrip() + '\n')
>=20
> Is there anything wrong with print(line.rstrip()) which is the more
> common way of doing this?

The other scripts in the repo avoided using print as a function which
was only added to Python 2.6 and newer if you use from __future__ import
print_function. The README in the repo still says Python 2.3 and newer
so I had assumed if I broke things prior to Python 2.6 it would be a
show stopper. While Python 2.3 was released July 29th 2003 and Python
2.6 was released Oct 1st 2008 I figured changing this requirement was
going to be met with the same difficultly I encountered last time
suggesting that we only support versions of build tools released in the
past decade.


>=20
>> diff --git a/xen/tools/compat-build-source.py b/xen/tools/compat-build=
-source.py
>> index 595bc3ff58..8101290ebe 100755
>> --- a/xen/tools/compat-build-source.py
>> +++ b/xen/tools/compat-build-source.py
>> @@ -26,4 +26,4 @@ for pat in pats:
>>  for line in sys.stdin.readlines():
>>      for pat in pats:
>>          line =3D re.sub(pat[0], pat[1], line)
>> -    print line.rstrip()
>> +    sys.stdout.write(line.rstrip() + '\n')
>> diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
>> index 613b909c3d..d64f257816 100755
>> --- a/xen/tools/gen-cpuid.py
>> +++ b/xen/tools/gen-cpuid.py
>> @@ -3,6 +3,13 @@
>> =20
>>  import sys, os, re
>> =20
>> +if (sys.version_info > (3, 0)):
>> +    def long(x):
>> +        return x
>=20
> Strictly speaking, return int(x), however...
>=20
>> +
>> +    def xrange(x):
>> +        return range(x)
>> +
>>  class Fail(Exception):
>>      pass
>> =20
>> @@ -98,13 +105,13 @@ def parse_definitions(state):
>>  def featureset_to_uint32s(fs, nr):
>>      """ Represent a featureset as a list of C-compatible uint32_t's "=
""
>> =20
>> -    bitmap =3D 0L
>> +    bitmap =3D long(0)
>>      for f in fs:
>> -        bitmap |=3D 1L << f
>> +        bitmap |=3D long(1) << f
>=20
> Having tested this out, I think the L suffixes can just be dropped:
>=20
> Python 2.4.3 (#1, Sep 21 2011, 20:06:00)
> [GCC 4.1.2 20080704 (Red Hat 4.1.2-51)] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
>>>> bitmap =3D 0
>>>> type(bitmap)
> <type 'int'>
>>>> for x in xrange(80): bitmap |=3D 1 << x
> ...
>>>> type(bitmap)
> <type 'long'>
>>>>
>=20
> I don't recall why I wrote it like this, but I don't think its
> necessary.=C2=A0 As a result, you shouldn't need to define long above.
>=20
> ~Andrew

Python 2.4 and newer will properly extend for you but Python 2.3 will
not and I was aiming to still support Python 2.3. Now this is all
theoretical since I can't find any boxes with Python 2.3 anywhere and
I'm not interested in building it.

--=20
Doug Goldstein


--MOAcJqc3yH68pNeWpER4A0hebRwkQK1aB--

--Af4fPevFWUsEwJ6FMuDfjapj7LLxZES42
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlqO9B9fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl242RAArj9L9hmm1iagLP6YH4ZoOA73dxsWy+uhQFviJtSqVqPYxg6OHubA6FrV
s0DFAkmafi+9plE+2/PSJyLkrepej8hyK46kYzadY/OUj9HFKwR7a5VP/OrzDnZK
H8Om6HdE/Weqyc1jfxvKwLy3qpWHbcGrmSbp/KLEnataok/uXsesx3ksFAMuxOi8
54YlrEajP5QyCfVbmbrqL5vuHK6U4oKb0d6/5hlI7cgzTBLqC2av6NQCEcb9Ngea
fhCtq3ewHa6E4jEt2H434E3ncQiPYXGiJi135WbHWmNQqivMYI7U5XoEMKmDvkat
Ca2NciLXxpYi8V5NrQlk2C7qGQdtXtyDCa14wokdQB4Z9MrJXfFF8P2qvUFPbfFS
6W751d3FOKLG1g/jRV8a5kespzEst4zDNdnK0NvcxZYx3ZCo8DTU+wqyyuabUL0a
lRwjt7FlUDekj2pMv/chEFrvmnN3k/3Zb3G0JSKXP9PSOds21MzaWAaXn6yK8OdB
aGUSe1QZCEbU3nw/HH+DukbirguKwIEaNh9IfdpTFTYXZJqaC+Irv39kDkd15QJQ
4/UXUFqS7Q3qZaX1xA6UohH68E0Gc2V4dLjm+enNpTW3ilKY/HH0kGed36cN24bw
reJt1VZakm8YP5mzl+89YAxRQAVyqvdk4hbh8kYIdxCQfXbsZOs=
=+NwH
-----END PGP SIGNATURE-----

--Af4fPevFWUsEwJ6FMuDfjapj7LLxZES42--


--===============1090157841089621772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1090157841089621772==--
