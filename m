From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
 4.10.1
Date: Tue, 9 Jan 2018 12:13:47 -0600
Message-ID: <42f1e433-beda-cce3-ec38-864f3f509fb5@cardoe.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0518585584375829883=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2je3=ee=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eYyPJ-0004ys-Je
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 18:13:53 +0000
Received: by mail-yb0-x22d.google.com with SMTP id v17so4886049ybl.10
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2018 10:13:52 -0800 (PST)
In-Reply-To: <23123.44604.284781.889416@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org, Jan Beulich <JBeulich@suse.com>, security@xenproject.org
Cc: committers@xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0518585584375829883==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="RA3g5NZWOdyeaFxtRCm7HZ6f85HllQNmv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RA3g5NZWOdyeaFxtRCm7HZ6f85HllQNmv
Content-Type: multipart/mixed; boundary="5sqkk6KPYPMUSxvuCIZjgIweb89Lkuflj";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Jan Beulich <JBeulich@suse.com>, security@xenproject.org
Cc: committers@xenproject.org
Message-ID: <42f1e433-beda-cce3-ec38-864f3f509fb5@cardoe.com>
Subject: Re: [Xen-devel] Radical proposal: ship not-fully-tidied shim as
 4.10.1
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
In-Reply-To: <23123.44604.284781.889416@mariner.uk.xensource.com>

--5sqkk6KPYPMUSxvuCIZjgIweb89Lkuflj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/8/18 11:45 AM, Ian Jackson wrote:
> But this is not a usual situation.  This time, we don't have the time
> to wait.
>=20
> Opinions ?

I'm going to follow up with a top post with my feelings and from info on
various parts of the thread.

We have 2 versions of PV shim, the Citrix version and the Amazon
version. The proposal here is to go with the Citrix version. I'll
compare the two how I see them.

Citrix Version
--------------
- based on PVH which means 4.10 only
  - supported on 4.8 and 4.9 if we backport changes to the toolstack
- no solution for 4.7 and prior versions
- no backports currently available
- supports *most* Xen PV features
  - no support for PCI pass through
- confirmed to not work on HVM [1] [2]

Amazon Version
--------------
- based on HVM
- tested and deployed across Amazon's large fleet
- works from Xen 3.4 and up
- backported to 4.9 and 4.10 [3]
- supports *most* Xen PV features
  - ballooning is broken but Anthony has committed to providing a v3
with this support. [4]
  - migration is currently untested

If the primary driver for getting these patches in is for end users and
consumers of Xen, a large portion of them who have not yet deployed Xen
4.10 then why are we moving forard with an approach that requires them
to potentially upgrade or change a lot more of their environment. This
seems down right hostile to their concerns and needs.


[1]
https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00711.htm=
l
[2]
https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00778.htm=
l
[3]
https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00751.htm=
l
[4]
https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00736.htm=
l
--=20
Doug Goldstein


--5sqkk6KPYPMUSxvuCIZjgIweb89Lkuflj--

--RA3g5NZWOdyeaFxtRCm7HZ6f85HllQNmv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpVBltfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl26hA/9EQ9dDGexaX2ImlF+zlK7scnmZLm+tba42+En27h8nbNM1h4UW4s0hr+l
38j5WyD57XbiBTEFEqJPXNKc0Bl5t1e7wkAdDM6A15DdWEHNDJNdUGjncrMxAhCM
/GNEu116gim5EsfoqX2RKK5kSsHjdldLiGDC/cvFfQOLggobCIPiRS69Z37L1G3d
J8K8fipeOyRNUcBnigDntuN3JiLCfjZc7meK7RUrtfCsN1WTo2XGcplb5jmsh5Ur
cu+UnA9VA8nV+XGC1ASmACQxo0L5F5vgr6YNyEyIQ53SfyJ7jYJ63c3ihCazi0yg
sPUfANX1TzzVF9s7avf0lnkG8KtnZnUSnGK0A4h0gl3mDRBU7nm6M7PleT4UdSpQ
fv2dCF1+VxOoaRvsXoY9VSzneKMNe6YwTcVFa1pFXBnj17GDjF+nPooJEbLTR0EI
GFl+2UReYmI6PbyNAGUwIJhKd8jTIt9Z+t4/Wd7w5F6G08a+Wzr7+0HYRgKQGKtL
L+nMp/qMGlAKdbu7OtyWxxSAhR9ysFyIpendLLEcvfE09utcNgrPAAKtgejGU/6n
JBVSGD6wJIACxas2uzqxo25Y4Etnlrm1wWocIsiRqCCQH4TGccOoVj23J/3YD7Ha
GnGR4gZram7x/6wk/hJ2MAt1L1iiYjWJ6KqOUsx9yP9yLorClho=
=BGnm
-----END PGP SIGNATURE-----

--RA3g5NZWOdyeaFxtRCm7HZ6f85HllQNmv--


--===============0518585584375829883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0518585584375829883==--
