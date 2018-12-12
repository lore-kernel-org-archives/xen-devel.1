From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH for-4.12 v2 16/17] xen/arm: Implement
 Set/Way operations
Date: Wed, 12 Dec 2018 18:49:21 +0100
Message-ID: <fb57e74bce733e5dc305f87070165db35526e7ae.camel@suse.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
 <20181204202651.8836-17-julien.grall@arm.com>
 <alpine.DEB.2.10.1812061445190.18779@sstabellini-ThinkPad-X260>
 <9540568a-bcd3-bd33-d036-25d8470140f5@arm.com>
 <alpine.DEB.2.10.1812071311540.18779@sstabellini-ThinkPad-X260>
 <851b26ab-be32-3d08-302f-3a49cb26c785@arm.com>
 <alpine.DEB.2.10.1812120925120.12259@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7438437267862729942=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SVFL=OV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gX8dJ-0003Q1-DL
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 17:49:17 +0000
In-Reply-To: <alpine.DEB.2.10.1812120925120.12259@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============7438437267862729942==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mKUfQ4FdnhAjIF0NFTM7"


--=-mKUfQ4FdnhAjIF0NFTM7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-12-12 at 09:25 -0800, Stefano Stabellini wrote:
> On Wed, 12 Dec 2018, Julien Grall wrote:
> > > For Dario: basically we have a long running operation to perform,
> we
> > > thought that the best place for it would be on the path returning
> to
> > > guest (leave_hypervisor_tail). The operation can interrupt itself
> > > checking sotfirq_pending() once in a while to avoid blocking the
> pcpu
> > > for too long.
> > >=20
> > > The question is: is it better to check sotfirq_pending() even
> before
> > > starting? Or every so often during the operating is good enough?
> Does it
> > > even matter?
> > I am not sure to understand what is your concern here. Checking for
> > softirq_pending() often is not an issue. The issue is when we
> happen to not
> > check it. At the moment, I would prefer to be over cautious until
> we figure
> > out whether this is a real issue.
> >=20
> > If you are concerned about the performance impact, this is only
> called when a
> > guest is using set/way.
>=20
> Actually, I have no concerns, as I think it should make no
> difference,
> but I just wanted a second opinion.
>
Yeah, sorry. I saw the email on Monday, but then got distracted.

So, in this case, I personally don't think either solution is so much
better (or so much worse) of the other one.

In general, what's best may vary on a case-by-case basis (e.g., how
long have we been non-preemptable already, when we entering the long
running operation?).

Therefore, if I'd want to be on the safe side, I think I would check
before entering the loop (or whatever the long running op is
implemented).

The performance impact of just one more softirq_pending() check itself
should really be negligible (even considering cache effects).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-mKUfQ4FdnhAjIF0NFTM7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlwRSiEACgkQFkJ4iaW4
c+7/JRAAn1m1IPcBU0F03AVv4bpuHTaGEnEME9y0o9B8NqfyHOi9scVdSRoL7M2z
qb85TYlAKEIpmXdFNZQZdTNa5ZuwsZQfeWvarJCCHab70JBcgO1hDpUOp/jyVVu0
3jeNekIvOWHtgmJKfumrqWL2tkuwT+NrMPq2/ZQyUwfzJFszU3rSlobcbiCvrFOh
9A+hl0Yizvtueaa2J7/43E6rJP/WJszXV8rfiaGZjrs7bR4MLdn5pr2sjQZFmq6q
cD1hXTNz6SK4ID2BK8S3D1FdELjYcH03CNSy/fRjwe7eXtQE7GKEIDC4KFU8w86Z
Tw+791zWGFQWm2GSn3CGvHk5IVsxshBVBCiofqIj/T/vDw43zbJ9EhegxgUTkHO3
hqEgiFuIrM38jVezg0nHl+ufoU/VabuWmvKOpVj6yRoW9A/Y4o71VBniB9F4VBpD
9Z2aWxyj7CcMG+cfU6E3kz+c7GvTixoZLmvfqsvbwY7bV9TNjxLnrdZ7/lJkyWHg
jXPlRLpAzg9be65G7CYpsgUTWTVZ1hZlt/boW3pXj8HvMvCARu19WyFFoF7ony75
hntpGRYAXqeBYjGy5aCjMyxUKwOjbajfnoU97K5coNn4XsfWMH/mUuw17JWK4oZI
tN5HfI1Fr635GB2Iefjx6XSNVqykF1gI2QkKHYt/GRLRdk9KHeQ=
=tc4v
-----END PGP SIGNATURE-----

--=-mKUfQ4FdnhAjIF0NFTM7--



--===============7438437267862729942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7438437267862729942==--
