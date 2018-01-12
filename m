From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Thu, 11 Jan 2018 19:57:54 -0600
Message-ID: <7e493ab0-600e-bc6b-f029-7a4d44aef53f@cardoe.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
 <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
 <20180107150029.GA2935@mail-itl>
 <alpine.DEB.2.10.1801081804150.4603@sstabellini-ThinkPad-X260>
 <2ff9538c98ece66b66da2484a7b7d67c@randomwebstuff.com>
 <30d1c766-eee6-9af3-3770-05dad888294b@suse.com>
 <4A0D5682-1292-43E9-BBDA-331B3CEF15A4@gmail.com>
 <B50B31AF-0F8E-48B8-A51E-0CD0948631E9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4978062012830918695=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=kyvf=eh=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eZobZ-0002Zh-KO
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 01:58:01 +0000
Received: by mail-yb0-x22a.google.com with SMTP id a82so2036553ybg.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2018 17:57:59 -0800 (PST)
In-Reply-To: <B50B31AF-0F8E-48B8-A51E-0CD0948631E9@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Peter <xen@randomwebstuff.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4978062012830918695==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="7ulIn1ofmLRdvHikPllJ6PTH41qT574La"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7ulIn1ofmLRdvHikPllJ6PTH41qT574La
Content-Type: multipart/mixed; boundary="2uyLnG3RVmpgQLskq549BOoqNGkWapm9M";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>, Juergen Gross <jgross@suse.com>
Cc: Peter <xen@randomwebstuff.com>, xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <7e493ab0-600e-bc6b-f029-7a4d44aef53f@cardoe.com>
Subject: Re: [Xen-devel] Xen Project Spectre/Meltdown FAQ
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
 <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
 <20180107150029.GA2935@mail-itl>
 <alpine.DEB.2.10.1801081804150.4603@sstabellini-ThinkPad-X260>
 <2ff9538c98ece66b66da2484a7b7d67c@randomwebstuff.com>
 <30d1c766-eee6-9af3-3770-05dad888294b@suse.com>
 <4A0D5682-1292-43E9-BBDA-331B3CEF15A4@gmail.com>
 <B50B31AF-0F8E-48B8-A51E-0CD0948631E9@gmail.com>
In-Reply-To: <B50B31AF-0F8E-48B8-A51E-0CD0948631E9@gmail.com>

--2uyLnG3RVmpgQLskq549BOoqNGkWapm9M
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/11/18 3:16 AM, Lars Kurth wrote:
> And this time with attachment
>=20
>=20
>=20
>> On 11 Jan 2018, at 09:15, Lars Kurth <lars.kurth.xen@gmail.com
>> <mailto:lars.kurth.xen@gmail.com>> wrote:
>>
>> I am wondering whether something like the attached table would make
>> understanding the FAQ easier. Page 1 is clearly what is Xen specific
>> and we definitely should cover.
>> Page 2 in general covers Linux and guests. The first block is
>> relatively straightforward.
>>
>> The 2nd and 3rd block is based on information from Doug: as there are
>> many gaps, I would be uneasy about publishing these somewhere prominen=
t.=A0
>>
>> Also
>>> As this is really guest specific this information can't be provided b=
y
>>> Xen.
>> which carries a risk that any analysis made by anyone might only apply=

>> to the context in which the analysis was done.
>>
>> But the question keeps coming up, so making this clearer is maybe
>> sensible.
>>
>> Best Regards
>> Lars

Thanks for the improvements Lars.

--=20
Doug Goldstein


--2uyLnG3RVmpgQLskq549BOoqNGkWapm9M--

--7ulIn1ofmLRdvHikPllJ6PTH41qT574La
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpYFiJfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3u2xAAySljffvYOmsVYSkbHoYNw5cf1/I4y/MzLn1vNCfwLeP+n+Ei8cOk74Dm
jyZLIgjNBVOR85kGeSuJP/VeEtuD+xdymVKherg8JMlVFfUY9SCEoInl4/aTpDRU
WPO7XIWF+dEGwNsrt5tkBCjefkSgi9J8mPfJCBvhNh7F4zVr9ZWyyMVHNC6bG8/L
KD3Rkhggb6p+yBU8AbQKZf9SB0xS9KxLiaVUOe0pAWABscapa+ud6XxBEbYgMrgn
kxMlXEtDuufqvDPCxdKzVvCXf1wwu9svdqcbL7dAow8slfsCbK7orH8MBnJoJ3yg
ZJu62Rkuqne8Dnw/ujbp8i1Pb8u9BMgdGIaStfaVaJqf7cBvFS3TuCIXkpbpeWX9
ci+92KhPiLs5dPxnMTQtmZyThLtSF2OXO0+SPsdcNe2cJ3JaLc1r+wXDKHozFCHF
Ko3OTOWkPLbqcUjN2YpQRY31ZLQnbbjhhxOgnUMcGdpWvIqVwEdK8F0rIiJoPwN1
9jndrmY/DOTaCr3EHEGvM3KjV0qPIwPA/Aq2NYxTVHV0f7wI+aIRv6MmD1EXEr47
rQmO9VPEIvl6ZAs3JbLFWr8I+UuD+r3QCIcUYaliKaUBVRY5SPXEBpZftnSUIYYQ
LB/DWC83UIiJBw0DIMiEmXMyRwjxflfatt0H6R3YYGFMZCMSVOI=
=F81c
-----END PGP SIGNATURE-----

--7ulIn1ofmLRdvHikPllJ6PTH41qT574La--


--===============4978062012830918695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4978062012830918695==--
