From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched: fix csched2_deinit_pdata()
Date: Thu, 09 May 2019 18:04:39 +0200
Message-ID: <3b72ad3ab0f8afdde8ee32fb2370dbbcb29c9fdd.camel@suse.com>
References: <20190508113132.19198-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6622695024258622103=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Daoc=TJ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hOlXl-00025f-3y
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 16:05:13 +0000
In-Reply-To: <20190508113132.19198-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6622695024258622103==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wdljtkcDW+0JlqPLlI9a"


--=-wdljtkcDW+0JlqPLlI9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-05-08 at 13:31 +0200, Juergen Gross wrote:
> Commit 753ba43d6d16e688 ("xen/sched: fix credit2 smt idle handling")
> introduced a regression when switching cpus between cpupools.
>=20
> When assigning a cpu to a cpupool with credit2 being the default
> scheduler csched2_deinit_pdata() is called for the credit2 private
> data
> after the new scheduler's private data has been hooked to the per-cpu
> scheduler data. Unfortunately csched2_deinit_pdata() will cycle
> through
> all per-cpu scheduler areas it knows of for removing the cpu from the
> respective sibling masks including the area of the just moved cpu.
> This
> will (depending on the new scheduler) either clobber the data of the
> new scheduler or in case of sched_rt lead to a crash.
>=20
These issues will drive us all crazy, at some point! :-(

I really wish I managed to put a cpupool test in OSSTest. I guess I can
pickup my old draft, but I need some time to put together an OSSTest
dev environment again. :-/

Anyway...

> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-wdljtkcDW+0JlqPLlI9a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzUT5cACgkQFkJ4iaW4
c+4LZw/6A7DjRkwI5xUyYsNqnBOWEyt2IvIGgh2BrOGjsJ1FucBqO3LTQyBL/0ia
KDw3CTNG6gQUbR9i+x7+BOXq34N4GsKOHl6eAWQMS7rD1LnlB5rSBoKadX7jtjGR
xQ5kHVLCI4vUhq3vlP+mQNiINgOVlBTjyfKj0sXukzoT71MAvMAC24GIYTSKG8dp
MI3+sZFGOiFPiakkMB2K83hNlWLB1A7el7e9RL5wR1WR6sY6SoDE3HoC6TWsSY20
71R+hRRsz9hZzE36ZR4r1jnEY/LMIy/HWrgJDvb8CWcj7AfQfGWdgaAw8vNzjzIa
/6gJDUD2IxUMtUCTEGqWWcbWEgrg6P2fB7s78zbkwOQnZPHD4u9HxuckoWcY1Ihv
qQQIPtAzmNAs/uHhQgollx37FaJhkMadq37AOP7ELYSNoaEPeOXhhNBrqlmAwrpn
Zv/Z2RAKtXVugMRKHWZN139t0dYhP2Gmw8gcdAMoD3IbWvINpfi17nOqdUD+wA6Z
VZ9TSIO0GABIu/uXcZ6kEueHRD2PJHKTFA4lkI9R7QVea6D1cfSqIrZjtLEvGns6
m4YBKvOZPYr97T/DlPdUWctMU4NyWJ09eIl6ICimCXZyJ6uMWI90dxx6sHzNMqYZ
FkobtUs/ASaN+akd2L3zOBPSqCibcPJ5pqcVPzz1Jg2ND9gmhTA=
=Y4ph
-----END PGP SIGNATURE-----

--=-wdljtkcDW+0JlqPLlI9a--



--===============6622695024258622103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6622695024258622103==--
