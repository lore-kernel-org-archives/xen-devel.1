From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] libxl: extract and save affinity maps from
 hypervisor
Date: Tue, 16 Oct 2018 19:39:34 +0200
Message-ID: <6eee6a89df54025bb4316a917a67b60840026725.camel@suse.com>
References: <409d6789ab39c20d3c90483426e6d146ad131de1.1537546261.git-series.wei.liu2@citrix.com>
 <23494.4470.855127.777529@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2782647806117217094=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q9ou=m4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gCTJj-00021z-Lj
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 17:39:39 +0000
In-Reply-To: <23494.4470.855127.777529@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============2782647806117217094==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-x4kNujADF7OGgV5QK1wj"


--=-x4kNujADF7OGgV5QK1wj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-10-16 at 17:27 +0100, Ian Jackson wrote:
> Wei Liu writes ("[PATCH] libxl: extract and save affinity maps from
> hypervisor"):
> > This is required to retain affinity setting across save/restore and
> > migration.
>=20
> Does the hypervisor or libxl invent a default affinity map at some
> point ?  If so that default calculation needs to be re-done for the
> new host.  ISTR some code to do NUMA affinity stuff by
> default.  CCing
> Dario who will hopefully save me digging into the code to answer that
> question :-).
>
I'll try, but no promises. :-/

So, when we create the domain, if there is no hard or soft affinity
configured by the user, we run automatic placement, which then ends up
(if successful) in the guest having a soft-affinity.

(We're in libxl/libxl_dom.c:libxl__build_pre(), BTW.)

If we save it/send to the destination, I think it means that when
resuming the guest, we'll see that it has a soft-affinity already and
go with it, skipping automatic placement.

Is that good? Is that what we always want?

I would say 'no', in the sense that, if affinity wasn't originally
specified, I'd argue that what we want is for libxl to figure it out
automatically at resume time, or on the new host, as it did when
creating the domain for the first time.

If on the other hand, a domain was actually explicitly specified, then
I guess it makes sense to at least try to set it when resuming.

So the point is, are we, at that time (i.e., during resume), able to
tell whether the reason why the domain has an affinity, is because the
user explicitly specified it? Out of the top of my head, I don't think
we can, but I probably better have another look at the code tomorrow...
:-/

> > diff --git a/tools/libxl/libxl_domain.c
> > b/tools/libxl/libxl_domain.c
> > index 3377bba..24fac9b 100644
> > --- a/tools/libxl/libxl_domain.c
> > +++ b/tools/libxl/libxl_domain.c
> >=20
> > +        /* Affinity maps */
> > +
> > +#define
> > REALLOC_AFFINITY_MAP(n)                                           =20
> >    \
> > +        for (i =3D 0; i < b_info->num_vcpu_ ## n ## _affinity; i++)
> > {           \
> > +            libxl_bitmap *m =3D &b_info->vcpu_ ## n ##
> > _affinity[i];            \
> > +            libxl_bitmap_dispose(m);                             =20
> >             \
> > +            libxl_bitmap_init(m);                                =20
> >             \
> > +            libxl_cpu_bitmap_alloc(CTX, m,
> > 0);                                \
> > +        }                                                        =20
> >             \
> > +        b_info->vcpu_ ## n ## _affinity
> > =3D                                     \
> > +            libxl__realloc(NOGC, b_info->vcpu_ ## n ##
> > _affinity,             \
> > +                    max_vcpus * sizeof(b_info->vcpu_ ## n ##
> > _affinity[0]));  \
> > +        for (i =3D b_info->num_vcpu_ ## n ## _affinity; i <
> > max_vcpus; i++) {   \
> > +            libxl_bitmap *m =3D &b_info->vcpu_ ## n ##
> > _affinity[i];            \
> > +            libxl_bitmap_init(m);                                =20
> >             \
> > +            libxl_cpu_bitmap_alloc(CTX, m,
> > 0);                                \
> > +        }                                                        =20
> >             \
> > +        b_info->num_vcpu_ ## n ## _affinity =3D max_vcpus;
> > +
> > +        REALLOC_AFFINITY_MAP(hard);
> > +        REALLOC_AFFINITY_MAP(soft);
>=20
> I don't think this needs to be a macro, does it ?  I mean, there's
> just the one member _affinity.  You could make this into a function.
>=20
FWIW, I'm not sure I'm getting, but there's vcpu_soft_affinity and
vcpu_hard_affinity.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-x4kNujADF7OGgV5QK1wj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvGIlYACgkQFkJ4iaW4
c+6k0Q/8CHJe/HU6IFOX0paRfOgpl/uB+igAtipnRhpN0Cwpxs+DwpI92oWPGYt1
I1xFPuZbBqwizAnScHa2aSrLbL6aCwu0YIW17+PyMWrZNFcqR6RkozqhtC2aJRDS
cPYIQ+KTh/tuSGY9DwJwG4UqKEkohdp9/1J2/3TJ996j257enVg4hgCukoYGAFI5
a2m3GBhssjz9jA5/M71RGNYjszfng5MNBLJTs165+VaWYBqcrw+a+ISrX8nyHsxt
B/5CpG6OL1S3EnNUcqTCdCWIYaYag0DMFZvdYy0bm09VokJpnYcTVkNMpHYvTkBr
pe8LnPJEHS4Sl1XNXaHF/M+0C/mqJjy6C5RQf7b05XJ/jL3mobX9F50tWX1lb1ZW
t8+v3Yakr/zJLDt6E/GGV/NVBopxRH7ZQRLdG8brhq8/4XOy1U9m3r2wVARPu0za
rs85GAdii5sttl0WWxtW9GtT7dgcLGK4FKDQ25u5voq2Z+y+dIsuUmfnO5TNSsCy
iykm0RB4BB+80xKN9t37WqgtUbuDdEpGTFWRkyKmbGjIVKVSaJSxrw5HfAVvNM7G
vMazFiIITzLEvSxRXMkKwpMFRkNSlYBfyPUy1n3tr/PTyQdo+NMnM1KbqQBd4Fb0
+Urlu+0AauxdQJd5pYsU/x4ycuD+SzIUSKqiBGjrrJsceA+AWgo=
=Pyk1
-----END PGP SIGNATURE-----

--=-x4kNujADF7OGgV5QK1wj--



--===============2782647806117217094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2782647806117217094==--
