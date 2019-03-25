From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched: fix credit2 smt idle handling
Date: Mon, 25 Mar 2019 11:53:05 +0100
Message-ID: <9d464b61e6430cb9f203c0fa5b396ebdccfca5d5.camel@suse.com>
References: <20190322090431.28112-1-jgross@suse.com>
 <2bd3783c9eb5e87a1e0a19acacc193a29fec3120.camel@suse.com>
 <9dce8e69-6ebc-85f4-be25-a6d2ee9a5116@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8818728657094781828=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h8NEU-0005d9-Lt
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 10:53:34 +0000
In-Reply-To: <9dce8e69-6ebc-85f4-be25-a6d2ee9a5116@suse.com>
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


--===============8818728657094781828==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0ZM7vSSzBw8MvCOlTho5"


--=-0ZM7vSSzBw8MvCOlTho5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-03-23 at 14:22 +0100, Juergen Gross wrote:
> On 23/03/2019 03:32, Dario Faggioli wrote:
> > To properly deal with offline CPUs, I think we can change the logic
> > a
> > little, i.e., we initialize the smt_idle mask to all-1 (all CPUs
> > idle),
> > and we also make sure that we set the CPU bit (instead of learing
> > it)
> > in smt_idle, when we remove the CPU from the scheduler.
>=20
> How does that help?
>=20
> Only if all siblings are marked as idle in rqd->idle we set any bits
> in rqd->smt_idle (all siblings).
>=20
> Or did you mean rqd->idle instead?
>=20
Yep, indeed I was thinking to rqd->idle, sorry for the confusion. :-)

> This might be problematic in case of runqueue per cpu, though.
>=20
Mmm... So, my point here is, when a CPU does not belong to a scheduler
(and, in case of Credit2, even when it does not belong to a runqueue)
we "consider" it as being either idle or busy, depending on whether we
set or clear the relevant bit.

But truth is, we don't have a way to know if it is really idle or not,
so we really shouldn't rely on such info.

Therefore, we should:
- make sure that we actually don't, or it's a bug (which is the point
of this patch ;-P)
- decide whether to set or clear the bit basing on what's more
convenient (e.g., because it saves some cpumask operation).

Anyway...

> Another idea: we could introduce a credit2 pcpu data cpumask pointer
> for replacement of the cpu_sibling_mask. For runqueue per cpu it
> would
> pount to cpumask_of(cpu), for the "normal case" it would point to the
> correct cpu_sibling_mask, and for special cases we could allocate a
> mask if needed.
>=20
... I think I am fine with this idea.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-0ZM7vSSzBw8MvCOlTho5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyYsxEACgkQFkJ4iaW4
c+5d5Q/+LQHj884kNyWlIsKvSh+rIruoI/ZZhLsyr9RUo+SF2tLE3J0a8WEzLARd
qisyKNJ1y7IdYf9P6YVL7db7++ZwnO3BbL1wuQlFThH/ygYBX5q4iFlZ1U3ILvVG
qK0fOmCZxhcUmGw4I/7ngVvuXUleKO0KM2f4RnTwXIUs0TuYHMPkoXflnx+UVicl
9WhJUROXGem7VkwbWDSktZHWXfzdDCFzZKWxgNjUXZw8q6mFD23fZazPSxXlbAMk
lwfVn1P3b8kgdwKdS6AUy7RciJVPEfl4RHNU1zw/WvUGvcy4n4loMkIkiVhe/8vd
r7hW0DYi/bqDNvrNp9UMKmfx5+Lv/UteypyKoZaxVrD4QUORhUQ6cYQo9/VY4f8l
eVYagQkarep+Wn0acN1VKQhIgtw03LQ82gsfbIUOwylm2HI7nWkuaT0u/LOnAW1e
r+piWjFj8AIaTfo2tJPllyHRKKYyaZj7ujWL59IOD43gJ3Iq+R9zlQwFHx5eihEV
9vi5F4EjeOvEHwsYIRVlEPvAd7NcF2vRVEstRkWuOXpGHJMlRApuU7E+i0BCdW1P
eWMdAYpunbL1xoH4OcnZ6vnYmy/uQIfSHzEZ6YyufwVrA42e57ULRDYSFB41XFp6
wfjFm5Y9byTdv9h1SqLxonPfl8OkIwWkwsVV567gWqpEMG0qQPw=
=6Rdu
-----END PGP SIGNATURE-----

--=-0ZM7vSSzBw8MvCOlTho5--



--===============8818728657094781828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8818728657094781828==--
