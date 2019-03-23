From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen/sched: fix credit2 smt idle handling
Date: Sat, 23 Mar 2019 13:34:47 +0100
Message-ID: <383e43c2e9bff26b55460de58298c4871a34d0d9.camel@suse.com>
References: <20190322090431.28112-1-jgross@suse.com>
 <2bd3783c9eb5e87a1e0a19acacc193a29fec3120.camel@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8662418254738544163=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MgHg=R2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h7fs0-0004am-1a
 for xen-devel@lists.xenproject.org; Sat, 23 Mar 2019 12:35:28 +0000
In-Reply-To: <2bd3783c9eb5e87a1e0a19acacc193a29fec3120.camel@suse.com>
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


--===============8662418254738544163==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-P/F6JajuGn+MTP5oC9AN"


--=-P/F6JajuGn+MTP5oC9AN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-03-23 at 03:32 +0100, Dario Faggioli wrote:
> On Fri, 2019-03-22 at 10:04 +0100, Juergen Gross wrote:
> > This problem can be solved by and-ing the core's sibling cpumask
> > with
> > the runqueue's active mask before doing the idle test.
> >=20
>=20
> Therefore, I'm a bit reluctant at adding another cpumask bitwise
> operation, in hot paths, just for taking care of it.
>=20
> Note that this also applies to cpupools, i.e., I also consider a very
> poor choice putting two sibling hyperthreads in different pools. If
> you
> recall, I even sent a patch to forbid doing that (which is still
> blocked on a series of yours for passing parameters from the tools to
> the hypervisor).
>=20
> The only case I care, is a CPU being off-lined.
>=20
> So, one thing that we could do is to put credit2_runqueue=3Dcpu inside
> such #ifdef-s too (and I can prepare a patch to that effect myself,
> if
> you want).
>=20
> To properly deal with offline CPUs, I think we can change the logic a
> little, i.e., we initialize the smt_idle mask to all-1 (all CPUs
> idle),
> and we also make sure that we set the CPU bit (instead of learing it)
> in smt_idle, when we remove the CPU from the scheduler.
>=20
Which, thinking more about this, should also serve as a solution for
the issue addressed by this patch.

We need to check whether all the other places where smt_idle is used
would be ok with that (I think they are, as we pretty much always end
up &&-ing it with online or active anyway), or if they need some
reshuffling (and if yes, how that looks like).

I can check this on Monday.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-P/F6JajuGn+MTP5oC9AN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyWJ+cACgkQFkJ4iaW4
c+4kPRAAuXLDYMGEnHljwDRw8bMuwld7FAkFNvXdAXJFv7rIVspHA5zpjUqGUW2E
ey7tXkv20uKK2QdnADB7riM5BUGO/a4xh54Fh4COvjhbcUFGRR99Ij7IYrOxDwt8
UbTUC2ZlDALnQUx8O9kul8HR640PqHpdMMfIiXLfR/1xxmhQtdGIiGQRBTMBPUh3
nALLEKT/t6Ozu6ukITs17FoEvbPBR77K1hn3Y2jQWCp8GsgY3g5OnHKAHNT9hUV8
qbKaCFSqqUHzDqtjlwPOeDcZ5jPMnJLWlu1/NBVwpdLI8vjrGFLZwFrUI4D4Yb5E
CKwzc7geL9DFjI330XBRxnD+b04rdQ2jgPPJXJj0gDbM295dmnIzVLzUihUGvNux
IFG4zSEadYTKuWZcPNmoUFHYp8aVGKUKsGTd61DbCeACja1kaXzOVc6ru8uP7RYr
wdfA9e1ECPyxAtnULLsyzZLdgO/qdXEhXczEGo3A+V3mDkJsZ1DZnGNfBxuOcyna
FmJ1ZXNQn7xJLcOwfV4sVJ+lAdG6tvUApI22XruXS2B2pyjeF7pLHDChXdtOgz8M
QYgBxe8Ejr4TljZHYOQMwKB91oRwOoPZ2Doi9VQOvnSVoAaH+5fTrqV5y9NcKfme
aveRaO25ze/6VAkrwGcpi8lGH9rcz6X8nJVaIDTuhGKTDYr2l0U=
=yc2F
-----END PGP SIGNATURE-----

--=-P/F6JajuGn+MTP5oC9AN--



--===============8662418254738544163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8662418254738544163==--
