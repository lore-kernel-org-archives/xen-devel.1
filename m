From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] tools: libxl/xl: run NUMA placement even
 when an hard-affinity is set
Date: Mon, 20 Aug 2018 16:22:43 +0200
Message-ID: <b346c13a4a05c75d531da1dcfa7ea684a0d5089e.camel@suse.com>
References: <153452538306.14879.2645077465028661264.stgit@Palanthas.fritz.box>
 <20180820101428.djudte4z2wye3cz3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8360441442764491152=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=inry=ld=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1frl5X-0000fg-Of
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 14:23:23 +0000
In-Reply-To: <20180820101428.djudte4z2wye3cz3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8360441442764491152==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-B9XbtQ57suqp7e0X0tTo"


--=-B9XbtQ57suqp7e0X0tTo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-08-20 at 11:14 +0100, Wei Liu wrote:
> On Fri, Aug 17, 2018 at 07:03:03PM +0200, Dario Faggioli wrote:
> > @@ -27,6 +27,8 @@
> > =20
> >  #include "_paths.h"
> > =20
> > +//#define DEBUG 1
> > +
>=20
> Stray changes here?
>=20
> You can use NDEBUG instead.
>=20
I found this in one other place in libxl (libxl_event.c), and figured I
could use it here too.

Reason is that this guards a (potentially) rather expensive check,
which I personally consider too much, even for debug build. At the same
time, it could be handy for us developers to have it there, and be able
to enable it when making changes to affinity and/or NUMA placement
code.

But I don't have a too strong opinion; I'll change it to us NDEBUG if
that's what you prefer.

> > @@ -162,6 +165,38 @@ static int numa_place_domain(libxl__gc *gc,
> > uint32_t domid,
> >      rc =3D libxl_cpupool_info(CTX, &cpupool_info, cpupool);
> >      if (rc)
> >          goto out;
> > +    map =3D &cpupool_info.cpumap;
> > +
> > +    /*
> > +     * If there's a well defined hard affinity mask (i.e., the
> > same one for all
> > +     * the vcpus), we can try to run the placement considering
> > only the pcpus
> > +     * within such mask.
> > +     */
> > +    if (info->num_vcpu_hard_affinity)
> > +    {
>=20
> Placement of "{" is wrong.
>=20
Yep, sorry.

> > +        int j;
> > +
> > +        for (j =3D 0; j < info->num_vcpu_hard_affinity; j++)
> > +            assert(libxl_bitmap_equal(&info-
> > >vcpu_hard_affinity[0],
> > +                                      &info-
> > >vcpu_hard_affinity[j], 0));
> > +#endif /* DEBUG */
>=20
> But why should the above be debug only? The assumption doesn't seem
> to
> always hold.
>=20
I'm not sure I'm getting your point. If we're here, we do indeed want
to be sure that we don't have a different hard-affinity mask for the
various vcpus... In fact, if we do, which one should we use for
placement?

So, yes, if we are here, I think the assert() should be true. I just
considered this check only useful to developers, and too expensive even
for debug builds. But as said above, I can gate this with NDEBUG if you
prefer so.

> > +        /*
> > +         * Hard affinity should _really_ contain cpus that are
> > inside our
> > +         * cpupool. Anyway, if it does not, log a warning and only
> > use the
> > +         * cpupool's cpus for placement.
> > +         */
> > +        if (!libxl_bitmap_is_empty(&cpumap))
> > +            map =3D &cpumap;
> > +        else
> > +            LOG(WARN, "Hard affinity completely outside of
> > domain's cpupool?");
>=20
> Should this be an error?
>=20
> What is the expected interaction for hard affinity and cpupool?
>=20
cpupools rulez. :-D

Basically, a domain can't possibly run on any cpu which is outside of
the pool where the domain itself lives, no matter what the affinity is.

BTW, I tested this better, and I believe there is no need for adding
this WARN. In fact, if the domain is being created inside a pool,
setting its hard affinity to a mask which is completely disjoint from
the cpupool's one fails _before_ getting here.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-B9XbtQ57suqp7e0X0tTo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlt6zrQACgkQFkJ4iaW4
c+6OZQ//egHklMUyrdstti69ISQFzDF/pW/uhUbTn4JlpK6esClKIh/7xaE/sZNT
I3lun5owIUcjyaV2C7PeqBVkJpNVryrRXrsZsPENnmP3bOx9yM/+sEiJHo+mly9d
dCuvFsdxCFp1JPQ7qaOEhr4F9uLsp86UMlwN03m/LNd3JeXfTThbgYBOt/R2ypbP
zr0Iag0maxH66xh/VZPA4S+HgUFEOFLigPrj8Sroe3NRvoVnU9IixvJbcGhNeeq/
37fppQFSm671EEA6Y6nM3VJyp0yVwAC61e2YTXqWmunLgg685LrKkj4/4n7pCGsH
Q28ADTHAoRvpbEZEyhdQMnacBHcZXyAE3hIvzyddH6nW98fQ07eyffICvuq7+ekl
O78dfKKemZErxJGPHmnuZQyuMvig5ZipO6iVfUU7CVXmrMgBevy6mom6IPW7Y3Xl
t9F7OtJiFE8PasEJ8ET8FhaBWE6cqBzDoAlXJGyq9aFwKJ9nN3tOJDUxu7QmK4lz
ykn2fhPCU4DhlGRis0ylOAVfRU89vVzdcocXZI2pvHJAzab/425lkmMRO+tcvEjX
RbKWmxVyQi/cNIqLca5EjFyC2rvvwMD4t/A76PFkkTvprlKjsO/TxZ95EyXR+fEV
t+ZrLOwNXuQqgBY9PEie0BnuYAMQs351cLBs/zLvQ6FNsHOHNHk=
=3v6C
-----END PGP SIGNATURE-----

--=-B9XbtQ57suqp7e0X0tTo--



--===============8360441442764491152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8360441442764491152==--
