From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen release cycle revisited
Date: Wed, 03 Jan 2018 02:07:48 +1100
Message-ID: <1722077.KMArrVY7cK@wopr.lan.crc.id.au>
References: <63cf216a-71af-bd35-55e7-88c69b773e52@suse.com>
 <371025E8-3FE9-47A5-A317-2C5088667A8B@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6040968225408541761=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vbgf=d5=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1eWOAc-0001vO-T1
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2018 15:08:02 +0000
In-Reply-To: <371025E8-3FE9-47A5-A317-2C5088667A8B@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@linaro.org>, "committers@xenproject.org" <committers@xenproject.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============6040968225408541761==
Content-Type: multipart/signed; boundary="nextPart2003744.2Dg46x3lUQ"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2003744.2Dg46x3lUQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, 2 January 2018 11:54:43 PM AEDT Lars Kurth wrote:
> Hi Juergen:
>=20
> thank you for raising this. As far as I can tell, the switch to the
> 6-monthly release model has had some consequences, some of which were
> predicted, others were not. So, I think we should probably review the
> decision.=20
=20
> Key concerns raised:
> =E2=80=A2 Too much work in actively maintaining 4 branches (6 security br=
anches)
> =E2=80=A2 Impact on users (too many releases)
> =E2=80=A2 I think we are definitely incurring higher overheads than with =
longer
> cycles
 =E2=80=A2 It is not clear to me whether one of the key benefits =E2=80=93 =
aka
> vendors getting patches into tree more easily =E2=80=93 has in fact mater=
ialized =E2=80=A2
> Better release predictability has materialized
>=20
> Maybe the right approach would be to kick off some kind of survey to gath=
er
> input from different stake-holders and maybe plan 4.11 for June. If there
> is a consensus for a change to say a year cadence, we probably wouldn=E2=
=80=99t
> execute this until 4.12 anyway.=20

I would like to propose for consideration:

* 12 months between major releases (x.y)
* 3 or 4 months between point releases (x.y.z)

This way, we roll up all XSAs etc into a x.y.z release on a regular basis -=
=20
which I believe would make the security teams job easier (let me know if I'=
m=20
wrong with this?).

Then aim to release x.y+1 (or maybe x+1?) in, say, June each year.

I'm not sure if there has been a set time frame as a goal for x.y.z release=
s -=20
from my not so close observations, they seem to be somewhat adhoc.

As always though - more than happy to get feedback / comments on the above.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB http://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897
--nextPart2003744.2Dg46x3lUQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlpLoEQACgkQQa811Xp9
MdxW/BAAn167G8EnAGkPaJPGoOs/y3k3kcpCMTR3I908PYKxkCTpA7zUpBo2pSY2
SoJaJ6yXRZFdMk7AspM75N56f3tQQMAnzbixb3GfMfOvfjmlacHTJzfv3m/d4/uc
NOx0xUEGIp96GcTNxNI6O//kh6so1uStFokEAW4k3yC0+BNpW1w2mW10eHbpDrZc
bQ+TR3OW+pxP440Czp52Iefp1kT75heWf/kfXbjBdd9b9rku3vZnAKafBsg5E6gb
vU2lnIGtfcijlXEWGmbu79qe6JbdSOZc3uVi1ATqkePZ61B1VFOSBoXsWptdG/ZW
wAIDajJany1M9a+/GmrMZ8eGcvGG0S49q28ehOrnsG/85927qald0l4NhZhvfWrV
PByM29rHxXudGoTcdIBzSQrVP/AVlb8l/OUEFn0KsVdfSF6/AdS8rk4uZRRpFHl6
AEuj740AqP32azuu6gSKYkIxhRMhOz9il25MRH+md9uBrhkZGqAMrkvauYC8wXS/
xaLXcrK/H4PTQJ2qYPmL7S8jOhtmYeTytjIOqQU1eUyNztZiH0QjSESNRLycyoRK
+7fQ5RfZ7k5FsfvFyeqBZIZVXCNR/9QA0VMHpbE8j4jrfXFro/lv57zwQ96BqTGZ
iGwSv0GykgCuv5EU6I76eM/1g665UY+V44KktrdE/Zik/Nj9lYQ=
=vgyp
-----END PGP SIGNATURE-----

--nextPart2003744.2Dg46x3lUQ--





--===============6040968225408541761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6040968225408541761==--
